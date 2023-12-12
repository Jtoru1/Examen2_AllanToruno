using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Examen_AllanT.Clases
{
  
    public class Usuario
    {
        // Propiedades
        public string Nombre { get; set; }
        public string Correo { get; set; }
        public string Telefono { get; set; }
        public string Rol { get; set; }

        public Usuario() { }
        // Constructor
        public Usuario(string nombre, string correo, string telefono, string rol)
        { 

            Nombre = nombre;
            Correo = correo;
            Telefono = telefono;           
            Rol = rol;
        }

        
    }

   

}