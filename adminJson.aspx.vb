Imports System.Data
Imports System.Net
Imports System.Net.Mail
Imports System.Net.Mime
Imports System.Net.IPAddress

Partial Class _json
    Inherits System.Web.UI.Page
    Dim DB105 As New Cls_Data105
    Dim CP As New Cls_Panu

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim qrs As String = ""

        If Request.QueryString("qrs") <> Nothing Then
            qrs = Request.QueryString("qrs")
        End If

        If qrs = "pendingProve" Then
            pendingProve()
        End If

        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        If qrs = "getShopDescProve" Then
            getShopDescProve()
        End If

        If qrs = "getShopDescProveLog" Then
            getShopDescProveLog()
        End If

        If qrs = "okProveDesc" Then
            okProveDesc()
        End If

        If qrs = "cancleProveDesc" Then
            cancleProveDesc()
        End If

        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        If qrs = "getShopImgProve" Then
            getShopImgProve()
        End If

        If qrs = "getShopImgProveLog" Then
            getShopImgProveLog()
        End If

        If qrs = "okProveImg" Then
            okProveImg()
        End If

        If qrs = "cancleProveImg" Then
            cancleProveImg()
        End If

        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        If qrs = "getShopDayTimeProve" Then
            getShopDayTimeProve()
        End If

        If qrs = "getShopDayTimeProveLog" Then
            getShopDayTimeProveLog()
        End If

        If qrs = "okProveDayTime" Then
            okProveDayTime()
        End If

        If qrs = "cancleProveDayTime" Then
            cancleProveDayTime()
        End If

        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        If qrs = "getShopNoteProve" Then
            getShopNoteProve()
        End If

        If qrs = "getShopNoteProveLog" Then
            getShopNoteProveLog()
        End If

        If qrs = "okProveNote" Then
            okProveNote()
        End If

        If qrs = "cancleProveNote" Then
            cancleProveNote()
        End If

        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

        If qrs = "loadArea" Then
            loadArea()
        End If

        If qrs = "loadShopType" Then
            loadShopType()
        End If

        If qrs = "loadAllShop" Then
            loadAllShop()
        End If

        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

        If qrs = "getThisDate" Then
            getThisDate()
        End If

        If qrs = "loadApproveStatus" Then
            loadApproveStatus()
        End If

        If qrs = "loadAllShopStockNote" Then
            loadAllShopStockNote()
        End If

        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

        If qrs = "loadAllshopStockNoteURL" Then
            loadAllshopStockNoteURL()
        End If

        If qrs = "newShopStockNoteURL" Then
            newShopStockNoteURL()
        End If

        If qrs = "saveShopStockNoteURL" Then
            saveShopStockNoteURL()
        End If

        If qrs = "removeShopStockNoteURL" Then
            removeShopStockNoteURL()
        End If

    End Sub

    Protected Sub pendingProve_back()
        Dim uemail As String = Request.QueryString("uemail")
        Dim vSql_tmp As String = ""
        Dim vSql As String = ""

        vSql_tmp += "select * from ("
        vSql_tmp += "   select 1 prove_topic, "
        vSql_tmp += "   case approve_status when 0 then 0 else 1 end abc, "
        vSql_tmp += "   no no_approve, no_shopStock, shop_code, approve_status, "
        vSql_tmp += "   update_date, update_by, approve_date, approve_by "
        vSql_tmp += "   from prove_shopStock "

        vSql_tmp += "   union "
        vSql_tmp += "   select 2 prove_topic, "
        vSql_tmp += "   case approve_status when 0 then 0 else 1 end abc, "
        vSql_tmp += "   no no_approve, 0 no_shopStock, shop_code, approve_status, "
        vSql_tmp += "   update_date, update_by, approve_date, approve_by "
        vSql_tmp += "   from prove_shopStock_daytime "

        vSql_tmp += "   union "
        vSql_tmp += "   select 3 prove_topic, "
        vSql_tmp += "   case approve_status when 0 then 0 else 1 end abc, "
        vSql_tmp += "   no no_approve, no_shopStock, shop_code, approve_status, "
        vSql_tmp += "   update_date, update_by, approve_date, approve_by "
        vSql_tmp += "   from prove_shopStock_img "

        vSql_tmp += "   union "
        vSql_tmp += "   select 4 prove_topic, "
        vSql_tmp += "   case approve_status when 0 then 0 else 1 end abc, "
        ''no_shopStock is no_note
        vSql_tmp += "   no no_approve, no_note no_shopStock, shop_code, approve_status, "
        vSql_tmp += "   update_date, update_by, approve_date, approve_by "
        vSql_tmp += "   from prove_shopstock_note "
        vSql_tmp += ") prove_alldata "

        vSql += "if exists (select * from [10.11.5.106].rmsdat01.dbo.m00860 where f02 = '" + uemail + "' and f03 = 'all') "
        vSql += "   " + vSql_tmp
        vSql += "   order by abc, approve_date desc, update_date desc "
        vSql += "else "
        vSql += "   " + vSql_tmp
        vSql += "   inner join (select * from [10.11.5.106].rmsdat01.dbo.m00860 where f02 = '" + uemail + "') m86 "
        vSql += "   on m86.f03 = prove_alldata.shop_code "
        vSql += "   order by abc, approve_date desc, update_date desc "

        'Response.Write(vSql)
        dim vFields = New ArrayList
        vFields.Add("no_shopStock")
        vFields.Add("no_approve")
        vFields.Add("shop_code")
        vFields.Add("prove_topic")
        vFields.Add("approve_status")
        vFields.Add("update_date")
        vFields.Add("update_by")
        vFields.Add("approve_date")
        vFields.Add("approve_by")

        Response.Write(CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql, vFields, "DB105"))
    End Sub

    Protected Sub pendingProve()
        Dim vShop_code As String = Request.QueryString("shop_code")
        Dim uemail As String = Request.QueryString("uemail")

        Dim vSql_tmp As String = ""
        Dim vSql As String = ""
        Dim vWhere As String = ""

        Dim vLimit As String = "300"
        Dim pInt As Integer

        If Request.QueryString("limit") <> Nothing And Integer.TryParse(Request.QueryString("limit"), pInt) Then
            vLimit = Request.QueryString("limit")
        End If

        If vShop_code <> Nothing Then
            vWhere += " where shop_code = '" & vShop_code & "' "
        End If

        vSql_tmp += "select top " & vLimit & " * from ("
        vSql_tmp += "   select 1 prove_topic, follow_id, 0 close_temp, "
        vSql_tmp += "   case approve_status when 0 then 0 when 3 then 1 else 2 end abc, "
        vSql_tmp += "   no_approve, no_shopStock, shop_code, approve_status, "
        vSql_tmp += "   update_date, update_by, approve_date, approve_by "
        vSql_tmp += "   from approve_shopStock " + vWhere

        vSql_tmp += "   union "
        vSql_tmp += "   select 2 prove_topic, follow_id, 0 close_temp, "
        vSql_tmp += "   case approve_status when 0 then 0 when 3 then 1 else 2 end abc, "
        vSql_tmp += "   no_approve, 0 no_shopStock, shop_code, approve_status, "
        vSql_tmp += "   update_date, update_by, approve_date, approve_by "
        vSql_tmp += "   from approve_shopStock_daytime " + vWhere

        vSql_tmp += "   union "
        vSql_tmp += "   select 3 prove_topic, '' follow_id, 0 close_temp, "
        vSql_tmp += "   case approve_status when 0 then 0 when 3 then 1 else 2 end abc, "
        vSql_tmp += "   no_approve, no_shopStock, shop_code, approve_status, "
        vSql_tmp += "   update_date, update_by, approve_date, approve_by "
        vSql_tmp += "   from approve_shopStock_img " + vWhere

        vSql_tmp += "   union "
        vSql_tmp += "   select 4 prove_topic, follow_id, close_temp, "
        vSql_tmp += "   case approve_status when 0 then 0 when 3 then 1 else 2 end abc, "
        ''no_shopStock is no_note
        vSql_tmp += "   no_approve, no_note no_shopStock, shop_code, approve_status, "
        vSql_tmp += "   update_date, update_by, approve_date, approve_by "
        vSql_tmp += "   from approve_shopstock_note " + vWhere
        vSql_tmp += ") prove_alldata "

        If Session("upermiss") = "BACKOFFICE_ADMIN" Then
            vSql += vSql_tmp
            vSql += "order by abc, approve_date desc, update_date desc "

        Else
            vSql += "DECLARE @tempermiss table( shop_code varchar(50) ); "
            vSql += "INSERT INTO @tempermiss EXEC MPermiss.dbo.st_AreaPermiss '" + Session("upermiss") + "', '" + Session("Uemail")  + "' "
            vSql += vSql_tmp
            vSql += "where shop_code in (select shop_code from @tempermiss) or prove_alldata.update_by = '" + Session("Uemail") + "' "
            vSql += "order by abc, approve_date desc, update_date desc "
        End If

        ' Response.Write(vSql)
        dim vFields = New ArrayList
        vFields.Add("no_approve")
        vFields.Add("no_shopStock")
        vFields.Add("shop_code")
        vFields.Add("prove_topic")
        vFields.Add("approve_status")
        vFields.Add("update_date")
        vFields.Add("update_by")
        vFields.Add("approve_date")
        vFields.Add("approve_by")
        vFields.Add("follow_id")
        vFields.Add("close_temp")

        Response.Write(CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql, vFields, "DB105"))
    End Sub

    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Protected Sub getShopDescProve()
        Dim vSql As String = "select no_approve,no_shopStock,shop_code,shop_name,"
        vSql += "province_name,amphur_name,storeplacetype_name,storeKiosType_name,"
        vSql += "REPLACE(REPLACE(shop_location, CHAR(13),' '), CHAR(10),' ') shop_location, "
        vSql += "REPLACE(REPLACE(shop_address, CHAR(13),' '), CHAR(10),' ') shop_address, "
        vSql += "shop_comment,telephone,fax,latitude,longitude,shop_temp,flag_promote,shop_keyword, "
        vSql += "approve_status,admin_override,admin_comment, follow_id, "
        vSql += "line_id,premium_receive_shop "
        vSql += "from approve_shopStock "

        vSql += "left join THprovince on approve_shopStock.province_code = THprovince.province_code "
        vSql += "left join THamphur on approve_shopStock.amphur_code = THamphur.amphur_code and approve_shopStock.province_code = THamphur.province_code "
        vSql += "left join storeplacetype on approve_shopStock.storeplacetype_id = storeplacetype.storeplacetype_id "
        vSql += "left join storeKiosType on approve_shopStock.storeKiosType_id = storeKiosType.storeKiosType_id "

        vSql += "where no_approve = '" + Request.QueryString("no_approve") + "' "

        Dim vFields = New ArrayList
        vFields.Add("no_approve")
        vFields.Add("no_shopStock")
        vFields.Add("shop_code")
        vFields.Add("shop_name")
        vFields.Add("shop_location")
        vFields.Add("shop_address")
        vFields.Add("shop_comment")
        vFields.Add("province_name")
        vFields.Add("amphur_name")
        vFields.Add("storeplacetype_name")
        vFields.Add("storeKiosType_name")
        vFields.Add("telephone")
        vFields.Add("fax")
        vFields.Add("latitude")
        vFields.Add("longitude")
        vFields.Add("shop_temp")
        vFields.Add("flag_promote")
        vFields.Add("shop_keyword")
        vFields.Add("approve_status")
        vFields.Add("admin_override")
        vFields.Add("admin_comment")
        vFields.Add("follow_id")
        vFields.Add("line_id")
        vFields.Add("premium_receive_shop")

        Response.Write(CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql, vFields, "DB105"))
    End Sub

    Protected Sub getShopDescProveLog()
        Dim vSql As String = "select no_approve,no_shopStock,shop_code,shop_name,"
        vSql += "province_name,amphur_name,storeplacetype_name,storeKiosType_name,"
        vSql += "REPLACE(REPLACE(shop_location, CHAR(13),' '), CHAR(10),' ') shop_location, "
        vSql += "REPLACE(REPLACE(shop_address, CHAR(13),' '), CHAR(10),' ') shop_address, "
        vSql += "shop_comment,telephone,fax,latitude,longitude,shop_temp,flag_promote,shop_keyword,"
        vSql += "line_id,premium_receive_shop "
        vSql += "from approve_log_shopStock "

        vSql += "left join THprovince on approve_log_shopStock.province_code = THprovince.province_code "
        vSql += "left join THamphur on approve_log_shopStock.amphur_code = THamphur.amphur_code and approve_log_shopStock.province_code = THamphur.province_code "
        vSql += "left join storeplacetype on approve_log_shopStock.storeplacetype_id = storeplacetype.storeplacetype_id "
        vSql += "left join storeKiosType on approve_log_shopStock.storeKiosType_id = storeKiosType.storeKiosType_id "

        vSql += "where no_approve = '" + Request.QueryString("no_approve") + "' "

        Dim vFields = New ArrayList
        vFields.Add("no_approve")
        vFields.Add("no_shopStock")
        vFields.Add("shop_code")
        vFields.Add("shop_name")
        vFields.Add("shop_location")
        vFields.Add("shop_address")
        vFields.Add("shop_comment")
        vFields.Add("province_name")
        vFields.Add("amphur_name")
        vFields.Add("storeplacetype_name")
        vFields.Add("storeKiosType_name")
        vFields.Add("telephone")
        vFields.Add("fax")
        vFields.Add("latitude")
        vFields.Add("longitude")
        vFields.Add("shop_temp")
        vFields.Add("flag_promote")
        vFields.Add("shop_keyword")
        vFields.Add("line_id")
        vFields.Add("premium_receive_shop")

        Response.Write(CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql, vFields, "DB105"))
    End Sub

    Protected Sub okProveDesc()
        Dim no_approve As String = Request.Form("no_approve")
        Dim uemail As String = Request.Form("uemail")
        Dim admin_comment As String = Request.Form("admin_comment")

        If no_approve <> Nothing And uemail <> Nothing Then
            Dim vSqlIn As String = "update approve_shopStock set "
            vSqlIn += "admin_comment='" + admin_comment + "', approve_by='" + uemail + "', approve_date=getdate(), approve_status=9 "
            vSqlIn += "where no_approve = '" & no_approve & "' "
                    
            If DB105.ExecuteNonQuery(vSqlIn).ToString() > 0 Then
                updateDesc(no_approve)
            Else
                Response.Write(0)
            End If
        End If
    End Sub

    Protected sub updateDesc(ByVal vNo_Approve As String)
        Dim vSqlIn As String = ""
        vSqlIn += "declare @no_shopStock int "
        vSqlIn += "set @no_shopStock = (select no_shopStock from approve_shopStock where no_approve = " & vNo_Approve & ") "

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
        vSqlIn += "inner join approve_shopStock t2 on t1.no = t2.no_shopStock and t2.no_approve = " & vNo_Approve & " "
        vSqlIn += "where t1.no = @no_shopStock "

        If DB105.ExecuteNonQuery(vSqlIn).ToString() > 0 Then
            CP.SendMailActionProve(1,vNo_Approve)

            Response.Write(1)
        Else
            Response.Write(0)
        End If
    End Sub

    Protected Sub cancleProveDesc()
        Dim no_approve As String = Request.Form("no_approve")
        Dim uemail As String = Request.Form("uemail")
        Dim admin_comment As String = Request.Form("admin_comment")

        If no_approve <> Nothing And uemail <> Nothing Then
            Dim vSqlIn As String = "update approve_shopStock set "
            vSqlIn += "admin_comment='" + admin_comment + "', approve_by='" + uemail + "', approve_date=getdate(), approve_status=8 "
            vSqlIn += "where no_approve = '" & no_approve & "' "
                    
            If DB105.ExecuteNonQuery(vSqlIn).ToString() > 0 Then
                CP.SendMailActionProve(1,no_approve)

                Response.Write(1)
            Else
                Response.Write(0)
            End If
        End If
    End Sub

    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Protected Sub getShopImgProve()
        Dim vSql As String = "select * "
        vSql += "from approve_shopStock_img "

        vSql += "where no_approve = '" + Request.QueryString("no_approve") + "' "

        Dim vFields = New ArrayList
        vFields.Add("no_approve")
        vFields.Add("no_shopStock")
        vFields.Add("shop_code")
        vFields.Add("picture1")
        vFields.Add("picture2")
        vFields.Add("picture3")
        vFields.Add("img_map")
        vFields.Add("approve_status")
        vFields.Add("admin_override")
        vFields.Add("admin_comment")

        Response.Write(CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql, vFields, "DB105"))
    End Sub

    Protected Sub getShopImgProveLog()
        Dim vSql As String = "select * "
        vSql += "from approve_log_shopStock_img "

        vSql += "where no_approve = '" + Request.QueryString("no_approve") + "' "

        Dim vFields = New ArrayList
        vFields.Add("no_approve")
        vFields.Add("no_shopStock")
        vFields.Add("shop_code")
        vFields.Add("picture1")
        vFields.Add("picture2")
        vFields.Add("picture3")
        vFields.Add("img_map")

        Response.Write(CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql, vFields, "DB105"))
    End Sub

    Protected Sub okProveImg()
        Dim no_approve As String = Request.Form("no_approve")
        Dim uemail As String = Request.Form("uemail")
        Dim admin_comment As String = Request.Form("admin_comment")

        If no_approve <> Nothing And uemail <> Nothing Then
            Dim vSqlIn As String = "update approve_shopStock_img set "
            vSqlIn += "admin_comment='" + admin_comment + "', approve_by='" + uemail + "', approve_date=getdate(), approve_status=9 "
            vSqlIn += "where no_approve = '" & no_approve & "' "
                    
            If DB105.ExecuteNonQuery(vSqlIn).ToString() > 0 Then
                updateImg(no_approve)
            Else
                Response.Write(0)
            End If
        End If
    End Sub

    Protected sub updateImg(ByVal vNo_Approve As String)
        Dim vSqlIn As String = ""
        vSqlIn += "declare @no_shopStock int "
        vSqlIn += "set @no_shopStock = (select no_shopStock from approve_shopStock_img where no_approve = " & vNo_Approve & ") "

        vSqlIn += "update shopStock set "
        vSqlIn += "update_by = t2.update_by, update_date = t2.update_date, "
        vSqlIn += "picture1 = t2.picture1, picture2 = t2.picture2, picture3 = t2.picture3, img_map = t2.img_map "
        vSqlIn += "from shopStock t1 "
        vSqlIn += "inner join approve_shopStock_img t2 on t1.no = t2.no_shopStock and t2.no_approve = " & vNo_Approve & " "
        vSqlIn += "where t1.no = @no_shopStock "

        If DB105.ExecuteNonQuery(vSqlIn).ToString() > 0 Then
            CP.SendMailActionProve(3,vNo_Approve)

            Response.Write(1)
        Else
            Response.Write(0)
        End If
    End Sub

    Protected Sub cancleProveImg()
        Dim no_approve As String = Request.Form("no_approve")
        Dim uemail As String = Request.Form("uemail")
        Dim admin_comment As String = Request.Form("admin_comment")

        If no_approve <> Nothing And uemail <> Nothing Then
            Dim vSqlIn As String = "update approve_shopStock_img set "
            vSqlIn += "admin_comment='" + admin_comment + "', approve_by='" + uemail + "', approve_date=getdate(), approve_status=8 "
            vSqlIn += "where no_approve = '" & no_approve & "' "
                    
            If DB105.ExecuteNonQuery(vSqlIn).ToString() > 0 Then
                CP.SendMailActionProve(3,no_approve)

                Response.Write(1)
            Else
                Response.Write(0)
            End If
        End If
    End Sub

    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Protected Sub getShopDayTimeProve()
        Dim vSql As String = "select *, case holiday_time when 0 then 1 else 0 end holiday_chk, follow_id "
        vSql += "from approve_shopStock_daytime "
        vSql += "where no_approve = '" + Request.QueryString("no_approve") + "' "

        Dim vFields = New ArrayList
        vFields.Add("no_approve")
        vFields.Add("shop_code")
        vFields.Add("dayoff_sat")
        vFields.Add("dayoff_sun")
        vFields.Add("day_7")
        vFields.Add("wd_shop_open")
        vFields.Add("wd_shop_close")
        vFields.Add("wd_cash_open")
        vFields.Add("wd_cash_close")
        vFields.Add("wd_credit_open")
        vFields.Add("wd_credit_close")
        vFields.Add("we_shop_open")
        vFields.Add("we_shop_close")
        vFields.Add("we_cash_open")
        vFields.Add("we_cash_close")
        vFields.Add("we_credit_open")
        vFields.Add("we_credit_close")
        vFields.Add("approve_status")
        vFields.Add("admin_override")
        vFields.Add("admin_comment")
        vFields.Add("ho_shop_open")
        vFields.Add("ho_shop_close")
        vFields.Add("ho_cash_open")
        vFields.Add("ho_cash_close")
        vFields.Add("ho_credit_open")
        vFields.Add("ho_credit_close")
        vFields.Add("holiday_time")
        vFields.Add("holiday_chk")
        vFields.Add("monday_time")
        vFields.Add("friday_time")
        vFields.Add("follow_id")

        Response.Write(CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql, vFields, "DB105"))
    End Sub

    Protected Sub getShopDayTimeProveLog()
        Dim vSql As String = "select *, case holiday_time when 0 then 1 else 0 end holiday_chk "
        vSql += "from approve_log_shopStock_daytime "
        vSql += "where no_approve = '" + Request.QueryString("no_approve") + "' "

        Dim vFields = New ArrayList
        vFields.Add("no_approve")
        vFields.Add("shop_code")
        vFields.Add("dayoff_sat")
        vFields.Add("dayoff_sun")
        vFields.Add("day_7")
        vFields.Add("wd_shop_open")
        vFields.Add("wd_shop_close")
        vFields.Add("wd_cash_open")
        vFields.Add("wd_cash_close")
        vFields.Add("wd_credit_open")
        vFields.Add("wd_credit_close")
        vFields.Add("we_shop_open")
        vFields.Add("we_shop_close")
        vFields.Add("we_cash_open")
        vFields.Add("we_cash_close")
        vFields.Add("we_credit_open")
        vFields.Add("we_credit_close")
        vFields.Add("ho_shop_open")
        vFields.Add("ho_shop_close")
        vFields.Add("ho_cash_open")
        vFields.Add("ho_cash_close")
        vFields.Add("ho_credit_open")
        vFields.Add("ho_credit_close")
        vFields.Add("holiday_time")
        vFields.Add("holiday_chk")
        vFields.Add("monday_time")
        vFields.Add("friday_time")

        Response.Write(CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql, vFields, "DB105"))
    End Sub

    Protected Sub okProveDayTime()
        Dim no_approve As String = Request.Form("no_approve")
        Dim uemail As String = Request.Form("uemail")
        Dim admin_comment As String = Request.Form("admin_comment")

        If no_approve <> Nothing And uemail <> Nothing Then
            Dim vSqlIn As String = "update approve_shopStock_daytime set "
            vSqlIn += "admin_comment='" + admin_comment + "', approve_by='" + uemail + "', approve_date=getdate(), approve_status=9 "
            vSqlIn += "where no_approve = '" & no_approve & "' "
                    
            If DB105.ExecuteNonQuery(vSqlIn).ToString() > 0 Then
                updateDayTime(no_approve)
            Else
                Response.Write(0)
            End If
        End If
    End Sub

    Protected sub updateDayTime(ByVal vNo_Approve As String)
        Dim vSqlIn As String = ""
        vSqlIn += "declare @shop_code varchar(10) "
        vSqlIn += "set @shop_code = (select shop_code from approve_shopStock_daytime where no_approve = " & vNo_Approve & ") "

        vSqlIn += "update shopStock_dayoff set "
        vSqlIn += "sat = t2.dayoff_sat, sun = t2.dayoff_sun "
        vSqlIn += "from shopStock_dayoff t1 "
        vSqlIn += "inner join approve_shopStock_daytime t2 on t1.shop_code = t2.shop_code and t2.no_approve = " & vNo_Approve & " "
        vSqlIn += "where t1.shop_code = @shop_code "

        vSqlIn += "update shopstock_time set "
        vSqlIn += "update_by = t2.update_by, update_date = t2.update_date, day_7 = t2.day_7, "
        vSqlIn += "shop_open = t2.wd_shop_open, shop_close = t2.wd_shop_close, "
        vSqlIn += "cash_open = t2.wd_cash_open, cash_close = t2.wd_cash_close, "
        vSqlIn += "credit_open = t2.wd_credit_open, credit_close = t2.wd_credit_close, "
        vSqlIn += "holiday_time = t2.holiday_time, "
        vSqlIn += "monday_time = t2.monday_time, "
        vSqlIn += "friday_time = t2.friday_time "
        vSqlIn += "from shopstock_time t1 "
        vSqlIn += "inner join approve_shopStock_daytime t2 on t1.shop_code = t2.shop_code and t2.no_approve = " & vNo_Approve & " "
        vSqlIn += "where t1.shop_code = @shop_code and day_type = 5 "

        vSqlIn += "update shopstock_time set "
        vSqlIn += "update_by = t2.update_by, update_date = t2.update_date, day_7 = t2.day_7, "
        vSqlIn += "shop_open = t2.we_shop_open, shop_close = t2.we_shop_close, "
        vSqlIn += "cash_open = t2.we_cash_open, cash_close = t2.we_cash_close, "
        vSqlIn += "credit_open = t2.we_credit_open, credit_close = t2.we_credit_close, "
        vSqlIn += "holiday_time = t2.holiday_time, "
        vSqlIn += "monday_time = t2.monday_time, "
        vSqlIn += "friday_time = t2.friday_time "
        vSqlIn += "from shopstock_time t1 "
        vSqlIn += "inner join approve_shopStock_daytime t2 on t1.shop_code = t2.shop_code and t2.no_approve = " & vNo_Approve & " "
        vSqlIn += "where t1.shop_code = @shop_code and day_type = 2 "

        vSqlIn += "update shopstock_time set "
        vSqlIn += "update_by = t2.update_by, update_date = t2.update_date, day_7 = t2.day_7, "
        vSqlIn += "shop_open = t2.ho_shop_open, shop_close = t2.ho_shop_close, "
        vSqlIn += "cash_open = t2.ho_cash_open, cash_close = t2.ho_cash_close, "
        vSqlIn += "credit_open = t2.ho_credit_open, credit_close = t2.ho_credit_close, "
        vSqlIn += "holiday_time = t2.holiday_time, "
        vSqlIn += "monday_time = t2.monday_time, "
        vSqlIn += "friday_time = t2.friday_time "
        vSqlIn += "from shopstock_time t1 "
        vSqlIn += "inner join approve_shopStock_daytime t2 on t1.shop_code = t2.shop_code and t2.no_approve = " & vNo_Approve & " "
        vSqlIn += "where t1.shop_code = @shop_code and day_type = 0 "

        If DB105.ExecuteNonQuery(vSqlIn).ToString() > 0 Then
            CP.SendMailActionProve(2,vNo_Approve)

            Response.Write(1)
        Else
            Response.Write(0)
        End If
    End Sub

    Protected Sub cancleProveDayTime()
        Dim no_approve As String = Request.Form("no_approve")
        Dim uemail As String = Request.Form("uemail")
        Dim admin_comment As String = Request.Form("admin_comment")

        If no_approve <> Nothing And uemail <> Nothing Then
            Dim vSqlIn As String = "update approve_shopStock_daytime set "
            vSqlIn += "admin_comment='" + admin_comment + "', approve_by='" + uemail + "', approve_date=getdate(), approve_status=8 "
            vSqlIn += "where no_approve = '" & no_approve & "' "
                    
            If DB105.ExecuteNonQuery(vSqlIn).ToString() > 0 Then
                CP.SendMailActionProve(2,no_approve)

                Response.Write(1)
            Else
                Response.Write(0)
            End If
        End If
    End Sub

    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Protected Sub getShopNoteProve()
        Dim vSql As String = "select no_approve, no_note, shop_code, start_display, end_display, note_desc,explain_desc,note_ex_id,  "
        vSql += "close_temp, start_close, end_close, row_delete, upload_file, "
        vSql += "case when upload_date is null then '' else CONVERT(VARCHAR(7), upload_date, 126) end upload_file_path, "
        vSql += "approve_status, admin_override, admin_comment, follow_id "
        vSql += "from approve_shopstock_note "
        vSql += "where no_approve = '" + Request.QueryString("no_approve") + "' "

        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
    End Sub

    Protected Sub getShopNoteProveLog()
        Dim vSql As String = "select no_approve, no_note, shop_code, start_display, end_display, note_desc,explain_desc,note_ex_id, "
        vSql += "close_temp, start_close, end_close, row_delete, upload_file, "
        vSql += "case when upload_date is null then '' else CONVERT(VARCHAR(7), upload_date, 126) end upload_file_path "
        vSql += "from approve_log_shopStock_note "
        vSql += "where no_approve = '" + Request.QueryString("no_approve") + "' "

        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
    End Sub

    Protected Sub okProveNote()
        Dim no_approve As Integer = Request.Form("no_approve")
        Dim uemail As String = Request.Form("uemail")
        Dim admin_comment As String = Request.Form("admin_comment")

        If no_approve <> Nothing And uemail <> Nothing Then
            Dim vSqlIn As String = "update approve_shopStock_note set "
            vSqlIn += "admin_comment='" + admin_comment + "', approve_by='" + uemail + "', approve_date=getdate(), approve_status=9 "
            vSqlIn += "where no_approve = '" & no_approve & "' "
                    
            If DB105.ExecuteNonQuery(vSqlIn).ToString() > 0 Then
                updateNote(no_approve)
            Else
                Response.Write(0)
            End If
        End If
    End Sub

    Protected sub updateNote(ByVal vNo_Approve As String)
        Dim vSqlIn As String = ""
        vSqlIn += "declare @no_note int "
        vSqlIn += "declare @remove int "
        vSqlIn += "set @no_note = (select no_note from approve_shopstock_note where no_approve = " & vNo_Approve & ") "
        vSqlIn += "set @remove = (select row_delete from approve_shopstock_note where no_approve = " & vNo_Approve & ") "

        vSqlIn += "if (@no_note = 0) "
        vSqlIn += "   begin "
        vSqlIn += "    insert into shopstock_note ( "
        vSqlIn += "    shop_code,note_desc,start_display,end_display, "
        vSqlIn += "    close_temp,start_close,end_close,create_date,create_by, "
        vSqlIn += "    upload_file,upload_date,follow_id) "
        vSqlIn += "    select "
        vSqlIn += "    shop_code,note_desc,start_display,end_display, "
        vSqlIn += "    close_temp,start_close,end_close,update_date,update_by, "
        vSqlIn += "    upload_file,upload_date,follow_id "
        vSqlIn += "    from approve_shopstock_note "
        vSqlIn += "    where no_approve = " & vNo_Approve & " "

        vSqlIn += "    insert into shopstock_note_sub ( "
        vSqlIn += "    No,explain_desc,note_ex_id, "
        vSqlIn += "    start_display_date,end_display_date, "
        vSqlIn += "    start_close_date,end_close_date) "
        vSqlIn += "    select "
        vSqlIn += "    @@IDENTITY,explain_desc,note_ex_id "
        vSqlIn += "    , dbo.dateTH2EN(start_display) start_display_date "
        vSqlIn += "    , dbo.dateTH2EN(end_display) end_display_date "
        vSqlIn += "    , dbo.dateTH2EN(start_close) start_close_date "
        vSqlIn += "    , dbo.dateTH2EN(end_close) end_close_date "
        vSqlIn += "    from approve_shopstock_note "
        vSqlIn += "    where no_approve = " & vNo_Approve & " "
        vSqlIn += "   end "

        vSqlIn += "else if(@remove = 1) "
        vSqlIn += "   begin "
        vSqlIn += "    update shopstock_note set "
        vSqlIn += "    update_by = t2.update_by, update_date = t2.update_date, row_delete = t2.row_delete "
        vSqlIn += "    from shopstock_note t1 "
        vSqlIn += "    inner join approve_shopstock_note t2 on t1.no = t2.no_note and t2.no_approve = " & vNo_Approve & " "
        vSqlIn += "    where t1.no = @no_note "
        vSqlIn += "   end "

        vSqlIn += "else "
        vSqlIn += "   begin "
        vSqlIn += "    update shopstock_note set "
        vSqlIn += "    update_by = t2.update_by, update_date = t2.update_date, "
        vSqlIn += "    note_desc = t2.note_desc, start_display = t2.start_display, end_display = t2.end_display, "
        vSqlIn += "    close_temp = t2.close_temp, start_close = t2.start_close, end_close = t2.end_close, "
        vSqlIn += "    upload_file = t2.upload_file, upload_date = t2.upload_date "
        vSqlIn += "    from shopstock_note t1 "
        vSqlIn += "    inner join approve_shopstock_note t2 on t1.no = t2.no_note and t2.no_approve = " & vNo_Approve & " "
        vSqlIn += "    where t1.no = @no_note"

        vSqlIn += "    update shopstock_note_sub set disable = 1 "
        vSqlIn += "    where no = @no_note "

        vSqlIn += "    insert into shopstock_note_sub ( "
        vSqlIn += "    No,explain_desc,note_ex_id, "
        vSqlIn += "    start_display_date,end_display_date, "
        vSqlIn += "    start_close_date,end_close_date) "
        vSqlIn += "    select "
        vSqlIn += "    no_note,explain_desc,note_ex_id "
        vSqlIn += "    , dbo.dateTH2EN(start_display) start_display_date "
        vSqlIn += "    , dbo.dateTH2EN(end_display) end_display_date "
        vSqlIn += "    , dbo.dateTH2EN(start_close) start_close_date "
        vSqlIn += "    , dbo.dateTH2EN(end_close) end_close_date "
        vSqlIn += "    from approve_shopstock_note "
        vSqlIn += "    where no_approve = " & vNo_Approve & " "
        vSqlIn += "   end "

        If DB105.ExecuteNonQuery(vSqlIn).ToString() > 0 Then
            CP.SendMailActionProve(4,vNo_Approve)

            Response.Write(1)
        Else
            Response.Write(0)
        End If
    End Sub

    Protected Sub cancleProveNote()
        Dim no_approve As String = Request.Form("no_approve")
        Dim uemail As String = Request.Form("uemail")
        Dim admin_comment As String = Request.Form("admin_comment")

        If no_approve <> Nothing And uemail <> Nothing Then
            Dim vSqlIn As String = "update approve_shopStock_note set "
            vSqlIn += "admin_comment='" + admin_comment + "', approve_by='" + uemail + "', approve_date=getdate(), approve_status=8 "
            vSqlIn += "where no_approve = '" & no_approve & "' "
                    
            If DB105.ExecuteNonQuery(vSqlIn).ToString() > 0 Then
                CP.SendMailActionProve(4,no_approve)

                Response.Write(1)
            Else
                Response.Write(0)
            End If
        End If
    End Sub


    Protected Sub loadArea()
        Dim vSql As String = "select distinct branch.f03 as area_code, "
        vSql += "'RO' + ro.f02 as area_name "
        vSql += "from m00860 perm, m00030 branch, m02300 ro "
        vSql += "where branch.f03 = ro.f02 and perm.f03 = branch.f02 "

        Response.Write(CP.rJsonDBv4(vSql, "DB106"))
    End Sub

    Protected Sub loadShopType()
        Dim vSql As String = "select storeKiosType_id, storeKiosType_name "
        vSql += "from storeKiosType "
        vSql += "where disable = 0 "
        vSql += "order by storeKiosType_id"

        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
    End Sub

    Protected Sub loadAllShop()
        Dim xRo As String = Request.QueryString("ro")
        Dim xType As String = Request.QueryString("type")
        Dim xDis As String = Request.QueryString("dis")
        Dim xStatus As String = Request.QueryString("status")

        Dim vSql As String = "select case when just_open is null or delete_date is not null then -1 else just_open end or_der "
        vSql += ", isnull(m30.ro,'') ro "
        vSql += ", isnull(m30.cluster,'') cluster "
        vSql += ", isnull(m30.province_short,'') province_short "
        vSql += ", isnull(m30.province_name,'') province_name "
        vSql += ", case when shopStock.shop_code is null then m30.shop_code else shopStock.shop_code end shop_code "
        vSql += ", case when shopStock.shop_name is null then m30.shop_name else shopStock.shop_name end shop_name "
        vSql += ", storeKiosType_name, shop_temp, dis_3bb_shop, dis_contract, just_open, pos_active, hide_vas "
        vSql += ", cast(delete_date as date) delete_date "
        vSql += "from shopStock "

        vSql += "left join storeKiosType "
        vSql += "on shopStock.storeKiosType_id = storeKiosType.storeKiosType_id "

        vSql += "full outer join rmsdat.dbo.vw_branch_shop_all m30 "
        vSql += "on m30.shop_code = shopStock.shop_code "

        vSql += "where 1 = 1 "

        If xRo <> Nothing Then
            vSql += "and m30.ro= '" + xRo + "' "
        End If

        If xType <> Nothing Then
            vSql += "and shopStock.storeKiosType_id = '" + xType + "' "
        End If

        If xDis <> Nothing Then
            vSql += "and " + xDis + " = 1 "
        End If

        If xStatus <> Nothing Then
            vSql += "and " + xStatus + " "
        End If

        vSql += "order by or_der desc, m30.ro, m30.cluster, m30.province_short, m30.shop_code "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
    End Sub

    Protected Sub getThisDate()
        Dim vSql As String = "select convert(varchar(10), getdate() ,103) dtm "

        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
    End Sub

    Protected Sub loadApproveStatus()
        Dim vSql As String = "select status_id, status_name "
        vSql += "from approve_status where disable = 0 order by status_id  "

        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
    End Sub

    Protected Sub loadAllShopStockNote()
        Dim xStatus As String = Request.QueryString("status")
        Dim pig_month As String = "getdate()"

        If Request.QueryString("pig_month") <> Nothing And Request.QueryString("pig_month") <> "" Then
            pig_month = "convert(date, '01/" + Request.QueryString("pig_month") + "', 103)"
            ' pig_month = "convert(date, '01/04/2019', 103)"
        End If

        Dim vSql As String
        vSql = "declare @date date = " + pig_month + " "

        vSql += "select follow_id "
        vSql += ", RO, CLUSTER, unionall.shop_code, shop_name "
        vSql += ", approve_status, status_name, note_desc, explain_desc  "
        vSql += ", start_close_date, end_close_date "
        vSql += ", DATEDIFF(day, start_close_date, end_close_date) + 1 as diff_date "
        vSql += ", unionall.create_date, unionall.create_by "

        vSql += "from ( "
        vSql += "    select follow_id "
        vSql += "    , shop_code, approve_status, note_desc, explain_desc "
        vSql += "    , dbo.dateTH2EN(start_close) start_close_date "
        vSql += "    , dbo.dateTH2EN(end_close) end_close_date "
        vSql += "    , update_date create_date, update_by create_by "
        vSql += "    from approve_shopStock_note approve "
        vSql += "    where close_temp = 1 and follow_id is not null "
        vSql += "    and year(dbo.dateTH2EN(start_close)) = year(@date) "
        vSql += "    and month(dbo.dateTH2EN(start_close)) = month(@date) "
        vSql += "    and approve_status <> 9 "

        vSql += "    union all "

        vSql += "    select approve.follow_id "
        vSql += "    , approve.shop_code, approve_status, note.note_desc, note.explain_desc "
        vSql += "    , note.start_close_date, note.end_close_date "
        vSql += "    , note.create_date, note.create_by "
        vSql += "    from approve_shopStock_note approve "
        vSql += "    left join vw_shopStock_Note_joined_sub note "
        vSql += "    on note.shop_code = approve.shop_code "
        vSql += "    and note.follow_id = approve.follow_id "
        vSql += "    where approve.close_temp = 1 and approve.follow_id is not null "
        vSql += "    and year(start_close_date) = year(@date) "
        vSql += "    and month(start_close_date) = month(@date) "
        vSql += "    and approve_status = 9 "
        vSql += ") unionall "

        vSql += "left join vw_shopStock_joined_pos shopStock "
        vSql += "on shopStock.shop_code = unionall.shop_code "

        vSql += "left join approve_status "
        vSql += "on approve_status.status_id = unionall.approve_status "

        vSql += "where 1 = 1 "

        If xStatus <> Nothing Then
            vSql += "and approve_status = " + xStatus + " "
        End If

        vSql += "order by ro, cluster, unionall.shop_code, approve_status, start_close_date, end_close_date "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
    End Sub

    Protected Sub loadAllshopStockNoteURL()
        Dim vSql As String = "SELECT no, url_validate, tag_a_replace, create_date, create_by, update_date, update_by "
        vSql += "FROM shopStock_note_URL "
        vSql += "where disable = 0 "
        vSql += "order by create_date "

        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
    End Sub

    Protected Sub newShopStockNoteURL()
        Dim uemail As String = Request.Form("uemail")
        Dim url_validate As String = Request.Form("url_validate")
        Dim tag_a_replace As String = strURL(url_validate)

        If checkSubmitShopStockNoteURL(url_validate) > 0 Then
            Response.Write(9)
        Else 
            Dim vSqlIn As String = ""
            vSqlIn += "insert into shopStock_note_URL ("
            vSqlIn += "url_validate, tag_a_replace, "
            vSqlIn += "create_by, create_date) "
            vSqlIn += "values( "
            vSqlIn += "'" + url_validate + "', '" + tag_a_replace + "', "
            vSqlIn += "'" + uemail + "', getdate() " + ") "
                    
            ' Response.Write(vSqlIn)
            If DB105.ExecuteNonQuery(vSqlIn).ToString() > 0 Then
                Response.Write(1)
            Else 
                Response.Write(0)
            End If
        End If
    End Sub

    Protected Sub saveShopStockNoteURL()
        Dim uemail As String = Request.Form("uemail")
        Dim url_validate As String = Request.Form("url_validate")
        Dim tag_a_replace As String = strURL(url_validate)
        Dim no_url As String = Request.Form("no_url")

        If checkSubmitShopStockNoteURL(url_validate) > 0 Then
            Response.Write(9)
        Else 
            Dim vSqlIn As String = ""
            vSqlIn += "update shopStock_note_URL set "
            vSqlIn += "  url_validate = '" + url_validate + "' "
            vSqlIn += ", tag_a_replace = '" + tag_a_replace + "' "
            vSqlIn += ", update_by = '" + uemail + "' "
            vSqlIn += ", update_date = getdate() "
            vSqlIn += "where no = " + no_url
                        
            ' Response.Write(vSqlIn)
            If DB105.ExecuteNonQuery(vSqlIn).ToString() > 0 Then
                Response.Write(1)
            Else 
                Response.Write(0)
            End If
        End If
    End Sub

    Protected Sub removeShopStockNoteURL()
        Dim uemail As String = Request.Form("uemail")
        Dim no_url As String = Request.Form("no_url")

        Dim vSqlIn As String = ""
        vSqlIn += "update shopStock_note_URL set "
        vSqlIn += "  disable = 1 "
        vSqlIn += ", update_by = '" + uemail + "' "
        vSqlIn += ", update_date = getdate() "
        vSqlIn += "where no = " + no_url
                    
        Response.Write(DB105.ExecuteNonQuery(vSqlIn).ToString())
    End Sub

    Function checkSubmitShopStockNoteURL(ByVal url_validate As String)
        Dim vSql As String = "SELECT no, url_validate, tag_a_replace, create_date, create_by, update_date, update_by "
        vSql += "FROM shopStock_note_URL "
        vSql += "where disable = 0 "
        vSql += "and url_validate = '" + url_validate + "' "

        Dim vRes As New DataTable
        vRes = DB105.GetDataTable(vSql)

        Return vRes.Rows().Count() 
    End Function

    Function strURL(a)
        Return "<a href=''" + a + "''>" + a + "</a>"
    End Function

End Class
