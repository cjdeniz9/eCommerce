<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Layout.Master" CodeBehind="ViewCart1.aspx.vb" Inherits="CIS4250Fall2020OnlineStore.ViewCart1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div style="float: right; margin: 0 30px 5px 0;">
        <asp:Button ID="btnEmptyCart" runat="server" Text="Empty the Cart" OnClick="btnEmptyCart_Click"/>
    </div>   
    <asp:SqlDataSource ID="sqlDSCart1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringOnlineStore %>"> 
    </asp:SqlDataSource>

    <asp:ListView ID="lvCart" runat="server" DataSourceID="sqlDSCart1"
            OnItemCommand="lvCart_OnItemCommand" CellPadding="3" DataKeyField="CartNo"
            CellSpacing="0" RepeatColumns="1" DataKeyNames="ID">
        <LayoutTemplate>              
            <div style="float: right; margin: 0 30px 5px 0;">
                <asp:Label ID="lblPage" runat="server" Text="" Font-Size="14px"></asp:Label>
            </div><br />
            <div class="table-responsive cart_info">
            <table class="table table-condensed">
                <thead>
                    <tr class="cart_menu" style="background-color: cornflowerblue">
					    <td class="image">Item</td>
					    <td class="description">Description</td>
					    <td class="price">Price</td>
					    <td class="quantity">Quantity</td>
					    <td class="total">Subtotal</td>
					    <td></td>
                    </tr>
                </thead>
                <tbody>
                    <asp:PlaceHolder runat="server" id="itemPlaceholder"></asp:PlaceHolder>
                </tbody>
            </table> 
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
				<td class="cart_product">
					<a href=""><img src="img/products/<%# Trim(Eval("ProductNo")) %>.jpg" alt=""></a>
				</td>
				<td class="cart_description">
					<h4><a href=""><%# Trim(Eval("ProductName")) %></a></h4>
					<p>Web ID: <%# Eval("ProductNo") %></p>
				</td>
				<td class="cart_price">
					<p>$<%# Eval("Price") %></p>
				</td>
				<td class="cart_quantity">
                    <asp:TextBox ID="tbQuantity" Text='<%# Eval("Quantity")%>' Width="50px" CssClass="" runat="server"></asp:TextBox>
                    <asp:LinkButton runat="server" ID="lbUpdate" Text='Update'
                        CommandName="cmdUpdate" CommandArgument='<%# Eval("ProductNo")%>' />
                    <asp:LinkButton runat="server" ID="lbDelete" Text='Delete'
                        CommandName="cmdDelete" CommandArgument='<%# Eval("ProductNo")%>' />
				</td>
				<td class="cart_total">
                    <p class="cart_total_price">$<asp:Label ID="lblSubTotal" runat="server" Text='<%# Eval("Price") * Eval("Quantity")%>'></asp:Label></p>
				</td>
				<td class="cart_delete">
					
				</td>
                </tr> 
        </ItemTemplate>
    </asp:ListView>
    <div style="padding-right: 500px;text-align: right;">
    <p>Total <asp:Label ID="lblCartTotal" runat="server" Text=""></asp:Label></p>
        </div>

    <div style="padding: 8px;width: 100%;text-align: center;">
        <div style="display: inline-block; margin-top: 5px">
            <asp:Button runat="server" Text="&laquo;" id="show_prev" CssClass="show_prevx"></asp:Button>
            <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lvCart" PageSize="3">
                <Fields>        
                <asp:NumericPagerField NextPageText='&raquo;' PreviousPageText='&laquo;' ButtonCount="5" 
                    ButtonType="Button" NextPreviousButtonCssClass="next_prevx" NumericButtonCssClass="numericx" 
                    CurrentPageLabelCssClass="currentx" RenderNonBreakingSpacesBetweenControls="False" />
                </Fields>
            </asp:DataPager>
            <asp:Button runat="server" Text="&raquo;" id="show_next" CssClass="show_nextx"></asp:Button>
        </div>
    </div> 
</asp:Content>
