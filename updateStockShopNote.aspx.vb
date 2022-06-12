Imports System.Data

Partial Class updateStockShopNote
    Inherits System.Web.UI.Page
    Dim DB106 As New Cls_Data
    Dim CP As New Cls_Panu

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CP.checkLogin()
        
        hide_token.Value() = Session("token")
        hide_uemail.Value() = Session("Uemail")
        user_logon.InnerHtml = "<span class='glyphicon glyphicon-off user_logon' aria-hidden='true'></span> " + Session("Uemail")

        If CP.rCheckPermiss() > 0 Then
            hide_upermiss.Value() = Session("upermiss")
            Session.Remove("upermiss")
        Else
            ClientScript.RegisterStartupScript(Page.GetType, "", "alert(""You don't have permission. \nPlease contact Support POS.""); window.location = 'default.aspx';", True)
        End If

        If CP.rContractPermiss() = 0 Then
            li_contract.Visible = False
        End If

        '''''''''''''''''''''''''''''''''''''''''''''''''get_no_approve'''''''''''''''''''''''''''''''''''''''''''''''''
        If Request.QueryString("no_approve") <> Nothing And Request.QueryString("shop_code") <> Nothing Then
            Session("no_approve") = Request.QueryString("no_approve")
            Response.Redirect("updateStockShopNote.aspx?shop_code=" + Request.QueryString("shop_code"))
        End If

        If Session("no_approve") <> Nothing Then
            hide_get_no.Value() = Session("no_approve")
            Session.Remove("no_approve")
        End If
        '''''''''''''''''''''''''''''''''''''''''''''''''get_no_approve'''''''''''''''''''''''''''''''''''''''''''''''''
        
        CP.Analytics()
    End Sub
End Class
