<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Tecnicos.aspx.cs" Inherits="Examen_AllanT.Tecnicos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1 class="display-4">Técnicos</h1>
        <p class="lead">Contenido específico de Técnicos.</p>
        <asp:Button ID="Mostrar_Formulario" runat="server" Text="Agregar" OnClick="btnAgregar_Click" />
        <br />

        <br />
        <div>
            <asp:Panel ID="pnlFormulario" runat="server" Visible="false">
                <label for="Nombre">Nombre:</label>
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                <br />
                <label for="txtEspecialidad">Especialidad:</label>
                <asp:TextBox ID="txtEspecialidad" runat="server"></asp:TextBox>
                <br />
                <asp:Button ID="btnAgregar" runat="server" Text="Guardar" OnClick="Guardar_Click" />
                <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>

            </asp:Panel>
            <br />

            <br />
        </div>
        <asp:TextBox ID="txtFiltroNombre" runat="server" placeholder="Ingrese un Nombre"></asp:TextBox>
        <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar por Nombre" OnClick="btnFiltrar_Click" />
        <br />

        <br />
        <asp:GridView ID="GridViewTecnicos" runat="server" AutoGenerateColumns="False" DataKeyNames="TecnicoID" DataSourceID="SqlDataSourceTecnicos">

            <Columns>
                <asp:BoundField DataField="TecnicoID" HeaderText="TecnicoID" ReadOnly="True" SortExpression="TecnicoID" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" SortExpression="Especialidad" />
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceTecnicos" runat="server" ConnectionString="<%$ ConnectionStrings:Conexion %>"
            SelectCommand="SELECT * FROM Tecnicos" UpdateCommand="UPDATE Tecnicos SET Nombre = @Nombre, Especialidad = @Especialidad WHERE TecnicoID = @TecnicoID" DeleteCommand="DELETE FROM Tecnicos WHERE TecnicoID = @TecnicoID">

            <UpdateParameters>
                <asp:Parameter Name="Nombre" Type="String" />
                <asp:Parameter Name="Especialidad" Type="String" />
                <asp:Parameter Name="TecnicoID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
