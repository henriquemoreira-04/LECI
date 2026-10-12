using System;
using System.Data.SqlClient;
using System.Windows.Forms;
using Test.DAL;

namespace Test.Forms
{
    public partial class SalasForm : Form
    {
        private int _oldId = -1;
        private int _oldTipoId = -1;

        public SalasForm()
        {
            InitializeComponent();
            if (DatabaseHelper.TestConnection())
                this.Load += (s, e) => { LoadCombos(); LoadGrid(); LoadTipoGrid(); };
            else
                MessageBox.Show("Não foi possível ligar à base de dados.", "Erro de ligação");
        }

        // ── Auxiliares ────────────────────────────────────────────────────────

        private static object NullIfEmpty(string value) =>
            string.IsNullOrWhiteSpace(value) ? (object)DBNull.Value : value.Trim();

        // ── Carregamento ──────────────────────────────────────────────────────

        private void LoadCombos()
        {
            cbDep.DisplayMember = "Label";
            cbDep.ValueMember = "Chave";
            cbDep.DataSource = DatabaseHelper.ExecuteQuery(@"
                SELECT CAST(N_Departamento AS varchar) + '|' + Hospital_Nome AS Chave,
                       Nome + ' (' + Hospital_Nome + ')' AS Label
                FROM SGH.Departamento ORDER BY Hospital_Nome, Nome");

            cbTipo.DisplayMember = "Label";
            cbTipo.ValueMember = "Identificador";
            cbTipo.DataSource = DatabaseHelper.ExecuteQuery(@"
                SELECT Identificador,
                       CAST(Identificador AS varchar) + ' — ' + Designacao AS Label
                FROM SGH.Tipo_de_Sala ORDER BY Identificador");

            cbEquip.DisplayMember = "Label";
            cbEquip.ValueMember = "Identificador";
            cbEquip.DataSource = DatabaseHelper.ExecuteQuery(@"
                SELECT Identificador,
                       CAST(Identificador AS varchar) + ' — ' + Nome AS Label
                FROM SGH.Equipamento_Medico ORDER BY Nome");
        }

        private void LoadTipoGrid()
        {
            try
            {
                dvgTipo.DataSource = DatabaseHelper.ExecuteQuery(
                    "SELECT Identificador, Designacao FROM SGH.Tipo_de_Sala ORDER BY Identificador");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro"); }
        }

        private void LoadGrid()
        {
            try
            {
                dgv.DataSource = DatabaseHelper.ExecuteQuery(@"
                    SELECT s.N_Sala, s.Andar, s.Hospital_Nome,
                           d.Nome AS Departamento,
                           tsl.Label AS [Tipo de Sala]
                    FROM SGH.Sala s
                    JOIN SGH.Departamento d ON d.N_Departamento = s.N_Departamento
                                           AND d.Hospital_Nome  = s.Hospital_Nome
                    OUTER APPLY SGH.fn_TipoSalaLabel(s.Tipo_Sala) AS tsl
                    ORDER BY s.Hospital_Nome, s.N_Sala");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro"); }
        }

        private void LoadEquipGrid(int nSala)
        {
            try
            {
                dgvEquip.DataSource = DatabaseHelper.ExecuteQuery(@"
                    SELECT se.Identificador_Equipamento AS [ID Equip.],
                           e.Nome AS Equipamento,
                           se.Quantidade
                    FROM SGH.Sala_Equipamento se
                    JOIN SGH.Equipamento_Medico e ON e.Identificador = se.Identificador_Equipamento
                    WHERE se.N_Sala = @n
                    ORDER BY e.Nome",
                    new SqlParameter("@n", nSala));
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao carregar equipamento"); }
        }

        // ── Eventos das grelhas ───────────────────────────────────────────────

        private void dgv_SelectionChanged(object sender, EventArgs e)
        {
            if (dgv.CurrentRow == null || dgv.CurrentRow.Index < 0) return;
            var r = dgv.CurrentRow;
            numId.Value = Convert.ToInt32(r.Cells["N_Sala"].Value);
            txtAndar.Text = r.Cells["Andar"].Value?.ToString();
            _oldId = (int)numId.Value;

            try
            {
                var dt = DatabaseHelper.ExecuteQuery(
                    "SELECT N_Departamento, Hospital_Nome, Tipo_Sala FROM SGH.Sala WHERE N_Sala=@n",
                    new SqlParameter("@n", _oldId));
                if (dt.Rows.Count > 0)
                {
                    cbDep.SelectedValue = dt.Rows[0]["N_Departamento"].ToString() + "|" + dt.Rows[0]["Hospital_Nome"].ToString();
                    cbTipo.SelectedValue = Convert.ToInt32(dt.Rows[0]["Tipo_Sala"]);
                }
            }
            catch { }

            LoadEquipGrid(_oldId);
        }

        private void dgvEquip_SelectionChanged(object sender, EventArgs e)
        {
            if (dgvEquip.CurrentRow == null || dgvEquip.CurrentRow.Index < 0) return;
            cbEquip.SelectedValue = Convert.ToInt32(dgvEquip.CurrentRow.Cells["ID Equip."].Value);
            numQtd.Value = Convert.ToInt32(dgvEquip.CurrentRow.Cells["Quantidade"].Value);
        }

        // ── Botões da sala ────────────────────────────────────────────────────

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            LoadGrid();
            dgvEquip.DataSource = null;
        }

        private void btnNovo_Click(object sender, EventArgs e)
        {
            numId.Value = DatabaseHelper.GetNextId("Sala", "N_Sala");
            txtAndar.Clear();
            cbDep.SelectedIndex = -1;
            cbTipo.SelectedIndex = -1;
            dgvEquip.DataSource = null;
            _oldId = -1;
            txtAndar.Focus();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (cbDep.SelectedValue == null || cbTipo.SelectedValue == null)
            { MessageBox.Show("Departamento e Tipo de Sala são obrigatórios."); return; }
            try
            {
                var dep = ParseDep();
                DatabaseHelper.ExecuteNonQuery(
                    "INSERT INTO SGH.Sala (N_Sala, Andar, N_Departamento, Hospital_Nome, Tipo_Sala) " +
                    "VALUES (@n, @a, @dep, @hosp, @tipo)",
                    new SqlParameter("@n", (int)numId.Value),
                    new SqlParameter("@a", NullIfEmpty(txtAndar.Text)),
                    new SqlParameter("@dep", dep.dep),
                    new SqlParameter("@hosp", dep.hosp),
                    new SqlParameter("@tipo", Convert.ToInt32(cbTipo.SelectedValue)));
                LoadGrid();
                MessageBox.Show("Sala adicionada com sucesso.");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao inserir"); }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (_oldId < 0) { MessageBox.Show("Selecione uma sala."); return; }
            try
            {
                var dep = ParseDep();
                DatabaseHelper.ExecuteNonQuery(
                    "UPDATE SGH.Sala SET Andar=@a, N_Departamento=@dep, Hospital_Nome=@hosp, Tipo_Sala=@tipo " +
                    "WHERE N_Sala=@n",
                    new SqlParameter("@n", _oldId),
                    new SqlParameter("@a", NullIfEmpty(txtAndar.Text)),
                    new SqlParameter("@dep", dep.dep),
                    new SqlParameter("@hosp", dep.hosp),
                    new SqlParameter("@tipo", Convert.ToInt32(cbTipo.SelectedValue)));
                LoadGrid();
                MessageBox.Show("Sala atualizada.");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao atualizar"); }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (_oldId < 0) { MessageBox.Show("Selecione uma sala."); return; }
            if (MessageBox.Show("Remover sala? O equipamento alocado também será removido.",
                    "Confirmar", MessageBoxButtons.YesNo) != DialogResult.Yes) return;
            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "EXEC SGH.sp_RemoverSala @nSala",
                    new SqlParameter("@nSala", _oldId));
                LoadGrid();
                btnNovo_Click(sender, e);
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao remover"); }
        }

        // ── Botões do equipamento ─────────────────────────────────────────────

        private void btnAddEquip_Click(object sender, EventArgs e)
        {
            if (_oldId < 0)
            { MessageBox.Show("Selecione primeiro uma sala."); return; }
            if (cbEquip.SelectedValue == null)
            { MessageBox.Show("Selecione um equipamento."); return; }
            if ((int)numQtd.Value <= 0)
            { MessageBox.Show("A quantidade deve ser maior que zero."); return; }
            try
            {
                DatabaseHelper.ExecuteNonQuery(@"
                    IF EXISTS (SELECT 1 FROM SGH.Sala_Equipamento WHERE N_Sala=@n AND Identificador_Equipamento=@e)
                        UPDATE SGH.Sala_Equipamento SET Quantidade=@q WHERE N_Sala=@n AND Identificador_Equipamento=@e
                    ELSE
                        INSERT INTO SGH.Sala_Equipamento (N_Sala, Identificador_Equipamento, Quantidade)
                        VALUES (@n, @e, @q)",
                    new SqlParameter("@n", _oldId),
                    new SqlParameter("@e", Convert.ToInt32(cbEquip.SelectedValue)),
                    new SqlParameter("@q", (int)numQtd.Value));
                LoadEquipGrid(_oldId);
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao alocar equipamento"); }
        }

        private void btnDelEquip_Click(object sender, EventArgs e)
        {
            if (_oldId < 0)
            { MessageBox.Show("Selecione primeiro uma sala."); return; }
            if (dgvEquip.CurrentRow == null || dgvEquip.CurrentRow.Index < 0)
            { MessageBox.Show("Selecione um equipamento na lista."); return; }
            if (MessageBox.Show("Remover este equipamento da sala?", "Confirmar",
                    MessageBoxButtons.YesNo) != DialogResult.Yes) return;
            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "DELETE FROM SGH.Sala_Equipamento WHERE N_Sala=@n AND Identificador_Equipamento=@e",
                    new SqlParameter("@n", _oldId),
                    new SqlParameter("@e", Convert.ToInt32(dgvEquip.CurrentRow.Cells["ID Equip."].Value)));
                LoadEquipGrid(_oldId);
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao remover equipamento"); }
        }

        // ── Auxiliar dep ─────────────────────────────────────────────────────

        private (int dep, string hosp) ParseDep()
        {
            var parts = cbDep.SelectedValue?.ToString().Split('|');
            if (parts == null || parts.Length != 2)
                throw new InvalidOperationException("Selecione um departamento válido.");
            return (int.Parse(parts[0]), parts[1]);
        }

        // ── Tipos de Sala ─────────────────────────────────────────────────────

        private void dvgTipo_SelectionChanged(object sender, EventArgs e)
        {
            if (dvgTipo.CurrentRow == null || dvgTipo.CurrentRow.Index < 0) return;
            numericUpDown1.Value = Convert.ToInt32(dvgTipo.CurrentRow.Cells["Identificador"].Value);
            txtDes.Text = dvgTipo.CurrentRow.Cells["Designacao"].Value?.ToString();
            _oldTipoId = (int)numericUpDown1.Value;
        }

        private void btnNovoTipo_Click(object sender, EventArgs e)
        {
            numericUpDown1.Value = DatabaseHelper.GetNextId("Tipo_de_Sala", "Identificador");
            txtDes.Clear();
            _oldTipoId = -1;
            txtDes.Focus();
        }

        private void btnAddTipo_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtDes.Text))
            { MessageBox.Show("Designação é obrigatória."); return; }
            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "INSERT INTO SGH.Tipo_de_Sala (Identificador, Designacao) VALUES (@i, @d)",
                    new SqlParameter("@i", (int)numericUpDown1.Value),
                    new SqlParameter("@d", txtDes.Text.Trim()));
                LoadTipoGrid();
                LoadCombos();
                MessageBox.Show("Tipo de sala adicionado com sucesso.");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao inserir"); }
        }

        private void btnUpdTipo_Click(object sender, EventArgs e)
        {
            if (_oldTipoId < 0) { MessageBox.Show("Selecione um tipo de sala."); return; }
            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "UPDATE SGH.Tipo_de_Sala SET Designacao=@d WHERE Identificador=@i",
                    new SqlParameter("@i", _oldTipoId),
                    new SqlParameter("@d", txtDes.Text.Trim()));
                LoadTipoGrid();
                LoadCombos();
                LoadGrid();
                MessageBox.Show("Tipo de sala atualizado.");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message, "Erro ao atualizar"); }
        }

        private void btnDelTipo_Click(object sender, EventArgs e)
        {
            if (_oldTipoId < 0) { MessageBox.Show("Selecione um tipo de sala."); return; }
            if (MessageBox.Show("Remover tipo de sala?", "Confirmar",
                    MessageBoxButtons.YesNo) != DialogResult.Yes) return;
            try
            {
                DatabaseHelper.ExecuteNonQuery(
                    "DELETE FROM SGH.Tipo_de_Sala WHERE Identificador=@i",
                    new SqlParameter("@i", _oldTipoId));
                LoadTipoGrid();
                LoadCombos();
                LoadGrid();
                btnNovoTipo_Click(sender, e);
            }
            catch (Exception ex)
            {
                MessageBox.Show(
                    ex.Message + "\n\nNota: não é possível remover se existirem salas deste tipo.",
                    "Erro ao remover");
            }
        }
    }
}