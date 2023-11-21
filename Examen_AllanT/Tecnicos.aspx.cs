using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Examen_AllanT
{
    public partial class Tecnicos : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            string s = System.Configuration.ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
            conn = new SqlConnection("Data Source=DESKTOP-FOV1KMO\\SQLEXPRESS;Initial Catalog=Examen2_AllanT;Integrated Security=True");
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            pnlFormulario.Visible = !pnlFormulario.Visible;

        }
        protected void Guardar_Click(object sender, EventArgs e)
        {
            string Nombre = txtNombre.Text;
            string Especialidad = txtEspecialidad.Text;

            if (Nombre == "" || Especialidad == "")
            {
                string script = "alert('Faltan datos.');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);

                return;
            }
       

            conn.Open();
            //tran = conn.BeginTransaction();
            //cmd.Transaction = tran;

            try
            {
                string query = "INSERT INTO Tecnicos (Nombre, Especialidad) VALUES (@Nombre, @Especialidad)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
               
                    cmd.Parameters.AddWithValue("@Nombre", Nombre);
                    cmd.Parameters.AddWithValue("@Especialidad", Especialidad);
                   

                    cmd.ExecuteNonQuery();
                }
              
                string script = "alert('Datos guardados.');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                Limpiar();
            }

            catch
            (Exception ex)
            {
                lblMensaje.Text = "Error al guardar datos";
          
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
            txtNombre.Text = "";
            txtEspecialidad.Text = "";
       
            pnlFormulario.Visible = false;
            GridViewTecnicos.DataBind();
        }
        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
   
            string tipoNombrefiltro = txtFiltroNombre.Text.Trim();

            // Modificar el origen de datos para aplicar el filtro
            SqlDataSourceTecnicos.SelectCommand = "SELECT Nombre, Especialidad, TecnicoID FROM Tecnicos WHERE Nombre LIKE @Nombre";
            SqlDataSourceTecnicos.SelectParameters.Clear();
            SqlDataSourceTecnicos.SelectParameters.Add("Nombre", "%" + tipoNombrefiltro + "%");

            // Volver a cargar los datos en el GridView
            GridViewTecnicos.DataBind();
        }
    }
}