
Public Class Logout
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Customer") <> "" Then
            Session.Clear()
            Response.Redirect("Default.aspx")
        End If
    End Sub

End Class