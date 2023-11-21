<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Equipos.aspx.cs" Inherits="Examen_AllanT.Equipos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <link href="Styles/styles.css" rel="stylesheet" />
  
    <div class="jumbotron">

        <h1 class="display-4">Equipos</h1>
        <p class="lead">Contenido específico de Equipos.</p>
          <asp:Button ID="Mostrar_Formulario" runat="server" Text="Agregar" OnClick ="btnAgregar_Click" />
        <br />

        <br />

        <div>
            <asp:Panel ID="pnlFormulario" runat="server" Visible="false">
                <label for="TipoEquipo">TipoEquipo:</label>
                <asp:TextBox ID="txtTipoEquipo" runat="server"></asp:TextBox>
                <br />
                <label for="txtModelo">Modelo:</label>
                <asp:TextBox ID="txtModelo" runat="server"></asp:TextBox>
                <br />
                <label for="txtUsuarioID">UsuarioID:</label>
                <asp:TextBox ID="txtUsuarioID" runat="server"></asp:TextBox>
                <br />
                <asp:Button ID="btnAgregar" runat="server" Text="Guardar" OnClick="Guardar_Click" />
                <asp:Label ID="lblMensaje" runat="server" Text="" ></asp:Label>

            </asp:Panel>
            <br />

            <br />
        </div>
        <asp:TextBox ID="txtFiltroTipoEquipo" runat="server" placeholder="Ingrese Tipo de Equipo"></asp:TextBox>
<asp:Button ID="btnFiltrar" runat="server" Text="Filtrar por Tipo de Equipo" OnClick="btnFiltrar_Click" />
        <br />

<br />

    
        <asp:GridView ID="GridViewEquipos" runat="server" AutoGenerateColumns="False" DataKeyNames="EquipoID" DataSourceID="SqlDataSourceEquipos">
            <Columns>

                <asp:BoundField DataField="EquipoID" HeaderText="EquipoID" ReadOnly="True" SortExpression="EquipoID" />
                <asp:BoundField DataField="TipoEquipo" HeaderText="TipoEquipo" SortExpression="TipoEquipo" />
                <asp:BoundField DataField="Modelo" HeaderText="Modelo" SortExpression="Modelo" />
                <asp:BoundField DataField="UsuarioID" HeaderText="UsuarioID" SortExpression="UsuarioID" />
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />

            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceEquipos" runat="server" ConnectionString="<%$ ConnectionStrings:Conexion %>"
            SelectCommand="SELECT * FROM Equipos" UpdateCommand="UPDATE Equipos SET TipoEquipo = @TipoEquipo, Modelo = @Modelo, UsuarioID = @UsuarioID WHERE EquipoID = @EquipoID"
            DeleteCommand="DELETE FROM Equipos WHERE EquipoID = @EquipoID"
            InsertCommand="INSERT INTO Equipos (TipoEquipo, Modelo, UsuarioID) VALUES (@TipoEquipo, @Modelo, @UsuarioID)">
  
            <UpdateParameters>
                <asp:Parameter Name="TipoEquipo" Type="String" />
                <asp:Parameter Name="Modelo" Type="String" />
                <asp:Parameter Name="UsuarioID" Type="Int32" />
                <asp:Parameter Name="EquipoID" Type="Int32" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="EquipoID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TipoEquipo" Type="String" />
                <asp:Parameter Name="Modelo" Type="String" />
                <asp:Parameter Name="UsuarioID" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
    </div>
  
</asp:Content>
