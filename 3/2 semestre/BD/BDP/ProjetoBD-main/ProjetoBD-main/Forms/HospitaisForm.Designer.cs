namespace Test.Forms
{
    partial class HospitaisForm
    {
        private System.ComponentModel.IContainer components = null;
        private System.Windows.Forms.DataGridView dgv;
        private System.Windows.Forms.GroupBox grpEdit;
        private System.Windows.Forms.Label lblNome, lblLoc, lblTitulo;
        private System.Windows.Forms.TextBox txtNome, txtLoc;
        private System.Windows.Forms.Button btnNovo, btnAdd, btnUpdate, btnDelete, btnRefresh;

        protected override void Dispose(bool disposing) { if (disposing && components != null) components.Dispose(); base.Dispose(disposing); }

        private void InitializeComponent()
        {
            dgv = new DataGridView();
            grpEdit = new GroupBox();
            lblNome = new Label();
            txtNome = new TextBox();
            lblLoc = new Label();
            txtLoc = new TextBox();
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
            grpEdit.Controls.Add(lblNome);
            grpEdit.Controls.Add(txtNome);
            grpEdit.Controls.Add(lblLoc);
            grpEdit.Controls.Add(txtLoc);
            grpEdit.Controls.Add(btnNovo);
            grpEdit.Controls.Add(btnAdd);
            grpEdit.Controls.Add(btnUpdate);
            grpEdit.Controls.Add(btnDelete);
            grpEdit.Location = new Point(12, 335);
            grpEdit.Name = "grpEdit";
            grpEdit.Size = new Size(1878, 206);
            grpEdit.TabIndex = 2;
            grpEdit.TabStop = false;
            grpEdit.Text = "Detalhes";
            // 
            // lblNome
            // 
            lblNome.Location = new Point(15, 33);
            lblNome.Name = "lblNome";
            lblNome.Size = new Size(100, 23);
            lblNome.TabIndex = 0;
            lblNome.Text = "Nome (PK):";
            // 
            // txtNome
            // 
            txtNome.Location = new Point(110, 30);
            txtNome.Name = "txtNome";
            txtNome.Size = new Size(455, 29);
            txtNome.TabIndex = 1;
            // 
            // lblLoc
            // 
            lblLoc.Location = new Point(15, 63);
            lblLoc.Name = "lblLoc";
            lblLoc.Size = new Size(100, 23);
            lblLoc.TabIndex = 2;
            lblLoc.Text = "Localização:";
            // 
            // txtLoc
            // 
            txtLoc.Location = new Point(110, 60);
            txtLoc.Name = "txtLoc";
            txtLoc.Size = new Size(455, 29);
            txtLoc.TabIndex = 3;
            // 
            // btnNovo
            // 
            btnNovo.Location = new Point(15, 166);
            btnNovo.Name = "btnNovo";
            btnNovo.Size = new Size(156, 34);
            btnNovo.TabIndex = 4;
            btnNovo.Text = "Novo";
            btnNovo.Click += btnNovo_Click;
            // 
            // btnAdd
            // 
            btnAdd.BackColor = Color.WhiteSmoke;
            btnAdd.Location = new Point(177, 166);
            btnAdd.Name = "btnAdd";
            btnAdd.Size = new Size(156, 34);
            btnAdd.TabIndex = 5;
            btnAdd.Text = "Adicionar";
            btnAdd.UseVisualStyleBackColor = false;
            btnAdd.Click += btnAdd_Click;
            // 
            // btnUpdate
            // 
            btnUpdate.BackColor = Color.WhiteSmoke;
            btnUpdate.Location = new Point(339, 166);
            btnUpdate.Name = "btnUpdate";
            btnUpdate.Size = new Size(156, 34);
            btnUpdate.TabIndex = 6;
            btnUpdate.Text = "Atualizar";
            btnUpdate.UseVisualStyleBackColor = false;
            btnUpdate.Click += btnUpdate_Click;
            // 
            // btnDelete
            // 
            btnDelete.BackColor = Color.WhiteSmoke;
            btnDelete.Location = new Point(501, 166);
            btnDelete.Name = "btnDelete";
            btnDelete.Size = new Size(156, 34);
            btnDelete.TabIndex = 7;
            btnDelete.Text = "Remover";
            btnDelete.UseVisualStyleBackColor = false;
            btnDelete.Click += btnDelete_Click;
            // 
            // btnRefresh
            // 
            btnRefresh.Location = new Point(1734, 5);
            btnRefresh.Name = "btnRefresh";
            btnRefresh.Size = new Size(156, 34);
            btnRefresh.TabIndex = 8;
            btnRefresh.Text = "Recarregar";
            btnRefresh.Click += btnRefresh_Click;
            // 
            // lblTitulo
            // 
            lblTitulo.AutoSize = true;
            lblTitulo.Font = new Font("Segoe UI", 14F, FontStyle.Bold);
            lblTitulo.Location = new Point(12, 10);
            lblTitulo.Name = "lblTitulo";
            lblTitulo.Size = new Size(240, 32);
            lblTitulo.TabIndex = 0;
            lblTitulo.Text = "Gestão de Hospitais";
            // 
            // HospitaisForm
            // 
            BackColor = Color.WhiteSmoke;
            ClientSize = new Size(1902, 1033);
            Controls.Add(lblTitulo);
            Controls.Add(dgv);
            Controls.Add(grpEdit);
            Controls.Add(btnRefresh);
            Font = new Font("Segoe UI", 9.5F);
            Name = "HospitaisForm";
            Text = "Hospitais";
            ((System.ComponentModel.ISupportInitialize)dgv).EndInit();
            grpEdit.ResumeLayout(false);
            grpEdit.PerformLayout();
            ResumeLayout(false);
            PerformLayout();
        }
    }
}