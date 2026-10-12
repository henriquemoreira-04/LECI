using Test.DAL;
using System;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace Test.Forms
{
    public partial class MedicosForm : Form
    {
        public MedicosForm()
        {
            InitializeComponent();
            if (DatabaseHelper.TestConnection())
                this.Load += (s, e) => { LoadCombos(); LoadGrid(); };
            else
                MessageBox.Show("Não foi possível ligar à base de dados.", "Erro de ligação");
        }

        // ── Auxiliares ────────────────────────────────────────────────────────

        private static object NullIfEmpty(string value) =>
            string.IsNullOrWhiteSpace(value) ? (object)DBNull.Value : value.Trim();

        // ── Carregamento ──────────────────────────────────────────────────────

        private void LoadCombos()
        {
            // Pessoas
            var dtPessoas = DatabaseHelper.ExecuteQuery(
                "SELECT CC, CC + ' — ' + Nome AS Label FROM SGH.Pessoa ORDER BY Nome");
            cbCC.DisplayMember = "Label";
            cbCC.ValueMember   = "CC";
            cbCC.DataSource    = dtPessoas;

            // Departamentos
            var dtDept = DatabaseHelper.ExecuteQuery(
                "SELECT N_Departamento, CAST(N_Departamento AS VARCHAR) + ' — ' + Nome AS Label FROM SGH.Departamento ORDER BY Nome");
            cbDepartamento.DisplayMember = "Label";
            cbDepartamento.ValueMember   = "N_Departamento";
            cbDepartamento.DataSource    = dtDept;

            // Hospitais
            var dtHosp = DatabaseHelper.ExecuteQuery(
                "SELECT Nome FROM SGH.Hospital ORDER BY Nome");
            cbHospital.DisplayMember = "Nome";
            cbHospital.ValueMember   = "Nome";
            cbHospital.DataSource    = dtHosp;
        }

        private void LoadGrid()
        {
            try
            {
                dgv.DataSource = DatabaseHelper.ExecuteQuery(@"
                    SELECT m.CC, ps.Nome, m.N_medico, m.Especialidade,
                           m.Historico_Consultas, m.Departamento_N, m.Hospital_Nome,
                           SGH.fn_TotalAvaliacoesMedico(m.CC) AS [Total Avaliações]
                    FROM SGH.Medico m
                    JOIN SGH.Pessoa ps ON ps.CC = m.CC
                    ORDER BY ps.Nome");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro"); }
        }

        // ── Eventos da grelha ─────────────────────────────────────────────────

        private void dgv_SelectionChanged(object sender, EventArgs e)
        {
            if (dgv.CurrentRow == null || dgv.CurrentRow.Index < 0) return;
            var r = dgv.CurrentRow;
            cbCC.SelectedValue          = r.Cells["CC"].Value?.ToString();
            txtNMedico.Text             = r.Cells["N_medico"].Value?.ToString();
            txtEspecialidade.Text       = r.Cells["Especialidade"].Value?.ToString();
            txtHistorico.Text           = r.Cells["Historico_Consultas"].Value?.ToString();
            cbDepartamento.SelectedValue = r.Cells["Departamento_N"].Value;
            cbHospital.SelectedValue    = r.Cells["Hospital_Nome"].Value?.ToString();
        }

        // ── Botões ────────────────────────────────────────────────────────────

        private void btnRefresh_Click(object sender, EventArgs e) => LoadGrid();

        private void btnNovo_Click(object sender, EventArgs e)
        {
            txtNMedico.Clear(); txtEspecialidade.Clear(); txtHistorico.Clear();
            cbCC.SelectedIndex          = -1;
            cbDepartamento.SelectedIndex = -1;
            cbHospital.SelectedIndex    = -1;
            txtNMedico.Focus();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (cbCC.SelectedValue == null || string.IsNullOrWhiteSpace(txtNMedico.Text))
            { MessageBox.Show("CC (Pessoa) e Nº Médico são obrigatórios."); return; }
            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "INSERT INTO SGH.Medico (CC, N_medico, Especialidade, Historico_Consultas, Departamento_N, Hospital_Nome) " +
                    "VALUES (@cc, @nm, @esp, @hc, @dep, @hosp)",
                    new SqlParameter("@cc",   cbCC.SelectedValue.ToString()),
                    new SqlParameter("@nm",   txtNMedico.Text.Trim()),
                    new SqlParameter("@esp",  NullIfEmpty(txtEspecialidade.Text)),
                    new SqlParameter("@hc",   NullIfEmpty(txtHistorico.Text)),
                    new SqlParameter("@dep",  cbDepartamento.SelectedValue ?? (object)DBNull.Value),
                    new SqlParameter("@hosp", cbHospital.SelectedValue != null ? (object)cbHospital.SelectedValue.ToString() : DBNull.Value));
                LoadGrid();
                MessageBox.Show("Médico adicionado com sucesso.");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao inserir"); }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (cbCC.SelectedValue == null) { MessageBox.Show("Selecione um médico."); return; }
            try
            {
                var cc = cbCC.SelectedValue.ToString();
                DatabaseHelper.ExecuteNonQuery(
                    "UPDATE SGH.Medico SET N_medico=@nm, Especialidade=@esp, Historico_Consultas=@hc WHERE CC=@cc",
                    new SqlParameter("@cc",  cc),
                    new SqlParameter("@nm",  txtNMedico.Text.Trim()),
                    new SqlParameter("@esp", NullIfEmpty(txtEspecialidade.Text)),
                    new SqlParameter("@hc",  NullIfEmpty(txtHistorico.Text)));
                DatabaseHelper.ExecuteNonQuery(
                    "EXEC SGH.sp_TransferirMedico @cc, @novoDep, @novoHospital",
                    new SqlParameter("@cc",          cc),
                    new SqlParameter("@novoDep",     cbDepartamento.SelectedValue ?? (object)DBNull.Value),
                    new SqlParameter("@novoHospital", cbHospital.SelectedValue != null ? (object)cbHospital.SelectedValue.ToString() : DBNull.Value));
                LoadGrid();
                MessageBox.Show("Médico atualizado.");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao atualizar"); }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (cbCC.SelectedValue == null) { MessageBox.Show("Selecione um médico."); return; }
            if (MessageBox.Show("Remover médico?", "Confirmar",
                    MessageBoxButtons.YesNo) != DialogResult.Yes) return;
            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "EXEC SGH.sp_RemoverMedico @cc",
                    new SqlParameter("@cc", cbCC.SelectedValue.ToString()));
                LoadGrid();
                btnNovo_Click(sender, e);
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao remover"); }
        }
    }
}