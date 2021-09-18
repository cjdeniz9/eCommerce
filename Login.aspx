<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Layout.Master" CodeBehind="Login.aspx.vb" Inherits="CIS4250Fall2020OnlineStore.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <h2>Login to your account</h2>
    Email:<br />
    <asp:TextBox ID="tbEmail" Width="200" runat="server"></asp:TextBox><br />
    Password:<br />
    <asp:TextBox ID="tbPassword" Width="200" runat="server"></asp:TextBox><br /><br />
    <asp:Button ID="btnLogin" runat="server" Text="login" cssclass="btn btn-default" /><br /><br />
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
</asp:Content>
