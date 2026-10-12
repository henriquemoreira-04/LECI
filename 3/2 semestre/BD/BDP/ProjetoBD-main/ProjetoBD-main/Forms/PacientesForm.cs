using Test.DAL;
using System;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace Test.Forms
{
    public partial class PacientesForm : Form
    {
        public PacientesForm()
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
            var dt = DatabaseHelper.ExecuteQuery(
                "SELECT p.CC, p.CC + ' — ' + p.Nome AS Label FROM SGH.Pessoa p ORDER BY p.Nome");
            cbCC.DisplayMember = "Label";
            cbCC.ValueMember = "CC";
            cbCC.DataSource = dt;
        }

        private void LoadGrid()
        {
            try
            {
                dgv.DataSource = DatabaseHelper.ExecuteQuery(@"
                                        SELECT *
                                        FROM SGH.vw_Pacientes
                                        ORDER BY Nome");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro"); }
        }

        // ── Eventos da grelha ─────────────────────────────────────────────────

        private void dgv_SelectionChanged(object sender, EventArgs e)
        {
            if (dgv.CurrentRow == null || dgv.CurrentRow.Index < 0) return;
            var r = dgv.CurrentRow;
            cbCC.SelectedValue = r.Cells["CC"].Value?.ToString();
            txtNUtente.Text = r.Cells["N_utente"].Value?.ToString();
            cbGS.SelectedItem = r.Cells["Grupo_Sanguineo"].Value?.ToString();
            txtHM.Text = r.Cells["Historico_Medico"].Value?.ToString();
        }

        // ── Botões ────────────────────────────────────────────────────────────

        private void btnRefresh_Click(object sender, EventArgs e) => LoadGrid();

        private void btnNovo_Click(object sender, EventArgs e)
        {
            txtNUtente.Clear(); txtHM.Clear();
            cbCC.SelectedIndex = -1;
            cbGS.SelectedIndex = -1;
            txtNUtente.Focus();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (cbCC.SelectedValue == null || string.IsNullOrWhiteSpace(txtNUtente.Text))
            { MessageBox.Show("CC (Pessoa) e Nº Utente são obrigatórios."); return; }
            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "INSERT INTO SGH.Paciente (CC, N_utente, Grupo_Sanguineo, Historico_Medico) " +
                    "VALUES (@cc, @u, @gs, @h)",
                    new SqlParameter("@cc", cbCC.SelectedValue.ToString()),
                    new SqlParameter("@u", txtNUtente.Text.Trim()),
                    new SqlParameter("@gs", cbGS.SelectedItem != null ? (object)cbGS.SelectedItem.ToString() : DBNull.Value),
                    new SqlParameter("@h", NullIfEmpty(txtHM.Text)));
                LoadGrid();
                MessageBox.Show("Paciente adicionado com sucesso.");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao inserir"); }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (cbCC.SelectedValue == null) { MessageBox.Show("Selecione um paciente."); return; }
            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "UPDATE SGH.Paciente SET N_utente=@u, Grupo_Sanguineo=@gs, Historico_Medico=@h WHERE CC=@cc",
                    new SqlParameter("@cc", cbCC.SelectedValue.ToString()),
                    new SqlParameter("@u", txtNUtente.Text.Trim()),
                    new SqlParameter("@gs", cbGS.SelectedItem != null ? (object)cbGS.SelectedItem.ToString() : DBNull.Value),
                    new SqlParameter("@h", NullIfEmpty(txtHM.Text)));
                LoadGrid();
                MessageBox.Show("Paciente atualizado.");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao atualizar"); }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (cbCC.SelectedValue == null) { MessageBox.Show("Selecione um paciente."); return; }
            if (MessageBox.Show("Remover paciente?", "Confirmar",
                    MessageBoxButtons.YesNo) != DialogResult.Yes) return;
            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "DELETE FROM SGH.Paciente WHERE CC=@cc",
                    new SqlParameter("@cc", cbCC.SelectedValue.ToString()));
                LoadGrid();
                btnNovo_Click(sender, e);
            }
            catch (Exception ex)
            {
                MessageBox.Show(
                    ex.Message + "\n\nNota: não é possível remover se o paciente tiver registos associados.",
                    "Erro ao remover");
            }
        }
    }
}