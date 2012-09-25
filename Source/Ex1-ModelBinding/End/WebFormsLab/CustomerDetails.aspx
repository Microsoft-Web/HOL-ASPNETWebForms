<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerDetails.aspx.cs" Inherits="WebFormsLab.CustomerDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Customer Details</h3>

    <asp:FormView runat="server" ID="fvDataBinding" DataKeyNames="Id" ItemType="WebFormsLab.Model.Customer" 
        DefaultMode="ReadOnly" InsertMethod="SaveCustomer" UpdateMethod="UpdateCustomer" SelectMethod="SelectCustomer"
       >
     <ItemTemplate>
        <fieldset>
            <p><b><asp:Label runat="server" AssociatedControlID="customerFirstName">First Name:</asp:Label></b></p>
            <p><asp:Label runat="server" ID="customerFirstName" Text='<%#: Item.FirstName %>' /></p>
            <p><b><asp:Label runat="server" AssociatedControlID="customerLastName">Last Name:</asp:Label></b></p>
            <p><asp:Label runat="server" ID="customerLastName" Text='<%#: Item.LastName %>' /></p>
            <p><b><asp:Label runat="server" AssociatedControlID="customerAge">Age:</asp:Label></b></p>
            <p><asp:Label runat="server" ID="customerAge" Text='<%#: Item.Age %>' /></p>
            <p><b><asp:Label runat="server" AssociatedControlID="customerEmail">E-mail:</asp:Label></b></p>
            <p><asp:Label runat="server" ID="customerEmail" Text='<%#: Item.EmailAddress %>' /></p>
            <p><b><asp:Label runat="server" AssociatedControlID="customerPhone">Phone:</asp:Label></b></p>
            <p><asp:Label runat="server" ID="customerPhone" Text='<%#: Item.DaytimePhone %>' /></p>
            <br />
            <p>
                <asp:Button ID="Button1" runat="server" CommandName="Edit" Text="Edit" />&nbsp;
                <asp:HyperLink NavigateUrl="~/Customers.aspx" Text="Back" runat="server" />
            </p>
        </fieldset>
     </ItemTemplate>

     <EditItemTemplate>
        <fieldset>
            <p><asp:Label runat="server" AssociatedControlID="firstName">First Name: </asp:Label></p>
            <p><asp:TextBox runat="server" ID="firstName" Text='<%#: BindItem.FirstName %>' />
				&nbsp;<asp:RequiredFieldValidator runat="server" ControlToValidate="firstName" ErrorMessage="Please enter a value for First Name" ForeColor="Red" />
			</p>

            <p><asp:Label runat="server" AssociatedControlID="lastName">Last Name: </asp:Label></p>
            <p><asp:TextBox runat="server" ID="lastName" Text='<%#: BindItem.LastName %>' />
                &nbsp;<asp:RequiredFieldValidator runat="server" ControlToValidate="lastName" ErrorMessage="Please enter a value for Last Name" ForeColor="Red" />
			</p>

            <p><asp:Label runat="server" AssociatedControlID="Age">Age: </asp:Label></p>
            <p><asp:TextBox ID="age" runat="server" Text='<%#: BindItem.Age %>' /></p>
            
            <p><asp:Label runat="server" AssociatedControlID="Email">E-Mail: </asp:Label></p>
            <p><asp:TextBox ID="email" runat="server" Text='<%#: BindItem.EmailAddress %>' /></p>
            
            <p><asp:Label runat="server" AssociatedControlID="Phone">Phone: </asp:Label></p>
            <p><asp:TextBox ID="phone" runat="server" Text='<%#: BindItem.DaytimePhone %>' /></p>
            
            <br />
            <p>
                <asp:Button runat="server" CommandName="Update" Text="Save" />
                <asp:Button runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="false" />
            </p>
         </fieldset>             
     </EditItemTemplate>
     <InsertItemTemplate>        
        <fieldset>
            <p><asp:Label runat="server" AssociatedControlID="firstName">First Name: </asp:Label></p>
            <p><asp:TextBox runat="server" ID="firstName" Text='<%#: BindItem.FirstName %>' />			
                &nbsp;<asp:RequiredFieldValidator runat="server" ControlToValidate="firstName" ErrorMessage="Please enter a value for First Name" ForeColor="Red" />
			</p>

            <p><asp:Label runat="server" AssociatedControlID="lastName">Last Name: </asp:Label></p>                
			<p><asp:TextBox runat="server" ID="lastName" Text='<%#: BindItem.LastName %>' />
                &nbsp;<asp:RequiredFieldValidator runat="server" ControlToValidate="lastName" ErrorMessage="Please enter a value for Last Name" ForeColor="Red" />
			</p>

            <p><asp:Label runat="server" AssociatedControlID="Age">Age: </asp:Label></p>
            <p><asp:TextBox ID="age" runat="server" Text='<%#: BindItem.Age %>' /></p>
            
            <p><asp:Label runat="server" AssociatedControlID="Email">E-Mail: </asp:Label></p>
            <p><asp:TextBox ID="email" runat="server" Text='<%#: BindItem.EmailAddress %>' /></p>
            
            <p><asp:Label runat="server" AssociatedControlID="Phone">Phone: </asp:Label></p>
            <p><asp:TextBox ID="phone" runat="server" Text='<%#: BindItem.DaytimePhone %>' /></p>
            
            <br />
            <p>
                <asp:Button runat="server" CommandName="Insert" Text="Save" />               
            </p>
         </fieldset>                              
        </InsertItemTemplate>            
    </asp:FormView>
</asp:Content>
