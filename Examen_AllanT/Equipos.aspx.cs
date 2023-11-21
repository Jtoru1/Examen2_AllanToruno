using Examen_AllanT.Clases;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Examen_AllanT
{
    public partial class Equipos : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlTransaction tran;
        SqlDataReader dr;

        protected void Page_Load(object sender, EventArgs e)
        {
            String s = System.Configuration.ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
            conn = new SqlConnection("Data Source=DESKTOP-FOV1KMO\\SQLEXPRESS;Initial Catalog=Examen2_AllanT;Integrated Security=True");
            //cmd = new SqlCommand();
            //cmd.Connection = conn;
        }
        protected void GridViewEquipos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Insert")
            {
               
            }
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            pnlFormulario.Visible = !pnlFormulario.Visible;

        }
        protected void Guardar_Click(object sender, EventArgs e)
        {
            string Modelo = txtModelo.Text;
            string TipoEquipo = txtTipoEquipo.Text;

            if (Modelo == "" || TipoEquipo == "" || txtUsuarioID.Text == "")
            {
                string script = "alert('Faltan datos.');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);

                return;
            }
            int UsuarioID = Convert.ToInt32(txtUsuarioID.Text);

            conn.Open();
            //tran = conn.BeginTransaction();
            //cmd.Transaction = tran;

            try
            {
                string query = "INSERT INTO Equipos (TipoEquipo, Modelo, UsuarioID) VALUES (@TipoEquipo, @Modelo, @UsuarioID)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    // Asumiendo que TipoEquipo, Modelo y UsuarioID son variables que contienen los valores a insertar
                    cmd.Parameters.AddWithValue("@TipoEquipo", TipoEquipo);
                    cmd.Parameters.AddWithValue("@Modelo", Modelo);
                    cmd.Parameters.AddWithValue("@UsuarioID", UsuarioID);

                    cmd.ExecuteNonQuery();
                }
                // cmd= new SqlCommand(query,conn);
                // cmd.CommandText = query;
                // cmd.ExecuteNonQuery();
                // tran.Commit();
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
            txtTipoEquipo.Text = "";
            txtModelo.Text = "";
            txtUsuarioID.Text = "";
            pnlFormulario.Visible = false;
            GridViewEquipos.DataBind();
        }
        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            // Obtener el valor del TextBox de filtro
            string tipoEquipoFiltro = txtFiltroTipoEquipo.Text.Trim();

            // Modificar el origen de datos para aplicar el filtro
            SqlDataSourceEquipos.SelectCommand = "SELECT EquipoID, TipoEquipo, Modelo, UsuarioID FROM Equipos WHERE TipoEquipo LIKE @TipoEquipo";
            SqlDataSourceEquipos.SelectParameters.Clear();
            SqlDataSourceEquipos.SelectParameters.Add("TipoEquipo", "%" + tipoEquipoFiltro + "%");

            // Volver a cargar los datos en el GridView
            GridViewEquipos.DataBind();
        }
    }
}