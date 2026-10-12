namespace Test.Forms
{
    partial class EquipamentosForm
    {
        private System.ComponentModel.IContainer components = null;
        private System.Windows.Forms.DataGridView dgv;
        private System.Windows.Forms.GroupBox grpEdit;
        private System.Windows.Forms.Label lblId, lblNome, lblTitulo;
        private System.Windows.Forms.NumericUpDown numId;
        private System.Windows.Forms.TextBox txtNome;
        private System.Windows.Forms.Button btnNovo, btnAdd, btnUpdate, btnDelete, btnRefresh;

        protected override void Dispose(bool disposing) { if (disposing && components != null) components.Dispose(); base.Dispose(disposing); }

        private void InitializeComponent()
        {
            dgv = new DataGridView();
            grpEdit = new GroupBox();
            lblId = new Label();
            numId = new NumericUpDown();
            lblNome = new Label();
            txtNome = new TextBox();
            btnNovo = new Button();
            btnAdd = new Button();
            btnUpdate = new Button();
            btnDelete = new Button();
            btnRefresh = new Button();
            lblTitulo = new Label();
            ((System.ComponentModel.ISupportInitialize)dgv).BeginInit();
            grpEdit.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)numId).BeginInit();
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
            grpEdit.Controls.Add(lblId);
            grpEdit.Controls.Add(numId);
            grpEdit.Controls.Add(lblNome);
            grpEdit.Controls.Add(txtNome);
            grpEdit.Controls.Add(btnNovo);
            grpEdit.Controls.Add(btnAdd);
            grpEdit.Controls.Add(btnUpdate);
            grpEdit.Controls.Add(btnDelete);
            grpEdit.Location = new Point(12, 335);
            grpEdit.Name = "grpEdit";
            grpEdit.Size = new Size(1878, 195);
            grpEdit.TabIndex = 2;
            grpEdit.TabStop = false;
            grpEdit.Text = "Detalhes";
            // 
            // lblId
            // 
            lblId.Location = new Point(15, 33);
            lblId.Name = "lblId";
            lblId.Size = new Size(100, 23);
            lblId.TabIndex = 0;
            lblId.Text = "Identificador:";
            // 
            // numId
            // 
            numId.Location = new Point(140, 30);
            numId.Maximum = new decimal(new int[] { 9999, 0, 0, 0 });
            numId.Name = "numId";
            numId.Size = new Size(100, 29);
            numId.TabIndex = 1;
            // 
            // lblNome
            // 
            lblNome.Location = new Point(15, 63);
            lblNome.Name = "lblNome";
            lblNome.Size = new Size(100, 23);
            lblNome.TabIndex = 2;
            lblNome.Text = "Nome:";
            // 
            // txtNome
            // 
            txtNome.Location = new Point(140, 60);
            txtNome.Name = "txtNome";
            txtNome.Size = new Size(400, 29);
            txtNome.TabIndex = 3;
            // 
            // btnNovo
            // 
            btnNovo.Location = new Point(15, 158);
            btnNovo.Name = "btnNovo";
            btnNovo.Size = new Size(130, 31);
            btnNovo.TabIndex = 4;
            btnNovo.Text = "Novo";
            btnNovo.Click += btnNovo_Click;
            // 
            // btnAdd
            // 
            btnAdd.BackColor = Color.WhiteSmoke;
            btnAdd.Location = new Point(151, 158);
            btnAdd.Name = "btnAdd";
            btnAdd.Size = new Size(130, 31);
            btnAdd.TabIndex = 5;
            btnAdd.Text = "Adicionar";
            btnAdd.UseVisualStyleBackColor = false;
            btnAdd.Click += btnAdd_Click;
            // 
            // btnUpdate
            // 
            btnUpdate.BackColor = Color.WhiteSmoke;
            btnUpdate.Location = new Point(287, 158);
            btnUpdate.Name = "btnUpdate";
            btnUpdate.Size = new Size(130, 31);
            btnUpdate.TabIndex = 6;
            btnUpdate.Text = "Atualizar";
            btnUpdate.UseVisualStyleBackColor = false;
            btnUpdate.Click += btnUpdate_Click;
            // 
            // btnDelete
            // 
            btnDelete.BackColor = Color.WhiteSmoke;
            btnDelete.Location = new Point(423, 158);
            btnDelete.Name = "btnDelete";
            btnDelete.Size = new Size(130, 31);
            btnDelete.TabIndex = 7;
            btnDelete.Text = "Remover";
            btnDelete.UseVisualStyleBackColor = false;
            btnDelete.Click += btnDelete_Click;
            // 
            // btnRefresh
            // 
            btnRefresh.Location = new Point(1754, 8);
            btnRefresh.Name = "btnRefresh";
            btnRefresh.Size = new Size(136, 31);
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
            lblTitulo.Size = new Size(258, 32);
            lblTitulo.TabIndex = 0;
            lblTitulo.Text = "Equipamento Médico";
            // 
            // EquipamentosForm
            // 
            BackColor = Color.WhiteSmoke;
            ClientSize = new Size(1902, 1033);
            Controls.Add(lblTitulo);
            Controls.Add(dgv);
            Controls.Add(grpEdit);
            Controls.Add(btnRefresh);
            Font = new Font("Segoe UI", 9.5F);
            Name = "EquipamentosForm";
            Text = "Equipamento";
            ((System.ComponentModel.ISupportInitialize)dgv).EndInit();
            grpEdit.ResumeLayout(false);
            grpEdit.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)numId).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }
    }
}