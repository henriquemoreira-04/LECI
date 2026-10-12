namespace Test.Forms
{
    partial class EnfermeirosForm
    {
        private System.ComponentModel.IContainer components = null;
        private System.Windows.Forms.DataGridView dgv;
        private System.Windows.Forms.GroupBox grpEdit;
        private System.Windows.Forms.Label lblTitulo, lblCC, lblNEnf, lblHC, lblDep, lblCirurgias;
        private System.Windows.Forms.ComboBox cbCC, cbDep, cbCir;
        private System.Windows.Forms.TextBox txtNEnf, txtHC;
        private System.Windows.Forms.DataGridView cirGrid;
        private System.Windows.Forms.Button btnNovo, btnAdd, btnUpdate, btnDelete, btnRefresh;
        private System.Windows.Forms.Button btnAddCir, btnDelCir;

        protected override void Dispose(bool disposing) { if (disposing && components != null) components.Dispose(); base.Dispose(disposing); }

        private void InitializeComponent()
        {
            dgv = new DataGridView();
            grpEdit = new GroupBox();
            lblCC = new Label();
            cbCC = new ComboBox();
            lblNEnf = new Label();
            txtNEnf = new TextBox();
            lblDep = new Label();
            cbDep = new ComboBox();
            lblHC = new Label();
            txtHC = new TextBox();
            lblCirurgias = new Label();
            cirGrid = new DataGridView();
            cbCir = new ComboBox();
            btnAddCir = new Button();
            btnDelCir = new Button();
            btnNovo = new Button();
            btnAdd = new Button();
            btnUpdate = new Button();
            btnDelete = new Button();
            lblTitulo = new Label();
            btnRefresh = new Button();
            ((System.ComponentModel.ISupportInitialize)dgv).BeginInit();
            grpEdit.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)cirGrid).BeginInit();
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
            dgv.Size = new Size(1878, 200);
            dgv.TabIndex = 1;
            dgv.SelectionChanged += dgv_SelectionChanged;
            // 
            // grpEdit
            // 
            grpEdit.Controls.Add(lblCC);
            grpEdit.Controls.Add(cbCC);
            grpEdit.Controls.Add(lblNEnf);
            grpEdit.Controls.Add(txtNEnf);
            grpEdit.Controls.Add(lblDep);
            grpEdit.Controls.Add(cbDep);
            grpEdit.Controls.Add(lblHC);
            grpEdit.Controls.Add(txtHC);
            grpEdit.Controls.Add(lblCirurgias);
            grpEdit.Controls.Add(cirGrid);
            grpEdit.Controls.Add(cbCir);
            grpEdit.Controls.Add(btnAddCir);
            grpEdit.Controls.Add(btnDelCir);
            grpEdit.Controls.Add(btnNovo);
            grpEdit.Controls.Add(btnAdd);
            grpEdit.Controls.Add(btnUpdate);
            grpEdit.Controls.Add(btnDelete);
            grpEdit.Location = new Point(12, 255);
            grpEdit.Name = "grpEdit";
            grpEdit.Size = new Size(1878, 480);
            grpEdit.TabIndex = 2;
            grpEdit.TabStop = false;
            grpEdit.Text = "Detalhes";
            // 
            // lblCC
            // 
            lblCC.Location = new Point(15, 30);
            lblCC.Name = "lblCC";
            lblCC.Size = new Size(120, 23);
            lblCC.TabIndex = 0;
            lblCC.Text = "Pessoa (CC):";
            // 
            // cbCC
            // 
            cbCC.DropDownStyle = ComboBoxStyle.DropDownList;
            cbCC.Location = new Point(140, 27);
            cbCC.Name = "cbCC";
            cbCC.Size = new Size(400, 29);
            cbCC.TabIndex = 1;
            // 
            // lblNEnf
            // 
            lblNEnf.Location = new Point(15, 67);
            lblNEnf.Name = "lblNEnf";
            lblNEnf.Size = new Size(120, 23);
            lblNEnf.TabIndex = 2;
            lblNEnf.Text = "Nº Enfermeiro:";
            // 
            // txtNEnf
            // 
            txtNEnf.Location = new Point(140, 64);
            txtNEnf.Name = "txtNEnf";
            txtNEnf.Size = new Size(200, 29);
            txtNEnf.TabIndex = 2;
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
            // lblHC
            // 
            lblHC.Location = new Point(15, 141);
            lblHC.Name = "lblHC";
            lblHC.Size = new Size(120, 23);
            lblHC.TabIndex = 4;
            lblHC.Text = "Histórico Consultas:";
            // 
            // txtHC
            // 
            txtHC.Location = new Point(140, 138);
            txtHC.Multiline = true;
            txtHC.Name = "txtHC";
            txtHC.Size = new Size(590, 55);
            txtHC.TabIndex = 4;
            // 
            // lblCirurgias
            // 
            lblCirurgias.Location = new Point(15, 210);
            lblCirurgias.Name = "lblCirurgias";
            lblCirurgias.Size = new Size(120, 23);
            lblCirurgias.TabIndex = 5;
            lblCirurgias.Text = "Cirurgias:";
            // 
            // cirGrid
            // 
            cirGrid.AllowUserToAddRows = false;
            cirGrid.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            cirGrid.BackgroundColor = Color.White;
            cirGrid.BorderStyle = BorderStyle.Fixed3D;
            cirGrid.ColumnHeadersHeight = 29;
            cirGrid.Location = new Point(140, 207);
            cirGrid.MultiSelect = false;
            cirGrid.Name = "cirGrid";
            cirGrid.ReadOnly = true;
            cirGrid.RowHeadersVisible = false;
            cirGrid.RowHeadersWidth = 51;
            cirGrid.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            cirGrid.Size = new Size(590, 150);
            cirGrid.TabIndex = 5;
            cirGrid.SelectionChanged += cirGrid_SelectionChanged;
            // 
            // cbCir
            // 
            cbCir.DropDownStyle = ComboBoxStyle.DropDownList;
            cbCir.Location = new Point(140, 365);
            cbCir.Name = "cbCir";
            cbCir.Size = new Size(378, 29);
            cbCir.TabIndex = 6;
            // 
            // btnAddCir
            // 
            btnAddCir.BackColor = Color.WhiteSmoke;
            btnAddCir.Location = new Point(524, 365);
            btnAddCir.Name = "btnAddCir";
            btnAddCir.Size = new Size(100, 29);
            btnAddCir.TabIndex = 7;
            btnAddCir.Text = "Adicionar";
            btnAddCir.UseVisualStyleBackColor = false;
            btnAddCir.Click += btnAddCir_Click;
            // 
            // btnDelCir
            // 
            btnDelCir.BackColor = Color.WhiteSmoke;
            btnDelCir.Location = new Point(630, 365);
            btnDelCir.Name = "btnDelCir";
            btnDelCir.Size = new Size(100, 29);
            btnDelCir.TabIndex = 8;
            btnDelCir.Text = "Remover";
            btnDelCir.UseVisualStyleBackColor = false;
            btnDelCir.Click += btnDelCir_Click;
            // 
            // btnNovo
            // 
            btnNovo.Location = new Point(15, 444);
            btnNovo.Name = "btnNovo";
            btnNovo.Size = new Size(150, 30);
            btnNovo.TabIndex = 9;
            btnNovo.Text = "Novo";
            btnNovo.Click += btnNovo_Click;
            // 
            // btnAdd
            // 
            btnAdd.BackColor = Color.WhiteSmoke;
            btnAdd.Location = new Point(171, 444);
            btnAdd.Name = "btnAdd";
            btnAdd.Size = new Size(150, 30);
            btnAdd.TabIndex = 10;
            btnAdd.Text = "Adicionar";
            btnAdd.UseVisualStyleBackColor = false;
            btnAdd.Click += btnAdd_Click;
            // 
            // btnUpdate
            // 
            btnUpdate.BackColor = Color.WhiteSmoke;
            btnUpdate.Location = new Point(327, 444);
            btnUpdate.Name = "btnUpdate";
            btnUpdate.Size = new Size(150, 30);
            btnUpdate.TabIndex = 11;
            btnUpdate.Text = "Atualizar";
            btnUpdate.UseVisualStyleBackColor = false;
            btnUpdate.Click += btnUpdate_Click;
            // 
            // btnDelete
            // 
            btnDelete.BackColor = Color.WhiteSmoke;
            btnDelete.Location = new Point(483, 444);
            btnDelete.Name = "btnDelete";
            btnDelete.Size = new Size(150, 30);
            btnDelete.TabIndex = 12;
            btnDelete.Text = "Remover";
            btnDelete.UseVisualStyleBackColor = false;
            btnDelete.Click += btnDelete_Click;
            // 
            // lblTitulo
            // 
            lblTitulo.AutoSize = true;
            lblTitulo.Font = new Font("Segoe UI", 14F, FontStyle.Bold);
            lblTitulo.Location = new Point(12, 10);
            lblTitulo.Name = "lblTitulo";
            lblTitulo.Size = new Size(272, 32);
            lblTitulo.TabIndex = 0;
            lblTitulo.Text = "Gestão de Enfermeiros";
            // 
            // btnRefresh
            // 
            btnRefresh.Location = new Point(1740, 8);
            btnRefresh.Name = "btnRefresh";
            btnRefresh.Size = new Size(150, 31);
            btnRefresh.TabIndex = 1;
            btnRefresh.Text = "Recarregar";
            btnRefresh.Click += btnRefresh_Click;
            // 
            // EnfermeirosForm
            // 
            BackColor = Color.WhiteSmoke;
            ClientSize = new Size(1902, 1033);
            Controls.Add(lblTitulo);
            Controls.Add(btnRefresh);
            Controls.Add(dgv);
            Controls.Add(grpEdit);
            Font = new Font("Segoe UI", 9.5F);
            Name = "EnfermeirosForm";
            Text = "Enfermeiros";
            ((System.ComponentModel.ISupportInitialize)dgv).EndInit();
            grpEdit.ResumeLayout(false);
            grpEdit.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)cirGrid).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }
    }
}