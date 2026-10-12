namespace Test.Forms
{
    partial class SalasForm
    {
        private System.ComponentModel.IContainer components = null;
        private System.Windows.Forms.DataGridView dgv;
        private System.Windows.Forms.GroupBox grpEdit;
        private System.Windows.Forms.Label lblTitulo, lblId, lblAndar, lblDep, lblTipo;
        private System.Windows.Forms.Label lblEquip, lblQtd;
        private System.Windows.Forms.NumericUpDown numId, numQtd;
        private System.Windows.Forms.TextBox txtAndar;
        private System.Windows.Forms.ComboBox cbDep, cbTipo, cbEquip;
        private System.Windows.Forms.DataGridView dgvEquip;
        private System.Windows.Forms.Button btnNovo, btnAdd, btnUpdate, btnDelete, btnRefresh;
        private System.Windows.Forms.Button btnAddEquip, btnDelEquip;

        protected override void Dispose(bool disposing) { if (disposing && components != null) components.Dispose(); base.Dispose(disposing); }

        private void InitializeComponent()
        {
            dgv = new DataGridView();
            grpEdit = new GroupBox();
            lblId = new Label();
            numId = new NumericUpDown();
            lblAndar = new Label();
            txtAndar = new TextBox();
            lblDep = new Label();
            cbDep = new ComboBox();
            lblTipo = new Label();
            cbTipo = new ComboBox();
            btnNovo = new Button();
            btnAdd = new Button();
            btnUpdate = new Button();
            btnDelete = new Button();
            lblEquip = new Label();
            dgvEquip = new DataGridView();
            cbEquip = new ComboBox();
            lblQtd = new Label();
            numQtd = new NumericUpDown();
            btnAddEquip = new Button();
            btnDelEquip = new Button();
            lblTitulo = new Label();
            btnRefresh = new Button();
            dvgTipo = new DataGridView();
            lblTipoSala = new Label();
            lblTipoID = new Label();
            numericUpDown1 = new NumericUpDown();
            lblDes = new Label();
            txtDes = new TextBox();
            btnNovoTipo = new Button();
            btnAddTipo = new Button();
            btnUpdTipo = new Button();
            btnDelTipo = new Button();
            ((System.ComponentModel.ISupportInitialize)dgv).BeginInit();
            grpEdit.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)numId).BeginInit();
            ((System.ComponentModel.ISupportInitialize)dgvEquip).BeginInit();
            ((System.ComponentModel.ISupportInitialize)numQtd).BeginInit();
            ((System.ComponentModel.ISupportInitialize)dvgTipo).BeginInit();
            ((System.ComponentModel.ISupportInitialize)numericUpDown1).BeginInit();
            SuspendLayout();
            // 
            // dgv
            // 
            dgv.AllowUserToAddRows = false;
            dgv.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgv.ColumnHeadersHeight = 29;
            dgv.Location = new Point(12, 45);
            dgv.MultiSelect = false;
            dgv.Name = "dgv";
            dgv.ReadOnly = true;
            dgv.RowHeadersVisible = false;
            dgv.RowHeadersWidth = 51;
            dgv.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgv.Size = new Size(1881, 280);
            dgv.TabIndex = 1;
            dgv.SelectionChanged += dgv_SelectionChanged;
            // 
            // grpEdit
            // 
            grpEdit.Controls.Add(lblTipoID);
            grpEdit.Controls.Add(numericUpDown1);
            grpEdit.Controls.Add(lblDes);
            grpEdit.Controls.Add(txtDes);
            grpEdit.Controls.Add(btnNovoTipo);
            grpEdit.Controls.Add(btnAddTipo);
            grpEdit.Controls.Add(btnUpdTipo);
            grpEdit.Controls.Add(btnDelTipo);
            grpEdit.Controls.Add(lblTipoSala);
            grpEdit.Controls.Add(dvgTipo);
            grpEdit.Controls.Add(lblId);
            grpEdit.Controls.Add(numId);
            grpEdit.Controls.Add(lblAndar);
            grpEdit.Controls.Add(txtAndar);
            grpEdit.Controls.Add(lblDep);
            grpEdit.Controls.Add(cbDep);
            grpEdit.Controls.Add(lblTipo);
            grpEdit.Controls.Add(cbTipo);
            grpEdit.Controls.Add(btnNovo);
            grpEdit.Controls.Add(btnAdd);
            grpEdit.Controls.Add(btnUpdate);
            grpEdit.Controls.Add(btnDelete);
            grpEdit.Controls.Add(lblEquip);
            grpEdit.Controls.Add(dgvEquip);
            grpEdit.Controls.Add(cbEquip);
            grpEdit.Controls.Add(lblQtd);
            grpEdit.Controls.Add(numQtd);
            grpEdit.Controls.Add(btnAddEquip);
            grpEdit.Controls.Add(btnDelEquip);
            grpEdit.Location = new Point(12, 335);
            grpEdit.Name = "grpEdit";
            grpEdit.Size = new Size(1881, 692);
            grpEdit.TabIndex = 2;
            grpEdit.TabStop = false;
            grpEdit.Text = "Detalhes";
            // 
            // lblId
            // 
            lblId.Location = new Point(15, 30);
            lblId.Name = "lblId";
            lblId.Size = new Size(120, 23);
            lblId.TabIndex = 0;
            lblId.Text = "Nº Sala:";
            // 
            // numId
            // 
            numId.Location = new Point(140, 27);
            numId.Maximum = new decimal(new int[] { 9999, 0, 0, 0 });
            numId.Name = "numId";
            numId.Size = new Size(100, 29);
            numId.TabIndex = 1;
            // 
            // lblAndar
            // 
            lblAndar.Location = new Point(15, 67);
            lblAndar.Name = "lblAndar";
            lblAndar.Size = new Size(120, 23);
            lblAndar.TabIndex = 2;
            lblAndar.Text = "Andar:";
            // 
            // txtAndar
            // 
            txtAndar.Location = new Point(140, 64);
            txtAndar.Name = "txtAndar";
            txtAndar.Size = new Size(100, 29);
            txtAndar.TabIndex = 2;
            // 
            // lblDep
            // 
            lblDep.Location = new Point(15, 104);
            lblDep.Name = "lblDep";
            lblDep.Size = new Size(120, 23);
            lblDep.TabIndex = 3;
            lblDep.Text = "Departamento:";
            // 
            // cbDep
            // 
            cbDep.DropDownStyle = ComboBoxStyle.DropDownList;
            cbDep.Location = new Point(140, 101);
            cbDep.Name = "cbDep";
            cbDep.Size = new Size(400, 29);
            cbDep.TabIndex = 3;
            // 
            // lblTipo
            // 
            lblTipo.Location = new Point(15, 141);
            lblTipo.Name = "lblTipo";
            lblTipo.Size = new Size(120, 23);
            lblTipo.TabIndex = 4;
            lblTipo.Text = "Tipo de Sala:";
            // 
            // cbTipo
            // 
            cbTipo.DropDownStyle = ComboBoxStyle.DropDownList;
            cbTipo.Location = new Point(140, 138);
            cbTipo.Name = "cbTipo";
            cbTipo.Size = new Size(300, 29);
            cbTipo.TabIndex = 4;
            // 
            // btnNovo
            // 
            btnNovo.Location = new Point(1708, 30);
            btnNovo.Name = "btnNovo";
            btnNovo.Size = new Size(150, 31);
            btnNovo.TabIndex = 5;
            btnNovo.Text = "Novo";
            btnNovo.Click += btnNovo_Click;
            // 
            // btnAdd
            // 
            btnAdd.BackColor = Color.WhiteSmoke;
            btnAdd.Location = new Point(1708, 67);
            btnAdd.Name = "btnAdd";
            btnAdd.Size = new Size(150, 31);
            btnAdd.TabIndex = 6;
            btnAdd.Text = "Adicionar";
            btnAdd.UseVisualStyleBackColor = false;
            btnAdd.Click += btnAdd_Click;
            // 
            // btnUpdate
            // 
            btnUpdate.BackColor = Color.WhiteSmoke;
            btnUpdate.Location = new Point(1708, 104);
            btnUpdate.Name = "btnUpdate";
            btnUpdate.Size = new Size(150, 31);
            btnUpdate.TabIndex = 7;
            btnUpdate.Text = "Atualizar";
            btnUpdate.UseVisualStyleBackColor = false;
            btnUpdate.Click += btnUpdate_Click;
            // 
            // btnDelete
            // 
            btnDelete.BackColor = Color.WhiteSmoke;
            btnDelete.Location = new Point(1708, 141);
            btnDelete.Name = "btnDelete";
            btnDelete.Size = new Size(150, 31);
            btnDelete.TabIndex = 8;
            btnDelete.Text = "Remover";
            btnDelete.UseVisualStyleBackColor = false;
            btnDelete.Click += btnDelete_Click;
            // 
            // lblEquip
            // 
            lblEquip.Font = new Font("Segoe UI", 9.5F, FontStyle.Bold);
            lblEquip.Location = new Point(15, 185);
            lblEquip.Name = "lblEquip";
            lblEquip.Size = new Size(120, 23);
            lblEquip.TabIndex = 9;
            lblEquip.Text = "Equipamento:";
            // 
            // dgvEquip
            // 
            dgvEquip.AllowUserToAddRows = false;
            dgvEquip.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgvEquip.ColumnHeadersHeight = 29;
            dgvEquip.Location = new Point(140, 185);
            dgvEquip.MultiSelect = false;
            dgvEquip.Name = "dgvEquip";
            dgvEquip.ReadOnly = true;
            dgvEquip.RowHeadersVisible = false;
            dgvEquip.RowHeadersWidth = 51;
            dgvEquip.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvEquip.Size = new Size(590, 359);
            dgvEquip.TabIndex = 5;
            dgvEquip.SelectionChanged += dgvEquip_SelectionChanged;
            // 
            // cbEquip
            // 
            cbEquip.DropDownStyle = ComboBoxStyle.DropDownList;
            cbEquip.Location = new Point(140, 551);
            cbEquip.Name = "cbEquip";
            cbEquip.Size = new Size(300, 29);
            cbEquip.TabIndex = 6;
            // 
            // lblQtd
            // 
            lblQtd.Location = new Point(446, 555);
            lblQtd.Name = "lblQtd";
            lblQtd.Size = new Size(41, 23);
            lblQtd.TabIndex = 10;
            lblQtd.Text = "Qtd:";
            // 
            // numQtd
            // 
            numQtd.Location = new Point(493, 551);
            numQtd.Maximum = new decimal(new int[] { 9999, 0, 0, 0 });
            numQtd.Minimum = new decimal(new int[] { 1, 0, 0, 0 });
            numQtd.Name = "numQtd";
            numQtd.Size = new Size(70, 29);
            numQtd.TabIndex = 7;
            numQtd.Value = new decimal(new int[] { 1, 0, 0, 0 });
            // 
            // btnAddEquip
            // 
            btnAddEquip.BackColor = Color.WhiteSmoke;
            btnAddEquip.Location = new Point(569, 551);
            btnAddEquip.Name = "btnAddEquip";
            btnAddEquip.Size = new Size(80, 29);
            btnAddEquip.TabIndex = 11;
            btnAddEquip.Text = "Alocar";
            btnAddEquip.UseVisualStyleBackColor = false;
            btnAddEquip.Click += btnAddEquip_Click;
            // 
            // btnDelEquip
            // 
            btnDelEquip.BackColor = Color.WhiteSmoke;
            btnDelEquip.Location = new Point(650, 550);
            btnDelEquip.Name = "btnDelEquip";
            btnDelEquip.Size = new Size(80, 29);
            btnDelEquip.TabIndex = 12;
            btnDelEquip.Text = "Remover";
            btnDelEquip.UseVisualStyleBackColor = false;
            btnDelEquip.Click += btnDelEquip_Click;
            // 
            // lblTitulo
            // 
            lblTitulo.AutoSize = true;
            lblTitulo.Font = new Font("Segoe UI", 14F, FontStyle.Bold);
            lblTitulo.Location = new Point(12, 10);
            lblTitulo.Name = "lblTitulo";
            lblTitulo.Size = new Size(191, 32);
            lblTitulo.TabIndex = 0;
            lblTitulo.Text = "Gestão de Salas";
            // 
            // btnRefresh
            // 
            btnRefresh.Location = new Point(1743, 8);
            btnRefresh.Name = "btnRefresh";
            btnRefresh.Size = new Size(150, 31);
            btnRefresh.TabIndex = 1;
            btnRefresh.Text = "Recarregar";
            btnRefresh.Click += btnRefresh_Click;
            // 
            // dvgTipo
            // 
            dvgTipo.AllowUserToAddRows = false;
            dvgTipo.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dvgTipo.ColumnHeadersHeight = 29;
            dvgTipo.Location = new Point(896, 185);
            dvgTipo.MultiSelect = false;
            dvgTipo.Name = "dvgTipo";
            dvgTipo.ReadOnly = true;
            dvgTipo.RowHeadersVisible = false;
            dvgTipo.RowHeadersWidth = 51;
            dvgTipo.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dvgTipo.Size = new Size(761, 218);
            dvgTipo.TabIndex = 13;
            dvgTipo.SelectionChanged += dvgTipo_SelectionChanged;
            // 
            // lblTipoSala
            // 
            lblTipoSala.Font = new Font("Segoe UI", 9.5F, FontStyle.Bold);
            lblTipoSala.Location = new Point(803, 185);
            lblTipoSala.Name = "lblTipoSala";
            lblTipoSala.Size = new Size(87, 23);
            lblTipoSala.TabIndex = 14;
            lblTipoSala.Text = "Tipo Sala:";
            // 
            // lblTipoID
            // 
            lblTipoID.Location = new Point(896, 415);
            lblTipoID.Name = "lblTipoID";
            lblTipoID.Size = new Size(100, 23);
            lblTipoID.TabIndex = 15;
            lblTipoID.Text = "Identificador:";
            // 
            // numericUpDown1
            // 
            numericUpDown1.Location = new Point(1021, 412);
            numericUpDown1.Maximum = new decimal(new int[] { 9999, 0, 0, 0 });
            numericUpDown1.Name = "numericUpDown1";
            numericUpDown1.Size = new Size(100, 29);
            numericUpDown1.TabIndex = 16;
            // 
            // lblDes
            // 
            lblDes.Location = new Point(896, 450);
            lblDes.Name = "lblDes";
            lblDes.Size = new Size(100, 23);
            lblDes.TabIndex = 17;
            lblDes.Text = "Designação:";
            // 
            // txtDes
            // 
            txtDes.Location = new Point(1021, 447);
            txtDes.Name = "txtDes";
            txtDes.Size = new Size(400, 29);
            txtDes.TabIndex = 18;
            // 
            // btnNovoTipo
            // 
            btnNovoTipo.Location = new Point(896, 491);
            btnNovoTipo.Name = "btnNovoTipo";
            btnNovoTipo.Size = new Size(150, 32);
            btnNovoTipo.TabIndex = 19;
            btnNovoTipo.Text = "Novo";
            btnNovoTipo.Click += btnNovoTipo_Click;
            //
            // btnAddTipo
            //
            btnAddTipo.Location = new Point(1052, 491);
            btnAddTipo.Name = "btnAddTipo";
            btnAddTipo.Size = new Size(150, 32);
            btnAddTipo.TabIndex = 20;
            btnAddTipo.Text = "Adicionar";
            btnAddTipo.Click += btnAddTipo_Click;
            //
            // btnUpdTipo
            //
            btnUpdTipo.Location = new Point(1208, 491);
            btnUpdTipo.Name = "btnUpdTipo";
            btnUpdTipo.Size = new Size(150, 32);
            btnUpdTipo.TabIndex = 21;
            btnUpdTipo.Text = "Atualizar";
            btnUpdTipo.Click += btnUpdTipo_Click;
            //
            // btnDelTipo
            //
            btnDelTipo.Location = new Point(1364, 491);
            btnDelTipo.Name = "btnDelTipo";
            btnDelTipo.Size = new Size(150, 32);
            btnDelTipo.TabIndex = 22;
            btnDelTipo.Text = "Apagar";
            btnDelTipo.Click += btnDelTipo_Click;
            // 
            // SalasForm
            // 
            BackColor = Color.WhiteSmoke;
            ClientSize = new Size(1902, 1033);
            Controls.Add(lblTitulo);
            Controls.Add(btnRefresh);
            Controls.Add(dgv);
            Controls.Add(grpEdit);
            Font = new Font("Segoe UI", 9.5F);
            Name = "SalasForm";
            Text = "Salas";
            ((System.ComponentModel.ISupportInitialize)dgv).EndInit();
            grpEdit.ResumeLayout(false);
            grpEdit.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)numId).EndInit();
            ((System.ComponentModel.ISupportInitialize)dgvEquip).EndInit();
            ((System.ComponentModel.ISupportInitialize)numQtd).EndInit();
            ((System.ComponentModel.ISupportInitialize)dvgTipo).EndInit();
            ((System.ComponentModel.ISupportInitialize)numericUpDown1).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        private Label lblTipoSala;
        private DataGridView dvgTipo;
        private Label lblTipoID;
        private NumericUpDown numericUpDown1;
        private Label lblDes;
        private TextBox txtDes;
        private Button btnNovoTipo;
        private Button btnAddTipo;
        private Button btnUpdTipo;
        private Button btnDelTipo;
    }
}