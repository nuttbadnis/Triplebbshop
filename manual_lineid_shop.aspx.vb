Partial Class manual_lineid_shop
    Inherits System.Web.UI.Page
    Dim CP As New Cls_Panu

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CP.Analytics()
        ' Response.Redirect("~/file/manual_lineid_shop.pdf")

        iframe_file.Attributes("src") = "file/manual_lineid_shop.pdf"
    End Sub
End Class
