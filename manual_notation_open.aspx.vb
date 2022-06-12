Partial Class manual_notation_open
    Inherits System.Web.UI.Page
    Dim CP As New Cls_Panu

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CP.Analytics()
        ' Response.Redirect("~/file/manual_notation_open.pdf")

        iframe_file.Attributes("src") = "file/manual_notation_open.pdf"
    End Sub
End Class
