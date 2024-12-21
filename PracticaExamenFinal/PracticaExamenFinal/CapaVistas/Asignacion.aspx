<%@ Page Title="" Language="C#" MasterPageFile="~/CapaVistas/menu.Master" AutoEventWireup="true" CodeBehind="Asignacion.aspx.cs" Inherits="PracticaExamenFinal.CapaVistas.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>ASIGNACION</h2>
    <br />  
    <div>   
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        

    </div>
    <br />
    <br />
    <div>
         <asp:Label ID="bcodigo" runat="server" Text="CODIGO"></asp:Label>
         <asp:TextBox ID="codigo" runat="server"></asp:TextBox>
         <asp:Label ID="bnombre" runat="server" Text="NOMBRE"></asp:Label>
         <asp:TextBox ID="nombre" runat="server"></asp:TextBox>
      
         <asp:Button ID="bagregar" runat="server" Text="AGREGAR" />
        <asp:Button ID="Bborrar" runat="server" Text="BORRAR" OnClick="Bborrar_Click" />
    </div>
    <div>   
      
    </div>
</asp:Content>
