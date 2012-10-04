<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="WebFormsLab.ProductDetails" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Product Details</h3>
    <asp:FormView runat="server" ID="productsFormView" DataKeyNames="ProductId" ItemType="WebFormsLab.Model.Product"
        DefaultMode="ReadOnly" UpdateMethod="UpdateProduct" SelectMethod="SelectProduct">
        <ItemTemplate>
            <fieldset>
                <p><b><asp:Label ID="Label2" runat="server" AssociatedControlID="itemProductName">Name:</asp:Label></b></p>
                <p><asp:Label runat="server" ID="itemProductName" Text='<%#: Item.ProductName %>' /></p>
                <p><b><asp:Label ID="Label3" runat="server" AssociatedControlID="itemDescription" ValidateRequestMode="Disabled">Description (HTML):</asp:Label></b></p>
                <p><asp:Label runat="server" ID="itemDescription" Text='<%# Item.Description %>' /></p>
                <p><b><asp:Label ID="Label4" runat="server" AssociatedControlID="itemUnitPrice">Price:</asp:Label></b></p>
                <p><asp:Label runat="server" ID="itemUnitPrice" Text='<%#: Item.UnitPrice %>' /></p>
                <p><b><asp:Label ID="Label5" runat="server" AssociatedControlID="itemUnitPrice">Image:</asp:Label></b></p>
                <p>
                    <img src="<%# string.IsNullOrEmpty(Item.ImagePath) ? "/Images/noimage.jpg" : Item.ImagePath %>" alt="Image" />
                </p>
                <br />
                <p>
                    <asp:Button ID="Button1" runat="server" CommandName="Edit" Text="Edit" />&nbsp;
                    <asp:HyperLink NavigateUrl="~/Products.aspx" Text="Back" runat="server" />
                </p>
            </fieldset>
        </ItemTemplate>
        <EditItemTemplate>
            <fieldset>
                <p><asp:Label ID="Label2" runat="server" AssociatedControlID="ProductName">Name:</asp:Label></p>
                <p><asp:TextBox runat="server" ID="ProductName" Text='<%#: BindItem.ProductName %>' /></p>
                <p><asp:Label ID="Label3" runat="server" AssociatedControlID="Description">Description (HTML):</asp:Label></p>
                <p>
                    <asp:TextBox runat="server" ID="Description" TextMode="MultiLine" Cols="60" Rows="8" Text='<%# BindItem.Description %>'  ValidateRequestMode="Disabled"/>
                </p>
                <p><asp:Label ID="Label4" runat="server" AssociatedControlID="UnitPrice">Price:</asp:Label></p>
                <p><asp:TextBox runat="server" ID="UnitPrice" Text='<%#: BindItem.UnitPrice %>' /></p>
                
                <p><asp:Label ID="Label1" runat="server" AssociatedControlID="ImagePath">Image URL:</asp:Label></p>
                <p><asp:TextBox runat="server" ID="ImagePath" Text='<%#:  BindItem.ImagePath %>' /></p>

                <br />
                <p>
                    <asp:Button runat="server" CommandName="Update" Text="Save" />
                    <asp:Button runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="false" />
                </p>
            </fieldset>
        </EditItemTemplate>
        <EmptyDataTemplate>Product not found</EmptyDataTemplate>
    </asp:FormView>
    
    <asp:Label ID="threadsMessageLabel" runat="server" />
</asp:Content>
