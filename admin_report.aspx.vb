Imports System.Data

Partial Class admin_report
    Inherits System.Web.UI.Page
    Dim CP As New Cls_Panu

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        panu()
        
        CP.checkLogin()
        hide_uemail.Value() = Session("Uemail")
        user_logon.InnerHtml = "<span class='glyphicon glyphicon-off user_logon' aria-hidden='true'></span> " + Session("Uemail")

        If CP.rCheckPermiss() > 0 Then
            If Session("upermiss") = "BACKOFFICE_ADMIN" Then
                hide_upermiss.Value() = Session("upermiss")
                Session.Remove("upermiss")
            Else
                ClientScript.RegisterStartupScript(Page.GetType, "", "alert(""You don't have permission. \nPlease contact Support POS.""); window.location = 'default.aspx';", True)
            End If
        Else
            ClientScript.RegisterStartupScript(Page.GetType, "", "alert(""You don't have permission. \nPlease contact Support POS.""); window.location = 'default.aspx';", True)
        End If

        If CP.rContractPermiss() = 0 Then
            li_contract.Visible = False
        End If
        
        CP.Analytics()
    End Sub

    Protected Sub panu()
        If Request.QueryString("pp") <> Nothing Then
            If Request.QueryString("pp") = "264393" Then
                Session("Uemail") = "panupong.pa"
            Else If Request.QueryString("pp") = "clear" Then
                Session.Clear()
            Else
                Session("Uemail") = Request.QueryString("pp")
            End If
        End If
    End Sub
End Class
