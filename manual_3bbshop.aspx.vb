Partial Class manual_3bbshop
    Inherits System.Web.UI.Page
    Dim CP As New Cls_Panu

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CP.Analytics()

        iframe_file.Attributes("src") = "file/manual_3bbshop.pdf"
    End Sub
End Class
