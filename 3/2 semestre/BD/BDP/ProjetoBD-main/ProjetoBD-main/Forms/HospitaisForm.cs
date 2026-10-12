using Test.DAL;
using System;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace Test.Forms
{
    public partial class HospitaisForm : Form
    {
        private string _selectedPk = null;

        public HospitaisForm()
        {
            InitializeComponent();
            if (DatabaseHelper.TestConnection())
                this.Load += (s, e) => LoadGrid();
            else
                MessageBox.Show("Não foi possível ligar à base de dados.", "Erro de ligação");
        }

        // ── Auxiliares ────────────────────────────────────────────────────────

        private static object NullIfEmpty(string value) =>
            string.IsNullOrWhiteSpace(value) ? (object)DBNull.Value : value.Trim();

        // ── Carregamento ──────────────────────────────────────────────────────

        private void LoadGrid()
        {
            try
            {
                dgv.DataSource = DatabaseHelper.ExecuteQuery(
                    "SELECT Nome, Localizacao FROM SGH.Hospital ORDER BY Nome");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro"); }
        }

        // ── Eventos da grelha ─────────────────────────────────────────────────

        private void dgv_SelectionChanged(object sender, EventArgs e)
        {
            if (dgv.CurrentRow == null || dgv.CurrentRow.Index < 0) return;
            txtNome.Text = dgv.CurrentRow.Cells["Nome"].Value?.ToString();
            txtLoc.Text = dgv.CurrentRow.Cells["Localizacao"].Value?.ToString();
            _selectedPk = txtNome.Text;
        }

        // ── Botões ────────────────────────────────────────────────────────────

        private void btnRefresh_Click(object sender, EventArgs e) => LoadGrid();

        private void btnNovo_Click(object sender, EventArgs e)
        {
            txtNome.Clear(); txtLoc.Clear();
            _selectedPk = null;
            txtNome.Focus();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtNome.Text)) { MessageBox.Show("Nome é obrigatório."); return; }
            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "INSERT INTO SGH.Hospital (Nome, Localizacao) VALUES (@n, @l)",
                    new SqlParameter("@n", txtNome.Text.Trim()),
                    new SqlParameter("@l", NullIfEmpty(txtLoc.Text)));
                LoadGrid();
                MessageBox.Show("Hospital adicionado com sucesso.");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao inserir"); }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(_selectedPk)) { MessageBox.Show("Selecione um hospital."); return; }
            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "UPDATE SGH.Hospital SET Localizacao=@l WHERE Nome=@n",
                    new SqlParameter("@n", _selectedPk),
                    new SqlParameter("@l", NullIfEmpty(txtLoc.Text)));
                LoadGrid();
                MessageBox.Show("Hospital atualizado.\n\nNota: o Nome é a chave primária e não é alterável — remova e crie novo se precisar.");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao atualizar"); }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(_selectedPk)) { MessageBox.Show("Selecione um hospital."); return; }
            if (MessageBox.Show("Remover hospital?", "Confirmar",
                    MessageBoxButtons.YesNo) != DialogResult.Yes) return;
            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "DELETE FROM SGH.Hospital WHERE Nome=@n",
                    new SqlParameter("@n", _selectedPk));
                LoadGrid();
                btnNovo_Click(sender, e);
            }
            catch (Exception ex)
            {
                MessageBox.Show(
                    ex.Message + "\n\nNota: não é possível remover se existirem departamentos, médicos ou outros registos associados.",
                    "Erro ao remover");
            }
        }
    }
}