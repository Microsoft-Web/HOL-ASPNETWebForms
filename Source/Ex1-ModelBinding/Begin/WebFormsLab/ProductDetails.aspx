<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ProductDetails.aspx.cs" Inherits="WebFormsLab.ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Product Details</h3>
    <asp:FormView runat="server" ID="productsFormView" DataKeyNames="ProductId" ItemType="WebFormsLab.Model.Product"
        DefaultMode="ReadOnly" UpdateMethod="UpdateProduct" SelectMethod="SelectProduct">
        <ItemTemplate>
            <fieldset>
                <ul>
                    <li><b><asp:Label ID="Label2" runat="server" AssociatedControlID="itemProductName">Name:</asp:Label></b></li>
                    <li><asp:Label runat="server" ID="itemProductName" Text='<%#: Item.ProductName %>' /></li>
                    <li><b><asp:Label ID="Label3" runat="server" AssociatedControlID="itemDescription">Description (HTML):</asp:Label></b></li>
                    <li><asp:Label runat="server" ID="itemDescription" Text='<%# Item.Description %>' /></li>
                    <li><b><asp:Label ID="Label4" runat="server" AssociatedControlID="itemUnitPrice">Price:</asp:Label></b></li>
                    <li><asp:Label runat="server" ID="itemUnitPrice" Text='<%#: Item.UnitPrice %>' /></li>
                </ul>
                <br />
                <ul>
                    <li>
                        <asp:Button ID="Button1" runat="server" CommandName="Edit" Text="Edit" />&nbsp;
                        <asp:HyperLink NavigateUrl="~/Products.aspx" Text="Back" runat="server" />
                    </li>
                </ul>
            </fieldset>
        </ItemTemplate>
        <EditItemTemplate>
            <fieldset>
                <ul>
                    <li><asp:Label ID="Label2" runat="server" AssociatedControlID="ProductName">Name:</asp:Label></li>
                    <li><asp:TextBox runat="server" ID="ProductName" Text='<%#: BindItem.ProductName %>' /></li>
                    <li><asp:Label ID="Label3" runat="server" AssociatedControlID="Description">Description (HTML):</asp:Label></li>
                    <li>
                        <asp:TextBox runat="server" ID="Description" TextMode="MultiLine" Cols="60" Rows="8" Text='<%# BindItem.Description %>' />
                    </li>
                    <li><asp:Label ID="Label4" runat="server" AssociatedControlID="UnitPrice">Price:</asp:Label></li>
                    <li><asp:TextBox runat="server" ID="UnitPrice" Text='<%#: BindItem.UnitPrice %>' /></li>
                </ul>
                <br />
                <ul>
                    <li>
                        <asp:Button runat="server" CommandName="Update" Text="Save" />
                        <asp:Button runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="false" />
                    </li>
                </ul>
            </fieldset>
        </EditItemTemplate>
        <EmptyDataTemplate>Product not found</EmptyDataTemplate>
    </asp:FormView>
</asp:Content>
