Partial Class manual_note
    Inherits System.Web.UI.Page
    Dim CP As New Cls_Panu

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CP.Analytics()
        ' Response.Redirect("~/file/manual_note.pdf")

        iframe_file.Attributes("src") = "file/manual_note.pdf"
    End Sub
End Class
