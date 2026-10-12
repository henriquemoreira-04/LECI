namespace Test.Forms
{
    partial class PessoasForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
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
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            lblTitulo = new Label();
            dgv = new DataGridView();
            grpEdit = new GroupBox();
            btnClear = new Button();
            btnDelete = new Button();
            btnUpdate = new Button();
            btnAdd = new Button();
            txtMorada = new TextBox();
            label4 = new Label();
            txtNIF = new TextBox();
            label3 = new Label();
            txtCC = new TextBox();
            label2 = new Label();
            txtNome = new TextBox();
            label1 = new Label();
            txtContacto = new TextBox();
            lblMorada = new Label();
            btnRefresh = new Button();
            ((System.ComponentModel.ISupportInitialize)dgv).BeginInit();
            grpEdit.SuspendLayout();
            SuspendLayout();
            // 
            // lblTitulo
            // 
            lblTitulo.AutoSize = true;
            lblTitulo.Font = new Font("Segoe UI", 14F, FontStyle.Bold);
            lblTitulo.Location = new Point(12, 9);
            lblTitulo.Name = "lblTitulo";
            lblTitulo.Size = new Size(222, 32);
            lblTitulo.TabIndex = 1;
            lblTitulo.Text = "Gestão de Pessoas";
            // 
            // dgv
            // 
            dgv.AllowUserToAddRows = false;
            dgv.AllowUserToDeleteRows = false;
            dgv.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgv.ColumnHeadersHeight = 29;
            dgv.Location = new Point(12, 44);
            dgv.MultiSelect = false;
            dgv.Name = "dgv";
            dgv.ReadOnly = true;
            dgv.RowHeadersVisible = false;
            dgv.RowHeadersWidth = 51;
            dgv.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgv.Size = new Size(1878, 280);
            dgv.TabIndex = 2;
            // 
            // grpEdit
            // 
            grpEdit.Controls.Add(btnClear);
            grpEdit.Controls.Add(btnDelete);
            grpEdit.Controls.Add(btnUpdate);
            grpEdit.Controls.Add(btnAdd);
            grpEdit.Controls.Add(txtMorada);
            grpEdit.Controls.Add(label4);
            grpEdit.Controls.Add(txtNIF);
            grpEdit.Controls.Add(label3);
            grpEdit.Controls.Add(txtCC);
            grpEdit.Controls.Add(label2);
            grpEdit.Controls.Add(txtNome);
            grpEdit.Controls.Add(label1);
            grpEdit.Controls.Add(txtContacto);
            grpEdit.Controls.Add(lblMorada);
            grpEdit.Location = new Point(12, 330);
            grpEdit.Name = "grpEdit";
            grpEdit.Size = new Size(1878, 238);
            grpEdit.TabIndex = 3;
            grpEdit.TabStop = false;
            grpEdit.Text = "Detalhes";
            // 
            // btnClear
            // 
            btnClear.Location = new Point(12, 202);
            btnClear.Name = "btnClear";
            btnClear.Size = new Size(124, 30);
            btnClear.TabIndex = 20;
            btnClear.Text = "Novo";
            btnClear.Click += btnClear_Click;
            // 
            // btnDelete
            // 
            btnDelete.Location = new Point(402, 202);
            btnDelete.Name = "btnDelete";
            btnDelete.Size = new Size(124, 30);
            btnDelete.TabIndex = 19;
            btnDelete.Text = "Apagar";
            btnDelete.Click += btnDelete_Click;
            // 
            // btnUpdate
            // 
            btnUpdate.Location = new Point(272, 202);
            btnUpdate.Name = "btnUpdate";
            btnUpdate.Size = new Size(124, 30);
            btnUpdate.TabIndex = 18;
            btnUpdate.Text = "Atualizar";
            btnUpdate.Click += btnUpdate_Click;
            // 
            // btnAdd
            // 
            btnAdd.Location = new Point(142, 202);
            btnAdd.Name = "btnAdd";
            btnAdd.Size = new Size(124, 30);
            btnAdd.TabIndex = 17;
            btnAdd.Text = "Adicionar";
            btnAdd.Click += btnNovo_Click;
            // 
            // txtMorada
            // 
            txtMorada.Location = new Point(82, 159);
            txtMorada.Name = "txtMorada";
            txtMorada.Size = new Size(300, 27);
            txtMorada.TabIndex = 15;
            // 
            // label4
            // 
            label4.AutoSize = true;
            label4.Location = new Point(12, 162);
            label4.Name = "label4";
            label4.Size = new Size(64, 20);
            label4.TabIndex = 16;
            label4.Text = "Morada:";
            // 
            // txtNIF
            // 
            txtNIF.Location = new Point(82, 93);
            txtNIF.Name = "txtNIF";
            txtNIF.Size = new Size(164, 27);
            txtNIF.TabIndex = 13;
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Location = new Point(12, 96);
            label3.Name = "label3";
            label3.Size = new Size(34, 20);
            label3.TabIndex = 14;
            label3.Text = "NIF:";
            // 
            // txtCC
            // 
            txtCC.Location = new Point(82, 60);
            txtCC.Name = "txtCC";
            txtCC.Size = new Size(164, 27);
            txtCC.TabIndex = 11;
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Location = new Point(12, 63);
            label2.Name = "label2";
            label2.Size = new Size(30, 20);
            label2.TabIndex = 12;
            label2.Text = "CC:";
            // 
            // txtNome
            // 
            txtNome.Location = new Point(82, 27);
            txtNome.Name = "txtNome";
            txtNome.Size = new Size(300, 27);
            txtNome.TabIndex = 9;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Location = new Point(12, 27);
            label1.Name = "label1";
            label1.Size = new Size(53, 20);
            label1.TabIndex = 10;
            label1.Text = "Nome:";
            // 
            // txtContacto
            // 
            txtContacto.Location = new Point(82, 126);
            txtContacto.Name = "txtContacto";
            txtContacto.Size = new Size(164, 27);
            txtContacto.TabIndex = 7;
            // 
            // lblMorada
            // 
            lblMorada.AutoSize = true;
            lblMorada.Location = new Point(12, 129);
            lblMorada.Name = "lblMorada";
            lblMorada.Size = new Size(72, 20);
            lblMorada.TabIndex = 8;
            lblMorada.Text = "Contacto:";
            // 
            // btnRefresh
            // 
            btnRefresh.Location = new Point(1740, 8);
            btnRefresh.Name = "btnRefresh";
            btnRefresh.Size = new Size(150, 30);
            btnRefresh.TabIndex = 14;
            btnRefresh.Text = "Recarregar";
            btnRefresh.Click += btnRefresh_Click;
            // 
            // PessoasForm
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1902, 1033);
            Controls.Add(grpEdit);
            Controls.Add(dgv);
            Controls.Add(lblTitulo);
            Controls.Add(btnRefresh);
            Name = "PessoasForm";
            Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)dgv).EndInit();
            grpEdit.ResumeLayout(false);
            grpEdit.PerformLayout();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label lblTitulo;
        private DataGridView dgv;
        private GroupBox grpEdit;
        private TextBox txtContacto;
        private Label lblMorada;
        private Button btnRefresh;
        private TextBox txtNome;
        private Label label1;
        private TextBox txtMorada;
        private Label label4;
        private TextBox txtNIF;
        private Label label3;
        private TextBox txtCC;
        private Label label2;
        private Button btnAdd;
        private Button btnDelete;
        private Button btnUpdate;
        private Button btnClear;
    }
}