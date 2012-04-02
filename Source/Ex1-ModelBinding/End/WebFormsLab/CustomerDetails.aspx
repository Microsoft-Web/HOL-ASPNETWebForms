<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerDetails.aspx.cs" Inherits="WebFormsLab.CustomerDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h3>Customer Details</h3>
    
    <asp:FormView runat="server" ID="fvDataBinding" DataKeyNames="Id" ItemType="WebFormsLab.Model.Customer" 
        DefaultMode="ReadOnly" InsertMethod="SaveCustomer" UpdateMethod="UpdateCustomer" SelectMethod="SelectCustomer"
       >
     <ItemTemplate>
        <fieldset>
            <ul>
                <li><b><asp:Label runat="server" AssociatedControlID="customerFirstName">First Name:</asp:Label></b></li>
                <li><asp:Label runat="server" ID="customerFirstName" Text='<%#: Item.FirstName %>' /></li>
                <li><b><asp:Label runat="server" AssociatedControlID="customerLastName">Last Name:</asp:Label></b></li>
                <li><asp:Label runat="server" ID="customerLastName" Text='<%#: Item.LastName %>' /></li>
                <li><b><asp:Label runat="server" AssociatedControlID="customerAge">Age:</asp:Label></b></li>
                <li><asp:Label runat="server" ID="customerAge" Text='<%#: Item.Age %>' /></li>
                <li><b><asp:Label runat="server" AssociatedControlID="customerEmail">E-mail:</asp:Label></b></li>
                <li><asp:Label runat="server" ID="customerEmail" Text='<%#: Item.EmailAddress %>' /></li>
                <li><b><asp:Label runat="server" AssociatedControlID="customerPhone">Phone:</asp:Label></b></li>
                <li><asp:Label runat="server" ID="customerPhone" Text='<%#: Item.DaytimePhone %>' /></li>
            </ul>
            <br />
            <ul>
                <li>
                    <asp:Button ID="Button1" runat="server" CommandName="Edit" Text="Edit" />&nbsp;
                    <asp:HyperLink NavigateUrl="~/Customers.aspx" Text="Back" runat="server" />
                </li>
            </ul>
        </fieldset>
     </ItemTemplate>

     <EditItemTemplate>
        <fieldset>
            <ul>
                <li><asp:Label runat="server" AssociatedControlID="firstName">First Name: </asp:Label></li>
                <li><asp:TextBox runat="server" ID="firstName" Text='<%#: BindItem.FirstName %>' />
					&nbsp;<asp:RequiredFieldValidator runat="server" ControlToValidate="firstName" ErrorMessage="Please enter a value for First Name" ForeColor="Red" />
				</li>
            </ul>
            <ul>
                <li><asp:Label runat="server" AssociatedControlID="lastName">Last Name: </asp:Label></li>
                <li><asp:TextBox runat="server" ID="lastName" Text='<%#: BindItem.LastName %>' />
                    &nbsp;<asp:RequiredFieldValidator runat="server" ControlToValidate="lastName" ErrorMessage="Please enter a value for Last Name" ForeColor="Red" />
				</li>
            </ul>
            <ul>
                <li><asp:Label runat="server" AssociatedControlID="Age">Age: </asp:Label></li>
                <li><asp:TextBox ID="age" runat="server" Text='<%#: BindItem.Age %>' /></li>
            </ul>
            <ul>
                <li><asp:Label runat="server" AssociatedControlID="Email">E-Mail: </asp:Label></li>
                <li><asp:TextBox ID="email" runat="server" Text='<%#: BindItem.EmailAddress %>' /></li>
            </ul>
            <ul>
                <li><asp:Label runat="server" AssociatedControlID="Phone">Phone: </asp:Label></li>
                <li><asp:TextBox ID="phone" runat="server" Text='<%#: BindItem.DaytimePhone %>' /></li>
            </ul>
            <br />
            <ul><li>
                <asp:Button runat="server" CommandName="Update" Text="Save" />
                <asp:Button runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="false" />
            </li></ul>
         </fieldset>             
     </EditItemTemplate>
     <InsertItemTemplate>        
        <fieldset>
            <ul>
                <li><asp:Label runat="server" AssociatedControlID="firstName">First Name: </asp:Label></li>
                <li><asp:TextBox runat="server" ID="firstName" Text='<%#: BindItem.FirstName %>' />			
                    &nbsp;<asp:RequiredFieldValidator runat="server" ControlToValidate="firstName" ErrorMessage="Please enter a value for First Name" ForeColor="Red" />
				</li>
            </ul>
            <ul>
                <li><asp:Label runat="server" AssociatedControlID="lastName">Last Name: </asp:Label></li>                
				<li><asp:TextBox runat="server" ID="lastName" Text='<%#: BindItem.LastName %>' />
                    &nbsp;<asp:RequiredFieldValidator runat="server" ControlToValidate="lastName" ErrorMessage="Please enter a value for Last Name" ForeColor="Red" />
				</li>
            </ul>
            <ul>
                <li><asp:Label runat="server" AssociatedControlID="Age">Age: </asp:Label></li>
                <li><asp:TextBox ID="age" runat="server" Text='<%#: BindItem.Age %>' /></li>
            </ul>
            <ul>
                <li><asp:Label runat="server" AssociatedControlID="Email">E-Mail: </asp:Label></li>
                <li><asp:TextBox ID="email" runat="server" Text='<%#: BindItem.EmailAddress %>' /></li>
            </ul>
            <ul>
                <li><asp:Label runat="server" AssociatedControlID="Phone">Phone: </asp:Label></li>
                <li><asp:TextBox ID="phone" runat="server" Text='<%#: BindItem.DaytimePhone %>' /></li>
            </ul>
            <br />
            <ul><li>
                <asp:Button runat="server" CommandName="Insert" Text="Save" />               
            </li></ul>
         </fieldset>                              
        </InsertItemTemplate>            
    </asp:FormView>    
</asp:Content>
