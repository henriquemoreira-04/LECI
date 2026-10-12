using System;
using System.Data.SqlClient;
using System.Windows.Forms;
using Test.DAL;

namespace Test.Forms
{
    public partial class PessoasForm : Form
    {
        public PessoasForm()
        {
            InitializeComponent();

            // 1. Conectamos el evento para que escuche cuando cambies de fila
            dgv.SelectionChanged += dgv_SelectionChanged;

            // 2. Validamos la conexión y cargamos la base de datos
            if (DatabaseHelper.TestConnection())
            {
                this.Load += (s, e) => LoadGrid();
            }
            else
            {
                MessageBox.Show("Não foi possível ligar à base de dados.", "Erro de ligação");
            }
        }

        // ── Auxiliares ────────────────────────────────────────────────────────

        private void LoadGrid()
        {
            try
            {
                dgv.DataSource = DatabaseHelper.ExecuteQuery(
                   "SELECT CC, NIF, Nome, Contacto, Morada FROM SGH.Pessoa ORDER BY CAST(CC AS INT)");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro"); }
        }

        /// <summary>
        /// Converte string vazia/whitespace para DBNull — necessário para colunas anuláveis.
        /// </summary>
        private static object NullIfEmpty(string value) =>
            string.IsNullOrWhiteSpace(value) ? (object)DBNull.Value : value.Trim();

        // ── Eventos da grelha ─────────────────────────────────────────────────

        private void dgv_SelectionChanged(object sender, EventArgs e)
        {
            if (dgv.CurrentRow == null || dgv.CurrentRow.Index < 0) return;
            var r = dgv.CurrentRow;
            txtCC.Text = r.Cells["CC"].Value?.ToString();
            txtNIF.Text = r.Cells["NIF"].Value?.ToString();
            txtNome.Text = r.Cells["Nome"].Value?.ToString();
            txtContacto.Text = r.Cells["Contacto"].Value?.ToString();
            txtMorada.Text = r.Cells["Morada"].Value?.ToString();
        }

        // ── Botões ────────────────────────────────────────────────────────────

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            LoadGrid();
        }

        private void btnNovo_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtCC.Text) ||
                string.IsNullOrWhiteSpace(txtNIF.Text) ||
                string.IsNullOrWhiteSpace(txtNome.Text))
            {
                MessageBox.Show("CC, NIF e Nome são obrigatórios.");
                return;
            }
            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "INSERT INTO SGH.Pessoa (CC, NIF, Nome, Contacto, Morada) " +
                    "VALUES (@cc, @nif, @nome, @ct, @mor)",
                    new SqlParameter("@cc", txtCC.Text.Trim()),
                    new SqlParameter("@nif", txtNIF.Text.Trim()),
                    new SqlParameter("@nome", txtNome.Text.Trim()),
                    new SqlParameter("@ct", NullIfEmpty(txtContacto.Text)),
                    new SqlParameter("@mor", NullIfEmpty(txtMorada.Text)));

                LoadGrid();
                MessageBox.Show("Pessoa adicionada com sucesso.");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao inserir"); }
        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            txtCC.Clear(); txtNIF.Clear(); txtNome.Clear();
            txtContacto.Clear(); txtMorada.Clear();
            txtCC.Focus();
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtCC.Text))
            { MessageBox.Show("Selecione uma pessoa."); return; }
            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "UPDATE SGH.Pessoa SET NIF=@nif, Nome=@nome, Contacto=@ct, Morada=@mor WHERE CC=@cc",
                    new SqlParameter("@cc", txtCC.Text.Trim()),
                    new SqlParameter("@nif", txtNIF.Text.Trim()),
                    new SqlParameter("@nome", txtNome.Text.Trim()),
                    new SqlParameter("@ct", NullIfEmpty(txtContacto.Text)),
                    new SqlParameter("@mor", NullIfEmpty(txtMorada.Text)));

                LoadGrid();
                MessageBox.Show("Pessoa atualizada.");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao atualizar"); }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtCC.Text))
            { MessageBox.Show("Selecione uma pessoa."); return; }
            if (MessageBox.Show("Remover esta pessoa?", "Confirmar",
                    MessageBoxButtons.YesNo) != DialogResult.Yes) return;
            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "DELETE FROM SGH.Pessoa WHERE CC=@cc",
                    new SqlParameter("@cc", txtCC.Text.Trim()));

                LoadGrid();
                btnClear_Click(sender, e);   // limpa os campos após apagar
            }
            catch (Exception ex)
            {
                MessageBox.Show(
                    ex.Message + "\n\nNota: não é possível remover se a pessoa for " +
                    "paciente/médico/enfermeiro/admin com registos.",
                    "Erro ao remover");
            }
        }
    }
}