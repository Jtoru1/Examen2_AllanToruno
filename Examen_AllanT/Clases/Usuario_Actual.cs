using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Examen_AllanT.Clases
{
    public class Usuario_Actual
    {
        private static Usuario usuario; // El campo usuario puede ser nulo

        // Método estático para obtener el usuario
        public static Usuario GetUsuario()
        {
            return usuario;
        }

        // Método estático para establecer el usuario
        public static void SetUsuario(Usuario nuevoUsuario)
        {
            usuario = nuevoUsuario;
        }
    }
}