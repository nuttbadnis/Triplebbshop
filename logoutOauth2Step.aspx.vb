Partial Class logoutOauth2Step
    Inherits System.Web.UI.Page
    Dim CP As New Cls_Panu

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CP.Analytics()

        Session().Clear()
        Response.Redirect("https://api.jasmine.com/authen1/jaslogout-page")
    End Sub
End Class
