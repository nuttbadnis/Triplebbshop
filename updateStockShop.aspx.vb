Imports System.Data

Partial Class updateStockShop
    Inherits System.Web.UI.Page
    Dim CP As New Cls_Panu
    Dim DB105 As New Cls_Data105
    Dim DB106 As New Cls_Data

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
        
        CP.Analytics()
    End Sub

    Sub Submit_ShopStock(ByVal Source As Object, ByVal E As EventArgs)
        SaveData()
    End Sub

    Private Sub SaveData()
        Dim upermiss As String = hide_upermiss.Value
        Dim uemail As String = hide_uemail.Value

        Dim no_shopStock As String = hide_no_shopStock.Value
        Dim no_approve As String = hide_no_approve.Value
        Dim shop_code As String = Request.QueryString("shop_code")
        Dim follow_id As String = hide_follow_id.Value

        Dim approve_status As Integer = 0

        If follow_id <> Nothing And follow_id <> "" Then
            approve_status = 3
        End If

        Dim shop_name As String = CP.rReplaceQuote(txt_shop_name.Value)
        Dim shop_tel As String = CP.rReplaceQuote(txt_tel.Value)
        Dim shop_fax As String = CP.rReplaceQuote(txt_fax.Value)
        Dim shop_location As String = CP.rReplaceQuote(txtar_location.Value)
        Dim shop_address As String = CP.rReplaceQuote(txtar_address.Value)
        Dim shop_keyword As String = CP.rReplaceQuote(txtar_keyword.Value)
        Dim shop_comment As String = CP.rReplaceQuote(txtar_comment.Value)
        Dim shop_lat As String = CP.rReplaceQuote(txt_lat.Value)
        Dim shop_lng As String = CP.rReplaceQuote(txt_lng.Value)
        shop_lat = shop_lat.Trim()
        shop_lng = shop_lng.Trim()

        Dim line_id As String = CP.rReplaceQuote(txt_line_id.Value)

        Dim storeKiosType_id As Integer = hide_type.Value
        Dim province_code As Integer = hide_province.Value
        Dim amphur_code As String = hide_district.Value
        Dim storeplacetype_id As Integer = hide_place.Value
        Dim shop_temp As Integer = 0
        Dim flag_promote As Integer = 0
        Dim premium_receive_shop As Integer = 0

        If chk_temp1.Checked Then
            shop_temp = 1
        ElseIf chk_temp2.Checked Then
            shop_temp = 2
        End If

        If chk_promote.Checked Then
            flag_promote = 1
        End If

        If chk_premium_receive_shop.Checked Then
            premium_receive_shop = 1
        End If

        Dim vSqlIn As String = ""

        vSqlIn += "if exists (select * from approve_shopstock where no_shopStock = '" & no_shopStock & "' and approve_status = 0) "
        vSqlIn += "begin "
        vSqlIn += "     update approve_shopStock set "
        vSqlIn += "     shop_name='" & shop_name & "',shop_location='" & shop_location & "',"
        vSqlIn += "     shop_address='" & shop_address & "',shop_comment='" & shop_comment & "',"
        vSqlIn += "     shop_keyword='" & shop_keyword & "',line_id='" & line_id & "',premium_receive_shop='" & premium_receive_shop & "',"
        vSqlIn += "     province_code='" & province_code & "',amphur_code='" & amphur_code & "',"
        vSqlIn += "     storeplacetype_id='" & storeplacetype_id & "',storeKiosType_id='" & storeKiosType_id & "',"
        vSqlIn += "     telephone='" & shop_tel & "',fax='" & shop_fax & "',"
        vSqlIn += "     latitude='" & shop_lat & "',longitude='" & shop_lng & "',"
        vSqlIn += "     shop_temp='" & shop_temp & "',flag_promote='" & flag_promote & "',"

        ''''''''''''''''''''''''''''''''''' ADMIN save and autoapprove step1(approve)
        If upermiss = "BACKOFFICE_ADMIN" Then
            vSqlIn += "approve_by='" & uemail & "',approve_date=getdate(), approve_status=9, admin_override=1 "
        ''''''''''''''''''''''''''''''''''' ADMIN save and autoapprove step1(approve)
        Else
            ' vSqlIn += "update_by='" & uemail & "',update_date=getdate() "
            vSqlIn += "update_by='" & uemail & "',update_date=getdate(), follow_id='" & follow_id & "', approve_status='" & approve_status & "' "
        End If
        vSqlIn += "     where shop_code = '" & shop_code & "' and approve_status = 0 "

        vSqlIn += "end "
        vSqlIn += "else "
        vSqlIn += "begin "
        vSqlIn += "     insert into approve_shopStock ("
        vSqlIn += "     no_shopStock,shop_code,shop_name,shop_location,shop_address,shop_comment,"
        vSqlIn += "     province_code,amphur_code,storeplacetype_id,storeKiosType_id,"
        vSqlIn += "     telephone,fax,latitude,longitude,shop_temp,flag_promote,shop_keyword,"
        vSqlIn += "     line_id,premium_receive_shop,follow_id,approve_status,update_by,update_date) "
        vSqlIn += "     values( "
        vSqlIn += "     '" & no_shopStock & "', '" & shop_code & "', '" & shop_name & "', '" & shop_location & "' , '" & shop_address & "', '"& shop_comment & "', "
        vSqlIn += "     '" & province_code & "', '" & amphur_code & "', '" & storeplacetype_id & "', '" & storeKiosType_id & "', "
        vSqlIn += "     '" & shop_tel & "', '" & shop_fax & "', '" & shop_lat & "', '" & shop_lng & "', '" & shop_temp & "', '" & flag_promote & "', '" & shop_keyword & "', "
        vSqlIn += "     '" & line_id & "', '" & premium_receive_shop & "', '" & follow_id & "', '" & approve_status & "', '" & uemail & "', getdate()) "

        vSqlIn += "     insert into approve_log_shopStock ( "
        vSqlIn += "     no_approve,no_shopStock,shop_code,"
        vSqlIn += "     shop_name,shop_location,shop_address,shop_comment,"
        vSqlIn += "     province_code,amphur_code,storeplacetype_id,storeKiosType_id,"
        vSqlIn += "     telephone,fax,latitude,longitude,shop_temp,flag_promote,shop_keyword,"
        vSqlIn += "     line_id,premium_receive_shop) "
        vSqlIn += "     select "
        vSqlIn += "     @@IDENTITY,no,shop_code,"
        vSqlIn += "     shop_name,shop_location,shop_address,shop_comment,"
        vSqlIn += "     province_code,amphur_code,storeplacetype_id,storeKiosType_id,"
        vSqlIn += "     telephone,fax,latitude,longitude,shop_temp,flag_promote,shop_keyword,"
        vSqlIn += "     line_id,premium_receive_shop "
        vSqlIn += "     from shopstock "
        vSqlIn += "     where no = '" & no_shopStock & "' "
        vSqlIn += "end "

        ''''''''''''''''''''''''''''''''''' ADMIN save and autoapprove step2(save)
        If upermiss = "BACKOFFICE_ADMIN" Then
            vSqlIn += "update shopStock set "
            vSqlIn += "just_open = 0, update_by = t2.update_by, update_date = t2.update_date, "
            vSqlIn += "shop_name = t2.shop_name, shop_location = t2.shop_location, "
            vSqlIn += "shop_address = t2.shop_address, shop_comment = t2.shop_comment, "
            vSqlIn += "province_code = t2.province_code, amphur_code = t2.amphur_code, "
            vSqlIn += "storeplacetype_id = t2.storeplacetype_id, storeKiosType_id = t2.storeKiosType_id, "
            vSqlIn += "telephone = t2.telephone, fax = t2.fax, latitude = t2.latitude, longitude = t2.longitude, "
            vSqlIn += "shop_temp = t2.shop_temp, flag_promote = t2.flag_promote, shop_keyword = t2.shop_keyword, "
            vSqlIn += "line_id = t2.line_id, premium_receive_shop = t2.premium_receive_shop "
            vSqlIn += "from shopStock t1 "
            vSqlIn += "inner join approve_shopStock t2 on t1.no = t2.no_shopStock and t2.no_approve = '" & no_approve & "' "
            vSqlIn += "where t1.no = '" & no_shopStock & "' "
        End If
        ''''''''''''''''''''''''''''''''''' ADMIN save and autoapprove step2(save)

        ' MyMessage.InnerHtml = vSqlIn

        If DB105.ExecuteNonQuery(vSqlIn).ToString() >= 1 Then
            ''''''''''''''''''''''''''''''''''' ADMIN save and autoapprove step3(sent mail prove)
            If upermiss = "BACKOFFICE_ADMIN" Then
                CP.SendMailActionProve(1,no_approve)
            ''''''''''''''''''''''''''''''''''' ADMIN save and autoapprove step3(sent mail prove)
            Else
                CP.SendMailAdmin(1,shop_code)
            End If

            Response.Redirect("admin_approval.aspx")
        Else
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alertscript", "alert('failed! ติดต่อ support pos');", True)
        End If
        
    End Sub
End Class
