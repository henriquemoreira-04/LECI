namespace Test.Forms
{
    partial class AvaliacoesForm
    {
        private System.ComponentModel.IContainer components = null;
        private System.Windows.Forms.DataGridView dgv;
        private System.Windows.Forms.GroupBox grpEdit;
        private System.Windows.Forms.Label lblN, lblData, lblPac, lblMed, lblSala, lblTitulo;
        private System.Windows.Forms.NumericUpDown numN;
        private System.Windows.Forms.DateTimePicker dtpData;
        private System.Windows.Forms.ComboBox cboPac, cboMed, cboSala;
        private System.Windows.Forms.Button btnNovo, btnAdd, btnUpdate, btnDelete, btnRefresh;

        protected override void Dispose(bool disposing) { if (disposing && components != null) components.Dispose(); base.Dispose(disposing); }

        private void InitializeComponent()
        {
            dgv = new DataGridView();
            grpEdit = new GroupBox();
            lblN = new Label();
            numN = new NumericUpDown();
            lblData = new Label();
            dtpData = new DateTimePicker();
            lblPac = new Label();
            cboPac = new ComboBox();
            lblMed = new Label();
            cboMed = new ComboBox();
            lblSala = new Label();
            cboSala = new ComboBox();
            btnNovo = new Button();
            btnAdd = new Button();
            btnUpdate = new Button();
            btnDelete = new Button();
            lblTitulo = new Label();
            btnRefresh = new Button();
            ((System.ComponentModel.ISupportInitialize)dgv).BeginInit();
            grpEdit.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)numN).BeginInit();
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
            grpEdit.Controls.Add(lblN);
            grpEdit.Controls.Add(numN);
            grpEdit.Controls.Add(lblData);
            grpEdit.Controls.Add(dtpData);
            grpEdit.Controls.Add(lblPac);
            grpEdit.Controls.Add(cboPac);
            grpEdit.Controls.Add(lblMed);
            grpEdit.Controls.Add(cboMed);
            grpEdit.Controls.Add(lblSala);
            grpEdit.Controls.Add(cboSala);
            grpEdit.Controls.Add(btnNovo);
            grpEdit.Controls.Add(btnAdd);
            grpEdit.Controls.Add(btnUpdate);
            grpEdit.Controls.Add(btnDelete);
            grpEdit.Location = new Point(12, 285);
            grpEdit.Name = "grpEdit";
            grpEdit.Size = new Size(1878, 220);
            grpEdit.TabIndex = 2;
            grpEdit.TabStop = false;
            grpEdit.Text = "Detalhes";
            // 
            // lblN
            // 
            lblN.Location = new Point(15, 30);
            lblN.Name = "lblN";
            lblN.Size = new Size(120, 23);
            lblN.TabIndex = 0;
            lblN.Text = "Nº Avaliação:";
            // 
            // numN
            // 
            numN.Location = new Point(140, 27);
            numN.Maximum = new decimal(new int[] { 999999, 0, 0, 0 });
            numN.Name = "numN";
            numN.Size = new Size(100, 29);
            numN.TabIndex = 1;
            // 
            // lblData
            // 
            lblData.Location = new Point(15, 67);
            lblData.Name = "lblData";
            lblData.Size = new Size(120, 23);
            lblData.TabIndex = 2;
            lblData.Text = "Data:";
            // 
            // dtpData
            // 
            dtpData.Format = DateTimePickerFormat.Short;
            dtpData.Location = new Point(140, 64);
            dtpData.Name = "dtpData";
            dtpData.Size = new Size(200, 29);
            dtpData.TabIndex = 2;
            // 
            // lblPac
            // 
            lblPac.Location = new Point(15, 104);
            lblPac.Name = "lblPac";
            lblPac.Size = new Size(120, 23);
            lblPac.TabIndex = 3;
            lblPac.Text = "Paciente:";
            // 
            // cboPac
            // 
            cboPac.DropDownStyle = ComboBoxStyle.DropDownList;
            cboPac.Location = new Point(140, 101);
            cboPac.Name = "cboPac";
            cboPac.Size = new Size(430, 29);
            cboPac.TabIndex = 3;
            // 
            // lblMed
            // 
            lblMed.Location = new Point(15, 141);
            lblMed.Name = "lblMed";
            lblMed.Size = new Size(120, 23);
            lblMed.TabIndex = 4;
            lblMed.Text = "Médico:";
            // 
            // cboMed
            // 
            cboMed.DropDownStyle = ComboBoxStyle.DropDownList;
            cboMed.Location = new Point(140, 138);
            cboMed.Name = "cboMed";
            cboMed.Size = new Size(430, 29);
            cboMed.TabIndex = 4;
            // 
            // lblSala
            // 
            lblSala.Location = new Point(15, 178);
            lblSala.Name = "lblSala";
            lblSala.Size = new Size(120, 23);
            lblSala.TabIndex = 5;
            lblSala.Text = "Sala (Gabinete):";
            // 
            // cboSala
            // 
            cboSala.DropDownStyle = ComboBoxStyle.DropDownList;
            cboSala.Location = new Point(140, 175);
            cboSala.Name = "cboSala";
            cboSala.Size = new Size(430, 29);
            cboSala.TabIndex = 5;
            // 
            // btnNovo
            // 
            btnNovo.Location = new Point(1704, 27);
            btnNovo.Name = "btnNovo";
            btnNovo.Size = new Size(150, 30);
            btnNovo.TabIndex = 6;
            btnNovo.Text = "Novo";
            btnNovo.Click += btnNovo_Click;
            // 
            // btnAdd
            // 
            btnAdd.BackColor = Color.WhiteSmoke;
            btnAdd.Location = new Point(1704, 64);
            btnAdd.Name = "btnAdd";
            btnAdd.Size = new Size(150, 30);
            btnAdd.TabIndex = 7;
            btnAdd.Text = "Adicionar";
            btnAdd.UseVisualStyleBackColor = false;
            btnAdd.Click += btnAdd_Click;
            // 
            // btnUpdate
            // 
            btnUpdate.BackColor = Color.WhiteSmoke;
            btnUpdate.Location = new Point(1704, 101);
            btnUpdate.Name = "btnUpdate";
            btnUpdate.Size = new Size(150, 30);
            btnUpdate.TabIndex = 8;
            btnUpdate.Text = "Atualizar";
            btnUpdate.UseVisualStyleBackColor = false;
            btnUpdate.Click += btnUpdate_Click;
            // 
            // btnDelete
            // 
            btnDelete.BackColor = Color.WhiteSmoke;
            btnDelete.Location = new Point(1704, 138);
            btnDelete.Name = "btnDelete";
            btnDelete.Size = new Size(150, 30);
            btnDelete.TabIndex = 9;
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
            lblTitulo.Size = new Size(228, 32);
            lblTitulo.TabIndex = 0;
            lblTitulo.Text = "Avaliações Clínicas";
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
            // AvaliacoesForm
            // 
            BackColor = Color.WhiteSmoke;
            ClientSize = new Size(1902, 1033);
            Controls.Add(lblTitulo);
            Controls.Add(btnRefresh);
            Controls.Add(dgv);
            Controls.Add(grpEdit);
            Font = new Font("Segoe UI", 9.5F);
            Name = "AvaliacoesForm";
            Text = "Avaliações";
            ((System.ComponentModel.ISupportInitialize)dgv).EndInit();
            grpEdit.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)numN).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }
    }
}