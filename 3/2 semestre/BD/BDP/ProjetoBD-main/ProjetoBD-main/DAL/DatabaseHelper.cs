using System;
using System.Data;
using System.Data.SqlClient;

namespace Test.DAL
{
    /// <summary>
    /// Centraliza o acesso à base de dados via System.Data.SqlClient.
    /// Todos os membros são estáticos — não há estado de instância.
    /// </summary>
    public static class DatabaseHelper
    {
        // Altera esta string para corresponder ao teu servidor/base de dados
        private const string ConnectionString =
            @"Server=192.168.182.10;Database=p6g2;User Id=p6g2;Password=1873128766@BD;TrustServerCertificate=True;";
        /// <summary>
        /// Devolve uma nova SqlConnection já aberta.
        /// </summary>
        public static SqlConnection GetSGBDConnection()
        {
            var conn = new SqlConnection(ConnectionString);
            conn.Open();
            return conn;
        }

        /// <summary>
        /// Testa a ligação. Devolve true se conseguir abrir; false caso contrário.
        /// </summary>
        public static bool TestConnection()
        {
            try
            {
                using (GetSGBDConnection()) { }
                return true;
            }
            catch
            {
                return false;
            }
        }

        /// <summary>
        /// Testa a ligação e devolve a mensagem de erro, se houver.
        /// </summary>
        public static bool TestConnection(out string error)
        {
            error = null;
            try
            {
                using (GetSGBDConnection()) { }
                return true;
            }
            catch (Exception ex)
            {
                error = ex.Message;
                return false;
            }
        }

        /// <summary>
        /// Executa SELECT e devolve um DataTable.
        /// </summary>
        public static DataTable ExecuteQuery(string sql, params SqlParameter[] parameters)
        {
            var dt = new DataTable();
            using (var conn = GetSGBDConnection())
            using (var cmd = new SqlCommand(sql, conn))
            {
                if (parameters != null) cmd.Parameters.AddRange(parameters);
                using (var adapter = new SqlDataAdapter(cmd))
                    adapter.Fill(dt);
            }
            return dt;
        }

        /// <summary>
        /// Executa INSERT/UPDATE/DELETE e devolve as linhas afetadas.
        /// </summary>
        public static int ExecuteNonQuery(string sql, params SqlParameter[] parameters)
        {
            using (var conn = GetSGBDConnection())
            using (var cmd = new SqlCommand(sql, conn))
            {
                if (parameters != null) cmd.Parameters.AddRange(parameters);
                return cmd.ExecuteNonQuery();
            }
        }

        /// <summary>
        /// Executa SELECT escalar e devolve o primeiro valor da primeira linha.
        /// </summary>
        public static object ExecuteScalar(string sql, params SqlParameter[] parameters)
        {
            using (var conn = GetSGBDConnection())
            using (var cmd = new SqlCommand(sql, conn))
            {
                if (parameters != null) cmd.Parameters.AddRange(parameters);
                return cmd.ExecuteScalar();
            }
        }

        /// <summary>
        /// Devolve o próximo ID disponível para uma coluna inteira (PK manual sem IDENTITY).
        /// </summary>
        public static int GetNextId(string table, string column)
        {
            string sql = $"SELECT ISNULL(MAX({column}), 0) + 1 FROM SGH.{table}";
            object o = ExecuteScalar(sql);
            return (o == null || o == DBNull.Value) ? 1 : Convert.ToInt32(o);
        }
    }
}