using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Examen_AllanT
{
    public partial class Usuarios : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            String s = System.Configuration.ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
            conn = new SqlConnection("Data Source=DESKTOP-FOV1KMO\\SQLEXPRESS;Initial Catalog=Examen2_AllanT;Integrated Security=True");
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            pnlFormulario.Visible = !pnlFormulario.Visible;

        }
        protected void Guardar_Click(object sender, EventArgs e)
        {
            string Nombre = txtNombre.Text;
            string Correo = txtCorreo.Text;
            string Telefono = txtTelefono.Text;

            if (Nombre == "" || Correo == "" || Telefono == "")
            {
                string script = "alert('Faltan datos.');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);

                return;
            }
          

            conn.Open();
          

            try
            {
                string query = "INSERT INTO Usuarios (Nombre, Correo, Telefono) VALUES (@Nombre, @Correo, @Telefono)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    // Asumiendo que TipoEquipo, Modelo y UsuarioID son variables que contienen los valores a insertar
                    cmd.Parameters.AddWithValue("@Nombre", Nombre);
                    cmd.Parameters.AddWithValue("@Correo", Correo);
                    cmd.Parameters.AddWithValue("@Telefono", Telefono);

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
                // tran.Rollback();
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
            txtCorreo.Text = "";
            txtTelefono.Text = "";
            pnlFormulario.Visible = false;
            GridViewUsuarios.DataBind();
        }
        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            // Obtener el valor del TextBox de filtro
            string FiltroNombre = txtFiltroNombre.Text.Trim();

            // Modificar el origen de datos para aplicar el filtro
            SqlDataSourceUsuarios.SelectCommand = "SELECT Nombre, Correo, Telefono, UsuarioID FROM Usuarios WHERE Nombre LIKE @TipoNombre";
            SqlDataSourceUsuarios.SelectParameters.Clear();
            SqlDataSourceUsuarios.SelectParameters.Add("TipoNombre", "%" + FiltroNombre + "%");

            // Volver a cargar los datos en el GridView
            GridViewUsuarios.DataBind();
        }
    }
}