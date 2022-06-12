Partial Class openfile
    Inherits System.Web.UI.Page
    Dim CP As New Cls_Panu

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CP.checkLogin()

        If Request.QueryString("file") = Nothing Then
            Response.Write("not file!!")
        Else If Request.QueryString("path") = Nothing Then
            Response.Write("not path!!")
        Else
            iframe_file.Attributes("src") = "openfile_iframe.aspx?file=" + Request.QueryString("file") + "&path=" + Request.QueryString("path")
        End If
        
        ' CP.Analytics()
    End Sub
End Class
