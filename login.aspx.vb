Partial Class login
    Inherits System.Web.UI.Page
    Dim CP As New Cls_Panu

    Dim oauth_client_id as String = System.Configuration.ConfigurationSettings.AppSettings("oauth_client_id")
    Dim oauth_client_Secret as String = System.Configuration.ConfigurationSettings.AppSettings("oauth_client_Secret")
    Dim oauth_redirect_uri as String = System.Configuration.ConfigurationSettings.AppSettings("oauth_redirect_uri")

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CP.Analytics()

        If Session("Uemail") Is Nothing Then
        	If Request.UrlReferrer IsNot Nothing Then
        		Session("current_url") = Request.UrlReferrer.AbsoluteUri()
        	End If

           	Response.Redirect("https://api.jasmine.com/authen1/oauth/authorize?response_type=code&client_id=" + oauth_client_id + "&redirect_uri=" + oauth_redirect_uri)
            ClientScript.RegisterStartupScript(Page.GetType, "open", "window.close()", True)

        Else
        ' If Session("Uemail") IsNot Nothing Then
            Response.Redirect("~/default.aspx")
        End If
    End Sub
End Class
