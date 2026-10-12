using System;
using System.Data.SqlClient;
using System.Windows.Forms;
using Test.DAL;

namespace Test.Forms
{
    public partial class TiposSalaForm : Form
    {
        private int _oldId = -1;

        public TiposSalaForm()
        {
            InitializeComponent();
            if (DatabaseHelper.TestConnection())
                this.Load += (s, e) => LoadGrid();
            else
                MessageBox.Show("Não foi possível ligar à base de dados.", "Erro de ligação");
        }

        // ── Carregamento ──────────────────────────────────────────────────────

        private void LoadGrid()
        {
            try
            {
                dgv.DataSource = DatabaseHelper.ExecuteQuery(
                    "SELECT Identificador, Designacao FROM SGH.Tipo_de_Sala ORDER BY Identificador");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro"); }
        }

        // ── Eventos da grelha ─────────────────────────────────────────────────

        private void dgv_SelectionChanged(object sender, EventArgs e)
        {
            if (dgv.CurrentRow == null || dgv.CurrentRow.Index < 0) return;
            numId.Value = Convert.ToInt32(dgv.CurrentRow.Cells["Identificador"].Value);
            txtDes.Text = dgv.CurrentRow.Cells["Designacao"].Value?.ToString();
            _oldId = (int)numId.Value;
        }

        // ── Botões ────────────────────────────────────────────────────────────

        private void btnRefresh_Click(object sender, EventArgs e) => LoadGrid();

        private void btnNovo_Click(object sender, EventArgs e)
        {
            numId.Value = DatabaseHelper.GetNextId("Tipo_de_Sala", "Identificador");
            txtDes.Clear();
            _oldId = -1;
            txtDes.Focus();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtDes.Text))
            { MessageBox.Show("Designação é obrigatória."); return; }
            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "INSERT INTO SGH.Tipo_de_Sala (Identificador, Designacao) VALUES (@i, @d)",
                    new SqlParameter("@i", (int)numId.Value),
                    new SqlParameter("@d", txtDes.Text.Trim()));
                LoadGrid();
                MessageBox.Show("Tipo de sala adicionado com sucesso.");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao inserir"); }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (_oldId < 0) { MessageBox.Show("Selecione um tipo de sala."); return; }
            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "UPDATE SGH.Tipo_de_Sala SET Designacao=@d WHERE Identificador=@i",
                    new SqlParameter("@i", _oldId),
                    new SqlParameter("@d", txtDes.Text.Trim()));
                LoadGrid();
                MessageBox.Show("Tipo de sala atualizado.");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao atualizar"); }
        }

        private void btnDelete_Click_1(object sender, EventArgs e)
        {
            if (_oldId < 0) { MessageBox.Show("Selecione um tipo de sala."); return; }
            if (MessageBox.Show("Remover tipo de sala?", "Confirmar",
                    MessageBoxButtons.YesNo) != DialogResult.Yes) return;
            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "DELETE FROM SGH.Tipo_de_Sala WHERE Identificador=@i",
                    new SqlParameter("@i", _oldId));
                LoadGrid();
                btnNovo_Click(sender, e);
            }
            catch (Exception ex)
            {
                MessageBox.Show(
                    ex.Message + "\n\nNota: não é possível remover se existirem salas deste tipo.",
                    "Erro ao remover");
            }
        }

        private void numId_ValueChanged(object sender, EventArgs e) { }
    }
}