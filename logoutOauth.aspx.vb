Partial Class logoutOauth
    Inherits System.Web.UI.Page
    Dim CP As New Cls_Panu

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CP.Analytics()
        logout()
        ' logoutOauth2Step()

        ' Session().Clear()
        ' Response.Redirect("https://api.jasmine.com/authen1/jaslogout-page")
    End Sub

    Protected Sub logout()
        Session().Clear()
        'Response.Redirect("~/default.aspx")
        Response.Redirect("https://api.jasmine.com/authen1/jaslogout-page")

        Dim vScript As String
        vScript += "var wd=window.open('https://api.jasmine.com', 'CloseWindowScript', 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no'); "
        vScript += "setTimeout(function() { "
        vScript += "    wd.close(); "
        vScript += "    window.location='default.aspx'; "
        vScript += "}, 3000); "

        'ClientScript.RegisterStartupScript(Page.GetType, "", vScript, true)
    End Sub

    Protected Sub logoutOauth2Step()
        Dim vUrl As String = HttpContext.Current.Request.Url.AbsoluteUri()

        If vUrl.ToLower().Contains("triplet") Then _

            vUrl = vUrl.Replace("posbcs.triplet.co.th", "10.11.5.104")
            vUrl = vUrl.Replace("logoutOauth", "logoutOauth2Step")

            Session().Clear()
            HttpContext.Current.Response.Redirect(vUrl)

        Else If vUrl.ToLower().Contains("10.11.5.104") And Not _
        (vUrl.ToLower().Contains("report_map.aspx") Or vUrl.ToLower().Contains("updatestockshop.aspx")) Then

            vUrl = vUrl.Replace("10.11.5.104", "posbcs.triplet.co.th")
        
            Session().Clear()
            HttpContext.Current.Response.Redirect(vUrl)
        End If
    End Sub
End Class
