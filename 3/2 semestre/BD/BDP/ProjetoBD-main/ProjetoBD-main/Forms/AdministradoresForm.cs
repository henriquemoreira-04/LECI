using System;
using System.Data.SqlClient;
using System.Windows.Forms;
using Test.DAL;
 
namespace Test
{
    public partial class AdministradoresForm : Form
    {
        public AdministradoresForm()
        {
            InitializeComponent();
            if (DatabaseHelper.TestConnection())
                this.Load += (s, e) => { LoadCombos(); LoadGrid(); };
            else
                MessageBox.Show("Não foi possível ligar à base de dados.", "Erro de ligação");
        }
 
        // ── Auxiliares ────────────────────────────────────────────────────────
 
        /// <summary>
        /// Converte a chave composta "N_Dep|Hospital_Nome" nos dois valores separados.
        /// </summary>
        private (int dep, string hosp) ParseDep()
        {
            var parts = cboDep.SelectedValue?.ToString().Split('|');
            if (parts == null || parts.Length != 2)
                throw new InvalidOperationException("Selecione um departamento válido.");
            return (int.Parse(parts[0]), parts[1]);
        }
 
        // ── Carregamento ──────────────────────────────────────────────────────
 
        private void LoadCombos()
        {
            cboCC.DisplayMember = "Label";
            cboCC.ValueMember   = "CC";
            cboCC.DataSource    = DatabaseHelper.ExecuteQuery(
                "SELECT CC, CC + ' — ' + Nome AS Label FROM SGH.Pessoa ORDER BY Nome");
 
            cboDep.DisplayMember = "Label";
            cboDep.ValueMember   = "Chave";
            cboDep.DataSource    = DatabaseHelper.ExecuteQuery(@"
                SELECT CAST(N_Departamento AS varchar) + '|' + Hospital_Nome AS Chave,
                       Nome + ' (' + Hospital_Nome + ')' AS Label
                FROM SGH.Departamento ORDER BY Hospital_Nome, Nome");
        }
 
        private void LoadGrid()
        {
            try
            {
                dgv.DataSource = DatabaseHelper.ExecuteQuery(@"
                    SELECT a.CC, ps.Nome, a.N_Administrador, a.Departamento_N, a.Hospital_Nome
                    FROM SGH.Administrador a
                    JOIN SGH.Pessoa ps ON ps.CC = a.CC
                    ORDER BY ps.Nome");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro"); }
        }
 
        // ── Eventos da grelha ─────────────────────────────────────────────────
 
        private void dgv_SelectionChanged(object sender, EventArgs e)
        {
            if (dgv.CurrentRow == null || dgv.CurrentRow.Index < 0) return;
            var r = dgv.CurrentRow;
            cboCC.SelectedValue = r.Cells["CC"].Value?.ToString();
            txtNum.Text         = r.Cells["N_Administrador"].Value?.ToString();
 
            // Reconstrói a chave composta para selecionar o departamento correto
            var depN  = r.Cells["Departamento_N"].Value?.ToString();
            var hosp  = r.Cells["Hospital_Nome"].Value?.ToString();
            if (depN != null && hosp != null)
                cboDep.SelectedValue = depN + "|" + hosp;
        }
 
        // ── Botões ────────────────────────────────────────────────────────────
 
        private void btnRefresh_Click(object sender, EventArgs e) => LoadGrid();
 
        private void btnNovo_Click(object sender, EventArgs e)
        {
            txtNum.Clear();
            cboCC.SelectedIndex  = -1;
            cboDep.SelectedIndex = -1;
            txtNum.Focus();
        }
 
        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (cboCC.SelectedValue == null || string.IsNullOrWhiteSpace(txtNum.Text) || cboDep.SelectedValue == null)
            { MessageBox.Show("CC, Nº Administrador e Departamento são obrigatórios."); return; }
            try
            {
                var dep = ParseDep();
                DatabaseHelper.ExecuteNonQuery(
                    "INSERT INTO SGH.Administrador (CC, N_Administrador, Departamento_N, Hospital_Nome) " +
                    "VALUES (@cc, @n, @dn, @hn)",
                    new SqlParameter("@cc", cboCC.SelectedValue.ToString()),
                    new SqlParameter("@n",  txtNum.Text.Trim()),
                    new SqlParameter("@dn", dep.dep),
                    new SqlParameter("@hn", dep.hosp));
                LoadGrid();
                MessageBox.Show("Administrador adicionado com sucesso.");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao inserir"); }
        }
 
        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (cboCC.SelectedValue == null) { MessageBox.Show("Selecione um administrador."); return; }
            try
            {
                var dep = ParseDep();
                DatabaseHelper.ExecuteNonQuery(@"
                    UPDATE SGH.Administrador
                    SET N_Administrador=@n, Departamento_N=@dn, Hospital_Nome=@hn
                    WHERE CC=@cc",
                    new SqlParameter("@cc", cboCC.SelectedValue.ToString()),
                    new SqlParameter("@n",  txtNum.Text.Trim()),
                    new SqlParameter("@dn", dep.dep),
                    new SqlParameter("@hn", dep.hosp));
                LoadGrid();
                MessageBox.Show("Administrador atualizado.");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao atualizar"); }
        }
 
        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (cboCC.SelectedValue == null) { MessageBox.Show("Selecione um administrador."); return; }
            if (MessageBox.Show("Remover administrador?", "Confirmar",
                    MessageBoxButtons.YesNo) != DialogResult.Yes) return;
            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "DELETE FROM SGH.Administrador WHERE CC=@cc",
                    new SqlParameter("@cc", cboCC.SelectedValue.ToString()));
                LoadGrid();
                btnNovo_Click(sender, e);
            }
            catch (Exception ex)
            {
                MessageBox.Show(
                    ex.Message + "\n\nNota: não é possível remover se o administrador tiver registos associados.",
                    "Erro ao remover");
            }
        }
    }
}