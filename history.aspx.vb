Imports System.Data

Partial Class history
    Inherits System.Web.UI.Page
    Dim DB106 As New Cls_Data
    Dim CP As New Cls_Panu

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'CP.checkLogin()
        'hide_uemail.Value() = Session("Uemail")

        'If CP.rCheckPermiss() > 0 Then
            'hide_upermiss.Value() = Session("upermiss")
            'Session.Remove("upermiss")
        'Else
            'ClientScript.RegisterStartupScript(Page.GetType, "", "alert(""You don't have permission. \nPlease contact Support POS.""); window.location = 'default.aspx';", True)
        'End If

        'user_logon.InnerHtml = "<span class='glyphicon glyphicon-off user_logon' aria-hidden='true'></span> " + Session("Uemail")


        If Session("Uemail") IsNot Nothing Then

            hide_uemail.Value() = Session("Uemail")
            user_logon.InnerHtml = "<span class='glyphicon glyphicon-off user_logon' aria-hidden='true'></span> " + Session("Uemail")

            If CP.rCheckPermiss() > 0 Then
                hide_upermiss.Value() = Session("upermiss")
                Session.Remove("upermiss")
            End If
        End If

        If CP.rContractPermiss() = 0 Then
            li_contract.Visible = False
        End If

        CP.Analytics()
    End Sub
End Class