using Test.DAL;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Configuration;
using Test.Forms;

namespace Test.Forms
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();
            this.Load += MainForm_Load;
        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            string error;
            if (DatabaseHelper.TestConnection(out error))
                lblStatus.Text = "Conectado à BD SGH_DB";
            else
                lblStatus.Text = "Sem ligação à BD: " + error;
        }

        // Abre o form filho no painel principal (estilo MDI light).
        private void OpenChild(Form child)
        {
            pnlMain.Controls.Clear();
            child.TopLevel = false;
            child.FormBorderStyle = FormBorderStyle.None;
            child.Dock = DockStyle.Fill;
            pnlMain.Controls.Add(child);
            child.Show();
        }

        private void mnuPessoasGeral_Click(object sender, EventArgs e) => OpenChild(new PessoasForm());
        private void mnuPacientes_Click(object sender, EventArgs e) => OpenChild(new PacientesForm());
        private void mnuMedicos_Click(object sender, EventArgs e) => OpenChild(new MedicosForm());
        private void mnuEnfermeiros_Click(object sender, EventArgs e) => OpenChild(new EnfermeirosForm());
        private void mnuAdministradores_Click(object sender, EventArgs e) => OpenChild(new AdministradoresForm());
        private void mnuHospitais_Click(object sender, EventArgs e) => OpenChild(new HospitaisForm());
        private void mnuDepartamentos_Click(object sender, EventArgs e) => OpenChild(new DepartamentosForm());
        private void mnuSalas_Click(object sender, EventArgs e) => OpenChild(new SalasForm());
        private void mnuEquipamentos_Click(object sender, EventArgs e) => OpenChild(new EquipamentosForm());
        private void mnuAvaliacoes_Click(object sender, EventArgs e) => OpenChild(new AvaliacoesForm());
        private void mnuDiagnosticos_Click(object sender, EventArgs e) => OpenChild(new DiagnosticosForm());
        private void mnuCirurgias_Click(object sender, EventArgs e) => OpenChild(new CirurgiasForm());
        private void mnuSair_Click(object sender, EventArgs e) => Application.Exit();
    }
}