Partial Class api_doc
    Inherits System.Web.UI.Page
    Dim CP As New Cls_Panu

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CP.Analytics()
        ' Response.Redirect("~/api_3bb_shop_vas_v3.pdf")

        iframe_file.Attributes("src") = "api_3bb_shop_vas_v3.pdf"
        
    End Sub
End Class
