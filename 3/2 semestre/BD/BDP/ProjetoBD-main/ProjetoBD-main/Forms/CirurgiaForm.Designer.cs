namespace Test.Forms
{
    partial class CirurgiasForm
    {
        private System.ComponentModel.IContainer components = null;
        private System.Windows.Forms.DataGridView dgv;
        private System.Windows.Forms.GroupBox grpEdit;
        private System.Windows.Forms.Label lblNC, lblData, lblRisco, lblObs, lblPac, lblSala, lblDiag, lblTitulo;
        private System.Windows.Forms.NumericUpDown numNC;
        private System.Windows.Forms.DateTimePicker dtpData;
        private System.Windows.Forms.ComboBox cboRisco, cboPac, cboSala, cboDiag;
        private System.Windows.Forms.TextBox txtObs;
        private System.Windows.Forms.Button btnNovo, btnAdd, btnUpdate, btnDelete, btnRefresh;

        protected override void Dispose(bool disposing) { if (disposing && components != null) components.Dispose(); base.Dispose(disposing); }

        private void InitializeComponent()
        {
            dgv = new DataGridView();
            grpEdit = new GroupBox();
            medGrid = new DataGridView();
            label1 = new Label();
            lblNC = new Label();
            numNC = new NumericUpDown();
            lblData = new Label();
            dtpData = new DateTimePicker();
            lblRisco = new Label();
            cboRisco = new ComboBox();
            lblPac = new Label();
            cboPac = new ComboBox();
            lblSala = new Label();
            cboSala = new ComboBox();
            lblDiag = new Label();
            cboDiag = new ComboBox();
            lblObs = new Label();
            txtObs = new TextBox();
            btnNovo = new Button();
            btnAdd = new Button();
            btnUpdate = new Button();
            btnDelete = new Button();
            lblTitulo = new Label();
            btnRefresh = new Button();
            cbMed = new ComboBox();
            btnAddMed = new Button();
            btnDelMed = new Button();
            ((System.ComponentModel.ISupportInitialize)dgv).BeginInit();
            grpEdit.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)medGrid).BeginInit();
            ((System.ComponentModel.ISupportInitialize)numNC).BeginInit();
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
            dgv.Size = new Size(1138, 200);
            dgv.TabIndex = 2;
            dgv.SelectionChanged += dgv_SelectionChanged;
            // 
            // grpEdit
            // 
            grpEdit.Controls.Add(btnAddMed);
            grpEdit.Controls.Add(btnDelMed);
            grpEdit.Controls.Add(cbMed);
            grpEdit.Controls.Add(medGrid);
            grpEdit.Controls.Add(label1);
            grpEdit.Controls.Add(lblNC);
            grpEdit.Controls.Add(numNC);
            grpEdit.Controls.Add(lblData);
            grpEdit.Controls.Add(dtpData);
            grpEdit.Controls.Add(lblRisco);
            grpEdit.Controls.Add(cboRisco);
            grpEdit.Controls.Add(lblPac);
            grpEdit.Controls.Add(cboPac);
            grpEdit.Controls.Add(lblSala);
            grpEdit.Controls.Add(cboSala);
            grpEdit.Controls.Add(lblDiag);
            grpEdit.Controls.Add(cboDiag);
            grpEdit.Controls.Add(lblObs);
            grpEdit.Controls.Add(txtObs);
            grpEdit.Controls.Add(btnNovo);
            grpEdit.Controls.Add(btnAdd);
            grpEdit.Controls.Add(btnUpdate);
            grpEdit.Controls.Add(btnDelete);
            grpEdit.Location = new Point(12, 255);
            grpEdit.Name = "grpEdit";
            grpEdit.Size = new Size(1138, 510);
            grpEdit.TabIndex = 3;
            grpEdit.TabStop = false;
            grpEdit.Text = "Detalhes";
            // 
            // medGrid
            // 
            medGrid.AccessibleRole = AccessibleRole.OutlineButton;
            medGrid.AllowUserToAddRows = false;
            medGrid.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            medGrid.BackgroundColor = Color.White;
            medGrid.BorderStyle = BorderStyle.Fixed3D;
            medGrid.ColumnHeadersHeight = 29;
            medGrid.Location = new Point(140, 305);
            medGrid.MultiSelect = false;
            medGrid.Name = "medGrid";
            medGrid.ReadOnly = true;
            medGrid.RowHeadersVisible = false;
            medGrid.RowHeadersWidth = 51;
            medGrid.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            medGrid.Size = new Size(590, 138);
            medGrid.TabIndex = 19;
            medGrid.SelectionChanged += medGrid_SelectionChanged;  // adicionar esta linha
            // 
            // label1
            // 
            label1.Location = new Point(15, 305);
            label1.Name = "label1";
            label1.Size = new Size(120, 23);
            label1.TabIndex = 18;
            label1.Text = "Médicos:";
            // 
            // lblNC
            // 
            lblNC.Location = new Point(15, 28);
            lblNC.Name = "lblNC";
            lblNC.Size = new Size(120, 23);
            lblNC.TabIndex = 0;
            lblNC.Text = "Nº Cirurgia:";
            // 
            // numNC
            // 
            numNC.Location = new Point(140, 25);
            numNC.Maximum = new decimal(new int[] { 999999, 0, 0, 0 });
            numNC.Name = "numNC";
            numNC.Size = new Size(100, 29);
            numNC.TabIndex = 1;
            // 
            // lblData
            // 
            lblData.Location = new Point(15, 63);
            lblData.Name = "lblData";
            lblData.Size = new Size(120, 23);
            lblData.TabIndex = 2;
            lblData.Text = "Data:";
            // 
            // dtpData
            // 
            dtpData.Format = DateTimePickerFormat.Short;
            dtpData.Location = new Point(140, 60);
            dtpData.Name = "dtpData";
            dtpData.Size = new Size(200, 29);
            dtpData.TabIndex = 3;
            // 
            // lblRisco
            // 
            lblRisco.Location = new Point(15, 98);
            lblRisco.Name = "lblRisco";
            lblRisco.Size = new Size(120, 23);
            lblRisco.TabIndex = 4;
            lblRisco.Text = "Risco:";
            // 
            // cboRisco
            // 
            cboRisco.Items.AddRange(new object[] { "Baixo", "Médio", "Alto", "Crítico" });
            cboRisco.Location = new Point(140, 95);
            cboRisco.Name = "cboRisco";
            cboRisco.Size = new Size(150, 29);
            cboRisco.TabIndex = 5;
            // 
            // lblPac
            // 
            lblPac.Location = new Point(15, 133);
            lblPac.Name = "lblPac";
            lblPac.Size = new Size(120, 23);
            lblPac.TabIndex = 6;
            lblPac.Text = "Paciente:";
            // 
            // cboPac
            // 
            cboPac.DropDownStyle = ComboBoxStyle.DropDownList;
            cboPac.Location = new Point(140, 130);
            cboPac.Name = "cboPac";
            cboPac.Size = new Size(450, 29);
            cboPac.TabIndex = 7;
            // 
            // lblSala
            // 
            lblSala.Location = new Point(15, 168);
            lblSala.Name = "lblSala";
            lblSala.Size = new Size(120, 23);
            lblSala.TabIndex = 8;
            lblSala.Text = "Sala Operação:";
            // 
            // cboSala
            // 
            cboSala.DropDownStyle = ComboBoxStyle.DropDownList;
            cboSala.Location = new Point(140, 165);
            cboSala.Name = "cboSala";
            cboSala.Size = new Size(450, 29);
            cboSala.TabIndex = 9;
            // 
            // lblDiag
            // 
            lblDiag.Location = new Point(15, 203);
            lblDiag.Name = "lblDiag";
            lblDiag.Size = new Size(120, 23);
            lblDiag.TabIndex = 10;
            lblDiag.Text = "Diagnóstico:";
            // 
            // cboDiag
            // 
            cboDiag.DropDownStyle = ComboBoxStyle.DropDownList;
            cboDiag.Location = new Point(140, 200);
            cboDiag.Name = "cboDiag";
            cboDiag.Size = new Size(550, 29);
            cboDiag.TabIndex = 11;
            // 
            // lblObs
            // 
            lblObs.Location = new Point(15, 243);
            lblObs.Name = "lblObs";
            lblObs.Size = new Size(120, 23);
            lblObs.TabIndex = 12;
            lblObs.Text = "Observações:";
            // 
            // txtObs
            // 
            txtObs.Location = new Point(140, 240);
            txtObs.Multiline = true;
            txtObs.Name = "txtObs";
            txtObs.Size = new Size(590, 45);
            txtObs.TabIndex = 13;
            // 
            // btnNovo
            // 
            btnNovo.Location = new Point(970, 28);
            btnNovo.Name = "btnNovo";
            btnNovo.Size = new Size(150, 30);
            btnNovo.TabIndex = 14;
            btnNovo.Text = "Novo";
            btnNovo.Click += btnNovo_Click;
            // 
            // btnAdd
            // 
            btnAdd.BackColor = Color.WhiteSmoke;
            btnAdd.Location = new Point(970, 65);
            btnAdd.Name = "btnAdd";
            btnAdd.Size = new Size(150, 30);
            btnAdd.TabIndex = 15;
            btnAdd.Text = "Adicionar";
            btnAdd.UseVisualStyleBackColor = false;
            btnAdd.Click += btnAdd_Click;
            // 
            // btnUpdate
            // 
            btnUpdate.BackColor = Color.WhiteSmoke;
            btnUpdate.Location = new Point(970, 102);
            btnUpdate.Name = "btnUpdate";
            btnUpdate.Size = new Size(150, 30);
            btnUpdate.TabIndex = 16;
            btnUpdate.Text = "Atualizar";
            btnUpdate.UseVisualStyleBackColor = false;
            btnUpdate.Click += btnUpdate_Click;
            // 
            // btnDelete
            // 
            btnDelete.BackColor = Color.WhiteSmoke;
            btnDelete.Location = new Point(970, 139);
            btnDelete.Name = "btnDelete";
            btnDelete.Size = new Size(150, 30);
            btnDelete.TabIndex = 17;
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
            lblTitulo.Size = new Size(117, 32);
            lblTitulo.TabIndex = 0;
            lblTitulo.Text = "Cirurgias";
            // 
            // btnRefresh
            // 
            btnRefresh.Location = new Point(1000, 8);
            btnRefresh.Name = "btnRefresh";
            btnRefresh.Size = new Size(150, 31);
            btnRefresh.TabIndex = 1;
            btnRefresh.Text = "Recarregar";
            btnRefresh.Click += btnRefresh_Click;
            // 
            // cbMed
            // 
            cbMed.DropDownStyle = ComboBoxStyle.DropDownList;
            cbMed.Location = new Point(140, 449);
            cbMed.Name = "cbMed";
            cbMed.Size = new Size(344, 29);
            cbMed.TabIndex = 20;
            // 
            // btnAddMed
            // 
            btnAddMed.BackColor = Color.WhiteSmoke;
            btnAddMed.Location = new Point(490, 449);
            btnAddMed.Name = "btnAddMed";
            btnAddMed.Size = new Size(117, 30);
            btnAddMed.TabIndex = 21;
            btnAddMed.Text = "Adicionar";
            btnAddMed.UseVisualStyleBackColor = false;
            btnAddMed.Click += btnAddMed_Click;
            // 
            // btnDelMed
            // 
            btnDelMed.BackColor = Color.WhiteSmoke;
            btnDelMed.Location = new Point(613, 449);
            btnDelMed.Name = "btnDelMed";
            btnDelMed.Size = new Size(117, 30);
            btnDelMed.TabIndex = 22;
            btnDelMed.Text = "Remover";
            btnDelMed.UseVisualStyleBackColor = false;
            btnDelMed.Click += btnDelMed_Click;
            // 
            // CirurgiasForm
            // 
            BackColor = Color.WhiteSmoke;
            ClientSize = new Size(1162, 925);
            Controls.Add(lblTitulo);
            Controls.Add(btnRefresh);
            Controls.Add(dgv);
            Controls.Add(grpEdit);
            Font = new Font("Segoe UI", 9.5F);
            Name = "CirurgiasForm";
            Text = "Cirurgias";
            ((System.ComponentModel.ISupportInitialize)dgv).EndInit();
            grpEdit.ResumeLayout(false);
            grpEdit.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)medGrid).EndInit();
            ((System.ComponentModel.ISupportInitialize)numNC).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        private Label label1;
        private DataGridView medGrid;
        private ComboBox cbMed;
        private Button btnAddMed;
        private Button btnDelMed;
    }
}