Imports System.IO
Imports System.Data

Partial Class updateDisbleShop
    Inherits System.Web.UI.Page
    Dim DB105 As New Cls_Data105
    Dim DB106 As New Cls_Data
    Dim CP As New Cls_Panu

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
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

    Sub Submit_ShopStock(ByVal Source As Object, ByVal E As EventArgs)
        SaveData()
    End Sub

    Private Sub SaveData()
        Dim uemail As String = hide_uemail.Value

        Dim no_shopStock As String = hide_no_shopStock.Value
        Dim shop_code As String = Request.QueryString("shop_code")

        Dim set_dis_3bb_shop As Integer = 0
        Dim set_dis_contract As Integer = 0

        If chk_dis_3bb_shop.Checked Then
            set_dis_3bb_shop = 1
        End If

        If chk_dis_contract.Checked Then
            set_dis_contract = 1
        End If

        Dim vSqlIn As String = ""

        vSqlIn += "update shopStock set "
        vSqlIn += "dis_3bb_shop='" & set_dis_3bb_shop & "', dis_contract='" & set_dis_contract & "' "
        vSqlIn += "where no = '" & no_shopStock & "' "

        vSqlIn += "insert into log_set_disable ("
        vSqlIn += "shop_code, pre_dis_3bb_shop, pre_dis_contract, set_dis_3bb_shop, set_dis_contract, create_by, create_date) "
        vSqlIn += "values( "
        vSqlIn += "'" & shop_code & "', '" & hide_pre_dis_3bb_shop.Value & "', '" & hide_pre_dis_contract.Value & "', '" & set_dis_3bb_shop & "', '" & set_dis_contract & "', "
        vSqlIn += "'" + uemail + "', getdate()) "

        If DB105.ExecuteNonQuery(vSqlIn).ToString() >= 1 Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alertscript", "alert('บันทึกเรียบร้อย');", True)
            ' Response.Redirect("updateDisbleShop.aspx?shop_code=" + shop_code)
        Else
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alertscript", "alert('failed! ติดต่อ support pos');", True)
        End If
        
    End Sub

End Class
