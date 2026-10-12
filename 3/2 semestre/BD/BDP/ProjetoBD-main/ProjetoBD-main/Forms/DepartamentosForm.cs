using System;
using System.Data.SqlClient;
using System.Windows.Forms;
using Test.DAL;

namespace Test.Forms
{
    public partial class DepartamentosForm : Form
    {
        private int _oldND = -1;
        private string _oldHosp = null;

        public DepartamentosForm()
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
            cboHosp.DisplayMember = "Nome";
            cboHosp.ValueMember = "Nome";
            cboHosp.DataSource = DatabaseHelper.ExecuteQuery(
                "SELECT Nome FROM SGH.Hospital ORDER BY Nome");
        }

        private void LoadGrid()
        {
            try
            {
                dgv.DataSource = DatabaseHelper.ExecuteQuery(
                    "SELECT N_Departamento, Hospital_Nome, Nome FROM SGH.Departamento ORDER BY Hospital_Nome, N_Departamento");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro"); }
        }

        // ── Eventos da grelha ─────────────────────────────────────────────────

        private void dgv_SelectionChanged(object sender, EventArgs e)
        {
            if (dgv.CurrentRow == null || dgv.CurrentRow.Index < 0) return;
            numND.Value = Convert.ToInt32(dgv.CurrentRow.Cells["N_Departamento"].Value);
            cboHosp.SelectedValue = dgv.CurrentRow.Cells["Hospital_Nome"].Value?.ToString();
            txtNome.Text = dgv.CurrentRow.Cells["Nome"].Value?.ToString();
            _oldND = (int)numND.Value;
            _oldHosp = cboHosp.SelectedValue?.ToString();
        }

        // ── Botões ────────────────────────────────────────────────────────────

        private void btnRefresh_Click(object sender, EventArgs e) => LoadGrid();

        private void btnNovo_Click(object sender, EventArgs e)
        {
            numND.Value = 1;
            txtNome.Clear();
            cboHosp.SelectedIndex = -1;
            _oldND = -1;
            _oldHosp = null;
            txtNome.Focus();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (cboHosp.SelectedValue == null || string.IsNullOrWhiteSpace(txtNome.Text))
            { MessageBox.Show("Hospital e Nome são obrigatórios."); return; }
            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "INSERT INTO SGH.Departamento (N_Departamento, Nome, Hospital_Nome) VALUES (@n, @nm, @h)",
                    new SqlParameter("@n", (int)numND.Value),
                    new SqlParameter("@nm", txtNome.Text.Trim()),
                    new SqlParameter("@h", cboHosp.SelectedValue.ToString()));
                LoadGrid();
                MessageBox.Show("Departamento adicionado com sucesso.");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao inserir"); }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (_oldND < 0) { MessageBox.Show("Selecione um departamento."); return; }
            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "UPDATE SGH.Departamento SET Nome=@nm WHERE N_Departamento=@n AND Hospital_Nome=@h",
                    new SqlParameter("@n", _oldND),
                    new SqlParameter("@h", _oldHosp),
                    new SqlParameter("@nm", txtNome.Text.Trim()));
                LoadGrid();
                MessageBox.Show("Departamento atualizado.");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao atualizar"); }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (_oldND < 0) { MessageBox.Show("Selecione um departamento."); return; }
            if (MessageBox.Show("Remover departamento?", "Confirmar",
                    MessageBoxButtons.YesNo) != DialogResult.Yes) return;
            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "DELETE FROM SGH.Departamento WHERE N_Departamento=@n AND Hospital_Nome=@h",
                    new SqlParameter("@n", _oldND),
                    new SqlParameter("@h", _oldHosp));
                LoadGrid();
                btnNovo_Click(sender, e);
            }
            catch (Exception ex)
            {
                MessageBox.Show(
                    ex.Message + "\n\nNota: não é possível remover se o departamento tiver médicos associados.",
                    "Erro ao remover");
            }
        }
    }
}