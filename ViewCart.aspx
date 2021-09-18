<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Layout.Master" CodeBehind="ViewCart.aspx.vb" Inherits="CIS4250Fall2020OnlineStore.ViewCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
<!-- Cart Items - start -->
        <form action="#">

            <div class="cart-items-wrap">
                <table class="cart-items">
                    <thead>
                    <tr>
                        <td class="cart-image">Photo</td>
                        <td class="cart-ttl">Products</td>
                        <td class="cart-price">Price</td>
                        <td class="cart-quantity">Quantity</td>
                        <td class="cart-summ">Summ</td>
                        <td class="cart-del">&nbsp;</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="cart-image">
                            <a href="product.html">
                                <img src="http://placehold.it/61x80" alt="Similique delectus totam">
                            </a>
                        </td>
                        <td class="cart-ttl">
                            <a href="product.html">Similique delectus totam</a>
                            <p>Color: Red</p>
                            <p>Size: XS</p>
                        </td>
                        <td class="cart-price">
                            <b>$220</b>
                        </td>
                        <td class="cart-quantity">
                            <p class="cart-qnt">
                                <input value="1" type="text">
                                <a href="#" class="cart-plus"><i class="fa fa-angle-up"></i></a>
                                <a href="#" class="cart-minus"><i class="fa fa-angle-down"></i></a>
                            </p>
                        </td>
                        <td class="cart-summ">
                            <b>$220</b>
                            <p class="cart-forone">unit price <b>$220</b></p>
                        </td>
                        <td class="cart-del">
                            <a href="#" class="cart-remove"></a>
                        </td>
                    </tr>
                    <tr>
                        <td class="cart-image">
                            <a href="product.html">
                                <img src="http://placehold.it/69x80" alt="Eveniet nobis minus">
                            </a>
                        </td>
                        <td class="cart-ttl">
                            <a href="product.html">Eveniet nobis minus</a>
                        </td>
                        <td class="cart-price">
                            <b>$150</b>
                        </td>
                        <td class="cart-quantity">
                            <p class="cart-qnt">
                                <input value="1" type="text">
                                <a href="#" class="cart-plus"><i class="fa fa-angle-up"></i></a>
                                <a href="#" class="cart-minus"><i class="fa fa-angle-down"></i></a>
                            </p>
                        </td>
                        <td class="cart-summ">
                            <b>$150</b>
                            <p class="cart-forone">unit price <b>$150</b></p>
                        </td>
                        <td class="cart-del">
                            <a href="#" class="cart-remove"></a>
                        </td>
                    </tr>
                    <tr>
                        <td class="cart-image">
                            <a href="product.html">
                                <img src="http://placehold.it/96x80" alt="Quod soluta corrupti">
                            </a>
                        </td>
                        <td class="cart-ttl">
                            <a href="product.html">Quod soluta corrupti</a>
                        </td>
                        <td class="cart-price">
                            <b>$195</b>
                        </td>
                        <td class="cart-quantity">
                            <p class="cart-qnt">
                                <input value="1" type="text">
                                <a href="#" class="cart-plus"><i class="fa fa-angle-up"></i></a>
                                <a href="#" class="cart-minus"><i class="fa fa-angle-down"></i></a>
                            </p>
                        </td>
                        <td class="cart-summ">
                            <b>$195</b>
                            <p class="cart-forone">unit price <b>$195</b></p>
                        </td>
                        <td class="cart-del">
                            <a href="#" class="cart-remove"></a>
                        </td>
                    </tr>
                    <tr>
                        <td class="cart-image">
                            <a href="product.html">
                                <img src="http://placehold.it/67x80" alt="Perferendis recusandae">
                            </a>
                        </td>
                        <td class="cart-ttl">
                            <a href="product.html">Perferendis recusandae</a>
                            <p>Color: Blue</p>
                            <p>Size: XS</p>
                        </td>
                        <td class="cart-price">
                            <b>$250</b>
                        </td>
                        <td class="cart-quantity">
                            <p class="cart-qnt">
                                <input value="1" type="text">
                                <a href="#" class="cart-plus"><i class="fa fa-angle-up"></i></a>
                                <a href="#" class="cart-minus"><i class="fa fa-angle-down"></i></a>
                            </p>
                        </td>
                        <td class="cart-summ">
                            <b>$250</b>
                            <p class="cart-forone">unit price <b>$250</b></p>
                        </td>
                        <td class="cart-del">
                            <a href="#" class="cart-remove"></a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <ul class="cart-total">
                <li class="cart-summ">TOTAL: <b>$815</b></li>
            </ul>
            <div class="cart-submit">
                <div class="cart-coupon">
                    <input placeholder="your coupon" type="text">
                    <a class="cart-coupon-btn" href="#"><img src="img/ok.png" alt="your coupon"></a>
                </div>
                <a href="#" class="cart-submit-btn">Checkout</a>
                <a href="#" class="cart-clear">Clear cart</a>
            </div>
        </form>
        <!-- Cart Items - end -->
        <asp:SqlDataSource ID="SqlDSCart" runat="server" 
        DataSourceMode="DataSet"
        ConnectionString="<%$ ConnectionStrings:ConnectionStringOnlineStore %>" 
        SelectCommand=""
        DeleteCommand="DELETE FROM [Cart] WHERE ([CartNo] = @CartNo AND [ProductNo] = @ProductNo)"
        UpdateCommand="UPDATE [Cart] SET [Quantity] = @Quantity WHERE ([CartNo] = @CartNo AND [ProductNo] = @ProductNo)">
        </asp:SqlDataSource>
        <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDSCart" AllowPaging="True" PageSize="3" DataKeyNames="CartNo,ProductNo"
            AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" 
            EmptyDataText="There are no product in the cart.">
            <Columns>
                <asp:BoundField DataField="ProductNo" HeaderText="Product No" InsertVisible="False" ReadOnly="true"
                    SortExpression="ProductNo" />
                <asp:BoundField DataField="ProductName" HeaderText="Product Name" InsertVisible="False" ReadOnly="true"
                    SortExpression="ProductName" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                    SortExpression="Quantity" />

                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" InsertVisible="False" ReadOnly="true" />
            </Columns>
        </asp:GridView>
</asp:Content>
