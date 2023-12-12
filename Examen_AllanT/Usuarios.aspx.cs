using System;
using Examen_AllanT.Clases;
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

        Usuario usuarioactual;

        SqlConnection conn;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            String s = System.Configuration.ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
            conn = new SqlConnection("Data Source=DESKTOP-FOV1KMO\\SQLEXPRESS;Initial Catalog=Examen2_AllanT;Integrated Security=True");
            Usuario usuario = Usuario_Actual.GetUsuario();
            if(usuario!= null)
            {
                usuarioactual=usuario;
                lblNombre.Text = "Nombre: " + usuarioactual.Nombre;
                lblRol.Text = "Rol: " + usuarioactual.Rol;
                lbCorreo.Text = "Correo: " + usuarioactual.Correo;
            }
            if (usuarioactual.Rol == "Administrador")
            {
                // Mostrar todas las columnas y acciones para el rol de Administrador
                GridViewUsuarios.Columns[0].Visible = true; // Columna UsuarioID
                GridViewUsuarios.Columns[1].Visible = true; // Columna Nombre
                GridViewUsuarios.Columns[2].Visible = true; // Columna Correo
                GridViewUsuarios.Columns[3].Visible = true; // Columna Telefono
                GridViewUsuarios.Columns[4].Visible = true; // Botón de Editar
                GridViewUsuarios.Columns[5].Visible = true; // Botón de Eliminar
                Mostrar_Formulario.Visible = true;
                contenedor_busqueda.Visible = true;
                SqlDataSourceUsuarios.SelectCommand = "SELECT UsuarioID, Nombre, Correo, Telefono FROM Usuarios";
            }
            else
            {
                // Ocultar la columna de UsuarioID y los botones de Editar/Eliminar para otros roles
                GridViewUsuarios.Columns[0].Visible = false; // Columna UsuarioID
               
                GridViewUsuarios.Columns[5].Visible = false; // Botón de Eliminar
                Mostrar_Formulario.Visible = false;
                pnlFormulario.Visible = false;
                contenedor_busqueda.Visible = false;
                SqlDataSourceUsuarios.SelectCommand = "SELECT UsuarioID, Nombre, Correo, Telefono FROM Usuarios WHERE Correo = @Correo";
                SqlDataSourceUsuarios.SelectParameters.Clear();
                SqlDataSourceUsuarios.SelectParameters.Add("Correo", usuario.Correo);
            }
    
            GridViewUsuarios.DataBind();

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
                lblMensaje.Text = "Error al guardar datos" ;
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
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Cierra la sesión (puedes agregar más lógica de cierre de sesión si es necesario)
            Session.Clear();

            // Redirige al login principal
            Response.Redirect("Login.aspx");
        }

    }
}