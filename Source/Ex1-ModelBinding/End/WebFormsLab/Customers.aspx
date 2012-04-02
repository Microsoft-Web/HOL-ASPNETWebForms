<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="WebFormsLab.Customers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Customers</h3>
    <ul>
        <asp:Repeater ID="customersRepeater" ItemType="WebFormsLab.Model.Customer" runat="server">
            <ItemTemplate>
                <li>
                    <a href="CustomerDetails.aspx?id=<%#: Item.Id %>">
                        <%#: Item.FirstName %> <%#: Item.LastName %>
                    </a>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>	
	<a href="CustomerDetails.aspx"> Add a New Customer</a>
</asp:Content>
