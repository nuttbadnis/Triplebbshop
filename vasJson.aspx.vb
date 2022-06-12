Imports System.Data

Partial Class _Json
    Inherits System.Web.UI.Page
    Dim CP As New Cls_Panu
    Dim CDB As New Cls_Data
    
    Dim command As String = ""
    Dim type As String = ""
    Dim vNLine As String = "[*NL]"

    Dim vShopTime As String = "" + _
        "select d5.shop_code, " + _
        "'วันจันทร์-ศุกร์ ตั้งแต่เวลา ' + d5.shop_open + ' - ' + d5.shop_close + ' น. ' time_open_weekday, " + _
        "case " + _
        "    when d5.cash_open = '' or d5.cash_close = '' then " + _
        "        '' " + _
        "    else " + _
        "        'เงินสด ตั้งแต่เวลา ' + d5.cash_open + ' - ' + d5.cash_close + ' น. ' " + _
        "end payment_cash_weekday, " + _
        "case " + _
        "    when d5.credit_open = '' or d5.credit_close = '' then " + _
        "        '' " + _
        "    else " + _
        "        'เช็ค/บัตรเครดิต ตั้งแต่เวลา ' + d5.credit_open + ' - ' + d5.credit_close + ' น. ' " + _
        "end payment_credit_weekday, " + _
        "case " + _
        "    when d2_dayoff.sat = 1 and d2_dayoff.sun = 1 then " + _
        "        '' " + _
        "    when d2_dayoff.sun = 1 then " + _
        "        'วันเสาร์ ตั้งแต่เวลา ' + d2.shop_open + ' - ' + d2.shop_close + ' น. '  " + _
        "    when d2_dayoff.sat = 1 then " + _
        "        'วันอาทิตย์ ตั้งแต่เวลา ' + d2.shop_open + ' - ' + d2.shop_close + ' น. '  " + _
        "    else " + _
        "        'วันเสาร์-อาทิตย์ ตั้งแต่เวลา ' + d2.shop_open + ' - ' + d2.shop_close + ' น. ' " + _
        "end time_open_weekend, " + _
        "case " + _
        "    when d2_dayoff.sat = 1 and d2_dayoff.sun = 1 then " + _
        "        '' " + _
        "    when d2.cash_open = '' or d2.cash_close = '' then " + _
        "        '' " + _
        "    else " + _
        "        'เงินสด ตั้งแต่เวลา ' + d2.cash_open + ' - ' + d2.cash_close + ' น. ' " + _
        "end payment_cash_weekend, " + _
        "case " + _
        "    when d2_dayoff.sat = 1 and d2_dayoff.sun = 1 then " + _
        "        '' " + _
        "    when d2.credit_open = '' or d2.credit_close = '' then " + _
        "        '' " + _
        "    else " + _
        "        'เช็ค/บัตรเครดิต ตั้งแต่เวลา ' + d2.credit_open + ' - ' + d2.credit_close + ' น.' " + _
        "end payment_credit_weekend " + _
        "from (select * from shopStock_time where day_7 = 0 and day_type = 5) d5 " + _
        "join (select * from shopStock_time where day_7 = 0 and day_type = 2) d2 " + _
        "on d5.shop_code = d2.shop_code " + _
        "join shopStock_dayoff d2_dayoff " + _
        "on d2_dayoff.shop_code = d2.shop_code " + _
        "" + _
        "union " + _
        "select time_weekend.shop_code, " + _
        "case " + _
        "    when d7_dayoff.sat = 1 or d7_dayoff.sun = 1 then " + _
        "        'วัน จันทร์-ศุกร์ ตั้งแต่เวลา ' + shop_open + ' - ' + shop_close + ' น. ' " + _
        "    else " + _
        "        'ทุกวัน ตั้งแต่เวลา ' + shop_open + ' - ' + shop_close + ' น. ' " + _
        "end time_open_weekday, " + _
        "payment_cash_weekday, payment_credit_weekday , " + _
        "case " + _
        "    when d7_dayoff.sun = 1 and d7_dayoff.sat = 1 then " + _
        "       '' " + _
        "    when d7_dayoff.sun = 1 then " + _
        "        'วัน เสาร์ ตั้งแต่เวลา ' + shop_open + ' - ' + shop_close + ' น. ' " + _
        "    when d7_dayoff.sat = 1 then " + _
        "        'วัน อาทิตย์ ตั้งแต่เวลา ' + shop_open + ' - ' + shop_close + ' น. ' " + _
        "    else " + _
        "        '' " + _
        "end time_open_weekend, " + _
        "case " + _
        "    when d7_dayoff.sun = 1 and d7_dayoff.sat = 1 then " + _
        "       '' " + _
        "    when d7_dayoff.sat = 1 or d7_dayoff.sun = 1 then " + _
        "        payment_cash_weekday " + _
        "    else " + _
        "        '' " + _
        "end payment_cash_weekend, " + _
        "case " + _
        "    when d7_dayoff.sun = 1 and d7_dayoff.sat = 1 then " + _
        "       '' " + _
        "    when d7_dayoff.sat = 1 or d7_dayoff.sun = 1 then " + _
        "        payment_credit_weekday " + _
        "    else " + _
        "        '' " + _
        "end payment_credit_weekend " + _
        "from ( " + _
        "    select shop_code, shop_open, shop_close, " + _
        "    case " + _
        "        when cash_open = '' or cash_close = '' then " + _
        "            '' " + _
        "        else " + _
        "            'เงินสด ตั้งแต่เวลา ' + cash_open + ' - ' + cash_close + ' น. ' " + _
        "    end payment_cash_weekday, " + _
        "    case " + _
        "        when credit_open = '' or credit_close = '' then " + _
        "            '' " + _
        "        else " + _
        "            'เช็ค/บัตรเครดิต ตั้งแต่เวลา ' + credit_open + ' - ' + credit_close + ' น.' " + _
        "    end payment_credit_weekday " + _
        "    from shopStock_time " + _
        "    where day_7 = 1 " + _
        "    group by shop_code,shop_open,shop_close ,cash_open,cash_close,credit_open,credit_close " + _
        ") time_weekend " + _
        "join shopStock_dayoff d7_dayoff " + _
        "on d7_dayoff.shop_code = time_weekend.shop_code "

    Dim vSelect_shop As String = "select shopStock.shop_code, replace(shop_name, ',', ' ') shop_name_th, " + _
        "province_name, storeKiosType_name shop_type," + _
        "replace(replace(replace(shop_location, ',', ' '), CHAR(13),' '), CHAR(10),' ') shop_location, " + _
        "replace(replace(replace(shop_address, ',', ' '), CHAR(13),' '), CHAR(10),' ') shop_address, " + _
        "replace(telephone, ',', ' ') phone, replace(fax, ',', ' ') fax, " + _
        "latitude lat, longitude long, img_map, picture1 img1, picture2 img2, picture3 img3, " + _
        "time_open_weekday, payment_cash_weekday, payment_credit_weekday, " + _
        "time_open_weekend, payment_cash_weekend, payment_credit_weekend, " + _
        "shop_temp "
        '"case shop_temp when 1 then 'shop ชั่วคราว' when 2 then 'shop ไม่รับชำระ' else '0' end shop_temp "

    Dim vSql_main_back As String = "from shopStock " + _
        "left join [10.11.5.106].rmsdat01.dbo.m00030 m30 " + _
        "on m30.f02 = shopStock.shop_code " + _
        "left join ( " + _
        "   select f02,count(*) count_open " + _
        "   from [10.11.5.106].RMSDAT01.dbo.r16010 " + _
        "   group by f02 " + _
        ") r2 " + _
        "on r2.f02 = shopStock.shop_code "

    Dim vWhere_main_back As String = "((shop_temp = 0 and m30.f20 is null and count_open > 0) or shop_temp != 0) and delete_date is null "

    Dim vSql_main As String = "from shopStock " + _
        "left join THprovince on shopStock.province_code = THprovince.province_code " + _
        "left join THamphur on shopStock.amphur_code = THamphur.amphur_code and shopStock.province_code = THamphur.province_code " + _
        "left join storeplacetype on shopStock.storeplacetype_id = storeplacetype.storeplacetype_id " + _
        "left join storeKiosType on shopStock.storeKiosType_id = storeKiosType.storeKiosType_id "

    'Dim vWhere_main As String = "((shop_temp = 0 and pos_active = 1) or shop_temp != 0) and delete_date is null "
    Dim vWhere_main As String = "((shop_temp = 0 and pos_active = 1) or (shop_temp != 0 and shop_temp != 1)) and delete_date is null " + _
        "and storeKiosType.hide_vas = 0 and shopStock.shop_code != 'bkkkk' "

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Request.QueryString("command") <> Nothing Then
            command = Request.QueryString("command")
        End If

        If Request.QueryString("type") <> Nothing Then
            type = Request.QueryString("type")
        End If


        If command = "list" Then

            If type = "province" Then
                loadProvince()

            Else If type = "amphur" And Request.QueryString("province_id") <> Nothing Then
                loadAmphur()

            Else If type = "shop" And (Request.QueryString("province_id") <> Nothing or Request.QueryString("ro") <> Nothing) Then
                loadShop()

            Else If type = "default" Then
                loadShopDefault()
            End If
        End If


        If command = "search" Then

            If type = "shop" And Request.QueryString("keyword") <> Nothing Then
                loadShop()
            End If
        End If


        If command = "total" Then

            If Request.QueryString("keyword") <> Nothing Or Request.QueryString("province_id") <> Nothing Or Request.QueryString("amphur_id") <> Nothing Then
                totalResult()
            End If
        End If


        If command = "get" Then

            If type = "shop" And Request.QueryString("shop_code") <> Nothing Then
                loadShop()
            End If
        End If


        If command = "radius" Then

            If type = "shop" And Request.QueryString("shop_code") <> Nothing Then
                loadShopRadius()
            End If
        End If
    End Sub

    Protected Sub loadProvince()
        Dim vSql As String = "select province_code province_id, province_name province_name_th from THprovince order by province_name"

        Dim vFields = New ArrayList
        vFields.Add("province_id")
        vFields.Add("province_name_th")

        'Response.Write(vSql)
        Response.Write(CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql, vFields, "DBLocal"))
    End Sub

    Protected Sub loadAmphur()
        Dim province_code As Integer = 0

        If Request.QueryString("province_id") <> Nothing Then
            province_code = Request.QueryString("province_id")
        End If

        Dim vSql As String = "select amphur_code amphur_id, amphur_name amphur_name_th from THamphur "
        vSql += "where province_code = '" & province_code & "' order by amphur_name "

        Dim vFields = New ArrayList
        vFields.Add("amphur_id")
        vFields.Add("amphur_name_th")

        Response.Write(CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql, vFields, "DBLocal"))
    End Sub

    Protected Sub totalResult()

        Dim vSql As String = "select count(shop_code) total "
        vSql += vSql_main
        vSql += "where " + vWhere_main
        
        If Request.QueryString("province_id") <> Nothing And Request.QueryString("province_id") <> "0" Then
            vSql += "and shopStock.province_code = '" + Request.QueryString("province_id") + "'"
        End If

        If Request.QueryString("amphur_id") <> Nothing Then
            vSql += "and shopStock.amphur_code = '" + Request.QueryString("amphur_id") + "'"
        End If

        If Request.QueryString("keyword") <> Nothing Then
            Dim xKeyword As String = Request.QueryString("keyword")

            If xKeyword.length >= 2 Then
                vSql += "and ( "
                vSql += "shopStock.shop_code like '%" + xKeyword + "%' or "
                vSql += "shopStock.shop_name like '%" + xKeyword + "%' or "
                'vSql += "shopStock.shop_location like '%" + xKeyword + "%' or "
                vSql += "shopStock.shop_address like '%" + xKeyword + "%' or "
                vSql += "shopStock.shop_keyword like '%" + xKeyword + "%' or "
                vSql += "province_name like '%" + xKeyword + "%' or "
                vSql += "amphur_name like '%" + xKeyword + "%' or "
                vSql += "storeplacetype_name like '%" + xKeyword + "%' "
                vSql += ") "
            Else
                vSql += "and 0 = 1 "
            End If
        End If

        Dim vRes As New DataTable
        vRes = CDB.GetDataTable_Local(vSql)

        Response.Write("{ """ + command + """ : """ & vRes.Rows(0).Item("total") & """}")
    End Sub

    Protected Sub loadShop()

        Dim vSql As String = vSelect_shop + ", m30.f03 ro " + vSql_main

        vSql += "left join m00030 m30 "
        vSql += "on m30.f02 = shopStock.shop_code "

        vSql += "left join ( " + vShopTime + " ) shopTime "
        vSql += "on shopTime.shop_code = shopStock.shop_code "

        vSql += "where " + vWhere_main

        If Request.QueryString("shop_code") <> Nothing Then
            vSql += "and shopStock.shop_code = '" + Request.QueryString("shop_code") + "'"
        End If

        If Request.QueryString("province_id") <> Nothing And Request.QueryString("province_id") <> "0" Then
            vSql += "and shopStock.province_code = '" + Request.QueryString("province_id") + "'"
        End If

        If Request.QueryString("amphur_id") <> Nothing Then
            vSql += "and shopStock.amphur_code = '" + Request.QueryString("amphur_id") + "'"
        End If

        If Request.QueryString("ro") <> Nothing Then
            vSql += "and m30.f03 = '" + Request.QueryString("ro") + "'"
        End If

        If Request.QueryString("keyword") <> Nothing Then
            Dim xKeyword As String = Request.QueryString("keyword")

            If xKeyword.length >= 2 Then
                vSql += "and ( "
                vSql += "shopStock.shop_code like '%" + xKeyword + "%' or "
                vSql += "shopStock.shop_name like '%" + xKeyword + "%' or "
                'vSql += "shopStock.shop_location like '%" + xKeyword + "%' or "
                vSql += "shopStock.shop_address like '%" + xKeyword + "%' or "
                vSql += "shopStock.shop_keyword like '%" + xKeyword + "%' or "
                vSql += "province_name like '%" + xKeyword + "%' or "
                vSql += "amphur_name like '%" + xKeyword + "%' or "
                vSql += "storeplacetype_name like '%" + xKeyword + "%' "
                vSql += ") "
            Else
                vSql += "and 0 = 1 "
            End If
        End If

        vSql += "order by shopStock.shop_code "

        Dim vFields = New ArrayList
        vFields.Add("ro")
        vFields.Add("shop_code")
        vFields.Add("shop_name_th")
        vFields.Add("province_name")
        vFields.Add("shop_location")
        vFields.Add("shop_address")
        vFields.Add("time_open_weekday")
        vFields.Add("payment_cash_weekday")
        vFields.Add("payment_credit_weekday")
        vFields.Add("time_open_weekend")
        vFields.Add("payment_cash_weekend")
        vFields.Add("payment_credit_weekend")
        vFields.Add("phone")
        vFields.Add("fax")
        vFields.Add("lat")
        vFields.Add("long")
        vFields.Add("img_map")
        vFields.Add("img1")
        vFields.Add("img2")
        vFields.Add("img3")
        vFields.Add("shop_type")
        vFields.Add("shop_temp")

        'Response.Write(vSql)
        Response.Write(rJsonShop(vSql, vFields))
    End Sub

    Protected Sub loadShopDefault()

        Dim vSql As String = "select * from ("
        vSql += vSelect_shop + ", m30.f03 ro, m30.f19 open_date, flag_promote, " 
        vSql += "row_number() OVER (ORDER BY m30.f19 desc, flag_promote desc) AS row_num "
        vSql += vSql_main

        vSql += "left join ( " + vShopTime + " ) shopTime "
        vSql += "on shopTime.shop_code = shopStock.shop_code "

        vSql += "left join m00030 m30 "
        vSql += "on m30.f02 = shopStock.shop_code "

        vSql += "where " + vWhere_main
        vSql += "and (flag_promote = 1 or m30.f19 >= dateadd(month, -3, getdate())) "

        vSql += ") shopDefalt "

        If Request.QueryString("row_start") <> Nothing Then
            vSql += "where row_num >= " + Request.QueryString("row_start")
        End If

        'vSql += "order by flag_promote desc, m30.f19 desc "

        Dim vFields = New ArrayList
        vFields.Add("flag_promote")
        vFields.Add("open_date")
        vFields.Add("shop_code")
        vFields.Add("shop_name_th")
        vFields.Add("province_name")
        vFields.Add("shop_location")
        vFields.Add("shop_address")
        vFields.Add("time_open_weekday")
        vFields.Add("payment_cash_weekday")
        vFields.Add("payment_credit_weekday")
        vFields.Add("time_open_weekend")
        vFields.Add("payment_cash_weekend")
        vFields.Add("payment_credit_weekend")
        vFields.Add("phone")
        vFields.Add("fax")
        vFields.Add("lat")
        vFields.Add("long")
        vFields.Add("img_map")
        vFields.Add("img1")
        vFields.Add("img2")
        vFields.Add("img3")
        vFields.Add("shop_type")
        vFields.Add("shop_temp")

        'Response.Write(vSql)
        Response.Write(rJsonShop(vSql, vFields))
    End Sub

    Protected Sub loadShopRadius()
        Dim xShop_code As String = Request.QueryString("shop_code")
        Dim km_dis As String = "25"

        If Request.QueryString("km") <> Nothing Then
            km_dis = Request.QueryString("km")
        End If

        Dim vSql As String = vSelect_shop + ", km_dis KM " 
        vSql += vSql_main

        vSql += "left join ( " + vShopTime + " ) shopTime "
        vSql += "on shopTime.shop_code = shopStock.shop_code "

        vSql += "join ( "
        vSql += "   select all_shop.shop_code, "
        vSql += "   dbo.geoDistanceKM(this_shop.latitude,this_shop.longitude,all_shop.latitude,all_shop.longitude) km_dis from "
        vSql += "   ( "
        vSql += "       select shop_code, latitude, longitude, 'forJoin' forJoin "
        vSql += "       from shopStock where shop_code = '" + xShop_code + "' "
        vSql += "   ) this_shop "
        vSql += "   join ( "
        vSql += "       select shop_code, latitude, longitude, 'forJoin' forJoin "
        vSql += "       from shopStock "
        vSql += "       where latitude != '' and longitude != '' and shop_code != '" + xShop_code + "' "
        vSql += "   ) all_shop "
        vSql += "   on all_shop.forJoin = this_shop.forJoin "
        vSql += ") shop_radius "
        vSql += "on shop_radius.shop_code = shopStock.shop_code and km_dis <= " + km_dis + " "

        vSql += "where " + vWhere_main

        vSql += "order by km_dis "

        Dim vFields = New ArrayList
        vFields.Add("KM")
        vFields.Add("shop_code")
        vFields.Add("shop_name_th")
        vFields.Add("province_name")
        vFields.Add("shop_location")
        vFields.Add("shop_address")
        vFields.Add("time_open_weekday")
        vFields.Add("payment_cash_weekday")
        vFields.Add("payment_credit_weekday")
        vFields.Add("time_open_weekend")
        vFields.Add("payment_cash_weekend")
        vFields.Add("payment_credit_weekend")
        vFields.Add("phone")
        vFields.Add("fax")
        vFields.Add("lat")
        vFields.Add("long")
        vFields.Add("img_map")
        vFields.Add("img1")
        vFields.Add("img2")
        vFields.Add("img3")
        vFields.Add("shop_type")
        vFields.Add("shop_temp")

        Response.Write(rJsonShop(vSql, vFields))
    End Sub

    Function rJsonShop(ByVal vSql As String, ByVal vFields As ArrayList)

        Dim vJson As String = ""
        Dim vTemp As String = ""

        Dim vRes As New DataTable
        vRes = CDB.GetDataTable_Local(vSql)

        For i As Integer = 0 To vRes.Rows().Count() - 1
            vJson += "{"

            For Each vf As String In vFields
                vTemp = "Null"
                If Not IsDbNull(vRes.Rows(i).Item(vf)) Then
                    vTemp = vRes.Rows(i).Item(vf)
                End If
                vJson += " """ + vf + """:""" + CStr(vTemp) + """ ,"
            Next

            'append remark'
            If Not IsDbNull(vRes.Rows(i).Item("shop_code")) Then
                vJson += " ""remark"":""" + rJsonRemark(vRes.Rows(i).Item("shop_code")) + """ ,"
            End If
            'append remark'

            vJson = vJson.Remove(vJson.Length - 1, 1)
            vJson += "},"
        Next

        If vJson <> Nothing Then
            vJson = "{ """ + command + """ : [" + vJson
            vJson = vJson.Remove(vJson.Length - 1, 1)
            vJson += "]}"
        Else
            vJson = "{ """ + command + """ : []}"
        End If

        Return vJson
    End Function

    Function rJsonRemark(ByVal vCode As String) As String 
        Dim vReturn As String = ""
        vReturn = rDayoff(vCode)

        Dim vSql As String = "select No,shop_code,start_display,end_display,note_desc, "
        vSql += "close_temp,start_close,end_close "
        vSql += "from shopStock_note "
        vSql += "where row_delete = 0 and shop_code = '" + vCode + "' "
        vSql += "and convert(datetime,start_display,103) <= convert(datetime,convert(varchar,dateadd(year,543, getdate()),103),103) "
        vSql += "and convert(datetime,end_display,103) >= convert(datetime,convert(varchar,dateadd(year,543, getdate()),103),103) "

        Dim vRes As New DataTable
        vRes = CDB.GetDataTable_Local(vSql)

        For i As Integer = 0 To vRes.Rows().Count() - 1
            If Not IsDbNull(vRes.Rows(i).Item("note_desc")) Then
                vReturn += CP.rReplaceSpecialSting(vRes.Rows(i).Item("note_desc")) + vNLine
            End If
        Next

        If vReturn.Length >= 5 Then
            vReturn = vReturn.Remove(vReturn.Length - 5, 5)
        End If

        Return vReturn
    End Function

    Function rDayoff(ByVal vCode As String) As String
        Dim vReturn As String = ""
        
        Dim vSql As String = "select * from shopStock_dayoff "
        vSql += "where shop_code = '" + vCode + "' "

        Dim vRes As New DataTable
        vRes = CDB.GetDataTable_Local(vSql)

        For i As Integer = 0 To vRes.Rows().Count() - 1
            If Not IsDbNull(vRes.Rows(i).Item("sat")) And Not IsDbNull(vRes.Rows(i).Item("sun")) Then
                If vRes.Rows(i).Item("sat") = 1 And vRes.Rows(i).Item("sun") = 1 Then
                    vReturn += "ปิดทำการ วันเสาร์ - อาทิตย์" + vNLine
                Else If vRes.Rows(i).Item("sat") Then
                    vReturn += "ปิดทำการ วันเสาร์" + vNLine
                Else If vRes.Rows(i).Item("sun") Then
                    vReturn += "ปิดทำการ วันอาทิตย์" + vNLine
                End If
            End If
        Next

        Return vReturn
    End Function
End Class
