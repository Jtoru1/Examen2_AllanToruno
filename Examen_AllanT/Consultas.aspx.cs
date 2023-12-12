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
    public partial class Consultas : System.Web.UI.Page
    {
        Usuario usuarioactual;

        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            String s = System.Configuration.ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
            conn = new SqlConnection("Data Source=DESKTOP-FOV1KMO\\SQLEXPRESS;Initial Catalog=Examen2_AllanT;Integrated Security=True");

            Usuario usuario = Usuario_Actual.GetUsuario();

            if (usuario != null)
            {
                usuarioactual = usuario;

                // Verificar el rol del usuario
                if (usuarioactual.Rol == "Tecnico")
                {

                    // Configurar la consulta para mostrar solo las consultas del técnico actual
                    SqlDataSourceAsignaciones.SelectCommand = "select Tecnicos.TecnicoID as ID, Tecnicos.Nombre, Asignaciones.AsignacionID, Asignaciones.FechaAsignacion, Asignaciones.AsignacionID as Codigo_Reparacion, reparaciones.FechaSolicitud,Reparaciones.Estado, DetallesReparacion.Descripcion, Equipos.TipoEquipo, equipos.Modelo, Usuarios.Nombre as NombreUsuario, Usuarios.Correo from Tecnicos inner join Asignaciones ON Asignaciones.TecnicoID = Tecnicos.TecnicoID inner join Reparaciones ON Asignaciones.ReparacionID= Reparaciones.ReparacionID INNER join DetallesReparacion on DetallesReparacion.ReparacionID= Reparaciones.ReparacionID inner join Equipos on Equipos.EquipoID = Reparaciones.EquipoID inner join Usuarios on usuarios.UsuarioID = Equipos.UsuarioID where Usuarios.Correo= @Correo";
                    SqlDataSourceAsignaciones.SelectParameters.Clear();
                    SqlDataSourceAsignaciones.SelectParameters.Add("Correo", usuario.Correo);

                }
                else
                {
                    if (usuarioactual.Rol != "Administrador")
                    {

                        // Configurar la consulta para mostrar solo las consultas del técnico actual
                        SqlDataSourceAsignaciones.SelectCommand = "select Tecnicos.TecnicoID as ID, Tecnicos.Nombre, Asignaciones.AsignacionID, Asignaciones.FechaAsignacion, Asignaciones.AsignacionID as Codigo_Reparacion, reparaciones.FechaSolicitud,Reparaciones.Estado, DetallesReparacion.Descripcion, Equipos.TipoEquipo, equipos.Modelo, Usuarios.Nombre as NombreUsuario, Usuarios.Correo from Tecnicos inner join Asignaciones ON Asignaciones.TecnicoID = Tecnicos.TecnicoID inner join Reparaciones ON Asignaciones.ReparacionID= Reparaciones.ReparacionID INNER join DetallesReparacion on DetallesReparacion.ReparacionID= Reparaciones.ReparacionID inner join Equipos on Equipos.EquipoID = Reparaciones.EquipoID inner join Usuarios on usuarios.UsuarioID = Equipos.UsuarioID where Usuarios.Correo= @Correo";
                        SqlDataSourceAsignaciones.SelectParameters.Clear();
                        SqlDataSourceAsignaciones.SelectParameters.Add("Correo", usuario.Correo);

                    }
                }

                // Resto del código para cargar y mostrar la tabla de Consultas
                // Puedes personalizar esto según las necesidades de tu aplicación
                GridViewAsignaciones.DataBind();
            }
        }


    
    }
}