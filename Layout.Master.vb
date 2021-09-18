Imports System.Data
Imports System.Data.SqlClient
Public Class Layout
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Customer") <> "" Then
            hlLogin.Visible = False
            hlLogout.Visible = True
            lblCustomer.Text = Session("Customer")
            lblCustomer.Visible = True
        End If
    End Sub

    Private Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        If tbSearch.Text <> "" Then
            Dim strURL As String = ""

            ' check the number of words in the textbox
            Dim strCheck As String = " "
            If Not Trim(tbSearch.Text).Contains(strCheck) Then

                ' check if there is a ProductID match in the Product table 
                Dim strConn As String = System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionStringOnlineStore").ConnectionString
                Dim connProduct As SqlConnection
                Dim cmdProduct As SqlCommand
                Dim drProduct As SqlDataReader
                Dim strSQL As String = "Select * from Product Where ProductID = '" & Trim(tbSearch.Text) & "'"
                connProduct = New SqlConnection(strConn)
                cmdProduct = New SqlCommand(strSQL, connProduct)
                connProduct.Open()
                drProduct = cmdProduct.ExecuteReader(CommandBehavior.CloseConnection)
                strURL = "ProductDetail.aspx?SearchString=" & Trim(tbSearch.Text)
                Response.Redirect(strURL)
                ' all the database objects delcared and instantiated
                ' Dim strSQL As String = "Select * from Product Where ProductID = '" & Trim(tbSearch.Text) & "'"
                ' If there is a match, redirect to ProductDetail.aspx?...
                ' assign a dynamic value for strURL
                ' Response.Redirect(strURL)
            Else
                strURL = "Category.aspx?SearchString=" & Trim(tbSearch.Text)
                Response.Redirect(strURL)
            End If
        End If
    End Sub
End Class