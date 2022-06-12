
Partial Class app_download
    Inherits System.Web.UI.Page
    Dim CP As New Cls_Panu

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CP.AnalyticsMemberRPT()
    End Sub

    Sub Load_Excel(ByVal Source As Object, ByVal E As EventArgs)
        Response.Redirect("app_xport_acc_dont.aspx?cluster=" + hide_cluster.Value)
    End Sub

End Class