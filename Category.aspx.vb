Imports System.Data
Imports System.Data.SqlClient
Public Class Category
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("SearchString") <> "" Then
            Dim strConn As String = System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionStringOnlineStore").ConnectionString
            Dim connProduct As SqlConnection
            Dim cmdProduct As SqlCommand
            Dim drProduct As SqlDataReader
            Dim strSQL As String = "Select * from Product Where productname LIKE" & CInt(Request.QueryString("ProductName"))
            Dim lblPrice As Label = CType(rpProductList.FindControl("lblPrice"), Label)
            lblProductList.Text = "Product list for " + Request.QueryString("SubCategoryName")
            connProduct = New SqlConnection(strConn)
            cmdProduct = New SqlCommand(strSQL, connProduct)
            connProduct.Open()
            drProduct = cmdProduct.ExecuteReader(CommandBehavior.CloseConnection)
            ' all the database objects delcared and instantiated
            ' Dim strSQL As String = "Select * from Product Where ProductName LIKE

            If drProduct.Read() Then
                lblPrice.Text = drProduct.Item("UnitPrice")
            End If
        End If
        If Request.QueryString("MainCategoryID") <> "" Then
            SqlDSSubCategory.SelectCommand = "Select * From Category Where parent = " & CInt(Request.QueryString("MainCategoryID"))
            lblMainCategoryName.Text = Request.QueryString("MainCategoryName")
            lblSubCategoryName.Text = Request.QueryString("SubCategoryName")
            SqlDSProductList.SelectCommand = "Select * From Product Where featuredid = " & CInt(Request.QueryString("MainCategoryID"))
            ' assign selectcommmand to SqlDSProductList for the featured products of the main category
            ' change lblProductList.Text to "Feature Products"
            lblProductList.Text = "Feature Products"
        End If

        If Request.QueryString("SubCategoryID") <> "" Then
            SqlDSProductList.SelectCommand = "Select * From Product Where subcategoryid = " & CInt(Request.QueryString("SubCategoryID"))
            lblProductList.Text = "Product list for " + Request.QueryString("SubCategoryName")
        End If
    End Sub

    Public Function GetWholesalePrice(ByVal OriginalPrice As Decimal) As String
        Dim decWholesalePrice As Decimal = 0.00
        If Session("Customer") <> "" Then
            decWholesalePrice = OriginalPrice * 0.9
        Else
            decWholesalePrice = OriginalPrice
        End If
        Return decWholesalePrice
    End Function

End Class