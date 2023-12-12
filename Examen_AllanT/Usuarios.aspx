<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="Examen_AllanT.Usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <asp:Label ID="lblNombre" runat="server" Text=""></asp:Label>
        <asp:Label ID="lblRol" runat="server" Text=""></asp:Label>
        <asp:Label ID="lbCorreo" runat="server" Text=""></asp:Label>
        <h1 class="display-4">Usuarios</h1>
        <p class="lead">Contenido específico de Usuarios.</p>
        <asp:Button ID="Mostrar_Formulario" runat="server" Text="Agregar" OnClick="btnAgregar_Click" />
        <br />

        <br />
        <div>
            <asp:Panel ID="pnlFormulario" runat="server" Visible="false">
                <label for="txtNombre">Nombre:</label>
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                <br />
                <label for="txtCorreo">Correo:</label>
                <asp:TextBox ID="txtCorreo" runat="server"></asp:TextBox>
                <br />
                <label for="txtTelefono">Telefono:</label>
                <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
                <br />
                <asp:Button ID="btnAgregar" runat="server" Text="Guardar" OnClick="Guardar_Click" />
                <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>

            </asp:Panel>
            <br />

            <br />
        </div>
        <div id="contenedor_busqueda" runat="server">
            <asp:TextBox ID="txtFiltroNombre" runat="server" placeholder="Ingrese el Nombre"></asp:TextBox>
            <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar por Nombre de Usuario" OnClick="btnFiltrar_Click" />
            <br />


            <br />
        </div>

        <asp:GridView ID="GridViewUsuarios" runat="server" AutoGenerateColumns="False" DataKeyNames="UsuarioID" DataSourceID="SqlDataSourceUsuarios">

            <Columns>
                <asp:BoundField DataField="UsuarioID" HeaderText="UsuarioID" ReadOnly="True" SortExpression="UsuarioID" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Correo" HeaderText="Correo" SortExpression="Correo" />
                <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceUsuarios" runat="server" ConnectionString="<%$ ConnectionStrings:Conexion %>"
            SelectCommand="SELECT * FROM Usuarios" UpdateCommand="UPDATE Usuarios SET Nombre = @Nombre, Correo = @Correo, Telefono = @Telefono WHERE UsuarioID = @UsuarioID" DeleteCommand="DELETE FROM Usuarios WHERE UsuarioID = @UsuarioID">
            <UpdateParameters>
                <asp:Parameter Name="Nombre" Type="String" />
                <asp:Parameter Name="Correo" Type="String" />
                <asp:Parameter Name="Telefono" Type="String" />
             
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
