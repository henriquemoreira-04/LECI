using System;
using System.Data.SqlClient;
using System.Windows.Forms;
using Test.DAL;

namespace Test.Forms
{
    public partial class AvaliacoesForm : Form
    {
        private int _oldN = -1;

        public AvaliacoesForm()
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
            cboPac.DisplayMember = "Label";
            cboPac.ValueMember = "CC";
            cboPac.DataSource = DatabaseHelper.ExecuteQuery(@"
                SELECT p.CC, p.CC + ' — ' + ps.Nome AS Label
                FROM SGH.Paciente p
                JOIN SGH.Pessoa ps ON ps.CC = p.CC
                ORDER BY ps.Nome");

            cboMed.DisplayMember = "Label";
            cboMed.ValueMember = "CC";
            cboMed.DataSource = DatabaseHelper.ExecuteQuery(@"
                SELECT m.CC, ps.Nome + ' (' + ISNULL(m.Especialidade, '-') + ')' AS Label
                FROM SGH.Medico m
                JOIN SGH.Pessoa ps ON ps.CC = m.CC
                ORDER BY ps.Nome");

            cboSala.DisplayMember = "Label";
            cboSala.ValueMember = "N_Sala";
            cboSala.DataSource = DatabaseHelper.ExecuteQuery(@"
                SELECT s.N_Sala,
                       'Sala ' + CAST(s.N_Sala AS varchar) + ' (' + s.Hospital_Nome + ')' AS Label
                FROM SGH.Sala s
                JOIN SGH.Tipo_de_Sala t ON t.Identificador = s.Tipo_Sala
                WHERE t.Designacao LIKE 'Gabinete%'
                ORDER BY s.N_Sala");
        }

        private void LoadGrid()
        {
            try
            {
                dgv.DataSource = DatabaseHelper.ExecuteQuery(@"
                    SELECT a.N_Avaliacao, a.Data, a.CC_Paciente, pp.Nome AS Paciente,
                           a.CC_Medico, pm.Nome AS Medico, a.N_Sala_Gabinete AS Sala
                    FROM SGH.Avaliacao a
                    JOIN SGH.Pessoa pp ON pp.CC = a.CC_Paciente
                    JOIN SGH.Pessoa pm ON pm.CC = a.CC_Medico
                    ORDER BY a.Data DESC, a.N_Avaliacao");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro"); }
        }

        // ── Eventos da grelha ─────────────────────────────────────────────────

        private void dgv_SelectionChanged(object sender, EventArgs e)
        {
            if (dgv.CurrentRow == null || dgv.CurrentRow.Index < 0) return;
            var r = dgv.CurrentRow;
            numN.Value = Convert.ToInt32(r.Cells["N_Avaliacao"].Value);
            dtpData.Value = Convert.ToDateTime(r.Cells["Data"].Value);
            cboPac.SelectedValue = r.Cells["CC_Paciente"].Value?.ToString();
            cboMed.SelectedValue = r.Cells["CC_Medico"].Value?.ToString();
            cboSala.SelectedValue = Convert.ToInt32(r.Cells["Sala"].Value);
            _oldN = (int)numN.Value;
        }

        // ── Botões ────────────────────────────────────────────────────────────

        private void btnRefresh_Click(object sender, EventArgs e) => LoadGrid();

        private void btnNovo_Click(object sender, EventArgs e)
        {
            numN.Value = DatabaseHelper.GetNextId("Avaliacao", "N_Avaliacao");
            dtpData.Value = DateTime.Today;
            cboPac.SelectedIndex = -1;
            cboMed.SelectedIndex = -1;
            cboSala.SelectedIndex = -1;
            _oldN = -1;
        }

        private bool ConfirmarSalaDisponivel(int nSala, DateTime data)
        {
            var disp = DatabaseHelper.ExecuteScalar(
                "SELECT SGH.fn_SalaDisponivel(@s, @d)",
                new SqlParameter("@s", nSala),
                new SqlParameter("@d", data.Date));
            if (Convert.ToBoolean(disp)) return true;
            return MessageBox.Show(
                "A sala já tem eventos agendados para esta data. Continuar mesmo assim?",
                "Sala ocupada", MessageBoxButtons.YesNo) == DialogResult.Yes;
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (cboPac.SelectedValue == null || cboMed.SelectedValue == null || cboSala.SelectedValue == null)
            { MessageBox.Show("Paciente, médico e sala são obrigatórios."); return; }
            if (!ConfirmarSalaDisponivel(Convert.ToInt32(cboSala.SelectedValue), dtpData.Value)) return;
            try
            {
                DatabaseHelper.ExecuteNonQuery(@"
                    INSERT INTO SGH.Avaliacao (N_Avaliacao, Data, CC_Paciente, CC_Medico, N_Sala_Gabinete)
                    VALUES (@n, @d, @p, @m, @s)",
                    new SqlParameter("@n", (int)numN.Value),
                    new SqlParameter("@d", dtpData.Value.Date),
                    new SqlParameter("@p", cboPac.SelectedValue.ToString()),
                    new SqlParameter("@m", cboMed.SelectedValue.ToString()),
                    new SqlParameter("@s", Convert.ToInt32(cboSala.SelectedValue)));
                LoadGrid();
                MessageBox.Show("Avaliação adicionada com sucesso.");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao inserir"); }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (_oldN < 0) { MessageBox.Show("Selecione uma avaliação."); return; }
            if (cboSala.SelectedValue != null && !ConfirmarSalaDisponivel(Convert.ToInt32(cboSala.SelectedValue), dtpData.Value)) return;
            try
            {
                DatabaseHelper.ExecuteNonQuery(@"
                    UPDATE SGH.Avaliacao
                    SET Data=@d, CC_Paciente=@p, CC_Medico=@m, N_Sala_Gabinete=@s
                    WHERE N_Avaliacao=@n",
                    new SqlParameter("@n", _oldN),
                    new SqlParameter("@d", dtpData.Value.Date),
                    new SqlParameter("@p", cboPac.SelectedValue.ToString()),
                    new SqlParameter("@m", cboMed.SelectedValue.ToString()),
                    new SqlParameter("@s", Convert.ToInt32(cboSala.SelectedValue)));
                LoadGrid();
                MessageBox.Show("Avaliação atualizada.");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao atualizar"); }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (_oldN < 0) { MessageBox.Show("Selecione uma avaliação."); return; }
            if (MessageBox.Show("Remover avaliação?", "Confirmar",
                    MessageBoxButtons.YesNo) != DialogResult.Yes) return;
            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "DELETE FROM SGH.Avaliacao WHERE N_Avaliacao=@n",
                    new SqlParameter("@n", _oldN));
                LoadGrid();
                btnNovo_Click(sender, e);
            }
            catch (Exception ex)
            {
                MessageBox.Show(
                    ex.Message + "\n\nNota: não é possível remover se existirem diagnósticos associados.",
                    "Erro ao remover");
            }
        }
    }
}