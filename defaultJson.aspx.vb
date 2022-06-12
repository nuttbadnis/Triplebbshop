Imports System.Data
Imports System.Web.Script.Serialization
Imports System.Collections.Generic

Partial Class _json
    Inherits System.Web.UI.Page
    Dim DB106 As New Cls_Data
    Dim DB105 As New Cls_Data105
    Dim CP As New Cls_Panu

    Dim vNLine As String = "[*NL]"

    Dim vSelect_shop As String = "select shopStock.shop_code, " + _
        "replace(replace(replace(shop_name, ',', ' '), CHAR(13),' '), CHAR(10),' ') shop_name, " + _
        "replace(replace(replace(shop_location, ',', ' '), CHAR(13),' '), CHAR(10),' ') shop_location, " + _
        "replace(replace(replace(shop_address, ',', ' '), CHAR(13),' '), CHAR(10),' ') shop_address, " + _
        "replace(replace(replace(shop_comment, ',', ' '), CHAR(13),' '), CHAR(10),' ') shop_comment, " + _
        "replace(telephone, ',', ' ') telephone, replace(fax, ',', ' ') fax, " + _
        "latitude, longitude, img_map, picture1, picture2, picture3, line_id, premium_receive_shop, " + _
        "time_open_weekday, time_open_weekend, day_off, " + _
        "shopStock.storeplacetype_id, shop_temp, flag_promote, hide_vas, pos_active, " + _
        "cast(delete_date as date) delete_date, " + _
        "case hide_vas when 1 then '*** ' else '' end + " + _
        "case when storeKiosType_name is null then '-' else storeKiosType_name end as storeKiosType_name "

    Dim vSql_main As String = "from shopStock " + _
        "left join THprovince on shopStock.province_code = THprovince.province_code " + _
        "left join THamphur on shopStock.amphur_code = THamphur.amphur_code and shopStock.province_code = THamphur.province_code " + _
        "left join storeplacetype on shopStock.storeplacetype_id = storeplacetype.storeplacetype_id " + _
        "left join storeKiosType on shopStock.storeKiosType_id = storeKiosType.storeKiosType_id "

    Dim vWhere_main As String = "delete_date is null and dis_3bb_shop = 0 "

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim qrs As String = ""

        If Request.QueryString("qrs") <> Nothing Then
            qrs = Request.QueryString("qrs")
        End If

        If qrs = "province" Then
            loadProvince()
        End If

        If qrs = "searchResult" Then
            searchResult()
        End If

        If qrs = "autoComplete" Then
            autoComplete(Request.QueryString("term"))
        End If

        If qrs = "autoCompleteAllShopOpenAndClose" Then
            autoCompleteAllShopOpenAndClose(Request.QueryString("term"))
        End If

        If qrs = "getSession" Then
            Response.Write(Session("Uemail"))
        End If

        If qrs = "loadAllShopStockNote" Then
            loadAllShopStockNote()
        End If

    End Sub

    Protected Sub autoComplete(ByVal vTerm As String)
        vTerm = vTerm.Replace(" ", "%")

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

        vSql += "where " + vWhere_main

        vSql += "and ( "
        vSql += "shopStock.shop_code like '%" + vTerm + "%' or "
        vSql += "shopStock.shop_name like '%" + vTerm + "%' or "
        vSql += "shopStock.shop_location like '%" + vTerm + "%' or "
        vSql += "shopStock.shop_address like '%" + vTerm + "%' or "
        vSql += "shopStock.shop_keyword like '%" + vTerm + "%' or "
        vSql += "province_name like '%" + vTerm + "%' or "
        vSql += "amphur_name like '%" + vTerm + "%' or "
        vSql += "storeplacetype_name like '%" + vTerm + "%' "
        vSql += ") "
        vSql += "order by shopStock.shop_code"

        'Response.Write(vSql)
        Dim vField(1) As String
        vField(0) = "shop_code"
        vField(1) = "shop_label"

        Response.Write(CP.rJsonDB(Request.QueryString("qrs"), vSql, vField, "DB105"))
    End Sub

    Protected Sub autoCompleteAllShopOpenAndClose(ByVal vTerm As String)
        vTerm = vTerm.Replace(" ", "%")

        Dim vSql As String = "select distinct shopStock.shop_code, "
        vSql += "case when delete_date is not null then '[CLOSE] ' when dis_3bb_shop = 1 then '[DISABLE] ' else '' end + "
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

        vSql += "where 1 = 1 "

        vSql += "and ( "
        vSql += "shopStock.shop_code like '%" + vTerm + "%' or "
        vSql += "shopStock.shop_name like '%" + vTerm + "%' or "
        vSql += "shopStock.shop_location like '%" + vTerm + "%' or "
        vSql += "shopStock.shop_address like '%" + vTerm + "%' or "
        vSql += "shopStock.shop_keyword like '%" + vTerm + "%' or "
        vSql += "province_name like '%" + vTerm + "%' or "
        vSql += "amphur_name like '%" + vTerm + "%' or "
        vSql += "storeplacetype_name like '%" + vTerm + "%' "
        vSql += ") "
        vSql += "order by shopStock.shop_code"

        'Response.Write(vSql)
        Dim vField(1) As String
        vField(0) = "shop_code"
        vField(1) = "shop_label"

        Response.Write(CP.rJsonDB(Request.QueryString("qrs"), vSql, vField, "DB105"))
    End Sub

    Protected Sub loadProvince()
        Dim vSql As String = "select * from THprovince "
        vSql += "where province_code != '73' and province_code != '74' and province_code != '75' and province_code != '76' "
        vSql += "order by province_name "

        Dim vField(1) As String
        vField(0) = "province_code"
        vField(1) = "province_name"

        Response.Write(CP.rJsonDB(Request.QueryString("qrs"), vSql, vField, "DB105"))
    End Sub

    Protected Sub searchResult()
    'Protected Sub searchResult_20172022()
        Dim xProvince As String = Request.QueryString("province_code")
        Dim xCode As String = Request.QueryString("shop_code")
        Dim xShopMode As String = Request.QueryString("mode")
        Dim xAuditCamera As String = Request.QueryString("camera_permit")

        Dim vSql As String = vSelect_shop 
        vSql += ", m30.f03 ro " 

        If xShopMode = "vasdefaultpage" Then
            vSql += ",row_number() OVER (ORDER BY m30.f19 desc, flag_promote desc) AS row_num "
        End If

        If xAuditCamera = 1 Then
            vSql += ",camera_icon "
        Else
            vSql += ",'Null' camera_icon "
        End If

        vSql += vSql_main

        vSql += "left join RMSDAT.dbo.m00030 m30 "
        vSql += "on m30.f02 = shopStock.shop_code "

        vSql += "left join ( select * from vw_all_shopstock_time_str ) shopTime "
        vSql += "on shopTime.shop_code = shopStock.shop_code "

        vSql += "left join ( select * from vw_all_shopstock_dayoff_str ) shopOff "
        vSql += "on shopOff.shop_code = shopStock.shop_code "

        If xAuditCamera = 1 Then
            vSql += "left join vw_shop_camera shopCamera  "
            vSql += "on shopCamera.shop_code = shopStock.shop_code "
        End If

        If xCode <> Nothing Then
            vSql += "where 1 = 1 " 
        Else
            vSql += "where " + vWhere_main
        End If

        If xShopMode = "justopen" Then
            vSql += "and just_open = 1 "
        Else If xShopMode = "novas" Then
            vSql += "and shop_temp = 1 and just_open = 0 "
        Else If xShopMode = "vasdefaultpage" Then
            vSql += "and (flag_promote = 1 or m30.f19 >= dateadd(month, -3, getdate())) "
            vSql += "and ((shop_temp = 0 and pos_active = 1) or (shop_temp != 0 and shop_temp != 1)) "
            vSql += "and storeKiosType.hide_vas = 0 and shopStock.shop_code != 'tssss' "
            vSql += "and delete_date is null "
        Else If xShopMode = "premium" Then
            vSql += "and premium_receive_shop = 1 "
        End If

        If xProvince <> Nothing Then
            vSql += "and shopstock.province_code = '" + xProvince + "' "
        End If

        If xCode <> Nothing Then
            vSql += "and shopstock.shop_code = '" + xCode + "' "
        End If

        If xShopMode = "justopen" Then
            vSql += "order by create_date desc, shopStock.shop_code "
        Else If xShopMode <> "vasdefaultpage" Then
            vSql += "order by shopStock.shop_code "
        End If

        Dim vFields = New ArrayList
        vFields.Add("ro")
        vFields.Add("shop_code")
        vFields.Add("shop_name")
        vFields.Add("shop_location")
        vFields.Add("shop_address")
        vFields.Add("shop_comment")
        vFields.Add("time_open_weekday")
        vFields.Add("time_open_weekend")
        vFields.Add("day_off")
        vFields.Add("telephone")
        vFields.Add("fax")
        vFields.Add("latitude")
        vFields.Add("longitude")
        vFields.Add("img_map")
        vFields.Add("picture1")
        vFields.Add("picture2")
        vFields.Add("picture3")
        vFields.Add("line_id")
        vFields.Add("premium_receive_shop")
        vFields.Add("shop_temp")
        vFields.Add("flag_promote")
        vFields.Add("storeKiosType_name")
        vFields.Add("storeplacetype_id")
        vFields.Add("hide_vas")
        vFields.Add("pos_active")
        vFields.Add("delete_date")
        vFields.Add("camera_icon")

        'Response.Write(vSql)
        Response.Write(rJsonShop(vSql, vFields))
    End Sub

    Function rJsonShop(ByVal vSql As String, ByVal vFields As ArrayList)

        Dim vJson As String = ""
        Dim vTemp As String = ""

        Dim vRes As New DataTable
        vRes = DB105.GetDataTable(vSql)

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
            End If

            If Not IsDbNull(vRes.Rows(i).Item("shop_code")) Then
                vJson += " ""remark_future"":""" + rJsonRemarkFuture(vRes.Rows(i).Item("shop_code")) + """ ,"
            End If
            'append remark'

            vJson = vJson.Remove(vJson.Length - 1, 1)
            vJson += "},"
        Next

        If vJson <> Nothing Then
            vJson = "{ ""search"" : [" + vJson
            vJson = vJson.Remove(vJson.Length - 1, 1)
            vJson += "]}"
        Else
            vJson = "{ ""search"" : []}"
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
        vSql += "AND dbo.dateTH2EN(start_display) <= CONVERT(DATE, getdate(), 103) "
        vSql += "AND dbo.dateTH2EN(end_display) >= CONVERT(DATE, getdate(), 103) "
        ' vSql += "and convert(datetime,start_display,103) <= convert(datetime,convert(varchar,dateadd(year,543, getdate()),103),103) "
        ' vSql += "and convert(datetime,end_display,103) >= convert(datetime,convert(varchar,dateadd(year,543, getdate()),103),103) "

        Dim vRes As New DataTable
        vRes = DB105.GetDataTable(vSql)

        For i As Integer = 0 To vRes.Rows().Count() - 1
            If Not IsDbNull(vRes.Rows(i).Item("note_desc")) Then
                ' vReturn += CP.rValidJson(vRes.Rows(i).Item("note_desc")) + vNLine
                vReturn += CP.rValidJson(vRes.Rows(i).Item("note_desc"))
                vReturn += "<br><span class='shop-description'>*แสดงผลวันที่ " & CP.rValidJson(vRes.Rows(i).Item("start_display")) & " ถึง " & CP.rValidJson(vRes.Rows(i).Item("end_display")) & "</span>"
                vReturn += vNLine
            End If
        Next

        If vReturn.Length >= 5 Then
            vReturn = vReturn.Remove(vReturn.Length - 5, 5)
            vReturn = rReplaceUrlRemark(vReturn)
        End If

        Return vReturn
    End Function

    Function rJsonRemarkFuture(ByVal vCode As String) As String 
        Dim vReturn As String = ""
        'vReturn = rDayoff(vCode)

        Dim vSql As String = "select No,shop_code,start_display,end_display,note_desc, "
        vSql += "close_temp,start_close,end_close "
        vSql += "from shopStock_note "
        vSql += "where row_delete = 0 and shop_code = '" + vCode + "' "
        vSql += "AND dbo.dateTH2EN(start_display) > CONVERT(DATE, getdate(), 103) "
        vSql += "AND dbo.dateTH2EN(end_display) >= CONVERT(DATE, getdate(), 103) "
        ' vSql += "and convert(datetime,start_display,103) <= convert(datetime,convert(varchar,dateadd(year,543, getdate()),103),103) "
        ' vSql += "and convert(datetime,end_display,103) >= convert(datetime,convert(varchar,dateadd(year,543, getdate()),103),103) "

        Dim vRes As New DataTable
        vRes = DB105.GetDataTable(vSql)

        For i As Integer = 0 To vRes.Rows().Count() - 1
            If Not IsDbNull(vRes.Rows(i).Item("note_desc")) Then
                vReturn += CP.rValidJson(vRes.Rows(i).Item("note_desc"))
                vReturn += "<br><span class='shop-description'>*แสดงผลวันที่ " & CP.rValidJson(vRes.Rows(i).Item("start_display")) & " ถึง " & CP.rValidJson(vRes.Rows(i).Item("end_display")) & "</span>"
                vReturn += vNLine
            End If
        Next

        If vReturn.Length >= 5 Then
            vReturn = vReturn.Remove(vReturn.Length - 5, 5)
            vReturn = rReplaceUrlRemark(vReturn)
        End If

        Return vReturn
    End Function

    Function rReplaceUrlRemark(ByVal vJsonRemark As String) As String
        Dim vSql As String = "select url_validate, tag_a_replace from shopStock_note_URL where disable = 0 "

        Dim vRes As New DataTable
        vRes = DB105.GetDataTable(vSql)

        For i As Integer = 0 To vRes.Rows().Count() - 1
            If Not IsDbNull(vRes.Rows(i).Item("url_validate")) And Not IsDbNull(vRes.Rows(i).Item("tag_a_replace")) Then
                vJsonRemark = vJsonRemark.Replace(vRes.Rows(i).Item("url_validate"), vRes.Rows(i).Item("tag_a_replace"))
            End If
        Next

        Return vJsonRemark
    End Function

    Protected Sub rShopCameraIcon()
        Dim vSql As String = "select camera_icon from shop_camera_model "
        vSql += "where camera_icon = 'o' and camera_model = '"+ Request.QueryString("model") + "' "

        Dim vRes As New DataTable
        vRes = DB105.GetDataTable(vSql)

        If vRes.Rows().Count() > 0 Then
            Response.Write("o")
        Else
            Response.Write("n")
        End If
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

End Class
