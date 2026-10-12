namespace Test
{
    partial class AdministradoresForm
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;
        private System.Windows.Forms.DataGridView dgv;
        private System.Windows.Forms.GroupBox grpEdit;
        private System.Windows.Forms.Label lblCC, lblNum, lblDep, lblTitulo;
        private System.Windows.Forms.ComboBox cboCC, cboDep;
        private System.Windows.Forms.TextBox txtNum;
        private System.Windows.Forms.Button btnNovo, btnAdd, btnUpdate, btnDelete, btnRefresh;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            dgv = new DataGridView();
            grpEdit = new GroupBox();
            lblCC = new Label();
            cboCC = new ComboBox();
            lblNum = new Label();
            txtNum = new TextBox();
            lblDep = new Label();
            cboDep = new ComboBox();
            btnNovo = new Button();
            btnAdd = new Button();
            btnUpdate = new Button();
            btnDelete = new Button();
            btnRefresh = new Button();
            lblTitulo = new Label();
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
            dgv.Size = new Size(1878, 280);
            dgv.TabIndex = 1;
            dgv.SelectionChanged += dgv_SelectionChanged;
            // 
            // grpEdit
            // 
            grpEdit.Controls.Add(lblCC);
            grpEdit.Controls.Add(cboCC);
            grpEdit.Controls.Add(lblNum);
            grpEdit.Controls.Add(txtNum);
            grpEdit.Controls.Add(lblDep);
            grpEdit.Controls.Add(cboDep);
            grpEdit.Controls.Add(btnNovo);
            grpEdit.Controls.Add(btnAdd);
            grpEdit.Controls.Add(btnUpdate);
            grpEdit.Controls.Add(btnDelete);
            grpEdit.Location = new Point(12, 335);
            grpEdit.Name = "grpEdit";
            grpEdit.Size = new Size(1878, 200);
            grpEdit.TabIndex = 2;
            grpEdit.TabStop = false;
            grpEdit.Text = "Detalhes";
            // 
            // lblCC
            // 
            lblCC.AutoSize = true;
            lblCC.Location = new Point(15, 20);
            lblCC.Name = "lblCC";
            lblCC.Size = new Size(94, 21);
            lblCC.TabIndex = 0;
            lblCC.Text = "Pessoa (CC):";
            // 
            // cboCC
            // 
            cboCC.DropDownStyle = ComboBoxStyle.DropDownList;
            cboCC.Location = new Point(162, 17);
            cboCC.Name = "cboCC";
            cboCC.Size = new Size(350, 29);
            cboCC.TabIndex = 1;
            // 
            // lblNum
            // 
            lblNum.AutoSize = true;
            lblNum.Location = new Point(15, 63);
            lblNum.Name = "lblNum";
            lblNum.Size = new Size(136, 21);
            lblNum.TabIndex = 2;
            lblNum.Text = "Nº Administrador:";
            // 
            // txtNum
            // 
            txtNum.Location = new Point(162, 60);
            txtNum.Name = "txtNum";
            txtNum.Size = new Size(200, 29);
            txtNum.TabIndex = 3;
            // 
            // lblDep
            // 
            lblDep.AutoSize = true;
            lblDep.Location = new Point(15, 103);
            lblDep.Name = "lblDep";
            lblDep.Size = new Size(113, 21);
            lblDep.TabIndex = 4;
            lblDep.Text = "Departamento:";
            // 
            // cboDep
            // 
            cboDep.DropDownStyle = ComboBoxStyle.DropDownList;
            cboDep.Location = new Point(162, 100);
            cboDep.Name = "cboDep";
            cboDep.Size = new Size(500, 29);
            cboDep.TabIndex = 5;
            // 
            // btnNovo
            // 
            btnNovo.Location = new Point(15, 160);
            btnNovo.Name = "btnNovo";
            btnNovo.Size = new Size(96, 34);
            btnNovo.TabIndex = 6;
            btnNovo.Text = "Novo";
            btnNovo.Click += btnNovo_Click;
            // 
            // btnAdd
            // 
            btnAdd.BackColor = Color.WhiteSmoke;
            btnAdd.Location = new Point(117, 160);
            btnAdd.Name = "btnAdd";
            btnAdd.Size = new Size(96, 34);
            btnAdd.TabIndex = 7;
            btnAdd.Text = "Adicionar";
            btnAdd.UseVisualStyleBackColor = false;
            btnAdd.Click += btnAdd_Click;
            // 
            // btnUpdate
            // 
            btnUpdate.BackColor = Color.WhiteSmoke;
            btnUpdate.Location = new Point(219, 160);
            btnUpdate.Name = "btnUpdate";
            btnUpdate.Size = new Size(96, 34);
            btnUpdate.TabIndex = 8;
            btnUpdate.Text = "Atualizar";
            btnUpdate.UseVisualStyleBackColor = false;
            btnUpdate.Click += btnUpdate_Click;
            // 
            // btnDelete
            // 
            btnDelete.BackColor = Color.WhiteSmoke;
            btnDelete.Location = new Point(321, 160);
            btnDelete.Name = "btnDelete";
            btnDelete.Size = new Size(96, 34);
            btnDelete.TabIndex = 9;
            btnDelete.Text = "Remover";
            btnDelete.UseVisualStyleBackColor = false;
            btnDelete.Click += btnDelete_Click;
            // 
            // btnRefresh
            // 
            btnRefresh.Location = new Point(1764, 5);
            btnRefresh.Name = "btnRefresh";
            btnRefresh.Size = new Size(126, 34);
            btnRefresh.TabIndex = 10;
            btnRefresh.Text = "Recarregar";
            btnRefresh.Click += btnRefresh_Click;
            // 
            // lblTitulo
            // 
            lblTitulo.AutoSize = true;
            lblTitulo.Font = new Font("Segoe UI", 14F, FontStyle.Bold);
            lblTitulo.Location = new Point(12, 10);
            lblTitulo.Name = "lblTitulo";
            lblTitulo.Size = new Size(324, 32);
            lblTitulo.TabIndex = 0;
            lblTitulo.Text = "Gestão de Administradores";
            // 
            // AdministradoresForm
            // 
            BackColor = Color.WhiteSmoke;
            ClientSize = new Size(1902, 1033);
            Controls.Add(lblTitulo);
            Controls.Add(dgv);
            Controls.Add(grpEdit);
            Controls.Add(btnRefresh);
            Font = new Font("Segoe UI", 9.5F);
            Name = "AdministradoresForm";
            Text = "Administradores";
            ((System.ComponentModel.ISupportInitialize)dgv).EndInit();
            grpEdit.ResumeLayout(false);
            grpEdit.PerformLayout();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion
    }
}
