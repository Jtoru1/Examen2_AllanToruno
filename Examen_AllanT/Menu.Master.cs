using Examen_AllanT.Clases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Examen_AllanT
{
    public partial class Menu1 : System.Web.UI.MasterPage
    {
        Usuario usuarioactual;
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = Usuario_Actual.GetUsuario();
            if (usuario != null)
            {
                usuarioactual = usuario;

            }
            if (usuarioactual.Rol == "Administrador")
            {
                rolestab.Visible = true;
                tecnicostab.Visible = true;
                equipostab.Visible = true;
                asigrolestab.Visible = true;

            }
            else
            {
                rolestab.Visible = false;
                tecnicostab.Visible = false; 
                equipostab.Visible = false;
                asigrolestab.Visible = false;   
            }
            if(usuarioactual.Rol == "Tecnico")
            {
                equipostab.Visible= true;   
            }
        }
        protected void miBoton_Click(object sender, EventArgs e)
        {
            Usuario_Actual.SetUsuario(null);
            Response.Redirect("Login.aspx");
          

            
        }
    }
}