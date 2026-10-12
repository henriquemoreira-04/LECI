using Test.DAL;
using System;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace Test.Forms
{
    public partial class EnfermeirosForm : Form
    {
        private int _oldNC = -1; // cirurgia selecionada na cirGrid

        public EnfermeirosForm()
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
            // Pessoas que ainda não são enfermeiros + as já existentes
            cbCC.DisplayMember = "Label";
            cbCC.ValueMember = "CC";
            cbCC.DataSource = DatabaseHelper.ExecuteQuery(
                "SELECT CC, CC + ' — ' + Nome AS Label FROM SGH.Pessoa ORDER BY Nome");

            // Departamentos
            cbDep.DisplayMember = "Label";
            cbDep.ValueMember = "Chave";
            cbDep.DataSource = DatabaseHelper.ExecuteQuery(@"
                SELECT CAST(N_Departamento AS varchar) + '|' + Hospital_Nome AS Chave,
                       Nome + ' (' + Hospital_Nome + ')' AS Label
                FROM SGH.Departamento ORDER BY Hospital_Nome, Nome");

            // ComboBox de cirurgias para associar
            cbCir.DisplayMember = "Label";
            cbCir.ValueMember = "N_Cirurgia";
            cbCir.DataSource = DatabaseHelper.ExecuteQuery(@"
                SELECT c.N_Cirurgia,
                       'Cir.' + CAST(c.N_Cirurgia AS varchar) + ' — ' + ps.Nome
                       + ' (' + CONVERT(varchar, c.Data, 23) + ')' AS Label
                FROM SGH.Cirurgia c
                JOIN SGH.Pessoa ps ON ps.CC = c.CC_Paciente
                ORDER BY c.Data DESC");
        }

        private void LoadGrid()
        {
            try
            {
                dgv.DataSource = DatabaseHelper.ExecuteQuery(@"
                    SELECT e.CC, ps.Nome, e.N_Enfermeiro, e.Historico_Consultas,
                           e.Departamento_N, e.Hospital_Nome
                    FROM SGH.Enfermeiro e
                    JOIN SGH.Pessoa ps ON ps.CC = e.CC
                    ORDER BY ps.Nome");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro"); }
        }

        private void LoadCirGrid(string ccEnfermeiro)
        {
            try
            {
                cirGrid.DataSource = DatabaseHelper.ExecuteQuery(@"
                    SELECT ec.N_Cirurgia, c.Data, c.Risco,
                           ps.Nome AS Paciente
                    FROM SGH.Enfermeiro_Cirurgia ec
                    JOIN SGH.Cirurgia c  ON c.N_Cirurgia  = ec.N_Cirurgia
                    JOIN SGH.Pessoa ps   ON ps.CC          = c.CC_Paciente
                    WHERE ec.CC_Enfermeiro = @cc
                    ORDER BY c.Data DESC",
                    new SqlParameter("@cc", ccEnfermeiro));
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao carregar cirurgias"); }
        }

        // ── Eventos das grelhas ───────────────────────────────────────────────

        private void dgv_SelectionChanged(object sender, EventArgs e)
        {
            if (dgv.CurrentRow == null || dgv.CurrentRow.Index < 0) return;
            var r = dgv.CurrentRow;
            cbCC.SelectedValue = r.Cells["CC"].Value?.ToString();
            txtNEnf.Text = r.Cells["N_Enfermeiro"].Value?.ToString();
            txtHC.Text = r.Cells["Historico_Consultas"].Value?.ToString();

            var depN = r.Cells["Departamento_N"].Value?.ToString();
            var hosp = r.Cells["Hospital_Nome"].Value?.ToString();
            if (depN != null && hosp != null)
                cbDep.SelectedValue = depN + "|" + hosp;

            LoadCirGrid(r.Cells["CC"].Value?.ToString());
        }

        private void cirGrid_SelectionChanged(object sender, EventArgs e)
        {
            if (cirGrid.CurrentRow == null || cirGrid.CurrentRow.Index < 0) return;
            cbCir.SelectedValue = Convert.ToInt32(cirGrid.CurrentRow.Cells["N_Cirurgia"].Value);
        }

        // ── Botões do enfermeiro ──────────────────────────────────────────────

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            LoadGrid();
            cirGrid.DataSource = null;
        }

        private void btnNovo_Click(object sender, EventArgs e)
        {
            txtNEnf.Clear(); txtHC.Clear();
            cbCC.SelectedIndex = -1;
            cbDep.SelectedIndex = -1;
            cirGrid.DataSource = null;
            txtNEnf.Focus();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (cbCC.SelectedValue == null || string.IsNullOrWhiteSpace(txtNEnf.Text) || cbDep.SelectedValue == null)
            { MessageBox.Show("CC, Nº Enfermeiro e Departamento são obrigatórios."); return; }
            try
            {
                var dep = ParseDep();
                DatabaseHelper.ExecuteNonQuery(
                    "INSERT INTO SGH.Enfermeiro (CC, N_Enfermeiro, Historico_Consultas, Departamento_N, Hospital_Nome) " +
                    "VALUES (@cc, @n, @hc, @dep, @hosp)",
                    new SqlParameter("@cc", cbCC.SelectedValue.ToString()),
                    new SqlParameter("@n", txtNEnf.Text.Trim()),
                    new SqlParameter("@hc", NullIfEmpty(txtHC.Text)),
                    new SqlParameter("@dep", dep.dep),
                    new SqlParameter("@hosp", dep.hosp));
                LoadGrid();
                MessageBox.Show("Enfermeiro adicionado com sucesso.");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao inserir"); }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (cbCC.SelectedValue == null) { MessageBox.Show("Selecione um enfermeiro."); return; }
            try
            {
                var dep = ParseDep();
                DatabaseHelper.ExecuteNonQuery(
                    "UPDATE SGH.Enfermeiro SET N_Enfermeiro=@n, Historico_Consultas=@hc, " +
                    "Departamento_N=@dep, Hospital_Nome=@hosp WHERE CC=@cc",
                    new SqlParameter("@cc", cbCC.SelectedValue.ToString()),
                    new SqlParameter("@n", txtNEnf.Text.Trim()),
                    new SqlParameter("@hc", NullIfEmpty(txtHC.Text)),
                    new SqlParameter("@dep", dep.dep),
                    new SqlParameter("@hosp", dep.hosp));       
                LoadGrid();
                MessageBox.Show("Enfermeiro atualizado.");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao atualizar"); }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (cbCC.SelectedValue == null) { MessageBox.Show("Selecione um enfermeiro."); return; }
            if (MessageBox.Show("Remover enfermeiro? As suas associações a cirurgias também serão removidas.",
                    "Confirmar", MessageBoxButtons.YesNo) != DialogResult.Yes) return;
            try
            {
                // A stored procedure trata de remover primeiro as associações
                DatabaseHelper.ExecuteNonQuery(
                    "EXEC SGH.sp_RemoverEnfermeiro @cc",
                    new SqlParameter("@cc", cbCC.SelectedValue.ToString()));
                LoadGrid();
                btnNovo_Click(sender, e);
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao remover"); }
        }

        // ── Botões das cirurgias ──────────────────────────────────────────────

        private void btnAddCir_Click(object sender, EventArgs e)
        {
            if (cbCC.SelectedValue == null)
            { MessageBox.Show("Selecione primeiro um enfermeiro."); return; }
            if (cbCir.SelectedValue == null)
            { MessageBox.Show("Selecione uma cirurgia."); return; }
            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "INSERT INTO SGH.Enfermeiro_Cirurgia (CC_Enfermeiro, N_Cirurgia) VALUES (@cc, @n)",
                    new SqlParameter("@cc", cbCC.SelectedValue.ToString()),
                    new SqlParameter("@n", Convert.ToInt32(cbCir.SelectedValue)));
                LoadCirGrid(cbCC.SelectedValue.ToString());
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message + "\n\nNota: o enfermeiro pode já estar associado a esta cirurgia.",
                    "Erro ao associar");
            }
        }

        private void btnDelCir_Click(object sender, EventArgs e)
        {
            if (cbCC.SelectedValue == null)
            { MessageBox.Show("Selecione primeiro um enfermeiro."); return; }
            if (cirGrid.CurrentRow == null || cirGrid.CurrentRow.Index < 0)
            { MessageBox.Show("Selecione uma cirurgia na lista."); return; }

            if (MessageBox.Show("Remover esta associação?", "Confirmar",
                    MessageBoxButtons.YesNo) != DialogResult.Yes) return;
            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "DELETE FROM SGH.Enfermeiro_Cirurgia WHERE CC_Enfermeiro=@cc AND N_Cirurgia=@n",
                    new SqlParameter("@cc", cbCC.SelectedValue.ToString()),
                    new SqlParameter("@n", Convert.ToInt32(cirGrid.CurrentRow.Cells["N_Cirurgia"].Value)));
                LoadCirGrid(cbCC.SelectedValue.ToString());
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao remover associação"); }
        }

        // ── Auxiliar dep ─────────────────────────────────────────────────────

        private (int dep, string hosp) ParseDep()
        {
            var parts = cbDep.SelectedValue?.ToString().Split('|');
            if (parts == null || parts.Length != 2)
                throw new InvalidOperationException("Selecione um departamento válido.");
            return (int.Parse(parts[0]), parts[1]);
        }
    }
}