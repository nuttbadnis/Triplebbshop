Imports System.Data

Partial Class report_premium_receive_shop
    Inherits System.Web.UI.Page
    Dim CP As New Cls_Panu

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
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
