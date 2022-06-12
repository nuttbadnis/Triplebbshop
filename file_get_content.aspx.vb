Imports System.Net

Partial Class file_get_content
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim xLink As String = Request.QueryString("link")
        ' Dim sourceString As String = New System.Net.WebClient().DownloadString(xLink)

    	Dim client As WebClient = New WebClient()
    	client.Encoding = System.Text.Encoding.UTF8
    	
        Dim sourceString As String = client.DownloadString(xLink)

        Response.Write(sourceString)
    End Sub
End Class
