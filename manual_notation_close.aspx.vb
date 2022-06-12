Partial Class manual_notation_close
    Inherits System.Web.UI.Page
    Dim CP As New Cls_Panu

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CP.Analytics()
        ' Response.Redirect("~/file/manual_notation_close.pdf")

        iframe_file.Attributes("src") = "file/manual_notation_close.pdf"

    End Sub
End Class
