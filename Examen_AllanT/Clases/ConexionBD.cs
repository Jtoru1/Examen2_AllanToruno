using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Examen_AllanT.Clases
{
    public class DB_connection
    {
        public static SqlConnection Conexion()
        {
            String s = System.Configuration.ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            return conexion;
        }

    }
}