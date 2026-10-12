namespace Test.Forms
{
    partial class MainForm
    {
        private System.ComponentModel.IContainer components = null;
        private System.Windows.Forms.MenuStrip menuStrip;
        private System.Windows.Forms.StatusStrip statusStrip;
        private System.Windows.Forms.ToolStripStatusLabel lblStatus;
        private System.Windows.Forms.Panel pnlMain;
        private System.Windows.Forms.Label lblWelcome;

        private System.Windows.Forms.ToolStripMenuItem mnuPessoas;
        private System.Windows.Forms.ToolStripMenuItem mnuPessoasGeral;
        private System.Windows.Forms.ToolStripMenuItem mnuPacientes;
        private System.Windows.Forms.ToolStripMenuItem mnuMedicos;
        private System.Windows.Forms.ToolStripMenuItem mnuEnfermeiros;
        private System.Windows.Forms.ToolStripMenuItem mnuAdministradores;

        private System.Windows.Forms.ToolStripMenuItem mnuEstrutura;
        private System.Windows.Forms.ToolStripMenuItem mnuHospitais;
        private System.Windows.Forms.ToolStripMenuItem mnuDepartamentos;
        private System.Windows.Forms.ToolStripMenuItem mnuSalas;
        private System.Windows.Forms.ToolStripMenuItem mnuEquipamentos;

        private System.Windows.Forms.ToolStripMenuItem mnuClinico;
        private System.Windows.Forms.ToolStripMenuItem mnuAvaliacoes;
        private System.Windows.Forms.ToolStripMenuItem mnuDiagnosticos;
        private System.Windows.Forms.ToolStripMenuItem mnuCirurgias;
        private System.Windows.Forms.ToolStripMenuItem mnuEnfCir;

        private System.Windows.Forms.ToolStripMenuItem mnuRelatorios;
        private System.Windows.Forms.ToolStripMenuItem mnuDashboard;

        private System.Windows.Forms.ToolStripMenuItem mnuSair;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null)) components.Dispose();
            base.Dispose(disposing);
        }

        private void InitializeComponent()
        {
            menuStrip = new MenuStrip();
            mnuPessoas = new ToolStripMenuItem();
            mnuPessoasGeral = new ToolStripMenuItem();
            mnuPacientes = new ToolStripMenuItem();
            mnuMedicos = new ToolStripMenuItem();
            mnuEnfermeiros = new ToolStripMenuItem();
            mnuAdministradores = new ToolStripMenuItem();
            mnuEstrutura = new ToolStripMenuItem();
            mnuHospitais = new ToolStripMenuItem();
            mnuDepartamentos = new ToolStripMenuItem();
            mnuSalas = new ToolStripMenuItem();
            mnuEquipamentos = new ToolStripMenuItem();
            mnuClinico = new ToolStripMenuItem();
            mnuAvaliacoes = new ToolStripMenuItem();
            mnuDiagnosticos = new ToolStripMenuItem();
            mnuCirurgias = new ToolStripMenuItem();
            mnuEnfCir = new ToolStripMenuItem();
            mnuRelatorios = new ToolStripMenuItem();
            mnuDashboard = new ToolStripMenuItem();
            mnuSair = new ToolStripMenuItem();
            statusStrip = new StatusStrip();
            lblStatus = new ToolStripStatusLabel();
            pnlMain = new Panel();
            lblWelcome = new Label();
            menuStrip.SuspendLayout();
            statusStrip.SuspendLayout();
            pnlMain.SuspendLayout();
            SuspendLayout();
            // 
            // menuStrip
            // 
            menuStrip.Font = new Font("Segoe UI", 10F);
            menuStrip.ImageScalingSize = new Size(20, 20);
            menuStrip.Items.AddRange(new ToolStripItem[] { mnuPessoas, mnuEstrutura, mnuClinico, mnuRelatorios, mnuSair });
            menuStrip.Location = new Point(0, 0);
            menuStrip.Name = "menuStrip";
            menuStrip.Padding = new Padding(7, 3, 0, 3);
            menuStrip.Size = new Size(809, 33);
            menuStrip.TabIndex = 2;
            // 
            // mnuPessoas
            // 
            mnuPessoas.DropDownItems.AddRange(new ToolStripItem[] { mnuPessoasGeral, mnuPacientes, mnuMedicos, mnuEnfermeiros, mnuAdministradores });
            mnuPessoas.Name = "mnuPessoas";
            mnuPessoas.Size = new Size(82, 27);
            mnuPessoas.Text = "&Pessoas";
            // 
            // mnuPessoasGeral
            // 
            mnuPessoasGeral.Name = "mnuPessoasGeral";
            mnuPessoasGeral.Size = new Size(218, 28);
            mnuPessoasGeral.Text = "Pessoas (geral)";
            mnuPessoasGeral.Click += mnuPessoasGeral_Click;
            // 
            // mnuPacientes
            // 
            mnuPacientes.Name = "mnuPacientes";
            mnuPacientes.Size = new Size(218, 28);
            mnuPacientes.Text = "Pacientes";
            mnuPacientes.Click += mnuPacientes_Click;
            // 
            // mnuMedicos
            // 
            mnuMedicos.Name = "mnuMedicos";
            mnuMedicos.Size = new Size(218, 28);
            mnuMedicos.Text = "Médicos";
            mnuMedicos.Click += mnuMedicos_Click;
            // 
            // mnuEnfermeiros
            // 
            mnuEnfermeiros.Name = "mnuEnfermeiros";
            mnuEnfermeiros.Size = new Size(218, 28);
            mnuEnfermeiros.Text = "Enfermeiros";
            mnuEnfermeiros.Click += mnuEnfermeiros_Click;
            // 
            // mnuAdministradores
            // 
            mnuAdministradores.Name = "mnuAdministradores";
            mnuAdministradores.Size = new Size(218, 28);
            mnuAdministradores.Text = "Administradores";
            mnuAdministradores.Click += mnuAdministradores_Click;
            // 
            // mnuEstrutura
            // 
            mnuEstrutura.DropDownItems.AddRange(new ToolStripItem[] { mnuHospitais, mnuDepartamentos, mnuSalas, mnuEquipamentos});
            mnuEstrutura.Name = "mnuEstrutura";
            mnuEstrutura.Size = new Size(93, 27);
            mnuEstrutura.Text = "&Estrutura";
            // 
            // mnuHospitais
            // 
            mnuHospitais.Name = "mnuHospitais";
            mnuHospitais.Size = new Size(257, 28);
            mnuHospitais.Text = "Hospitais";
            mnuHospitais.Click += mnuHospitais_Click;
            // 
            // mnuDepartamentos
            // 
            mnuDepartamentos.Name = "mnuDepartamentos";
            mnuDepartamentos.Size = new Size(257, 28);
            mnuDepartamentos.Text = "Departamentos";
            mnuDepartamentos.Click += mnuDepartamentos_Click;
            // 
            // mnuSalas
            // 
            mnuSalas.Name = "mnuSalas";
            mnuSalas.Size = new Size(257, 28);
            mnuSalas.Text = "Salas";
            mnuSalas.Click += mnuSalas_Click;
            // 
            // mnuEquipamentos
            // 
            mnuEquipamentos.Name = "mnuEquipamentos";
            mnuEquipamentos.Size = new Size(257, 28);
            mnuEquipamentos.Text = "Equipamento Médico";
            mnuEquipamentos.Click += mnuEquipamentos_Click;
            // 
            // mnuClinico
            // 
            mnuClinico.DropDownItems.AddRange(new ToolStripItem[] { mnuAvaliacoes, mnuDiagnosticos, mnuCirurgias});
            mnuClinico.Name = "mnuClinico";
            mnuClinico.Size = new Size(75, 27);
            mnuClinico.Text = "&Clínico";
            // 
            // mnuAvaliacoes
            // 
            mnuAvaliacoes.Name = "mnuAvaliacoes";
            mnuAvaliacoes.Size = new Size(278, 28);
            mnuAvaliacoes.Text = "Avaliações";
            mnuAvaliacoes.Click += mnuAvaliacoes_Click;
            // 
            // mnuDiagnosticos
            // 
            mnuDiagnosticos.Name = "mnuDiagnosticos";
            mnuDiagnosticos.Size = new Size(278, 28);
            mnuDiagnosticos.Text = "Diagnósticos";
            mnuDiagnosticos.Click += mnuDiagnosticos_Click;
            // 
            // mnuCirurgias
            // 
            mnuCirurgias.Name = "mnuCirurgias";
            mnuCirurgias.Size = new Size(278, 28);
            mnuCirurgias.Text = "Cirurgias";
            mnuCirurgias.Click += mnuCirurgias_Click;
            // 
            // mnuSair
            // 
            mnuSair.Name = "mnuSair";
            mnuSair.Size = new Size(52, 27);
            mnuSair.Text = "&Sair";
            mnuSair.Click += mnuSair_Click;
            // 
            // statusStrip
            // 
            statusStrip.ImageScalingSize = new Size(20, 20);
            statusStrip.Items.AddRange(new ToolStripItem[] { lblStatus });
            statusStrip.Location = new Point(0, 361);
            statusStrip.Name = "statusStrip";
            statusStrip.Padding = new Padding(1, 0, 16, 0);
            statusStrip.Size = new Size(809, 26);
            statusStrip.TabIndex = 1;
            // 
            // lblStatus
            // 
            lblStatus.Name = "lblStatus";
            lblStatus.Size = new Size(53, 20);
            lblStatus.Text = "Pronto";
            // 
            // pnlMain
            // 
            pnlMain.BackColor = Color.WhiteSmoke;
            pnlMain.Controls.Add(lblWelcome);
            pnlMain.Dock = DockStyle.Fill;
            pnlMain.Location = new Point(0, 33);
            pnlMain.Margin = new Padding(3, 4, 3, 4);
            pnlMain.Name = "pnlMain";
            pnlMain.Size = new Size(809, 328);
            pnlMain.TabIndex = 0;
            // 
            // lblWelcome
            // 
            lblWelcome.Dock = DockStyle.Fill;
            lblWelcome.Font = new Font("Segoe UI", 16F);
            lblWelcome.ForeColor = Color.DimGray;
            lblWelcome.Location = new Point(0, 0);
            lblWelcome.Name = "lblWelcome";
            lblWelcome.Size = new Size(809, 328);
            lblWelcome.TabIndex = 0;
            lblWelcome.Text = "Sistema de Gestão Hospitalar\r\n\r\nSeleccione um módulo no menu para começar.";
            lblWelcome.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // MainForm
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1902, 1033);
            Controls.Add(pnlMain);
            Controls.Add(statusStrip);
            Controls.Add(menuStrip);
            MainMenuStrip = menuStrip;
            Margin = new Padding(3, 4, 3, 4);
            Name = "MainForm";
            StartPosition = FormStartPosition.CenterScreen;
            Text = "SGH — Sistema de Gestão Hospitalar";
            WindowState = FormWindowState.Maximized;
            menuStrip.ResumeLayout(false);
            menuStrip.PerformLayout();
            statusStrip.ResumeLayout(false);
            statusStrip.PerformLayout();
            pnlMain.ResumeLayout(false);
            ResumeLayout(false);
            PerformLayout();
        }
    }
}