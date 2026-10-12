using System;
using System.Data.SqlClient;
using System.Windows.Forms;
using Test.DAL;

namespace Test.Forms
{
    public partial class DiagnosticosForm : Form
    {
        private int _oldND = -1;

        public DiagnosticosForm()
        {
            InitializeComponent();
            if (DatabaseHelper.TestConnection())
                this.Load += (s, e) => { LoadCombos(); LoadGrid(); };
            else
                MessageBox.Show("Não foi possível ligar à base de dados.", "Erro de ligação");
        }

        // ── Carregamento ──────────────────────────────────────────────────────

        private void LoadCombos()
        {
            cboNA.DisplayMember = "Label";
            cboNA.ValueMember = "N_Avaliacao";
            cboNA.DataSource = DatabaseHelper.ExecuteQuery(@"
                SELECT a.N_Avaliacao,
                       'Av.' + CAST(a.N_Avaliacao AS varchar) + ' — ' + ps.Nome
                       + ' (' + CONVERT(varchar, a.Data, 23) + ')' AS Label
                FROM SGH.Avaliacao a
                JOIN SGH.Pessoa ps ON ps.CC = a.CC_Paciente
                ORDER BY a.Data DESC");
        }

        private void LoadGrid()
        {
            try
            {
                dgv.DataSource = DatabaseHelper.ExecuteQuery(@"
                    SELECT d.N_Diagnostico, d.N_Avaliacao, d.Data, d.Designacao
                    FROM SGH.Diagnostico d
                    ORDER BY d.Data DESC, d.N_Diagnostico");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro"); }
        }

        // ── Eventos da grelha ─────────────────────────────────────────────────

        private void dgv_SelectionChanged(object sender, EventArgs e)
        {
            if (dgv.CurrentRow == null || dgv.CurrentRow.Index < 0) return;
            var r = dgv.CurrentRow;
            numND.Value = Convert.ToInt32(r.Cells["N_Diagnostico"].Value);
            cboNA.SelectedValue = Convert.ToInt32(r.Cells["N_Avaliacao"].Value);
            dtpData.Value = Convert.ToDateTime(r.Cells["Data"].Value);
            txtDes.Text = r.Cells["Designacao"].Value?.ToString();
            _oldND = (int)numND.Value;
        }

        // ── Botões ────────────────────────────────────────────────────────────

        private void btnRefresh_Click(object sender, EventArgs e) => LoadGrid();

        private void btnNovo_Click(object sender, EventArgs e)
        {
            numND.Value = DatabaseHelper.GetNextId("Diagnostico", "N_Diagnostico");
            dtpData.Value = DateTime.Today;
            txtDes.Clear();
            cboNA.SelectedIndex = -1;
            _oldND = -1;
            txtDes.Focus();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (cboNA.SelectedValue == null || string.IsNullOrWhiteSpace(txtDes.Text))
            { MessageBox.Show("Avaliação e designação são obrigatórias."); return; }
            try
            {
                DatabaseHelper.ExecuteNonQuery(@"
                    INSERT INTO SGH.Diagnostico (N_Avaliacao, N_Diagnostico, Data, Designacao)
                    VALUES (@a, @n, @d, @des)",
                    new SqlParameter("@a", Convert.ToInt32(cboNA.SelectedValue)),
                    new SqlParameter("@n", (int)numND.Value),
                    new SqlParameter("@d", dtpData.Value.Date),
                    new SqlParameter("@des", txtDes.Text.Trim()));
                LoadGrid();
                MessageBox.Show("Diagnóstico adicionado com sucesso.");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao inserir"); }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (_oldND < 0) { MessageBox.Show("Selecione um diagnóstico."); return; }
            try
            {
                DatabaseHelper.ExecuteNonQuery(@"
                    UPDATE SGH.Diagnostico
                    SET N_Avaliacao=@a, Data=@d, Designacao=@des
                    WHERE N_Diagnostico=@n",
                    new SqlParameter("@n", _oldND),
                    new SqlParameter("@a", Convert.ToInt32(cboNA.SelectedValue)),
                    new SqlParameter("@d", dtpData.Value.Date),
                    new SqlParameter("@des", txtDes.Text.Trim()));
                LoadGrid();
                MessageBox.Show("Diagnóstico atualizado.");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao atualizar"); }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (_oldND < 0) { MessageBox.Show("Selecione um diagnóstico."); return; }
            if (MessageBox.Show("Remover diagnóstico?", "Confirmar",
                    MessageBoxButtons.YesNo) != DialogResult.Yes) return;
            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "DELETE FROM SGH.Diagnostico WHERE N_Diagnostico=@n",
                    new SqlParameter("@n", _oldND));
                LoadGrid();
                btnNovo_Click(sender, e);
            }
            catch (Exception ex)
            {
                MessageBox.Show(
                    ex.Message + "\n\nNota: não é possível remover se existirem cirurgias associadas.",
                    "Erro ao remover");
            }
        }
    }
}