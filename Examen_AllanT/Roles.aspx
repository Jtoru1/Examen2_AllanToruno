<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Roles.aspx.cs" Inherits="Examen_AllanT.Roles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1 class="display-4">Roles</h1>
        <p class="lead">Contenido específico de Roles.</p>
        <asp:Button ID="Mostrar_Formulario" runat="server" Text="Agregar Rol" OnClick="btnAgregarrol_Click" />
        <br />
        <div>
            <asp:Panel ID="pnlFormularioRol" runat="server" Visible="false">            
                <br />
                <label for="txtdescripcion">Descripcion:</label>
                <asp:TextBox ID="txtdescripcion" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="btnAgregarrol" runat="server" Text="Guardar" OnClick="Guardar_Clickrol" />
                <asp:Label ID="lblMensajerol" runat="server" Text=""></asp:Label>
            </asp:Panel>
            <br />
            <br />
        </div>
        <div id="contenedor_busqueda" runat="server">
            
            <br />
            <br />
        </div>

        <asp:GridView ID="GridViewRoles" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSourceRoles" >
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="Rol ID" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSourceRoles" runat="server" ConnectionString="<%$ ConnectionStrings:Conexion %>"
            SelectCommand="SELECT * FROM Rol" UpdateCommand="UPDATE Rol SET Descripcion = @Descripcion WHERE ID = @ID" DeleteCommand="DELETE FROM Rol WHERE ID = @ID">
            <UpdateParameters>
               
                <asp:Parameter Name="Descripcion" Type="String" />

            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
