<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Examen_AllanT.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
 
    <link rel="stylesheet" type="text/css" href="~/styles.css" />

    <a href="Imagenes/"></a>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <h2>Login de Usuario</h2>
            <asp:TextBox ID="txtUsuario" runat="server" placeholder="Usuario"></asp:TextBox>
            <asp:TextBox ID="txtContraseña" runat="server" TextMode="Password" placeholder="Contraseña"></asp:TextBox>
            <asp:Button ID="btnIniciarSesion" runat="server" Text="Iniciar Sesión" OnClick="btnIniciarSesion_Click" />
        </div>
    </form>
</body>
</html>
