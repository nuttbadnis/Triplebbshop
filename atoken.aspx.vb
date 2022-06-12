
Partial Class atoken
    Inherits System.Web.UI.Page
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("Uemail") = "panupong.pa"
        Session("token") = "c019c6a8-782c-444b-b352-58674c3f3e0c"

        Response.Write("Uemail = " & Session("Uemail"))
        Response.Write("<br> ")
        Response.Write("token = " & Session("token"))
    End Sub
End Class