using Examen_AllanT.Clases;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Examen_AllanT
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection("Data Source=DESKTOP-FOV1KMO\\SQLEXPRESS;Initial Catalog=Examen2_AllanT;Integrated Security=True");
        }
        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            // Aquí deberías realizar la validación de inicio de sesión, por ejemplo, verificar en una base de datos.

            string usuario = txtUsuario.Text;
            string contraseña = txtContraseña.Text;

            Usuario usuarioclase = ValidarLogin(usuario, contraseña);
            if (usuarioclase != null)
            {
               Usuario_Actual.SetUsuario(usuarioclase);
                Response.Redirect("Usuarios.aspx");
            }
            else
            {
                // Si las credenciales no son válidas, puedes mostrar un mensaje de error.
                // En un escenario real, deberías implementar la lógica de validación adecuada.
                string mensajeError = "<span style='font-size: 25px; color: #FFD700;'>Credenciales inválidas</span>";
                Response.Write(mensajeError);
            }  

        }
        private Usuario ValidarLogin(string Correo, string Clave)
        {
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (SqlCommand cmd = new SqlCommand("ValidarUsuario", conn))
                {
                    conn.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@correo", Correo));
                    cmd.Parameters.Add(new SqlParameter("@clave", Clave));
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Console.WriteLine("error");
                            Usuario usuario = new Usuario()
                            {
                                Nombre = reader["Nombre"].ToString(),
                                Correo = reader["Correo"].ToString(),
                                Rol = reader["Rol"].ToString(),
                               
                            };
                            return usuario;
                        }
                    }
                }


            }

            catch (Exception ex)
            {
               
                return null;
            }

            finally
            {
                conn.Close();
            }
            return null;
        }
    }
}