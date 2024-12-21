<%@ Page Title="" Language="C#" MasterPageFile="~/CapaVistas/menu.Master" AutoEventWireup="true" CodeBehind="EmpleadoProyecto.aspx.cs" Inherits="PracticaExamenFinal.CapaVistas.Clientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>EmpleadoProyecto </h2>
    <br />  
    <div> 
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
         

    </div>
    <br />  
    <br />  
    <div>  
         <asp:Label ID="Label1" runat="server" Text="CODIGO"></asp:Label>
        <asp:TextBox ID="codigo" runat="server"></asp:TextBox>
         <asp:Label ID="Label2" runat="server" Text="NOMBRE"></asp:Label>
        <asp:TextBox ID="nombre" runat="server"></asp:TextBox>

         <asp:Button ID="bagregar" runat="server" Text="AGREGAR" OnClick="bagregar_Click" />
        <asp:Button ID="Bborrar" runat="server" Text="BORRAR" />
    </div>
    <div>   
        <asp:Button ID="Consultar" runat="server" Text="CONSULTAR" />
    </div>
</asp:Content>

