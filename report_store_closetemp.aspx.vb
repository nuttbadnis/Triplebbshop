
Partial Class report_store_closetemp
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Redirect("~/covid_report.aspx")
    End Sub
End Class