namespace Test.Forms
{
    partial class TiposSalaForm
    {
        private System.ComponentModel.IContainer components = null;
        private System.Windows.Forms.DataGridView dgv;
        private System.Windows.Forms.GroupBox grpEdit;
        private System.Windows.Forms.Label lblId, lblDes, lblTitulo;
        private System.Windows.Forms.NumericUpDown numId;
        private System.Windows.Forms.TextBox txtDes;
        private System.Windows.Forms.Button btnNovo, btnAdd, btnUpdate, btnDelete, btnRefresh;

        protected override void Dispose(bool disposing) { if (disposing && components != null) components.Dispose(); base.Dispose(disposing); }

        private void InitializeComponent()
        {
            dgv = new DataGridView();
            grpEdit = new GroupBox();
            lblId = new Label();
            numId = new NumericUpDown();
            lblDes = new Label();
            txtDes = new TextBox();
            lblTitulo = new Label();
            btnNovo = new Button();
            btnAdd = new Button();
            btnUpdate = new Button();
            btnDelete = new Button();
            btnRefresh = new Button();
            ((System.ComponentModel.ISupportInitialize)dgv).BeginInit();
            ((System.ComponentModel.ISupportInitialize)numId).BeginInit();
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
            dgv.Size = new Size(950, 280);
            dgv.TabIndex = 1;
            dgv.SelectionChanged += dgv_SelectionChanged;
            // 
            // grpEdit
            // 
            grpEdit.Controls.Add(lblId);
            grpEdit.Controls.Add(numId);
            grpEdit.Controls.Add(lblDes);
            grpEdit.Controls.Add(txtDes);
            grpEdit.Controls.Add(btnNovo);
            grpEdit.Controls.Add(btnAdd);
            grpEdit.Controls.Add(btnUpdate);
            grpEdit.Controls.Add(btnDelete);
            grpEdit.Location = new Point(12, 335);
            grpEdit.Name = "grpEdit";
            grpEdit.Size = new Size(950, 176);
            grpEdit.TabIndex = 2;
            grpEdit.TabStop = false;
            grpEdit.Text = "Detalhes";
            // 
            // lblId
            // 
            lblId.Location = new Point(15, 33);
            lblId.Size = new Size(100, 23);
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
            // lblDes
            // 
            lblDes.Location = new Point(15, 68);
            lblDes.Size = new Size(100, 23);
            lblDes.Text = "Designação:";
            // 
            // txtDes
            // 
            txtDes.Location = new Point(140, 65);
            txtDes.Name = "txtDes";
            txtDes.Size = new Size(400, 29);
            txtDes.TabIndex = 2;
            // 
            // btnNovo
            // 
            btnNovo.Location = new Point(770, 22);
            btnNovo.Name = "btnNovo";
            btnNovo.Size = new Size(150, 32);
            btnNovo.Text = "Novo";
            btnNovo.Click += btnNovo_Click;
            // 
            // btnAdd
            // 
            btnAdd.Location = new Point(770, 60);
            btnAdd.Name = "btnAdd";
            btnAdd.Size = new Size(150, 32);
            btnAdd.Text = "Adicionar";
            btnAdd.Click += btnAdd_Click;
            // 
            // btnUpdate
            // 
            btnUpdate.Location = new Point(770, 98);
            btnUpdate.Name = "btnUpdate";
            btnUpdate.Size = new Size(150, 32);
            btnUpdate.Text = "Atualizar";
            btnUpdate.Click += btnUpdate_Click;  // estava em falta no original
            // 
            // btnDelete
            // 
            btnDelete.Location = new Point(770, 136);
            btnDelete.Name = "btnDelete";
            btnDelete.Size = new Size(150, 32);
            btnDelete.Text = "Apagar";
            btnDelete.Click += btnDelete_Click_1;
            // 
            // btnRefresh
            // 
            btnRefresh.Location = new Point(812, 7);
            btnRefresh.Name = "btnRefresh";
            btnRefresh.Size = new Size(150, 32);
            btnRefresh.Text = "Recarregar";
            btnRefresh.Click += btnRefresh_Click;
            // 
            // lblTitulo
            // 
            lblTitulo.AutoSize = true;
            lblTitulo.Font = new Font("Segoe UI", 14F, FontStyle.Bold);
            lblTitulo.Location = new Point(12, 10);
            lblTitulo.Name = "lblTitulo";
            lblTitulo.Text = "Tipos de Sala";
            // 
            // TiposSalaForm
            // 
            BackColor = Color.WhiteSmoke;
            ClientSize = new Size(972, 523);
            Font = new Font("Segoe UI", 9.5F);
            Name = "TiposSalaForm";
            Text = "Tipos de Sala";
            Controls.Add(lblTitulo);
            Controls.Add(btnRefresh);
            Controls.Add(dgv);
            Controls.Add(grpEdit);
            ((System.ComponentModel.ISupportInitialize)dgv).EndInit();
            ((System.ComponentModel.ISupportInitialize)numId).EndInit();
            grpEdit.ResumeLayout(false);
            grpEdit.PerformLayout();
            ResumeLayout(false);
            PerformLayout();
        }
    }
}