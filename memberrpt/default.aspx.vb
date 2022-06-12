Partial Class _default
    Inherits System.Web.UI.Page
    Dim CP As New Cls_Panu

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Redirect("app_a10.aspx")
    End Sub
End Class
