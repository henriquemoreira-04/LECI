using System;
using System.Data.SqlClient;
using System.Windows.Forms;
using Test.DAL;

namespace Test.Forms
{
    public partial class EquipamentosForm : Form
    {
        private int _oldId = -1;

        public EquipamentosForm()
        {
            InitializeComponent();
            this.Load += (s, e) => LoadGrid();
        }

        private void LoadGrid()
        {
            try { dgv.DataSource = DatabaseHelper.ExecuteQuery("SELECT Identificador, Nome FROM SGH.Equipamento_Medico ORDER BY Identificador"); }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro"); }
        }

        private void dgv_SelectionChanged(object sender, EventArgs e)
        {
            if (dgv.CurrentRow == null) return;
            numId.Value = Convert.ToInt32(dgv.CurrentRow.Cells["Identificador"].Value);
            txtNome.Text = dgv.CurrentRow.Cells["Nome"].Value?.ToString();
            _oldId = (int)numId.Value;
        }

        private void btnNovo_Click(object sender, EventArgs e)
        { numId.Value = DatabaseHelper.GetNextId("Equipamento_Medico", "Identificador"); txtNome.Clear(); _oldId = -1; }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtNome.Text)) { MessageBox.Show("Nome obrigatório."); return; }
            try
            {
                DatabaseHelper.ExecuteNonQuery("INSERT INTO SGH.Equipamento_Medico (Identificador, Nome) VALUES (@i,@n)",
                    new SqlParameter("@i", (int)numId.Value), new SqlParameter("@n", txtNome.Text.Trim()));
                LoadGrid();
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro"); }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (_oldId < 0) { MessageBox.Show("Selecione."); return; }
            try
            {
                DatabaseHelper.ExecuteNonQuery("UPDATE SGH.Equipamento_Medico SET Nome=@n WHERE Identificador=@i",
                    new SqlParameter("@i", _oldId), new SqlParameter("@n", txtNome.Text.Trim()));
                LoadGrid();
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro"); }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (_oldId < 0) { MessageBox.Show("Selecione."); return; }
            if (MessageBox.Show("Remover?", "Confirmar", MessageBoxButtons.YesNo) != DialogResult.Yes) return;
            try
            {
                DatabaseHelper.ExecuteNonQuery("DELETE FROM SGH.Equipamento_Medico WHERE Identificador=@i", new SqlParameter("@i", _oldId));
                LoadGrid();
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro"); }
        }

        private void btnRefresh_Click(object sender, EventArgs e) => LoadGrid();
    }
}