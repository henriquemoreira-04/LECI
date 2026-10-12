namespace Test.Forms
{
    partial class MedicosForm
    {
        private System.ComponentModel.IContainer components = null;
        private System.Windows.Forms.DataGridView dgv;
        private System.Windows.Forms.GroupBox grpEdit;
        private System.Windows.Forms.Label lblTitulo, lblCC, lblNMedico, lblEspecialidade, lblHistorico, lblDepartamento, lblHospital;
        private System.Windows.Forms.TextBox txtNMedico, txtEspecialidade, txtHistorico;
        private System.Windows.Forms.ComboBox cbCC, cbDepartamento, cbHospital;
        private System.Windows.Forms.Button btnNovo, btnAdd, btnUpdate, btnDelete, btnRefresh;

        protected override void Dispose(bool disposing) { if (disposing && components != null) components.Dispose(); base.Dispose(disposing); }

        private void InitializeComponent()
        {
            dgv = new DataGridView();
            grpEdit = new GroupBox();
            lblCC = new Label();
            cbCC = new ComboBox();
            lblNMedico = new Label();
            txtNMedico = new TextBox();
            lblEspecialidade = new Label();
            txtEspecialidade = new TextBox();
            lblDepartamento = new Label();
            cbDepartamento = new ComboBox();
            lblHospital = new Label();
            cbHospital = new ComboBox();
            lblHistorico = new Label();
            txtHistorico = new TextBox();
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
            grpEdit.Controls.Add(lblNMedico);
            grpEdit.Controls.Add(txtNMedico);
            grpEdit.Controls.Add(lblEspecialidade);
            grpEdit.Controls.Add(txtEspecialidade);
            grpEdit.Controls.Add(lblDepartamento);
            grpEdit.Controls.Add(cbDepartamento);
            grpEdit.Controls.Add(lblHospital);
            grpEdit.Controls.Add(cbHospital);
            grpEdit.Controls.Add(lblHistorico);
            grpEdit.Controls.Add(txtHistorico);
            grpEdit.Controls.Add(btnNovo);
            grpEdit.Controls.Add(btnAdd);
            grpEdit.Controls.Add(btnUpdate);
            grpEdit.Controls.Add(btnDelete);
            grpEdit.Location = new Point(12, 285);
            grpEdit.Name = "grpEdit";
            grpEdit.Size = new Size(1878, 277);
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
            // lblNMedico
            // 
            lblNMedico.Location = new Point(15, 65);
            lblNMedico.Name = "lblNMedico";
            lblNMedico.Size = new Size(100, 23);
            lblNMedico.TabIndex = 2;
            lblNMedico.Text = "Nº Médico:";
            // 
            // txtNMedico
            // 
            txtNMedico.Location = new Point(121, 62);
            txtNMedico.Name = "txtNMedico";
            txtNMedico.Size = new Size(200, 29);
            txtNMedico.TabIndex = 2;
            // 
            // lblEspecialidade
            // 
            lblEspecialidade.Location = new Point(15, 100);
            lblEspecialidade.Name = "lblEspecialidade";
            lblEspecialidade.Size = new Size(100, 23);
            lblEspecialidade.TabIndex = 3;
            lblEspecialidade.Text = "Especialidade:";
            // 
            // txtEspecialidade
            // 
            txtEspecialidade.Location = new Point(121, 97);
            txtEspecialidade.Name = "txtEspecialidade";
            txtEspecialidade.Size = new Size(350, 29);
            txtEspecialidade.TabIndex = 3;
            // 
            // lblDepartamento
            // 
            lblDepartamento.Location = new Point(15, 135);
            lblDepartamento.Name = "lblDepartamento";
            lblDepartamento.Size = new Size(100, 23);
            lblDepartamento.TabIndex = 4;
            lblDepartamento.Text = "Departamento:";
            // 
            // cbDepartamento
            // 
            cbDepartamento.DropDownStyle = ComboBoxStyle.DropDownList;
            cbDepartamento.Location = new Point(121, 132);
            cbDepartamento.Name = "cbDepartamento";
            cbDepartamento.Size = new Size(350, 29);
            cbDepartamento.TabIndex = 4;
            // 
            // lblHospital
            // 
            lblHospital.Location = new Point(15, 170);
            lblHospital.Name = "lblHospital";
            lblHospital.Size = new Size(100, 23);
            lblHospital.TabIndex = 5;
            lblHospital.Text = "Hospital:";
            // 
            // cbHospital
            // 
            cbHospital.DropDownStyle = ComboBoxStyle.DropDownList;
            cbHospital.Location = new Point(121, 167);
            cbHospital.Name = "cbHospital";
            cbHospital.Size = new Size(350, 29);
            cbHospital.TabIndex = 5;
            // 
            // lblHistorico
            // 
            lblHistorico.Location = new Point(500, 29);
            lblHistorico.Name = "lblHistorico";
            lblHistorico.Size = new Size(120, 23);
            lblHistorico.TabIndex = 6;
            lblHistorico.Text = "Histórico Consultas:";
            // 
            // txtHistorico
            // 
            txtHistorico.Location = new Point(500, 55);
            txtHistorico.Multiline = true;
            txtHistorico.Name = "txtHistorico";
            txtHistorico.Size = new Size(339, 145);
            txtHistorico.TabIndex = 6;
            // 
            // btnNovo
            // 
            btnNovo.Location = new Point(15, 243);
            btnNovo.Name = "btnNovo";
            btnNovo.Size = new Size(150, 28);
            btnNovo.TabIndex = 7;
            btnNovo.Text = "Novo";
            btnNovo.Click += btnNovo_Click;
            // 
            // btnAdd
            // 
            btnAdd.Location = new Point(171, 243);
            btnAdd.Name = "btnAdd";
            btnAdd.Size = new Size(150, 28);
            btnAdd.TabIndex = 8;
            btnAdd.Text = "Adicionar";
            btnAdd.Click += btnAdd_Click;
            // 
            // btnUpdate
            // 
            btnUpdate.Location = new Point(327, 243);
            btnUpdate.Name = "btnUpdate";
            btnUpdate.Size = new Size(150, 28);
            btnUpdate.TabIndex = 9;
            btnUpdate.Text = "Atualizar";
            btnUpdate.Click += btnUpdate_Click;
            // 
            // btnDelete
            // 
            btnDelete.Location = new Point(483, 243);
            btnDelete.Name = "btnDelete";
            btnDelete.Size = new Size(150, 28);
            btnDelete.TabIndex = 10;
            btnDelete.Text = "Remover";
            btnDelete.Click += btnDelete_Click;
            // 
            // lblTitulo
            // 
            lblTitulo.AutoSize = true;
            lblTitulo.Font = new Font("Segoe UI", 14F, FontStyle.Bold);
            lblTitulo.Location = new Point(12, 10);
            lblTitulo.Name = "lblTitulo";
            lblTitulo.Size = new Size(230, 32);
            lblTitulo.TabIndex = 0;
            lblTitulo.Text = "Gestão de Médicos";
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
            // MedicosForm
            // 
            BackColor = Color.WhiteSmoke;
            ClientSize = new Size(1902, 1033);
            Controls.Add(lblTitulo);
            Controls.Add(btnRefresh);
            Controls.Add(dgv);
            Controls.Add(grpEdit);
            Font = new Font("Segoe UI", 9.5F);
            Name = "MedicosForm";
            Text = "Médicos";
            ((System.ComponentModel.ISupportInitialize)dgv).EndInit();
            grpEdit.ResumeLayout(false);
            grpEdit.PerformLayout();
            ResumeLayout(false);
            PerformLayout();
        }
    }
}