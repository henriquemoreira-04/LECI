namespace Test.Forms
{
    partial class DepartamentosForm
    {
        private System.ComponentModel.IContainer components = null;
        private System.Windows.Forms.DataGridView dgv;
        private System.Windows.Forms.GroupBox grpEdit;
        private System.Windows.Forms.Label lblND, lblNome, lblHosp, lblTitulo;
        private System.Windows.Forms.NumericUpDown numND;
        private System.Windows.Forms.TextBox txtNome;
        private System.Windows.Forms.ComboBox cboHosp;
        private System.Windows.Forms.Button btnNovo, btnAdd, btnUpdate, btnDelete, btnRefresh;

        protected override void Dispose(bool disposing)
        {
            if (disposing && components != null) components.Dispose();
            base.Dispose(disposing);
        }

        private void InitializeComponent()
        {
            dgv = new DataGridView();
            grpEdit = new GroupBox();
            lblND = new Label();
            numND = new NumericUpDown();
            lblHosp = new Label();
            cboHosp = new ComboBox();
            lblNome = new Label();
            txtNome = new TextBox();
            btnNovo = new Button();
            btnAdd = new Button();
            btnUpdate = new Button();
            btnDelete = new Button();
            lblTitulo = new Label();
            btnRefresh = new Button();
            ((System.ComponentModel.ISupportInitialize)dgv).BeginInit();
            grpEdit.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)numND).BeginInit();
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
            grpEdit.Controls.Add(lblND);
            grpEdit.Controls.Add(numND);
            grpEdit.Controls.Add(lblHosp);
            grpEdit.Controls.Add(cboHosp);
            grpEdit.Controls.Add(lblNome);
            grpEdit.Controls.Add(txtNome);
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
            // lblND
            // 
            lblND.AutoSize = true;
            lblND.Location = new Point(15, 29);
            lblND.Name = "lblND";
            lblND.Size = new Size(136, 21);
            lblND.TabIndex = 0;
            lblND.Text = "Nº Departamento:";
            // 
            // numND
            // 
            numND.Location = new Point(157, 26);
            numND.Maximum = new decimal(new int[] { 9999, 0, 0, 0 });
            numND.Minimum = new decimal(new int[] { 1, 0, 0, 0 });
            numND.Name = "numND";
            numND.Size = new Size(102, 29);
            numND.TabIndex = 1;
            numND.Value = new decimal(new int[] { 1, 0, 0, 0 });
            // 
            // lblHosp
            // 
            lblHosp.AutoSize = true;
            lblHosp.Location = new Point(15, 65);
            lblHosp.Name = "lblHosp";
            lblHosp.Size = new Size(70, 21);
            lblHosp.TabIndex = 2;
            lblHosp.Text = "Hospital:";
            // 
            // cboHosp
            // 
            cboHosp.DropDownStyle = ComboBoxStyle.DropDownList;
            cboHosp.Location = new Point(157, 62);
            cboHosp.Name = "cboHosp";
            cboHosp.Size = new Size(402, 29);
            cboHosp.TabIndex = 2;
            // 
            // lblNome
            // 
            lblNome.AutoSize = true;
            lblNome.Location = new Point(15, 100);
            lblNome.Name = "lblNome";
            lblNome.Size = new Size(56, 21);
            lblNome.TabIndex = 3;
            lblNome.Text = "Nome:";
            // 
            // txtNome
            // 
            txtNome.Location = new Point(157, 97);
            txtNome.Name = "txtNome";
            txtNome.Size = new Size(402, 29);
            txtNome.TabIndex = 3;
            // 
            // btnNovo
            // 
            btnNovo.Location = new Point(15, 158);
            btnNovo.Name = "btnNovo";
            btnNovo.Size = new Size(150, 36);
            btnNovo.TabIndex = 4;
            btnNovo.Text = "Novo";
            btnNovo.Click += btnNovo_Click;
            // 
            // btnAdd
            // 
            btnAdd.Location = new Point(171, 158);
            btnAdd.Name = "btnAdd";
            btnAdd.Size = new Size(150, 36);
            btnAdd.TabIndex = 5;
            btnAdd.Text = "Adicionar";
            btnAdd.Click += btnAdd_Click;
            // 
            // btnUpdate
            // 
            btnUpdate.Location = new Point(327, 158);
            btnUpdate.Name = "btnUpdate";
            btnUpdate.Size = new Size(150, 36);
            btnUpdate.TabIndex = 6;
            btnUpdate.Text = "Atualizar";
            btnUpdate.Click += btnUpdate_Click;
            // 
            // btnDelete
            // 
            btnDelete.Location = new Point(483, 158);
            btnDelete.Name = "btnDelete";
            btnDelete.Size = new Size(150, 36);
            btnDelete.TabIndex = 7;
            btnDelete.Text = "Apagar";
            btnDelete.Click += btnDelete_Click;
            // 
            // lblTitulo
            // 
            lblTitulo.AutoSize = true;
            lblTitulo.Font = new Font("Segoe UI", 14F, FontStyle.Bold);
            lblTitulo.Location = new Point(12, 10);
            lblTitulo.Name = "lblTitulo";
            lblTitulo.Size = new Size(311, 32);
            lblTitulo.TabIndex = 0;
            lblTitulo.Text = "Gestão de Departamentos";
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
            // DepartamentosForm
            // 
            BackColor = Color.WhiteSmoke;
            ClientSize = new Size(1902, 1033);
            Controls.Add(lblTitulo);
            Controls.Add(btnRefresh);
            Controls.Add(dgv);
            Controls.Add(grpEdit);
            Font = new Font("Segoe UI", 9.5F);
            Name = "DepartamentosForm";
            Text = "Departamentos";
            ((System.ComponentModel.ISupportInitialize)dgv).EndInit();
            grpEdit.ResumeLayout(false);
            grpEdit.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)numND).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }
    }
}