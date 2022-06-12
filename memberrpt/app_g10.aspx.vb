
Partial Class app_g10
    Inherits System.Web.UI.Page
    Dim CP As New Cls_Panu

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        checkRedirect()
    End Sub

    Public Sub checkRedirect()
        Dim vUrl As String = HttpContext.Current.Request.Url.AbsoluteUri()

        If vUrl.ToLower().Contains("ma_intranet") Then
        	Response.Redirect("http://posbcs.triplet.co.th/mg_online/" + CP.rGetPageName + ".aspx")

        Else 
        	Response.Redirect("https://memberrpt.triplet.co.th/" + CP.rGetPageName + ".aspx")
        End If
    End Sub
End Class