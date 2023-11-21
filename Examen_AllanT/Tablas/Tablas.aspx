<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tablas.aspx.cs" Inherits="Examen_AllanT.Tablas.Tablas" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mantenimiento</title>
</head>

<body>
    <form id="form1" runat="server">
        <div>
            <h2>Equipos</h2>
            <asp:GridView ID="GridViewEquipos" runat="server" AutoGenerateColumns="False" DataKeyNames="EquipoID" DataSourceID="SqlDataSourceEquipos">
                <Columns>
                    <asp:BoundField DataField="EquipoID" HeaderText="EquipoID" ReadOnly="True" SortExpression="EquipoID" />
                    <asp:BoundField DataField="TipoEquipo" HeaderText="TipoEquipo" SortExpression="TipoEquipo" />
                    <asp:BoundField DataField="Modelo" HeaderText="Modelo" SortExpression="Modelo" />
                    <asp:BoundField DataField="UsuarioID" HeaderText="UsuarioID" SortExpression="UsuarioID" />
                    <asp:CommandField ShowEditButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceEquipos" runat="server" ConnectionString="<%$ ConnectionStrings:Conexion %>"
                SelectCommand="SELECT * FROM Equipos" UpdateCommand="UPDATE Equipos SET TipoEquipo = @TipoEquipo, Modelo = @Modelo, UsuarioID = @UsuarioID WHERE EquipoID = @EquipoID">
              
              
            </asp:SqlDataSource>
        </div>

        <div>
            <h2>Usuarios</h2>
            <asp:GridView ID="GridViewUsuarios" runat="server" AutoGenerateColumns="False" DataKeyNames="UsuarioID" DataSourceID="SqlDataSourceUsuarios">
             
                <Columns>
                    <asp:BoundField DataField="UsuarioID" HeaderText="UsuarioID" ReadOnly="True" SortExpression="UsuarioID" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Correo" HeaderText="Correo" SortExpression="Correo" />
                    <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
                    <asp:CommandField ShowEditButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceUsuarios" runat="server" ConnectionString="<%$ ConnectionStrings:Conexion %>"
                SelectCommand="SELECT * FROM Usuarios" UpdateCommand="UPDATE Usuarios SET Nombre = @Nombre, Correo = @Correo, Telefono = @Telefono WHERE UsuarioID = @UsuarioID">
                <UpdateParameters>
                    <asp:Parameter Name="Nombre" Type="String" />
                    <asp:Parameter Name="Correo" Type="String" />
                    <asp:Parameter Name="Telefono" Type="String" />
                    <asp:Parameter Name="UsuarioID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>

        <div>
            <h2>Técnicos</h2>
            <asp:GridView ID="GridViewTecnicos" runat="server" AutoGenerateColumns="False" DataKeyNames="TecnicoID" DataSourceID="SqlDataSourceTecnicos">
              
                <Columns>
                    <asp:BoundField DataField="TecnicoID" HeaderText="TecnicoID" ReadOnly="True" SortExpression="TecnicoID" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" SortExpression="Especialidad" />
                    <asp:CommandField ShowEditButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceTecnicos" runat="server" ConnectionString="<%$ ConnectionStrings:Conexion %>"
                SelectCommand="SELECT * FROM Tecnicos" UpdateCommand="UPDATE Tecnicos SET Nombre = @Nombre, Especialidad = @Especialidad WHERE TecnicoID = @TecnicoID">
                <UpdateParameters>
                    <asp:Parameter Name="Nombre" Type="String" />
                    <asp:Parameter Name="Especialidad" Type="String" />
                    <asp:Parameter Name="TecnicoID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>

    </form>
</body>
</html>
