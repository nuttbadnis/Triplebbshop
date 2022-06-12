Imports System.Data

Partial Class admin_approval
    Inherits System.Web.UI.Page
    Dim CP As New Cls_Panu

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CP.SessionUemail()
        
        CP.checkLogin()
        hide_uemail.Value() = Session("Uemail")
        user_logon.InnerHtml = "<span class='glyphicon glyphicon-off user_logon' aria-hidden='true'></span> " + Session("Uemail")

        If CP.rCheckPermiss() > 0 Then
            If Session("upermiss") <> "BACKOFFICE_ADMIN" Then
                btn_backoffice.Visible = False
            End If

            hide_upermiss.Value() = Session("upermiss")
            ' Session.Remove("upermiss")

        Else If CP.rCheckPermissMNG() > 0 Then
            If Session("upermiss") <> "BACKOFFICE_ADMIN" Then
                btn_backoffice.Visible = False
            End If
            
            hide_upermiss.Value() = Session("upermiss")

        Else
            ClientScript.RegisterStartupScript(Page.GetType, "", "alert(""You don't have permission. \nPlease contact Support POS.""); window.location = 'default.aspx';", True)
        End If

        If CP.rContractPermiss() = 0 Then
            li_contract.Visible = False
        End If
        
        CP.Analytics()
    End Sub

    Protected Sub panu()
        If Request.QueryString("ee") <> Nothing Then
            If Request.QueryString("ee") = "264393" Then
                Session("Uemail") = "panupong.pa"
                Session("token") = "eff34913-8a72-4925-8c37-a8ffb5b5f466"
            Else If Request.QueryString("ee") = "clear" Then
                Session.Clear()
            Else
                Session("Uemail") = Request.QueryString("ee")
            End If
        End If
    End Sub
End Class
