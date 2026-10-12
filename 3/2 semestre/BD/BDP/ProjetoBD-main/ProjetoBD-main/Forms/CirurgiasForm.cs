using System;
using System.Data.SqlClient;
using System.Windows.Forms;
using Test.DAL;

namespace Test.Forms
{
    public partial class CirurgiasForm : Form
    {
        private int _oldNC = -1;

        public CirurgiasForm()
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
            cboPac.DisplayMember = "Label";
            cboPac.ValueMember = "CC";
            cboPac.DataSource = DatabaseHelper.ExecuteQuery(@"
                SELECT p.CC, p.CC + ' — ' + ps.Nome AS Label
                FROM SGH.Paciente p
                JOIN SGH.Pessoa ps ON ps.CC = p.CC
                ORDER BY ps.Nome");

            cboSala.DisplayMember = "Label";
            cboSala.ValueMember = "N_Sala";
            cboSala.DataSource = DatabaseHelper.ExecuteQuery(@"
                SELECT s.N_Sala,
                       'Sala ' + CAST(s.N_Sala AS varchar) + ' (' + s.Hospital_Nome + ')' AS Label
                FROM SGH.Sala s
                JOIN SGH.Tipo_de_Sala t ON t.Identificador = s.Tipo_Sala
                WHERE t.Designacao LIKE '%Bloco%' OR t.Designacao LIKE '%Operat%'
                ORDER BY s.N_Sala");

            cboDiag.DisplayMember = "Label";
            cboDiag.ValueMember = "N_Diagnostico";
            cboDiag.DataSource = DatabaseHelper.ExecuteQuery(@"
                SELECT d.N_Diagnostico,
                       'Diag.' + CAST(d.N_Diagnostico AS varchar) + ' — ' + d.Designacao AS Label
                FROM SGH.Diagnostico d
                ORDER BY d.Data DESC");

            // ComboBox de médicos para associar à cirurgia
            cbMed.DisplayMember = "Label";
            cbMed.ValueMember = "CC";
            cbMed.DataSource = DatabaseHelper.ExecuteQuery(@"
                SELECT m.CC,
                       m.N_medico + ' — ' + ps.Nome + ' (' + ISNULL(m.Especialidade, '-') + ')' AS Label
                FROM SGH.Medico m
                JOIN SGH.Pessoa ps ON ps.CC = m.CC
                ORDER BY ps.Nome");

            // ComboBox de enfermeiros para associar à cirurgia
            cbEnf.DisplayMember = "Label";
            cbEnf.ValueMember = "CC";
            cbEnf.DataSource = DatabaseHelper.ExecuteQuery(@"
                SELECT e.CC,
                       e.N_Enfermeiro + ' — ' + ps.Nome AS Label
                FROM SGH.Enfermeiro e
                JOIN SGH.Pessoa ps ON ps.CC = e.CC
                ORDER BY ps.Nome");
        }

        private void LoadGrid()
        {
            try
            {
                dgv.DataSource = DatabaseHelper.ExecuteQuery(@"
                    SELECT c.N_Cirurgia, c.Data, c.Risco, c.CC_Paciente,
                           ps.Nome AS Paciente, c.N_Sala_Operacao AS Sala,
                           c.N_Diagnostico, c.Observacoes
                    FROM SGH.Cirurgia c
                    JOIN SGH.Pessoa ps ON ps.CC = c.CC_Paciente
                    ORDER BY c.Data DESC, c.N_Cirurgia");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro"); }
        }

        private void medGrid_SelectionChanged(object sender, EventArgs e)
        {
            if (medGrid.CurrentRow == null || medGrid.CurrentRow.Index < 0) return;
            cbMed.SelectedValue = medGrid.CurrentRow.Cells["CC"].Value?.ToString();
        }

        private void LoadMedGrid(int nCirurgia)
        {
            try
            {
                medGrid.DataSource = DatabaseHelper.ExecuteQuery(@"
                    SELECT mc.CC_Medico AS CC, m.N_medico AS [Nº Médico],
                           ps.Nome AS Nome, ISNULL(m.Especialidade, '-') AS Especialidade
                    FROM SGH.Medico_Cirurgia mc
                    JOIN SGH.Medico m  ON m.CC  = mc.CC_Medico
                    JOIN SGH.Pessoa ps ON ps.CC = mc.CC_Medico
                    WHERE mc.N_Cirurgia = @n
                    ORDER BY ps.Nome",
                    new SqlParameter("@n", nCirurgia));
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao carregar médicos"); }
        }

        private void dvgEnf_SelectionChanged(object sender, EventArgs e)
        {
            if (dvgEnf.CurrentRow == null || dvgEnf.CurrentRow.Index < 0) return;
            cbEnf.SelectedValue = dvgEnf.CurrentRow.Cells["CC"].Value?.ToString();
        }

        private void LoadEnfGrid(int nCirurgia)
        {
            try
            {
                dvgEnf.DataSource = DatabaseHelper.ExecuteQuery(@"
                    SELECT ec.CC_Enfermeiro AS CC, e.N_Enfermeiro AS [Nº Enfermeiro],
                           ps.Nome AS Nome
                    FROM SGH.Enfermeiro_Cirurgia ec
                    JOIN SGH.Enfermeiro e  ON e.CC  = ec.CC_Enfermeiro
                    JOIN SGH.Pessoa ps     ON ps.CC = ec.CC_Enfermeiro
                    WHERE ec.N_Cirurgia = @n
                    ORDER BY ps.Nome",
                    new SqlParameter("@n", nCirurgia));
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao carregar enfermeiros"); }
        }

        // ── Eventos da grelha principal ───────────────────────────────────────

        private void dgv_SelectionChanged(object sender, EventArgs e)
        {
            if (dgv.CurrentRow == null || dgv.CurrentRow.Index < 0) return;
            var r = dgv.CurrentRow;
            numNC.Value = Convert.ToInt32(r.Cells["N_Cirurgia"].Value);
            dtpData.Value = Convert.ToDateTime(r.Cells["Data"].Value);
            cboRisco.Text = r.Cells["Risco"].Value?.ToString();
            cboPac.SelectedValue = r.Cells["CC_Paciente"].Value?.ToString();
            cboSala.SelectedValue = Convert.ToInt32(r.Cells["Sala"].Value);
            cboDiag.SelectedValue = Convert.ToInt32(r.Cells["N_Diagnostico"].Value);
            txtObs.Text = r.Cells["Observacoes"].Value?.ToString();
            _oldNC = (int)numNC.Value;

            // Carrega médicos e enfermeiros da cirurgia selecionada
            LoadMedGrid(_oldNC);
            LoadEnfGrid(_oldNC);
        }

        // ── Botões da cirurgia ────────────────────────────────────────────────

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            LoadGrid();
            medGrid.DataSource = null;
            dvgEnf.DataSource = null;
        }

        private void btnNovo_Click(object sender, EventArgs e)
        {
            numNC.Value = DatabaseHelper.GetNextId("Cirurgia", "N_Cirurgia");
            dtpData.Value = DateTime.Today;
            cboRisco.Text = "";
            txtObs.Clear();
            cboPac.SelectedIndex = -1;
            cboSala.SelectedIndex = -1;
            cboDiag.SelectedIndex = -1;
            medGrid.DataSource = null;
            dvgEnf.DataSource = null;
            _oldNC = -1;
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
            if (cboPac.SelectedValue == null || cboSala.SelectedValue == null || cboDiag.SelectedValue == null)
            { MessageBox.Show("Paciente, sala e diagnóstico são obrigatórios."); return; }
            if (!ConfirmarSalaDisponivel(Convert.ToInt32(cboSala.SelectedValue), dtpData.Value)) return;
            try
            {
                DatabaseHelper.ExecuteNonQuery(@"
                    INSERT INTO SGH.Cirurgia
                        (N_Cirurgia, Data, Risco, Observacoes, CC_Paciente, N_Sala_Operacao, N_Diagnostico)
                    VALUES (@n, @d, @r, @o, @p, @s, @dg)",
                    new SqlParameter("@n", (int)numNC.Value),
                    new SqlParameter("@d", dtpData.Value.Date),
                    new SqlParameter("@r", NullIfEmpty(cboRisco.Text)),
                    new SqlParameter("@o", NullIfEmpty(txtObs.Text)),
                    new SqlParameter("@p", cboPac.SelectedValue.ToString()),
                    new SqlParameter("@s", Convert.ToInt32(cboSala.SelectedValue)),
                    new SqlParameter("@dg", Convert.ToInt32(cboDiag.SelectedValue)));
                LoadGrid();
                MessageBox.Show("Cirurgia adicionada com sucesso.");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao inserir"); }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (_oldNC < 0) { MessageBox.Show("Selecione uma cirurgia."); return; }
            if (cboSala.SelectedValue != null && !ConfirmarSalaDisponivel(Convert.ToInt32(cboSala.SelectedValue), dtpData.Value)) return;
            try
            {
                DatabaseHelper.ExecuteNonQuery(@"
                    UPDATE SGH.Cirurgia
                    SET Data=@d, Risco=@r, Observacoes=@o,
                        CC_Paciente=@p, N_Sala_Operacao=@s, N_Diagnostico=@dg
                    WHERE N_Cirurgia=@n",
                    new SqlParameter("@n", _oldNC),
                    new SqlParameter("@d", dtpData.Value.Date),
                    new SqlParameter("@r", NullIfEmpty(cboRisco.Text)),
                    new SqlParameter("@o", NullIfEmpty(txtObs.Text)),
                    new SqlParameter("@p", cboPac.SelectedValue.ToString()),
                    new SqlParameter("@s", Convert.ToInt32(cboSala.SelectedValue)),
                    new SqlParameter("@dg", Convert.ToInt32(cboDiag.SelectedValue)));
                LoadGrid();
                MessageBox.Show("Cirurgia atualizada.");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao atualizar"); }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (_oldNC < 0) { MessageBox.Show("Selecione uma cirurgia."); return; }
            if (MessageBox.Show("Remover cirurgia?", "Confirmar",
                    MessageBoxButtons.YesNo) != DialogResult.Yes) return;
            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "DELETE FROM SGH.Cirurgia WHERE N_Cirurgia=@n",
                    new SqlParameter("@n", _oldNC));
                LoadGrid();
                btnNovo_Click(sender, e);
            }
            catch (Exception ex)
            {
                MessageBox.Show(
                    ex.Message + "\n\nNota: remova primeiro as associações de médicos e enfermeiros.",
                    "Erro ao remover");
            }
        }

        // ── Botões dos médicos ────────────────────────────────────────────────

        private void btnAddMed_Click(object sender, EventArgs e)
        {
            if (_oldNC < 0)
            { MessageBox.Show("Selecione primeiro uma cirurgia."); return; }
            if (cbMed.SelectedValue == null)
            { MessageBox.Show("Selecione um médico."); return; }

            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "INSERT INTO SGH.Medico_Cirurgia (CC_Medico, N_Cirurgia) VALUES (@cc, @n)",
                    new SqlParameter("@cc", cbMed.SelectedValue.ToString()),
                    new SqlParameter("@n", _oldNC));
                LoadMedGrid(_oldNC);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message + "\n\nNota: o médico pode já estar associado a esta cirurgia.",
                    "Erro ao associar médico");
            }
        }

        private void btnDelMed_Click(object sender, EventArgs e)
        {
            if (_oldNC < 0)
            { MessageBox.Show("Selecione primeiro uma cirurgia."); return; }
            if (medGrid.CurrentRow == null || medGrid.CurrentRow.Index < 0)
            { MessageBox.Show("Selecione um médico na lista."); return; }

            var ccMed = medGrid.CurrentRow.Cells["CC"].Value?.ToString();
            if (string.IsNullOrEmpty(ccMed)) return;

            if (MessageBox.Show("Remover este médico da cirurgia?", "Confirmar",
                    MessageBoxButtons.YesNo) != DialogResult.Yes) return;
            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "DELETE FROM SGH.Medico_Cirurgia WHERE CC_Medico=@cc AND N_Cirurgia=@n",
                    new SqlParameter("@cc", ccMed),
                    new SqlParameter("@n", _oldNC));
                LoadMedGrid(_oldNC);
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao remover médico"); }
        }

        // ── Botões dos enfermeiros ────────────────────────────────────────────

        private void btnAddEnf_Click(object sender, EventArgs e)
        {
            if (_oldNC < 0)
            { MessageBox.Show("Selecione primeiro uma cirurgia."); return; }
            if (cbEnf.SelectedValue == null)
            { MessageBox.Show("Selecione um enfermeiro."); return; }

            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "INSERT INTO SGH.Enfermeiro_Cirurgia (CC_Enfermeiro, N_Cirurgia) VALUES (@cc, @n)",
                    new SqlParameter("@cc", cbEnf.SelectedValue.ToString()),
                    new SqlParameter("@n", _oldNC));
                LoadEnfGrid(_oldNC);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message + "\n\nNota: o enfermeiro pode já estar associado a esta cirurgia.",
                    "Erro ao associar enfermeiro");
            }
        }

        private void btnDelEnf_Click(object sender, EventArgs e)
        {
            if (_oldNC < 0)
            { MessageBox.Show("Selecione primeiro uma cirurgia."); return; }
            if (dvgEnf.CurrentRow == null || dvgEnf.CurrentRow.Index < 0)
            { MessageBox.Show("Selecione um enfermeiro na lista."); return; }

            var ccEnf = dvgEnf.CurrentRow.Cells["CC"].Value?.ToString();
            if (string.IsNullOrEmpty(ccEnf)) return;

            if (MessageBox.Show("Remover este enfermeiro da cirurgia?", "Confirmar",
                    MessageBoxButtons.YesNo) != DialogResult.Yes) return;
            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "DELETE FROM SGH.Enfermeiro_Cirurgia WHERE CC_Enfermeiro=@cc AND N_Cirurgia=@n",
                    new SqlParameter("@cc", ccEnf),
                    new SqlParameter("@n", _oldNC));
                LoadEnfGrid(_oldNC);
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao remover enfermeiro"); }
        }
    }
}