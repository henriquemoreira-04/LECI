namespace Test.Forms
{
    partial class DiagnosticosForm
    {
        private System.ComponentModel.IContainer components = null;
        private System.Windows.Forms.DataGridView dgv;
        private System.Windows.Forms.GroupBox grpEdit;
        private System.Windows.Forms.Label lblND, lblNA, lblData, lblDes, lblTitulo;
        private System.Windows.Forms.NumericUpDown numND;
        private System.Windows.Forms.ComboBox cboNA;
        private System.Windows.Forms.DateTimePicker dtpData;
        private System.Windows.Forms.TextBox txtDes;
        private System.Windows.Forms.Button btnNovo, btnAdd, btnUpdate, btnDelete, btnRefresh;

        protected override void Dispose(bool disposing) { if (disposing && components != null) components.Dispose(); base.Dispose(disposing); }

        private void InitializeComponent()
        {
            dgv = new DataGridView();
            grpEdit = new GroupBox();
            lblND = new Label();
            numND = new NumericUpDown();
            lblNA = new Label();
            cboNA = new ComboBox();
            lblData = new Label();
            dtpData = new DateTimePicker();
            lblDes = new Label();
            txtDes = new TextBox();
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
            dgv.Size = new Size(1878, 230);
            dgv.TabIndex = 2;
            dgv.SelectionChanged += dgv_SelectionChanged;
            // 
            // grpEdit
            // 
            grpEdit.Controls.Add(lblND);
            grpEdit.Controls.Add(numND);
            grpEdit.Controls.Add(lblNA);
            grpEdit.Controls.Add(cboNA);
            grpEdit.Controls.Add(lblData);
            grpEdit.Controls.Add(dtpData);
            grpEdit.Controls.Add(lblDes);
            grpEdit.Controls.Add(txtDes);
            grpEdit.Controls.Add(btnNovo);
            grpEdit.Controls.Add(btnAdd);
            grpEdit.Controls.Add(btnUpdate);
            grpEdit.Controls.Add(btnDelete);
            grpEdit.Location = new Point(12, 285);
            grpEdit.Name = "grpEdit";
            grpEdit.Size = new Size(1878, 251);
            grpEdit.TabIndex = 3;
            grpEdit.TabStop = false;
            grpEdit.Text = "Detalhes";
            // 
            // lblND
            // 
            lblND.Location = new Point(15, 33);
            lblND.Name = "lblND";
            lblND.Size = new Size(120, 23);
            lblND.TabIndex = 0;
            lblND.Text = "Nº Diagnóstico:";
            // 
            // numND
            // 
            numND.Location = new Point(140, 30);
            numND.Maximum = new decimal(new int[] { 999999, 0, 0, 0 });
            numND.Name = "numND";
            numND.Size = new Size(100, 29);
            numND.TabIndex = 1;
            // 
            // lblNA
            // 
            lblNA.Location = new Point(15, 68);
            lblNA.Name = "lblNA";
            lblNA.Size = new Size(120, 23);
            lblNA.TabIndex = 2;
            lblNA.Text = "Avaliação:";
            // 
            // cboNA
            // 
            cboNA.DropDownStyle = ComboBoxStyle.DropDownList;
            cboNA.Location = new Point(140, 65);
            cboNA.Name = "cboNA";
            cboNA.Size = new Size(590, 29);
            cboNA.TabIndex = 3;
            // 
            // lblData
            // 
            lblData.Location = new Point(15, 103);
            lblData.Name = "lblData";
            lblData.Size = new Size(120, 23);
            lblData.TabIndex = 4;
            lblData.Text = "Data:";
            // 
            // dtpData
            // 
            dtpData.Format = DateTimePickerFormat.Short;
            dtpData.Location = new Point(140, 100);
            dtpData.Name = "dtpData";
            dtpData.Size = new Size(200, 29);
            dtpData.TabIndex = 5;
            // 
            // lblDes
            // 
            lblDes.Location = new Point(15, 143);
            lblDes.Name = "lblDes";
            lblDes.Size = new Size(120, 23);
            lblDes.TabIndex = 6;
            lblDes.Text = "Designação:";
            // 
            // txtDes
            // 
            txtDes.Location = new Point(140, 140);
            txtDes.Multiline = true;
            txtDes.Name = "txtDes";
            txtDes.Size = new Size(590, 55);
            txtDes.TabIndex = 7;
            // 
            // btnNovo
            // 
            btnNovo.Location = new Point(15, 215);
            btnNovo.Name = "btnNovo";
            btnNovo.Size = new Size(150, 30);
            btnNovo.TabIndex = 8;
            btnNovo.Text = "Novo";
            btnNovo.Click += btnNovo_Click;
            // 
            // btnAdd
            // 
            btnAdd.Location = new Point(171, 215);
            btnAdd.Name = "btnAdd";
            btnAdd.Size = new Size(150, 30);
            btnAdd.TabIndex = 9;
            btnAdd.Text = "Adicionar";
            btnAdd.Click += btnAdd_Click;
            // 
            // btnUpdate
            // 
            btnUpdate.Location = new Point(327, 215);
            btnUpdate.Name = "btnUpdate";
            btnUpdate.Size = new Size(150, 30);
            btnUpdate.TabIndex = 10;
            btnUpdate.Text = "Atualizar";
            btnUpdate.Click += btnUpdate_Click;
            // 
            // btnDelete
            // 
            btnDelete.Location = new Point(483, 215);
            btnDelete.Name = "btnDelete";
            btnDelete.Size = new Size(150, 30);
            btnDelete.TabIndex = 11;
            btnDelete.Text = "Remover";
            btnDelete.Click += btnDelete_Click;
            // 
            // lblTitulo
            // 
            lblTitulo.AutoSize = true;
            lblTitulo.Font = new Font("Segoe UI", 14F, FontStyle.Bold);
            lblTitulo.Location = new Point(12, 10);
            lblTitulo.Name = "lblTitulo";
            lblTitulo.Size = new Size(162, 32);
            lblTitulo.TabIndex = 0;
            lblTitulo.Text = "Diagnósticos";
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
            // DiagnosticosForm
            // 
            BackColor = Color.WhiteSmoke;
            ClientSize = new Size(1902, 1033);
            Controls.Add(lblTitulo);
            Controls.Add(btnRefresh);
            Controls.Add(dgv);
            Controls.Add(grpEdit);
            Font = new Font("Segoe UI", 9.5F);
            Name = "DiagnosticosForm";
            Text = "Diagnósticos";
            ((System.ComponentModel.ISupportInitialize)dgv).EndInit();
            grpEdit.ResumeLayout(false);
            grpEdit.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)numND).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }
    }
}