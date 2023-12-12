<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="AsigRoles.aspx.cs" Inherits="Examen_AllanT.AsigRoles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="jumbotron">
        <h1 class="display-4">Roles</h1>
        <p class="lead">Contenido específico de Asignación de Roles.</p>
             <asp:GridView ID="GridViewAsigRoles" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSourceAsigRoles" >
     <Columns>
         <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
         <asp:BoundField DataField="Correo" HeaderText="Correo" SortExpression="Correo" ReadOnly="true" />
         <asp:TemplateField HeaderText="Rol">
            <ItemTemplate>
                <asp:Label ID="lblRol" runat="server" Text='<%# Eval("Rol") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>

                <asp:DropDownList ID="ddlRoles" runat="server" DataSourceID="SqlDataSourceRoles" DataTextField="DESCRIPCION" DataValueField="ID" SelectedValue='<%# Bind("IDRol") %>'></asp:DropDownList>
            </EditItemTemplate>
        </asp:TemplateField>         <asp:CommandField ShowEditButton="True" />
         
     </Columns>
 </asp:GridView>

 <asp:SqlDataSource ID="SqlDataSourceAsigRoles" runat="server" ConnectionString="<%$ ConnectionStrings:Conexion %>"
     SelectCommand="
   select UsuarioRoles.ID as ID, Usuario_Sistema.Correo, UsuarioRoles.IDRol,Rol.DESCRIPCION as Rol  from Usuario_Sistema 
   inner join UsuarioRoles on Usuario_Sistema.ID=UsuarioRoles.UsuarioID
   inner join Rol on UsuarioRoles.IDRol=Rol.ID" UpdateCommand="UPDATE UsuarioRoles SET IDRol = @IDRol WHERE ID = @ID">
   <UpdateParameters>
        <asp:Parameter Name="IDRol" Type="Int32" />
    </UpdateParameters>
 </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceRoles" runat="server" ConnectionString="<%$ ConnectionStrings:Conexion %>"
    SelectCommand="SELECT ID, DESCRIPCION FROM Rol">
</asp:SqlDataSource>
</asp:Content>
