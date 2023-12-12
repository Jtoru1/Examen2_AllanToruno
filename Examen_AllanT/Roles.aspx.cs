using Examen_AllanT.Clases;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Examen_AllanT
{
    public partial class Roles : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            string s = System.Configuration.ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
            conn = new SqlConnection("Data Source=DESKTOP-FOV1KMO\\SQLEXPRESS;Initial Catalog=Examen2_AllanT;Integrated Security=True");
            Usuario usuario = Usuario_Actual.GetUsuario();

            if (usuario != null)
            {
                // Verifica si el usuario tiene el rol de técnico
                if (usuario.Rol == "Tecnico")
                {
                    // Si es un técnico, oculta la tabla de roles
                    GridViewRoles.Visible = false;
                    Mostrar_Formulario.Visible = false;
                }
                else
                {
                    // Si no es un técnico, muestra la tabla de roles
                    GridViewRoles.Visible = true;
                    Mostrar_Formulario.Visible = true;
                }
            }
        }
        protected void btnAgregarrol_Click(object sender, EventArgs e)
        {
            pnlFormularioRol.Visible = !pnlFormularioRol.Visible;

        }
        protected void Guardar_Clickrol(object sender, EventArgs e)
        {
            
            string Descripcion = txtdescripcion.Text;
           

            if (ID == "" || Descripcion == "")
            {
                string script = "alert('Faltan datos.');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);

                return;
            }


            conn.Open();


            try
            {
                // Configura la conexión y el comando
                string query = "INSERT INTO Rol (Descripcion) VALUES (@Descripcion)";

                using (SqlCommand cmd = new SqlCommand(query, conn))

                {
                 
                    cmd.Parameters.AddWithValue("@Descripcion", Descripcion);

                    cmd.ExecuteNonQuery();
                    
                 
                }

                string scriptSuccess = "alert('Datos actualizados.');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", scriptSuccess, true);
                Limpiar();
            }

            catch
            (Exception ex)
            {
                lblMensajerol.Text = "Error al guardar datos"+ex;
                
                string script = "alert('Error al guardar datos.')";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
            }
            finally
            {
                conn.Close();
            }


        }
        private void Limpiar()
        {
            
            txtdescripcion.Text = "";
            pnlFormularioRol.Visible = false;
            GridViewRoles.DataBind();
        }
   
    }
}