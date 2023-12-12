<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Consultas.aspx.cs" Inherits="Examen_AllanT.Consultas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">

        <h1 class="display-4">Consultas</h1>
        <p class="lead">Contenido específico de Consultas.</p>
        <style type="text/css">
        .center-align {
            text-align: center;
        }
    </style>
        <asp:GridView ID="GridViewAsignaciones" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceAsignaciones">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" ItemStyle-CssClass="center-align" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre del Técnico" SortExpression="Nombre" ItemStyle-CssClass="center-align"/>
                <asp:BoundField DataField="AsignacionID" HeaderText="ID de Asignación" SortExpression="AsignacionID" ItemStyle-CssClass="center-align"/>
                <asp:BoundField DataField="FechaAsignacion" HeaderText="Fecha de Asignación" SortExpression="FechaAsignacion" ItemStyle-CssClass="center-align" />
                <asp:BoundField DataField="Codigo_Reparacion" HeaderText="Código de Reparación" SortExpression="Codigo_Reparacion" ItemStyle-CssClass="center-align" />
                <asp:BoundField DataField="FechaSolicitud" HeaderText="Fecha de Solicitud" SortExpression="FechaSolicitud" ItemStyle-CssClass="center-align" />
                <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" ItemStyle-CssClass="center-align"/>
                <asp:BoundField DataField="Descripcion" HeaderText="Descripción" SortExpression="Descripcion" ItemStyle-CssClass="center-align" />
                <asp:BoundField DataField="TipoEquipo" HeaderText="Tipo de Equipo" SortExpression="TipoEquipo" ItemStyle-CssClass="center-align"/>
                <asp:BoundField DataField="Modelo" HeaderText="Modelo" SortExpression="Modelo" ItemStyle-CssClass="center-align" />
                <asp:BoundField DataField="NombreUsuario" HeaderText="Nombre del Usuario" SortExpression="NombreUsuario" ItemStyle-CssClass="center-align" />
                <asp:BoundField DataField="Correo" HeaderText="Correo del Usuario" SortExpression="Correo" ItemStyle-CssClass="center-align" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSourceAsignaciones" runat="server" ConnectionString="<%$ ConnectionStrings:Conexion %>"
            SelectCommand="SELECT Tecnicos.TecnicoID as ID, Tecnicos.Nombre, Asignaciones.AsignacionID, Asignaciones.FechaAsignacion, Asignaciones.AsignacionID as Codigo_Reparacion, reparaciones.FechaSolicitud, Reparaciones.Estado, DetallesReparacion.Descripcion, Equipos.TipoEquipo, equipos.Modelo, Usuarios.Nombre as NombreUsuario, Usuarios.Correo FROM Tecnicos INNER JOIN Asignaciones ON Asignaciones.TecnicoID = Tecnicos.TecnicoID INNER JOIN Reparaciones ON Asignaciones.ReparacionID= Reparaciones.ReparacionID INNER JOIN DetallesReparacion ON DetallesReparacion.ReparacionID= Reparaciones.ReparacionID INNER JOIN Equipos ON Equipos.EquipoID = Reparaciones.EquipoID INNER JOIN Usuarios ON usuarios.UsuarioID = Equipos.UsuarioID"></asp:SqlDataSource>
    </div>
</asp:Content>
