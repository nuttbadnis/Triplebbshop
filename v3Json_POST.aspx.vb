Imports System.Data

Partial Class v3Json_POST
    Inherits System.Web.UI.Page
    Dim CP As New Cls_Panu
    Dim CDB As New Cls_Data105

    Dim command As String = ""
    Dim type As String = ""
    Dim vNLine As String = "[*NL]"

    Dim vShopTime As String = "" + _
        "select time_open.shop_code,show_time, " + _
        "case " + _
        "    when show_time = 1 and day_open_weekday != '' and day_open_weekday = 'ทุกวัน ' then " + _
        "        day_open_weekday + time_open_weekday " + _
        "    when show_time = 1 and day_open_weekday != '' then " + _
        "        day_open_weekday + holi_weekday + time_open_weekday " + _
        "    else " + _
        "        '' " + _
        "end time_open_weekday, " + _
        "case " + _
        "    when show_time = 1 and day_open_weekend != '' then " + _
        "        day_open_weekend + holi_weekend + time_open_weekend " + _
        "    when show_time = 1 and holi_weekend != '' and day_open_weekday != 'ทุกวัน' then " + _
        "        'วันหยุดนักขัตฤกษ์ ' + time_open_weekend + day_open_weekend " + _
        "    else " + _
        "        '' " + _
        "end time_open_weekend " + _
        "from ( " + _
        "        select d5.shop_code, " + _
        "        case " + _
        "            when d5.shop_open = '' then 0 " + _
        "            when d5.shop_close = '' then 0 " + _
        "            else 1 " + _
        "        end show_time, " + _
        "        'วันจันทร์-ศุกร์ ' day_open_weekday, " + _
        "        'ตั้งแต่เวลา ' + d5.shop_open + ' - ' + d5.shop_close + ' น. ' time_open_weekday, " + _
        "        case " + _
        "            when d2_dayoff.sat = 1 and d2_dayoff.sun = 1 then " + _
        "                '' " + _
        "            when d2_dayoff.sun = 1 then " + _
        "                'วันเสาร์ ' " + _
        "            when d2_dayoff.sat = 1 then " + _
        "                'วันอาทิตย์ ' " + _
        "            else " + _
        "                'วันเสาร์-อาทิตย์ ' " + _
        "        end day_open_weekend, " + _
        "        'ตั้งแต่เวลา ' + d2.shop_open + ' - ' + d2.shop_close + ' น. ' time_open_weekend " + _
        "        from (select shop_code, shop_open, shop_close from shopStock_time where day_7 = 0 and day_type = 5) d5 " + _
        "        join (select shop_code, shop_open, shop_close from shopStock_time where day_7 = 0 and day_type = 2) d2 " + _
        "        on d5.shop_code = d2.shop_code " + _
        "        join shopStock_dayoff d2_dayoff " + _
        "        on d2_dayoff.shop_code = d2.shop_code " + _
        "" + _
        "        union " + _
        "        select d7.shop_code, " + _
        "        case " + _
        "            when shop_open = '' then 0 " + _
        "            when shop_close = '' then 0 " + _
        "            else 1 " + _
        "        end show_time, " + _
        "        case " + _
        "            when d7_dayoff.sat = 1 and d7_dayoff.sun = 1 then " + _
        "                'วันจันทร์-ศุกร์ ' " + _
        "            when d7_dayoff.sun = 1 then " + _
        "                'วันจันทร์-เสาร์ ' " + _
        "            when d7_dayoff.sat = 1 then " + _
        "                'วันอาทิตย์-ศุกร์ ' " + _
        "            else " + _
        "                'ทุกวัน ' " + _
        "        end day_open_weekday, " + _
        "        'ตั้งแต่เวลา ' + shop_open + ' - ' + shop_close + ' น. '  time_open_weekday, " + _
        "        '' day_open_weekend, " + _
        "        'ตั้งแต่เวลา ' + shop_open + ' - ' + shop_close + ' น. '  time_open_weekend " + _
        "        from ( select shop_code, shop_open, shop_close from shopStock_time where day_7 = 1 and day_type = 2) d7 " + _
        "        join shopStock_dayoff d7_dayoff " + _
        "        on d7_dayoff.shop_code = d7.shop_code " + _
        ") time_open " + _
        "" + _
        "left join ( " + _
        "select shop_code,day_type,day_7,holiday_time, " + _
        "case " + _
        "    when holiday_time = 5 then " + _
        "        'และวันหยุดนักขัตฤกษ์ ' " + _
        "    else " + _
        "        '' " + _
        "end holi_weekday, " + _
        "case " + _
        "    when holiday_time = 2 then " + _
        "        'และวันหยุดนักขัตฤกษ์ ' " + _
        "    else " + _
        "        '' " + _
        "end holi_weekend " + _
        "from shopStock_time " + _
        "where day_type = 0 " + _
        ") str_holiday " + _
        "on str_holiday.shop_code = time_open.shop_code "

    Dim vShopOff As String = "" + _
        "select shop_code, " + _
        "case " + _
        "    when satoff <> '' or sunoff <> '' or holidayoff <> '' then " + _
        "        satoff + sunoff + holidayoff " + _
        "    else " + _
        "        '' " + _
        "end day_off " + _
        "from ( " + _
        "    select shopStock_dayoff.shop_code, " + _
        "    case when sat = 1 then 'วันเสาร์ ' else '' end satoff, " + _
        "    case when sun = 1 then 'วันอาทิตย์ ' else '' end sunoff, " + _
        "    case when holiday_time = 0 then 'วันหยุดนักขัตฤกษ์ ' else '' end holidayoff " + _
        "    from shopStock_dayoff " + _
        "    join shopStock_time " + _
        "    on shopStock_time.shop_code = shopStock_dayoff.shop_code and day_type = 0 " + _
        ") df "

    Dim vSelect_shop As String = "select shopStock.shop_code, " + _
        "replace(replace(replace(shop_name, ',', ' '), CHAR(13),' '), CHAR(10),' ') shop_name_th, " + _
        "shopStock.province_code, province_name, storeKiosType_name shop_type," + _
        "replace(replace(replace(shop_location, ',', ' '), CHAR(13),' '), CHAR(10),' ') shop_location, " + _
        "replace(replace(replace(shop_address, ',', ' '), CHAR(13),' '), CHAR(10),' ') shop_address, " + _
        "replace(telephone, ',', ' ') phone, replace(fax, ',', ' ') fax, " + _
        "latitude lat, longitude long, img_map, picture1 img1, picture2 img2, picture3 img3, " + _
        "time_open_weekday, time_open_weekend, " + _
        "shop_temp,day_off "

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
        "and storeKiosType.hide_vas = 0 and shopStock.shop_code != 'tssss' and dis_3bb_shop = 0 "

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CP.Analytics()

        If Request.Form("command") <> Nothing Then
            command = Request.Form("command")
        End If

        If Request.Form("type") <> Nothing Then
            type = Request.Form("type")
        End If


        If command = "list" Then

            If type = "province" And Request.Form("stamp") <> Nothing Then
                loadProvince()

            ElseIf type = "amphur" And Request.Form("province_id") <> Nothing Then
                loadAmphur()

            ElseIf type = "shop" And (Request.Form("province_id") <> Nothing Or Request.Form("ro") <> Nothing) Then
                loadShop()

            ElseIf type = "default" And Request.Form("stamp") <> Nothing Then
                loadShopDefault()

            ElseIf type = "storeplacetype" Then
                loadStorePlaceType()
            End If
        End If


        If command = "search" Then

            If type = "shop" And Request.Form("keyword") <> Nothing Then
                loadShop()
            End If
        End If


        If command = "total" Then

            If Request.Form("keyword") <> Nothing Or Request.Form("province_id") <> Nothing Or Request.Form("amphur_id") <> Nothing Then
                totalResult()
            End If
        End If


        If command = "get" Then

            If type = "shop" And Request.Form("shop_code") <> Nothing Then
                loadShop()
            End If
        End If


        If command = "radius" Then

            If type = "shop" And Request.Form("shop_code") <> Nothing Then
                loadShopRadius()

            ElseIf type = "find" And Request.Form("lat") <> Nothing And Request.Form("long") <> Nothing Then
                loadShopRadiusLatLng()

            ElseIf type = "line" And Request.Form("lat") <> Nothing And Request.Form("long") <> Nothing Then
                loadShopRadiusLine()
            End If
        End If

        If command = "execins" Then
            ExecuteAjax()
        End If
    End Sub

    Protected Sub ExecuteAjax()
        If Request.Form("sqlin") <> Nothing Then
            ' CDB.ExecuteNonQuery(Request.Form("sqlin"))
        End If

    End Sub

    Protected Sub loadProvince()
        Dim vSql As String = "select province_code province_id, province_name province_name_th from THprovince order by province_name"

        Dim vFields = New ArrayList
        vFields.Add("province_id")
        vFields.Add("province_name_th")

        'Response.Write(vSql)
        ' Response.Write(CP.rJsonDBv3_2(Request.Form("qrs"), vSql, vFields, "DBLocal"))

        Dim json_Str As String = CP.rJsonDB(Request.QueryString("qrs"), vSql, vFields, "DB105")

        If Request.Form("stamp") <> Nothing Then
            json_Str = rStampFile(json_Str, "v3_province.json")
        End If

        Response.Write(json_Str)
    End Sub

    Protected Sub loadAmphur()
        Dim province_code As Integer = 0

        If Request.Form("province_id") <> Nothing Then
            province_code = Request.Form("province_id")
        End If

        Dim vSql As String = "select amphur_code amphur_id, amphur_name amphur_name_th from THamphur "
        vSql += "where province_code = '" & province_code & "' order by amphur_name "

        Dim vFields = New ArrayList
        vFields.Add("amphur_id")
        vFields.Add("amphur_name_th")

        Response.Write(CP.rJsonDB(Request.QueryString("qrs"), vSql, vFields, "DB105"))
    End Sub

    Protected Sub loadStorePlaceType()
        Dim vSql As String = "select storeplacetype_id, storeplacetype_name from storeplacetype"

        Dim vFields = New ArrayList
        vFields.Add("storeplacetype_id")
        vFields.Add("storeplacetype_name")

        'Response.Write(vSql)
        Response.Write(CP.rJsonDB(Request.QueryString("qrs"), vSql, vFields, "DB105"))
    End Sub

    Protected Sub totalResult()

        Dim vSql As String = "select count(shop_code) total "
        vSql += vSql_main
        vSql += "where " + vWhere_main

        If Request.Form("province_id") <> Nothing And Request.Form("province_id") <> "0" Then
            vSql += "and shopStock.province_code = '" + Request.Form("province_id") + "'"
        End If

        If Request.Form("amphur_id") <> Nothing Then
            vSql += "and shopStock.amphur_code = '" + Request.Form("amphur_id") + "'"
        End If

        If Request.Form("keyword") <> Nothing Then
            Dim xKeyword As String = CP.rReplaceSpaceToPercent(Request.Form("keyword"))

            If xKeyword.length >= 2 Then
                vSql += "and ( "
                vSql += "shopStock.shop_code like '%" + xKeyword + "%' or "
                vSql += "shopStock.shop_name like '%" + xKeyword + "%' or "
                vSql += "shopStock.shop_location like '%" + xKeyword + "%' or "
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
        vRes = CDB.GetDataTable(vSql)

        Response.Write("{ """ + command + """ : """ & vRes.Rows(0).Item("total") & """}")
    End Sub

    Protected Sub loadShop()

        Dim vSql As String = vSelect_shop + ", m30.f03 ro " + vSql_main

        vSql += "left join rmsdat.dbo.m00030 m30 "
        vSql += "on m30.f02 = shopStock.shop_code "

        vSql += "left join ( select * from vw_all_shopstock_time_str ) shopTime "
        vSql += "on shopTime.shop_code = shopStock.shop_code "

        vSql += "left join ( select * from vw_all_shopstock_dayoff_str ) shopOff "
        vSql += "on shopOff.shop_code = shopStock.shop_code "

        vSql += "where " + vWhere_main

        If Request.Form("shop_code") <> Nothing Then
            vSql += "and shopStock.shop_code = '" + Request.Form("shop_code") + "' "
        End If

        If Request.Form("province_id") <> Nothing And Request.Form("province_id") <> "0" Then
            vSql += "and shopStock.province_code = '" + Request.Form("province_id") + "' "
        End If

        If Request.Form("amphur_id") <> Nothing Then
            vSql += "and shopStock.amphur_code = '" + Request.Form("amphur_id") + "' "
        End If

        If Request.Form("ro") <> Nothing Then
            vSql += "and m30.f03 = '" + Request.Form("ro") + "' "
        End If

        If Request.Form("storeplacetype_id") <> Nothing Then
            vSql += "and shopStock.storeplacetype_id = '" + Request.Form("storeplacetype_id") + "' "
        End If

        If Request.Form("keyword") <> Nothing Then
            Dim xKeyword As String = CP.rReplaceSpaceToPercent(Request.Form("keyword"))

            If xKeyword.length >= 2 Then
                vSql += "and ( "
                vSql += "shopStock.shop_code like '%" + xKeyword + "%' or "
                vSql += "shopStock.shop_name like '%" + xKeyword + "%' or "
                vSql += "shopStock.shop_location like '%" + xKeyword + "%' or "
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
        vFields.Add("province_code")
        vFields.Add("province_name")
        vFields.Add("shop_location")
        vFields.Add("shop_address")
        vFields.Add("time_open_weekday")
        vFields.Add("time_open_weekend")
        vFields.Add("day_off")
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

        ' Response.Write(vSql)
        Response.Write(rJsonShop(vSql, vFields))
    End Sub

    Protected Sub loadShopDefault()

        Dim vSql As String = "select * from ("
        vSql += vSelect_shop + ", m30.f03 ro, m30.f19 open_date, flag_promote, "
        vSql += "row_number() OVER (ORDER BY m30.f19 desc, flag_promote desc) AS row_num "
        vSql += vSql_main

        vSql += "left join ( select * from vw_all_shopstock_time_str ) shopTime "
        vSql += "on shopTime.shop_code = shopStock.shop_code "
        vSql += "left join ( select * from vw_all_shopstock_dayoff_str ) shopOff "
        vSql += "on shopOff.shop_code = shopStock.shop_code "

        vSql += "left join rmsdat.dbo.m00030 m30 "
        vSql += "on m30.f02 = shopStock.shop_code "

        vSql += "where " + vWhere_main
        vSql += "and (flag_promote = 1 or m30.f19 >= dateadd(month, -3, getdate())) "

        vSql += ") shopDefalt "

        If Request.Form("row_start") <> Nothing Then
            vSql += "where row_num >= " + Request.Form("row_start")
        End If

        'vSql += "order by flag_promote desc, m30.f19 desc "

        Dim vFields = New ArrayList
        vFields.Add("flag_promote")
        vFields.Add("open_date")
        vFields.Add("shop_code")
        vFields.Add("shop_name_th")
        vFields.Add("province_code")
        vFields.Add("province_name")
        vFields.Add("shop_location")
        vFields.Add("shop_address")
        vFields.Add("time_open_weekday")
        vFields.Add("time_open_weekend")
        vFields.Add("day_off")
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

        Dim json_Str As String = rJsonShop(vSql, vFields)

        If Request.Form("stamp") <> Nothing Then
            json_Str = rStampFile(json_Str, "v3_default.json")
        End If

        Response.Write(json_Str)
    End Sub

    Protected Sub loadShopRadius()
        Dim xShop_code As String = Request.Form("shop_code")
        Dim find_dis As String = "25"

        If Request.Form("km") <> Nothing Then
            find_dis = Request.Form("km")
        End If

        Dim vSql As String = vSelect_shop + ", km_dis KM "
        vSql += vSql_main

        vSql += "left join ( select * from vw_all_shopstock_time_str ) shopTime "
        vSql += "on shopTime.shop_code = shopStock.shop_code "
        vSql += "left join ( select * from vw_all_shopstock_dayoff_str ) shopOff "
        vSql += "on shopOff.shop_code = shopStock.shop_code "

        vSql += "join ( "
        vSql += "   select all_shop.shop_code, "
        vSql += "   dbo.geoDistanceKM_v4(this_shop.latitude,this_shop.longitude,all_shop.latitude,all_shop.longitude) km_dis from "
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
        vSql += "on shop_radius.shop_code = shopStock.shop_code and km_dis > 0 and km_dis <= " + find_dis + " "

        vSql += "where " + vWhere_main

        vSql += "order by km_dis "

        Dim vFields = New ArrayList
        vFields.Add("KM")
        vFields.Add("shop_code")
        vFields.Add("shop_name_th")
        vFields.Add("province_code")
        vFields.Add("province_name")
        vFields.Add("shop_location")
        vFields.Add("shop_address")
        vFields.Add("time_open_weekday")
        vFields.Add("time_open_weekend")
        vFields.Add("day_off")
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

    Protected Sub loadShopRadiusLatLng()
        Dim xLat As String = Request.Form("lat")
        Dim xLng As String = Request.Form("long")
        Dim find_dis As Integer = 25

        If Request.Form("km") <> Nothing Then
            find_dis = Request.Form("km")
        End If

        Dim vSql As String
        vSql = "DECLARE @tb_shopdis TABLE (shop_code VARCHAR(10), km_dis float) "
        vSql += "INSERT INTO @tb_shopdis "
        vSql += "select shop_code, dbo.geoDistanceKM_v4('" + xLat + "','" + xLng + "',latitude,longitude) km_dis from shopStock "

        vSql += "DECLARE @count_value INT = 0 "
        vSql += "DECLARE @min_value INT = 3 "
        vSql += "DECLARE @find_dis INT = " & find_dis & " "

        vSql += "WHILE @count_value < @min_value "
        vSql += "BEGIN "
        vSql += "    select @count_value = COUNT(1) from( "
        vSql += "        select * from @tb_shopdis "
        vSql += "    ) tb "
        vSql += "    where km_dis > 0 and km_dis <= @find_dis "
        vSql += "    IF @count_value >= @min_value "
        vSql += "    BEGIN "
        vSql += "        BREAK; "
        vSql += "    END "
        vSql += "    ELSE "
        vSql += "    BEGIN "
        vSql += "        SET @find_dis = @find_dis + 25 "
        vSql += "    END "
        vSql += "END "

        vSql += vSelect_shop + ", km_dis KM, @find_dis find_distance "
        vSql += vSql_main

        vSql += "left join ( select * from vw_all_shopstock_time_str ) shopTime "
        vSql += "on shopTime.shop_code = shopStock.shop_code "
        vSql += "left join ( select * from vw_all_shopstock_dayoff_str ) shopOff "
        vSql += "on shopOff.shop_code = shopStock.shop_code "

        vSql += "join ( "
        vSql += "   select * from @tb_shopdis where km_dis > 0 and km_dis <= @find_dis "
        vSql += ") shop_radius "
        vSql += "on shop_radius.shop_code = shopStock.shop_code "

        vSql += "where " + vWhere_main

        vSql += "order by km_dis "

        Dim vFields = New ArrayList
        vFields.Add("find_distance")
        vFields.Add("KM")
        vFields.Add("shop_code")
        vFields.Add("shop_name_th")
        vFields.Add("province_code")
        vFields.Add("province_name")
        vFields.Add("shop_location")
        vFields.Add("shop_address")
        vFields.Add("time_open_weekday")
        vFields.Add("time_open_weekend")
        vFields.Add("day_off")
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

    Protected Sub loadShopRadiusLine()
        Dim xLat As String = Request.Form("lat")
        Dim xLng As String = Request.Form("long")
        Dim find_dis As Integer = 10
        Dim top_limit As Integer = 5
        Dim min_value As Integer = 1

        If Request.Form("km") <> Nothing Then
            find_dis = Request.Form("km")
        End If

        If Request.Form("limit") <> Nothing Then
            top_limit = Request.Form("limit")
        End If

        If Request.Form("minimum") <> Nothing Then
            min_value = Request.Form("minimum")
        End If

        Dim vSql As String
        vSql = "DECLARE @tb_shopdis TABLE (shop_code VARCHAR(10), km_dis float) "
        vSql += "INSERT INTO @tb_shopdis "
        vSql += "select shop_code, dbo.geoDistanceKM_v4('" + xLat + "','" + xLng + "',latitude,longitude) km_dis from shopStock "

        vSql += "DECLARE @count_value INT = 0 "
        vSql += "DECLARE @min_value INT = " & min_value & " "
        vSql += "DECLARE @find_dis INT = " & find_dis & " "

        vSql += "WHILE @count_value < @min_value "
        vSql += "BEGIN "
        vSql += "    select @count_value = COUNT(1) from( "
        vSql += "        select * from @tb_shopdis "
        vSql += "    ) tb "
        vSql += "    where km_dis > 0 and km_dis <= @find_dis "

        vSql += "    IF @count_value >= @min_value "
        vSql += "    BEGIN "
        vSql += "        BREAK; "
        vSql += "    END "
        vSql += "    ELSE "
        vSql += "    BEGIN "
        vSql += "        SET @find_dis = @find_dis * 2 "
        vSql += "    END "
        vSql += "END "

        vSql += "select top " & top_limit & " * from ("
        vSql += vSelect_shop + ", km_dis KM, @find_dis find_distance "
        vSql += vSql_main

        vSql += "left join ( select * from vw_all_shopstock_time_str ) shopTime "
        vSql += "on shopTime.shop_code = shopStock.shop_code "
        vSql += "left join ( select * from vw_all_shopstock_dayoff_str ) shopOff "
        vSql += "on shopOff.shop_code = shopStock.shop_code "

        vSql += "join ( "
        ' vSql += "   select top " & top_limit & " * from @tb_shopdis where km_dis > 0 and km_dis <= @find_dis "
        ' vSql += "   select * from @tb_shopdis where km_dis > 0 and km_dis <= @find_dis "
        vSql += "   select * from @tb_shopdis where km_dis > 0 "
        vSql += ") shop_radius "
        vSql += "on shop_radius.shop_code = shopStock.shop_code "

        vSql += "where " + vWhere_main

        vSql += ") shop "
        vSql += "order by KM "

        Dim vFields = New ArrayList
        vFields.Add("find_distance")
        vFields.Add("KM")
        vFields.Add("shop_code")
        vFields.Add("shop_name_th")
        vFields.Add("province_code")
        vFields.Add("province_name")
        vFields.Add("shop_location")
        vFields.Add("shop_address")
        vFields.Add("time_open_weekday")
        vFields.Add("time_open_weekend")
        vFields.Add("day_off")
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

        ' Response.Write(vSql)
        Response.Write(rJsonShop(vSql, vFields))
    End Sub

    Function rJsonShop(ByVal vSql As String, ByVal vFields As ArrayList)

        Dim vJson As String = ""
        Dim vTemp As String = ""

        Dim vRes As New DataTable
        vRes = CDB.GetDataTable(vSql)

        For i As Integer = 0 To vRes.Rows().Count() - 1
            vJson += "{"

            For Each vf As String In vFields
                vTemp = "Null"
                If Not IsDbNull(vRes.Rows(i).Item(vf)) Then
                    vTemp = vRes.Rows(i).Item(vf)
                End If
                vJson += " """ + vf + """:""" + CP.rValidJson(vTemp) + """ ,"
            Next

            'append remark'
            If Not IsDbNull(vRes.Rows(i).Item("shop_code")) Then
                vJson += " ""remark"":""" + rJsonRemark(vRes.Rows(i).Item("shop_code")) + """ ,"
                'vJson += " ""dayoff"":""" + rJsonDayoff(vRes.Rows(i).Item("shop_code")) + """ ,"
            End If
            'append remark'

            vJson = vJson.Remove(vJson.Length - 1, 1)
            vJson += "},"
        Next

        If vJson <> Nothing Then
            vJson = "{ ""total"" : " & vRes.Rows().Count() & ", """ + command + """ : [" + vJson
            vJson = vJson.Remove(vJson.Length - 1, 1)
            vJson += "]}"
        Else
            vJson = "{ ""total"" : 0, """ + command + """ : []}"
        End If

        Return vJson
    End Function

    Function rJsonRemark(ByVal vCode As String) As String
        Dim vReturn As String = ""
        'vReturn = rDayoff(vCode)

        Dim vSql As String = "select No,shop_code,start_display,end_display,note_desc, "
        vSql += "close_temp,start_close,end_close "
        vSql += "from shopStock_note "
        vSql += "where row_delete = 0 and shop_code = '" + vCode + "' "
        vSql += "and convert(datetime,start_display,103) <= convert(datetime,convert(varchar,dateadd(year,543, getdate()),103),103) "
        vSql += "and convert(datetime,end_display,103) >= convert(datetime,convert(varchar,dateadd(year,543, getdate()),103),103) "

        Dim vRes As New DataTable
        vRes = CDB.GetDataTable(vSql)

        For i As Integer = 0 To vRes.Rows().Count() - 1
            If Not IsDbNull(vRes.Rows(i).Item("note_desc")) Then
                vReturn += CP.rValidJson(vRes.Rows(i).Item("note_desc")) + vNLine
            End If
        Next

        If vReturn.Length >= 5 Then
            vReturn = vReturn.Remove(vReturn.Length - 5, 5)
        End If

        Return vReturn
    End Function

    Function rJsonDayoff(ByVal vCode As String) As String
        Dim vReturn As String = ""

        Dim vSql As String = "select shopStock_dayoff.*, shopStock_time.holiday_time "
        vSql += "from shopStock_dayoff  "
        vSql += "join shopStock_time  "
        vSql += "on shopStock_time.shop_code = shopStock_dayoff.shop_code and day_type = 0 "
        vSql += "where shopStock_dayoff.shop_code = '" + vCode + "' "

        Dim vRes As New DataTable
        vRes = CDB.GetDataTable(vSql)

        For i As Integer = 0 To vRes.Rows().Count() - 1
            If Not IsDbNull(vRes.Rows(i).Item("sat")) And Not IsDbNull(vRes.Rows(i).Item("sun")) Then
                If vRes.Rows(i).Item("sat") Then
                    vReturn += "วันเสาร์ "
                End If

                If vRes.Rows(i).Item("sun") Then
                    vReturn += "วันอาทิตย์ "
                End If

                If vRes.Rows(i).Item("holiday_time") = 0 Then
                    vReturn += "วันหยุดนักขัตฤกษ์ "
                End If
            End If
        Next

        Return vReturn
    End Function

    Function rDayoff(ByVal vCode As String) As String
        Dim vReturn As String = ""

        Dim vSql As String = "select * from shopStock_dayoff "
        vSql += "where shop_code = '" + vCode + "' "

        Dim vRes As New DataTable
        vRes = CDB.GetDataTable(vSql)

        For i As Integer = 0 To vRes.Rows().Count() - 1
            If Not IsDbNull(vRes.Rows(i).Item("sat")) And Not IsDbNull(vRes.Rows(i).Item("sun")) Then
                If vRes.Rows(i).Item("sat") = 1 And vRes.Rows(i).Item("sun") = 1 Then
                    vReturn += "ปิดทำการ วันเสาร์ - อาทิตย์" + vNLine
                ElseIf vRes.Rows(i).Item("sat") Then
                    vReturn += "ปิดทำการ วันเสาร์" + vNLine
                ElseIf vRes.Rows(i).Item("sun") Then
                    vReturn += "ปิดทำการ วันอาทิตย์" + vNLine
                End If
            End If
        Next

        Return vReturn
    End Function

    Function rStampFile(ByVal json_Str As String, ByVal json_FILE_NAME As String)
        json_FILE_NAME = Server.MapPath("") & "\" & json_FILE_NAME
        Dim json_objWriter As New System.IO.StreamWriter(json_FILE_NAME, False)

        json_Str = json_Str.Remove(json_Str.Length - 1, 1)
        json_Str += ", ""timeStamp"" : """ + DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss") + """ }"

        json_objWriter.WriteLine(json_Str)
        json_objWriter.Close()

        Return json_Str
    End Function
End Class
