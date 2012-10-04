<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="WebFormsLab.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Categories</h3>
    <asp:Label ID="Label1" runat="server" AssociatedControlID="minProductsCount">
        Show categories with at least this number of products:
    </asp:Label>
    <asp:DropDownList runat="server" ID="minProductsCount" AutoPostBack="true">
        <asp:ListItem Value="" Text="-" />
        <asp:ListItem Text="1" />
        <asp:ListItem Text="3" />
        <asp:ListItem Text="5" />
    </asp:DropDownList>
    <br/>
    <asp:GridView ID="categoriesGrid" runat="server"
                  AutoGenerateColumns="false"
                  ItemType="WebFormsLab.Model.Category"
                  DataKeyNames="CategoryID"
                  SelectMethod="GetCategories"
                  AutoGenerateSelectButton="true"
                  AutoGenerateEditButton="true"
                  UpdateMethod="UpdateCategory">
        <Columns>
            <asp:BoundField DataField="CategoryId" HeaderText="ID" SortExpression="CategoryId" />
            <asp:BoundField DataField="CategoryName" HeaderText="Name" SortExpression="CategoryName" />
            <asp:BoundField DataField="Description" HeaderText="Description" />
            <asp:TemplateField HeaderText="# of Products">
                <ItemTemplate><%#: Item.Products.Count %></ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            No categories found with a product count of <%#: minProductsCount.SelectedValue %>
        </EmptyDataTemplate>
    </asp:GridView>

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowModelStateErrors="true" />

    <h3>Products</h3>
    <asp:GridView ID="productsGrid" runat="server" 
                  CellPadding="4"
                  AutoGenerateColumns="false"
                  ItemType="WebFormsLab.Model.Product"
                  DataKeyNames="ProductId"
                  SelectMethod="GetProducts">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <a href="ProductDetails.aspx?productId=<%#: Item.ProductId %>">View</a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ProductId" HeaderText="ID" />
            <asp:BoundField DataField="ProductName" HeaderText="Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" HtmlEncode="false" />
            <asp:BoundField DataField="UnitPrice" HeaderText="Price" />
        </Columns>
        <EmptyDataTemplate>
            Select a category above to see its products
        </EmptyDataTemplate>
    </asp:GridView>
</asp:Content>
