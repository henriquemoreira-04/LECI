namespace Test.Forms
{
    partial class PacientesForm
    {
        private System.ComponentModel.IContainer components = null;
        private System.Windows.Forms.DataGridView dgv;
        private System.Windows.Forms.GroupBox grpEdit;
        private System.Windows.Forms.Label lblNUtente, lblGS, lblHM, lblTitulo, lblCC;
        private System.Windows.Forms.TextBox txtNUtente, txtHM;
        private System.Windows.Forms.ComboBox cbCC, cbGS;
        private System.Windows.Forms.Button btnNovo, btnAdd, btnUpdate, btnDelete, btnRefresh;

        protected override void Dispose(bool disposing) { if (disposing && components != null) components.Dispose(); base.Dispose(disposing); }

        private void InitializeComponent()
        {
            dgv = new DataGridView();
            grpEdit = new GroupBox();
            lblCC = new Label();
            cbCC = new ComboBox();
            lblNUtente = new Label();
            txtNUtente = new TextBox();
            lblGS = new Label();
            cbGS = new ComboBox();
            lblHM = new Label();
            txtHM = new TextBox();
            btnNovo = new Button();
            btnAdd = new Button();
            btnUpdate = new Button();
            btnDelete = new Button();
            lblTitulo = new Label();
            btnRefresh = new Button();
            ((System.ComponentModel.ISupportInitialize)dgv).BeginInit();
            grpEdit.SuspendLayout();
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
            dgv.Size = new Size(1878, 230);
            dgv.TabIndex = 1;
            dgv.SelectionChanged += dgv_SelectionChanged;
            // 
            // grpEdit
            // 
            grpEdit.Controls.Add(lblCC);
            grpEdit.Controls.Add(cbCC);
            grpEdit.Controls.Add(lblNUtente);
            grpEdit.Controls.Add(txtNUtente);
            grpEdit.Controls.Add(lblGS);
            grpEdit.Controls.Add(cbGS);
            grpEdit.Controls.Add(lblHM);
            grpEdit.Controls.Add(txtHM);
            grpEdit.Controls.Add(btnNovo);
            grpEdit.Controls.Add(btnAdd);
            grpEdit.Controls.Add(btnUpdate);
            grpEdit.Controls.Add(btnDelete);
            grpEdit.Location = new Point(12, 285);
            grpEdit.Name = "grpEdit";
            grpEdit.Size = new Size(1878, 259);
            grpEdit.TabIndex = 2;
            grpEdit.TabStop = false;
            grpEdit.Text = "Detalhes";
            // 
            // lblCC
            // 
            lblCC.Location = new Point(15, 29);
            lblCC.Name = "lblCC";
            lblCC.Size = new Size(100, 23);
            lblCC.TabIndex = 0;
            lblCC.Text = "Pessoa (CC):";
            // 
            // cbCC
            // 
            cbCC.DropDownStyle = ComboBoxStyle.DropDownList;
            cbCC.Location = new Point(121, 26);
            cbCC.Name = "cbCC";
            cbCC.Size = new Size(350, 29);
            cbCC.TabIndex = 1;
            // 
            // lblNUtente
            // 
            lblNUtente.Location = new Point(15, 65);
            lblNUtente.Name = "lblNUtente";
            lblNUtente.Size = new Size(100, 23);
            lblNUtente.TabIndex = 2;
            lblNUtente.Text = "Nº Utente:";
            // 
            // txtNUtente
            // 
            txtNUtente.Location = new Point(121, 62);
            txtNUtente.Name = "txtNUtente";
            txtNUtente.Size = new Size(200, 29);
            txtNUtente.TabIndex = 2;
            // 
            // lblGS
            // 
            lblGS.Location = new Point(15, 100);
            lblGS.Name = "lblGS";
            lblGS.Size = new Size(100, 23);
            lblGS.TabIndex = 3;
            lblGS.Text = "Grupo Sanguíneo:";
            // 
            // cbGS
            // 
            cbGS.DropDownStyle = ComboBoxStyle.DropDownList;
            cbGS.Items.AddRange(new object[] { "O+", "O-", "A+", "A-", "B+", "B-", "AB+", "AB-" });
            cbGS.Location = new Point(121, 97);
            cbGS.Name = "cbGS";
            cbGS.Size = new Size(150, 29);
            cbGS.TabIndex = 3;
            // 
            // lblHM
            // 
            lblHM.Location = new Point(15, 135);
            lblHM.Name = "lblHM";
            lblHM.Size = new Size(100, 23);
            lblHM.TabIndex = 4;
            lblHM.Text = "Histórico Médico:";
            // 
            // txtHM
            // 
            txtHM.Location = new Point(121, 132);
            txtHM.Multiline = true;
            txtHM.Name = "txtHM";
            txtHM.Size = new Size(600, 60);
            txtHM.TabIndex = 4;
            // 
            // btnNovo
            // 
            btnNovo.Location = new Point(15, 225);
            btnNovo.Name = "btnNovo";
            btnNovo.Size = new Size(150, 28);
            btnNovo.TabIndex = 5;
            btnNovo.Text = "Novo";
            btnNovo.Click += btnNovo_Click;
            // 
            // btnAdd
            // 
            btnAdd.Location = new Point(171, 225);
            btnAdd.Name = "btnAdd";
            btnAdd.Size = new Size(150, 28);
            btnAdd.TabIndex = 6;
            btnAdd.Text = "Adicionar";
            btnAdd.Click += btnAdd_Click;
            // 
            // btnUpdate
            // 
            btnUpdate.Location = new Point(327, 225);
            btnUpdate.Name = "btnUpdate";
            btnUpdate.Size = new Size(150, 28);
            btnUpdate.TabIndex = 7;
            btnUpdate.Text = "Atualizar";
            btnUpdate.Click += btnUpdate_Click;
            // 
            // btnDelete
            // 
            btnDelete.Location = new Point(483, 225);
            btnDelete.Name = "btnDelete";
            btnDelete.Size = new Size(150, 28);
            btnDelete.TabIndex = 8;
            btnDelete.Text = "Remover";
            btnDelete.Click += btnDelete_Click;
            // 
            // lblTitulo
            // 
            lblTitulo.AutoSize = true;
            lblTitulo.Font = new Font("Segoe UI", 14F, FontStyle.Bold);
            lblTitulo.Location = new Point(12, 10);
            lblTitulo.Name = "lblTitulo";
            lblTitulo.Size = new Size(241, 32);
            lblTitulo.TabIndex = 0;
            lblTitulo.Text = "Gestão de Pacientes";
            // 
            // btnRefresh
            // 
            btnRefresh.Location = new Point(1739, 8);
            btnRefresh.Name = "btnRefresh";
            btnRefresh.Size = new Size(151, 31);
            btnRefresh.TabIndex = 1;
            btnRefresh.Text = "Recarregar";
            btnRefresh.Click += btnRefresh_Click;
            // 
            // PacientesForm
            // 
            BackColor = Color.WhiteSmoke;
            ClientSize = new Size(1902, 1033);
            Controls.Add(lblTitulo);
            Controls.Add(btnRefresh);
            Controls.Add(dgv);
            Controls.Add(grpEdit);
            Font = new Font("Segoe UI", 9.5F);
            Name = "PacientesForm";
            Text = "Pacientes";
            ((System.ComponentModel.ISupportInitialize)dgv).EndInit();
            grpEdit.ResumeLayout(false);
            grpEdit.PerformLayout();
            ResumeLayout(false);
            PerformLayout();
        }
    }
}