using System;
using System.Data;
using System.Windows.Forms;
using Microsoft.Data.SqlClient; // <-- 1. LIBRERÍA DE SQL (Súper importante)

namespace problema1._3
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        // ===============================================================
        // 2. AQUÍ PEGAMOS LOS MÉTODOS DEL ARCHIVO DE TEXTO
        // ===============================================================
        private void TestDBConnection(string dbServer, string dbName, string userName, string userPass)
        {
            SqlConnection CN = new SqlConnection("Data Source = " + dbServer + " ;" + "Initial Catalog = " + dbName +
                                        "; uid = " + userName + ";" + "password = " + userPass + ";Encrypt=false");
            try
            {
                CN.Open();
                if (CN.State == ConnectionState.Open)
                {
                    MessageBox.Show("Successful connection to database " + CN.Database + " on the " + CN.DataSource + " server", "Connection Test", MessageBoxButtons.OK);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Failed to open connection to database due to the error \r\n" + ex.Message, "Connection Test", MessageBoxButtons.OK);
            }

            if (CN.State == ConnectionState.Open)
                CN.Close();
        }

        private string getTableContent(SqlConnection CN)
        {
            string str = "";
            try
            {
                CN.Open();
                if (CN.State == ConnectionState.Open)
                {
                    int cnt = 1;
                    SqlCommand sqlcmd = new SqlCommand("SELECT * FROM Hello", CN);
                    SqlDataReader reader;
                    reader = sqlcmd.ExecuteReader();
                    while (reader.Read())
                    {
                        str += cnt.ToString() + " - " + reader.GetInt32(reader.GetOrdinal("MsgID")) + ", ";
                        str += reader.GetString(reader.GetOrdinal("MsgSubject"));
                        str += "\n";
                        cnt += 1;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Failed to open connection to database due to the error \r\n" + ex.Message, "Connection Error", MessageBoxButtons.OK);
            }

            if (CN.State == ConnectionState.Open)
                CN.Close();
            return str;
        }

        // ===============================================================
        // 3. AQUÍ VAN LOS EVENTOS DE TUS BOTONES Y COMPONENTES
        // ===============================================================

        // BOTÓN TEST: Este es el que se llama "test" en tus propiedades
        private void test_Click(object sender, EventArgs e)
        {
            // Llama a la función de prueba usando los datos de tus cuadros de texto
            // textBox1 = Server, textBox2 = User, textBox3 = Password
            TestDBConnection(textBox1.Text, textBox2.Text, textBox2.Text, textBox3.Text);
        }

        // BOTÓN HELLO: Este es el que se llama "button2"
        private void button2_Click(object sender, EventArgs e)
        {
            // Construimos la cadena de conexión
            string conexionString = "Data Source = " + textBox1.Text +
                                    ";Initial Catalog = " + textBox2.Text +
                                    ";uid = " + textBox2.Text +
                                    ";password = " + textBox3.Text + ";Encrypt=false";

            // Creamos la conexión y pedimos el contenido de la tabla
            SqlConnection miConexion = new SqlConnection(conexionString);
            string contenidoTabla = getTableContent(miConexion);

            // Mostramos el resultado
            MessageBox.Show(contenidoTabla, "Table Content", MessageBoxButtons.OK);
        }

        private void label2_Click(object sender, EventArgs e)
        {
            // Se deja vacío si no necesitas que pase nada al hacer clic en el texto "User"
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {
            // Se deja vacío; aquí es donde podrías programar algo cada vez que alguien escribe una letra
        }
    }
}