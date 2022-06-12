Imports System.IO
Imports System.Data

Partial Class updateNotation
    Inherits System.Web.UI.Page
    Dim DB105 As New Cls_Data105
    Dim DB106 As New Cls_Data
    Dim CP As New Cls_Panu

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CP.checkLogin()
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

        If Not Page.IsPostBack Then
            Dim vSql As String = "select notation_type_id, notation_type_name "
            vSql += "from notation_type where disable = 0 "

            DB105.SetDropDownList(sel_notiation_type, vSql, "notation_type_name", "notation_type_id", "เลือกประเภท")
        End If

        CP.Analytics()
    End Sub

End Class
