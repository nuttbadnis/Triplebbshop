Imports System.Data
Imports System.Web.Script.Serialization
Imports System.Collections.Generic
Imports MySql.Data.MySqlClient

Partial Class _json
    Inherits System.Web.UI.Page
    Dim DB106 As New Cls_Data
    Dim DB105 As New Cls_Data105
    Dim DBMYSQL As New Cls_MySQL
    Dim CP As New Cls_Panu

    Dim vSql_main As String = "from shopStock " + _
        "left join storeKiosType on shopStock.storeKiosType_id = storeKiosType.storeKiosType_id "

    Dim vWhere_main As String = "(shop_temp = 0 and pos_active = 1) and delete_date is null " + _
        "and storeKiosType.hide_vas = 0 and dis_3bb_shop = 0 "

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim qrs As String = ""

        If Request.QueryString("qrs") <> Nothing Then
            qrs = Request.QueryString("qrs")
        End If

        If qrs = "serverDatetime" Then
            serverDatetime()
        End If

        If qrs = "getShop" Then
            getShop()
        End If

        If qrs = "getShopPermiss" Then
            getShopPermiss()
        End If

        If qrs = "getLatLng" Then
            getLatLng()
        End If

        If qrs = "reportResult" Then
            reportResult()
        End If

        If qrs = "autoComplete" Then
            autoComplete()
        End If

        If qrs = "historyResult" Then
            historyResult()
        End If

        If qrs = "stateResult" Then
            stateResult()
        End If

        If qrs = "loadArea" Then
            loadArea()
        End If

        If qrs = "loadCluster" Then
            loadCluster()
        End If

        If qrs = "loadOnhand" Then
            loadOnhand()
        End If

        If qrs = "connectionResult" Then
            connectionResultPpat()
        End If

        If qrs = "connectPOSResult" Then
            connectPOSResult()
        End If

        If qrs = "lineLog" Then
            lineLog()
        End If

        If qrs = "saveLineLog" Then
            saveLineLog()
        End If

        If qrs = "saveLineNotifyLog" Then
            saveLineNotifyLog()
        End If

        If qrs = "getShopComplete" Then
            getShopComplete()
        End If

        If qrs = "SP_REPORT_COVID" Then
            SP_REPORT_COVID()
        End If

        If qrs = "SP_REPORT_COVID_TOTAL" Then
            SP_REPORT_COVID_TOTAL()
        End If

        If qrs = "SP_REPORT_COVID_AREA_TOTAL" Then
            SP_REPORT_COVID_AREA_TOTAL()
        End If

        If qrs = "SP_REPORT_STORE_LOCATION_MAIL" Then
            SP_REPORT_STORE_LOCATION_MAIL()
        End If

        If qrs = "SP_REPORT_PREMIUM_RECEIVE_SHOP" Then
            SP_REPORT_PREMIUM_RECEIVE_SHOP()
        End If

        If qrs = "SP_REPORT_NEARBY_SHOP" Then
            SP_REPORT_NEARBY_SHOP()
        End If

        If qrs = "getThisDateTime" Then
            getThisDateTime()
        End If
    End Sub

    Protected Sub serverDatetime()
        Dim xDate As String = Request.QueryString("date")

        If xDate <> Nothing Then
            xDate = "'" + xDate + "'"
        Else 
            xDate = "getdate()"
        End If

        Dim vSql As String = " select getdate() as get_datetime "
        vSql += ", convert(varchar(10), getdate(), 103) as get_date "
        vSql += ", convert(varchar(8), getdate(), 108) as get_time "
        vSql += ", datepart(hour, getdate()) as get_hh "
        vSql += ", datepart(minute, getdate()) as get_mi "
        vSql += ", datediff(day, convert(datetime, " + xDate + ", 103), getdate()) AS diff_date "

        Response.Write(CP.rJsonDBv4(vSql, "DB106"))
    End Sub

    Protected Sub getShop()
        Response.Write("[]")
    End Sub

    Protected Sub getShopPermiss()
        'get shop ที่มีสิทธิ์ดูแลอยู่'
        'โดยจัดเรียงด้วย shop status เพื่อเอา shop ที่ warning!!! ไปแสดง '
        Dim xUemail As String = Request.QueryString("uemail")

        Dim vSql As String = "DECLARE @current_date DATETIME = CAST(GETDATE() AS DATE) "
        vSql += "DECLARE @t table( "
        vSql += "            history_date datetime,  shop_code varchar(50), "
        vSql += "            shop_dayoff tinyint, close_temp tinyint, "
        vSql += "            shop_open varchar(10), shop_close varchar(10), "
        vSql += "            open_time varchar(5), close_time varchar(5), "
        vSql += "            open_in_serv varchar(5), close_in_serv varchar(5), in_serv_diff int, "
        vSql += "            open_status int, close_status int, shop_status int "
        vSql += "            ); "
        vSql += "INSERT INTO @t EXEC st_open_close_3bbshop @current_date, @current_date, 0 "

        vSql += "DECLARE @t2 TABLE( "
        vSql += "    f02 varchar(30) NOT NULL, "
        vSql += "    f03 varchar(5) NOT NULL "
        vSql += "); "
        vSql += "INSERT INTO @t2 SELECT f02, f03 FROM rmsdat.dbo.m00860 WHERE f02 = '" + xUemail + "' "

        vSql += "SELECT TOP 1 temp.shop_code, latitude, longitude, "
        vSql += "CASE WHEN shop_status >= 3 THEN "
        vSql += "    9 "
        vSql += "ELSE "
        vSql += "    0 "
        vSql += "END warning "
        vSql += "FROM ( SELECT shop_code, shop_status, 'ALL' f03 FROM @T ) temp "

        vSql += "JOIN @T2 m86 "
        vSql += "ON temp.shop_code = m86.f03 or temp.f03 = m86.f03 "

        vSql += "JOIN shopStock "
        vSql += "ON temp.shop_code = shopStock.shop_code "
        
        vSql += "ORDER BY warning desc, newid() " 'newid() = random order' 

        dim vFields = New ArrayList
        vFields.Add("warning")
        vFields.Add("shop_code")
        vFields.Add("latitude")
        vFields.Add("longitude")

        'Response.Write(vSql)
        Response.Write(CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql, vFields, "DB105"))
    End Sub

    Protected Sub autoComplete()
        Dim xKeyword As String = Request.QueryString("term")
        Dim xRO As String = Request.QueryString("ro")

        Dim vSql As String = "select distinct shopStock.shop_code, "
        vSql += "shopStock.shop_code + ':' + shop_name + "
        vSql += "case "
        vSql += "    when province_name is null then "
        vSql += "        '' "
        vSql += "    else "
        vSql += "        ', ' + province_name "
        vSql += "end + "
        vSql += "case "
        vSql += "    when amphur_name is null then "
        vSql += "        '' "
        vSql += "    else "
        vSql += "        ', ' + amphur_name "
        vSql += "end + "
        vSql += "case "
        vSql += "    when storeplacetype_name is null then "
        vSql += "        '' "
        vSql += "    else "
        vSql += "        ', ' + storeplacetype_name "
        vSql += "end shop_label "

        vSql += vSql_main

        vSql += "left join THprovince "
        vSql += "on shopStock.province_code = THprovince.province_code "

        vSql += "left join THamphur "
        vSql += "on shopStock.amphur_code = THamphur.amphur_code and shopStock.province_code = THamphur.province_code "

        vSql += "left join storeplacetype "
        vSql += "on shopStock.storeplacetype_id = storeplacetype.storeplacetype_id "

        vSql += "LEFT JOIN rmsdat.dbo.m00030 m30 "
        vSql += "ON m30.f02 = shopStock.shop_code "

        vSql += "where " + vWhere_main

        If xRO <> Nothing Then
            vSql += "AND m30.f18 = '" + xRO + "' "
        End If

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
        vSql += "order by shopStock.shop_code"

        'Response.Write(vSql)
        Dim vField(1) As String
        vField(0) = "shop_code"
        vField(1) = "shop_label"

        Response.Write(CP.rJsonDB(Request.QueryString("qrs"), vSql, vField, "DB105"))
    End Sub

    Protected Sub getLatLng()
        Dim vSql As String = "select shop_code,latitude,longitude "
        vSql += "from shopStock "
        vSql += "where shop_code = '" + Request.QueryString("shop_code") + "' "
        vSql += "and latitude != '' and longitude != '' "

        dim vFields = New ArrayList
        vFields.Add("shop_code")
        vFields.Add("latitude")
        vFields.Add("longitude")

        'Response.Write(vSql)
        Response.Write(CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql, vFields, "DB105"))
    End Sub

    Protected Sub reportResult()
        Dim xRO As String = Request.QueryString("ro")
        Dim xAuditCamera As String = Request.QueryString("camera_permit")

        Dim vSql As String = "DECLARE @current_date DATETIME = CAST(GETDATE() AS DATE) "
        vSql += "DECLARE @t table( "
        vSql += "    history_date datetime,  shop_code varchar(50), "
        vSql += "    shop_dayoff tinyint, close_temp tinyint, "
        vSql += "    shop_open varchar(10), shop_close varchar(10), "
        vSql += "    open_time varchar(5), close_time varchar(5), "
        vSql += "    open_in_serv varchar(5), close_in_serv varchar(5), in_serv_diff int, "
        vSql += "    open_status int, close_status int, shop_status int "
        vSql += "); "

        vSql += "INSERT INTO @t EXEC st_open_close_3bbshop @current_date, @current_date, 0 "

        vSql += "SELECT m30.f18 ro, shopStock.shop_code, shop_name, "
        vSql += "shop_open, shop_close, open_time, close_time, "
        vSql += "open_in_serv, close_in_serv, shop_status, shop_dayoff, close_temp, "
        vSql += "latitude, longitude, shop_temp, "
        vSql += "'-' first_up, '-' last_up, 0 diff_minute, "
        'vSql += "case when all_note is null then '-' else dbo.replaceHTML(all_note) end all_note, "
        vSql += "case when notation_desc is null then '-' else notation_desc end notation_desc "

        If xAuditCamera = 1 Then
            vSql += ",camera_icon "
        Else
            vSql += ",'Null' camera_icon "
        End If
        
        vSql += "FROM @T temp "

        vSql += "LEFT JOIN shopStock "
        vSql += "ON shopStock.shop_code = temp.shop_code "

        vSql += "LEFT JOIN rmsdat.dbo.m00030 m30 "
        vSql += "ON m30.f02 = shopStock.shop_code "

        vSql += "LEFT JOIN ( "
        vSql += "   select shop_code, notation_desc, notation_date from notation_history "
        vSql += "   where notation_date = convert(date, @current_date, 103) "
        vSql += ") notation_history "
        vSql += "ON shopStock.shop_code = notation_history.shop_code "

        If xAuditCamera = 1 Then
            vSql += "left join vw_shop_camera shopCamera  "
            vSql += "on shopCamera.shop_code = shopStock.shop_code "
        End If

        vSql += "WHERE 1 = 1 "

        If xRO <> Nothing Then
            vSql += "AND m30.f18 = '" + xRO + "' "
        End If

        vSql += "ORDER BY shopStock.shop_code "

        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
        ' Response.Write(vSql)
    End Sub

    Protected Sub historyResult()
        Dim xStartDate As String = Request.QueryString("start")
        Dim xEndDate As String = Request.QueryString("end")
        Dim xMonth As String = Request.QueryString("month")
        Dim xRO As String = Request.QueryString("ro")
        Dim xShopCode As String = Request.QueryString("shop_code")

        Dim vSql As String = "select m30.f18 ro, openshop_history.shop_code, shopStock.shop_name, "
        vSql += "convert(varchar(10), openshop_history.history_date, 103) history_date, "
        vSql += "shop_dayoff, shop_open, shop_close, open_time, pmt_time, close_time, "
        vSql += "open_in_serv, close_in_serv, in_serv_diff, "
        vSql += "case when first_up is null then '-' else first_up end first_up, "
        vSql += "case when last_up is null then '-' else last_up end last_up, "
        vSql += "open_status, close_status, close_temp, "
        vSql += "case when all_note is null then '-' else dbo.replaceHTML(all_note) end all_note, "
        vSql += "case when notation_desc is null then '-' else notation_desc end notation_desc, "
        vSql += "openshop_history.history_date order_date "
        vSql += "from openshop_history "

        vSql += "left join shopStock "
        vSql += "on shopStock.shop_code = openshop_history.shop_code "

        vSql += "left join rmsdat.dbo.m00030 m30 "
        vSql += "on m30.f02 = shopStock.shop_code "

        vSql += "left join connectPOS_history "
        vSql += "on shopStock.shop_code = connectPOS_history.shop_code "
        vSql += "and openshop_history.history_date = connectPOS_history.history_date "

        vSql += "left join ( "
        vSql += "   select shop_code, all_note, history_date as note_date from note_history "
        vSql += "   where 1=1 "
        If xStartDate <> Nothing And xEndDate <> Nothing Then
            vSql += "   and history_date >= convert(date, '" + xStartDate + "', 103) "
            vSql += "   and history_date <= convert(date,'" + xEndDate + "', 103) "
        End If
        If xMonth <> Nothing Then
            vSql += "and month(history_date) = LEFT('" + xMonth + "',2) "
            vSql += "and YEAR(history_date)= right('" + xMonth + "',4)"
        End If
        vSql += ") note_history "
        vSql += "on shopStock.shop_code = note_history.shop_code "
        vSql += "and openshop_history.history_date = note_history.note_date "

        vSql += "left join ( "
        vSql += "   select shop_code, notation_desc, notation_date from notation_history "
        vSql += "   where 1=1 "
        If xStartDate <> Nothing And xEndDate <> Nothing Then
            vSql += "   and notation_date >= convert(date, '" + xStartDate + "', 103) "
            vSql += "   and notation_date <= convert(date,'" + xEndDate + "', 103) "
        End If
        If xMonth <> Nothing Then
            vSql += "and month(notation_date) = LEFT('" + xMonth + "',2) "
            vSql += "and YEAR(notation_date)= right('" + xMonth + "',4)"
        End If
        vSql += ") notation_history "
        vSql += "on shopStock.shop_code = notation_history.shop_code "
        vSql += "and openshop_history.history_date = notation_history.notation_date "

        vSql += "where 1=1 "

        If xStartDate <> Nothing And xEndDate <> Nothing Then
            vSql += "and openshop_history.history_date >= convert(date, '" + xStartDate + "', 103) "
            vSql += "and openshop_history.history_date <= convert(date,'" + xEndDate + "', 103) "
        End If

        If xMonth <> Nothing Then
            vSql += "and month(openshop_history.history_date) = LEFT('" + xMonth + "',2) "
            vSql += "and YEAR(openshop_history.history_date)= right('" + xMonth + "',4)"
        End If

        If xRO <> Nothing Then
            vSql += "and m30.f18 = '" + xRO + "' "
        End If

        If xShopCode <> Nothing Then
            vSql += "and openshop_history.shop_code = '" + xShopCode + "' "
        End If

        vSql += "order by order_date,m30.f18,openshop_history.shop_code "

        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
        'Response.Write(vSql)
    End Sub

    Protected Sub stateResult()
        Dim xStartDate As String = Request.QueryString("start")
        Dim xEndDate As String = Request.QueryString("end")
        Dim xRO As String = Request.QueryString("ro")
        Dim xCluster As String = Request.QueryString("cluster")

        Dim vSql As String = "select shopState.*, shop_name "
        vSql += "from ( "
        vSql += "    select ro, cluster, shop_code, COUNT(shop_code) AS total, "
        vSql += "    SUM(CASE WHEN open_status = 0 THEN 1 ELSE 0 END) AS open_normal, "
        vSql += "    SUM(CASE WHEN open_status = 1 THEN 1 ELSE 0 END) AS open_deley, "
        vSql += "    SUM(CASE WHEN open_status = 1 AND open_accident = 1 THEN 1 ELSE 0 END) AS open_deley_accident, "
        vSql += "    SUM(CASE WHEN close_status = 0 THEN 1 ELSE 0 END) AS close_normal, "
        vSql += "    SUM(CASE WHEN close_status = 1 THEN 1 ELSE 0 END) AS close_pre, "
        vSql += "    SUM(CASE WHEN close_status = 1 AND close_accident = 1 THEN 1 ELSE 0 END) AS close_pre_accident, "
        vSql += "    SUM(CASE WHEN open_status = 2 THEN 1 ELSE 0 END) AS not_open, "
        vSql += "    SUM(CASE WHEN open_status = 3 THEN 1 ELSE 0 END) AS day_off "
        vSql += "    from ( "
        vSql += "        select branch.area ro, branch.cluster cluster, openshop_history.shop_code, "
        vSql += "        open_status, close_status, open_accident, close_accident "
        vSql += "        from openshop_history "

        vSql += "        left join notation_history "
        vSql += "        on notation_history.shop_code = openshop_history.shop_code "
        vSql += "        and notation_history.notation_date = openshop_history.history_date "

        vSql += "        left join rmsdat.dbo.vw_branch_shop branch "
        vSql += "        on branch.shop_code = openshop_history.shop_code "

        vSql += "        where history_date >= convert(date, '" + xStartDate + "', 103) and history_date <= convert(date,'" + xEndDate + "', 103) "

        If xRO <> Nothing Then
            vSql += "    and branch.area = '" + xRO + "' "
        End If

        If xCluster <> Nothing Then
            vSql += "    and branch.cluster = '" + xCluster + "' "
        End If

        vSql += "    ) inStatus "

        vSql += "    group by inStatus.ro,inStatus.cluster,inStatus.shop_code "
        vSql += ") shopState "

        vSql += "left join shopStock "
        vSql += "on shopStock.shop_code = shopState.shop_code "

        vSql += "order by shopState.ro,shopState.cluster,shopState.shop_code "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
    End Sub

    Protected Sub loadArea()
        Dim vSql As String = "select distinct area as area_code, "
        vSql += "'RO' + area as area_name "
        vSql += "FROM [RMSDAT].[dbo].[vw_branch_shop] "
        vSql += "where [area] <> '' "
        vSql += "order by 1 "

        Dim vFields = New ArrayList
        vFields.Add("area_code")
        vFields.Add("area_name")

        Response.Write(CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql, vFields, "DB105"))
    End Sub

    Protected Sub loadCluster()
        Dim vSql As String = "select distinct prov.y04 as cluster_code, "
        vSql += "prov.y04 as cluster_name "
        vSql += "from m00860 perm, m02020 prov, m00030 branch "
        vSql += "where prov.f02 = branch.f12 and perm.f03 = branch.f02 "

        If Request.QueryString("ro") <> Nothing Then
            vSql += "and prov.y03 = '" + Request.QueryString("ro") + "' "
        End If

        vSql += "order by prov.y04 "

        Dim vFields = New ArrayList
        vFields.Add("cluster_code")
        vFields.Add("cluster_name")

        Response.Write(CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql, vFields, "DB106"))
    End Sub

    Protected Sub loadOnhand()
        Dim xCode As String = Request.QueryString("shop_code")

        Dim vSql As String = "select RO, shop SHOPCODE, cast(PHYSICALDATE as date) PHYSICALDATE "
        vSql += ", subgroup GRUOP_ITEM, groupName + ': '+ subgroupName ITEM, [56] ONHAND_QUANTITY "
        vSql += "from [dbo].[sumONHANDreport] "
        vSql += "where [56] > 0  "
        vSql += "and shop = '" + xCode + "' "
        vSql += "order by subgroup "

        dim vFields = New ArrayList
        vFields.Add("SHOPCODE")
        vFields.Add("RO")
        vFields.Add("PHYSICALDATE")
        vFields.Add("GRUOP_ITEM")
        vFields.Add("ITEM")
        vFields.Add("ONHAND_QUANTITY")

        'Response.Write(vSql)
        Response.Write(CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql, vFields, "DBOnhand"))
    End Sub

    Protected Sub connectionResultPpat()
        Dim xRO As String = Request.QueryString("ro")

        Dim vMySQL As String = "select shop_ro ro, POS_Shop_log.shop_code, "
        vMySQL += "DATE_FORMAT(min(shop_up), '%H:%i') first_up, "
        vMySQL += "DATE_FORMAT(max(shop_up), '%H:%i') last_up, "
        vMySQL += "DATE_FORMAT(max(shop_check_time), '%H:%i') last_check, "
        vMySQL += "TIMESTAMPDIFF(MINUTE, max(shop_up), max(shop_check_time)) diff_minute "
        vMySQL += "from POS_Shop_log "

        vMySQL += "left join POS_Shop on POS_Shop.shop_code = POS_Shop_log.shop_code "

        vMySQL += "where shop_up != '0000-00-00 00:00:00' "
        vMySQL += "and CURDATE() = DATE_FORMAT(shop_check_time, '%Y-%m-%d') "

        If xRO <> Nothing Then
            vMySQL += "and shop_ro = '" + xRO + "' "
        End If

        vMySQL += "group by POS_Shop_log.shop_code, DATE_FORMAT(shop_check_time, '%Y-%m-%d') "
        vMySQL += "order by POS_Shop_log.shop_code "

        Dim vDT As DataTable
        vDT = DBMYSQL.QueryDataTable(vMySQL)
        DBMYSQL.Close()

        '############################### Json Format Data
        dim vFields = New ArrayList
        vFields.Add("ro")
        vFields.Add("shop_code")
        vFields.Add("first_up")
        vFields.Add("last_up")
        vFields.Add("last_check")
        vFields.Add("diff_minute")

        Dim vJson = New List(Of Dictionary(Of String, String))()
        Dim vTemp As String = ""

        For i As Integer = 0 To vDT.Rows.Count - 1
            Dim vRes_row = New Dictionary(Of String, String)

            For Each vf As String In vFields
                vTemp = "Null"
                If Not IsDbNull(vDT.Rows(i).Item(vf)) Then
                    vTemp = vDT.Rows(i).Item(vf)
                End If
                vRes_row.Add(vf, CStr(vTemp))
            Next 

            vJson.Add(vRes_row)
        Next

        Dim serializer as New JavaScriptSerializer()
        Dim arrayJson As String = serializer.Serialize(vJson)
        Response.Write(arrayJson)
        '############################### Json Format Data

    End Sub

    Protected Sub connectPOSResult()
        Dim vSql As String = "SELECT * "
        vSql += "FROM connectPOS "
        vSql += "ORDER BY shop_code "

        dim vFields = New ArrayList
        vFields.Add("shop_code")
        vFields.Add("first_up")
        vFields.Add("last_up")
        vFields.Add("last_check")
        vFields.Add("diff_minute")

        Response.Write(CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql, vFields, "DB105"))
        'Response.Write(vSql)
        'Response.Write("[]")
    End Sub
    
    Protected Sub lineLog()
        Dim msg As String = Request.QueryString("msg")

        msg = msg.Replace("[*]", "%0A")

        Dim vSqlIn As String = "insert into lineLog "
        vSqlIn += "(msg,attime) "
        vSqlIn += "values( '" + msg + "', getdate()) "
                    
        Response.Write(DB105.ExecuteNonQuery(vSqlIn).ToString())
    End Sub

    Protected Sub saveLineLog()
        Dim msg As String = Request.QueryString("msg")

        msg = msg.Replace("[*]", "%0A")

        Dim vSqlIn As String = "insert into line_log "
        vSqlIn += "(msg,attime) "
        vSqlIn += "values( '" + msg + "', getdate()) "
                    
        Response.Write(DB105.ExecuteNonQuery(vSqlIn).ToString())
    End Sub

    Protected Sub saveLineNotifyLog()
        Dim msg As String = Request.QueryString("msg")
        Dim token As String = Request.QueryString("token")

        Dim vSqlIn As String = "insert into line_notify_log "
        vSqlIn += "(msg,token) "
        vSqlIn += "values( '" + msg + "', '" + token + "') "
                    
        Response.Write(DB105.ExecuteNonQuery(vSqlIn).ToString())
    End Sub

    Protected Sub getShopComplete()
        Dim xCode As String = Request.QueryString("shop_code")

        Dim vSql As String = "select distinct shopStock.shop_code, "
        vSql += "shopStock.shop_code + ':' + shop_name + "
        vSql += "case "
        vSql += "    when province_name is null then "
        vSql += "        '' "
        vSql += "    else "
        vSql += "        ', ' + province_name "
        vSql += "end + "
        vSql += "case "
        vSql += "    when amphur_name is null then "
        vSql += "        '' "
        vSql += "    else "
        vSql += "        ', ' + amphur_name "
        vSql += "end + "
        vSql += "case "
        vSql += "    when storeplacetype_name is null then "
        vSql += "        '' "
        vSql += "    else "
        vSql += "        ', ' + storeplacetype_name "
        vSql += "end shop_label "

        vSql += vSql_main

        vSql += "left join THprovince "
        vSql += "on shopStock.province_code = THprovince.province_code "

        vSql += "left join THamphur "
        vSql += "on shopStock.amphur_code = THamphur.amphur_code and shopStock.province_code = THamphur.province_code "

        vSql += "left join storeplacetype "
        vSql += "on shopStock.storeplacetype_id = storeplacetype.storeplacetype_id "

        vSql += "where " + vWhere_main
        vSql += "and shopStock.shop_code = '" + xCode + "' "

        dim vFields = New ArrayList
        vFields.Add("shop_code")
        vFields.Add("shop_label")

        'Response.Write(vSql)
        Response.Write(CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql, vFields, "DB105"))
    End Sub

    Protected Sub SP_REPORT_COVID()

        Dim vSql As String
        vSql = "EXEC SP_REPORT_COVID "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
    End Sub

    Protected Sub SP_REPORT_COVID_TOTAL()

        Dim vSql As String
        vSql = "EXEC SP_REPORT_COVID_TOTAL "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
    End Sub

    Protected Sub SP_REPORT_COVID_AREA_TOTAL()

        Dim vSql As String
        vSql = "EXEC SP_REPORT_COVID_AREA_TOTAL "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
    End Sub

    Protected Sub SP_REPORT_STORE_LOCATION_MAIL()

        Dim vSql As String
        vSql = "EXEC SP_REPORT_STORE_LOCATION_MAIL "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
    End Sub

    Protected Sub SP_REPORT_PREMIUM_RECEIVE_SHOP()

        Dim vSql As String
        vSql = "EXEC SP_REPORT_PREMIUM_RECEIVE_SHOP "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
    End Sub

    Protected Sub SP_REPORT_NEARBY_SHOP()
        Dim xKm_dis As String = Request.QueryString("km_dis")

        Dim vSql As String
        vSql = "EXEC SP_REPORT_NEARBY_SHOP '" & xKm_dis & "' "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
    End Sub

    Protected Sub getThisDateTime()
        Dim vSql As String = "select convert(varchar(10), getdate() ,103) ddmmyyyy, getdate() dtm "

        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
    End Sub

End Class
