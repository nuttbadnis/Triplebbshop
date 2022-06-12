Imports System.Data
Imports System.Net
Imports System.Net.Mail
Imports System.Net.Mime
Imports System.Net.IPAddress

Partial Class updateStockShopJson
    Inherits System.Web.UI.Page
    Dim CP As New Cls_Panu
    Dim DB105 As New Cls_Data105

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim qrs As String = ""

        If Request.QueryString("qrs") <> Nothing Then
            qrs = Request.QueryString("qrs")
        End If

        If qrs = "shoptype" Then
            loadShopType()
        End If

        If qrs = "shopplace" Then
            loadShopPlace()
        End If

        If qrs = "province" Then
            loadProvince()
        End If

        If qrs = "district" Then
            loadamphur()
        End If

        If qrs = "loadRoProvince" Then
            loadRoProvince()
        End If

        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        If qrs = "checkShopCode" Then
            checkShopCode()
        End If

        If qrs = "loadStockShopDesc" Then
            loadStockShopDesc()
        End If

        If qrs = "loadStockShopDescProve" Then
            loadStockShopDescProve()
        End If

        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        If qrs = "loadStockShopDayOff" Then
            loadStockShopDayOff()
        End If

        If qrs = "loadStockShopTime" Then
            loadStockShopTime()
        End If

        If qrs = "loadStockShopDayTimeProve" Then
            loadStockShopDayTimeProve()
        End If

        If qrs = "currentStockShopDayTime" Then
            currentStockShopDayTime()
        End If

        If qrs = "exampleStockShopDayTime" Then
            exampleStockShopDayTime()
        End If

        If qrs = "checkStockShopTimeHardCode" Then
            checkStockShopTimeHardCode()
        End If

        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        If qrs = "loadStockShopPicture" Then
            loadStockShopPicture()
        End If

        If qrs = "loadStockShopPictureProve" Then
            loadStockShopPictureProve()
        End If

        If qrs = "saveStockShopPicture" Then
            saveStockShopPicture()
        End If

        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        If qrs = "loadStockShopNote" Then
            loadStockShopNote()
        End If

        If qrs = "loadStockShopNoteProve" Then
            loadStockShopNoteProve()
        End If

        If qrs = "loadAllNotes" Then
            loadAllNotes()
        End If

        If qrs = "newStockShopNote" Then
            newStockShopNote()
        End If

        If qrs = "updateStockShopNote" Then
            updateStockShopNote()
        End If

        If qrs = "removeStockShopNote" Then
            removeStockShopNote()
        End If

        If qrs = "loadStockShopNoteEx" Then
            loadStockShopNoteEx()
        End If

        If qrs = "loadStockShopNoteURL" Then
            loadStockShopNoteURL()
        End If

        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        If qrs = "loadNotationByDate" Then
            loadNotationByDate()
        End If

        If qrs = "loadAllNoteByDate" Then
            loadAllNoteByDate()
        End If

        If qrs = "loadAllNoteByCurentDate" Then
            loadAllNoteByCurentDate()
        End If

        If qrs = "saveNotation" Then
            saveNotation()
        End If

        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

        If qrs = "loadDisableShopDesc" Then
            loadDisableShopDesc()
        End If

        If qrs = "followEndSubmit" Then
            followEndSubmit()
        End If

        If qrs = "followRejectSubmit" Then
            followRejectSubmit()
        End If

    End Sub

    Protected Sub loadShopType()
        Dim vSql As String = "select storeKiosType_id, "
        vSql += "case hide_vas when 1 then '*** ' else '' end + storeKiosType_name as storeKiosType_name "
        vSql += "from storeKiosType "
        vSql += "where disable = 0 "
        vSql += "order by storeKiosType_id"

        Dim vFields = New ArrayList
        vFields.Add("storeKiosType_id")
        vFields.Add("storeKiosType_name")

        Response.Write(CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql, vFields, "DB105"))
    End Sub

    Protected Sub loadShopPlace()
        Dim vSql As String = "select * from storeplacetype order by storeplacetype_id "
        
        Dim vFields = New ArrayList
        vFields.Add("storeplacetype_id")
        vFields.Add("storeplacetype_name")

        Response.Write(CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql, vFields, "DB105"))
    End Sub

    Protected Sub loadProvince()
        Dim vSql As String = "select * from THprovince order by province_name"

        Dim vFields = New ArrayList
        vFields.Add("province_code")
        vFields.Add("province_name")

        Response.Write(CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql, vFields, "DB105"))
    End Sub

    Protected Sub loadAmphur()
        Dim vSql As String = "select amphur_code, amphur_name, province_name from THamphur, THprovince "
        vSql += "where THamphur.province_code = THprovince.province_code "
        vSql += "and THprovince.province_code = '" + Request.QueryString("province_code") + "' "
        vSql += "order by amphur_name"

        Dim vFields = New ArrayList
        vFields.Add("amphur_code")
        vFields.Add("amphur_name")
        vFields.Add("province_name")

        'Response.Write(vSql)
        Response.Write(CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql, vFields, "DB105"))
    End Sub

    Protected Sub loadRoProvince()
        Dim vSql As String 
        vSql = "select ro, province_short "
        vSql += "from RMSDAT.dbo.vw_branch_shop "
        vSql += "where shop_code = '" & Request.QueryString("shop_code") & "' "

        ' Response.Write(CP.rJsonDBv4(vSql, "DB105"))

        Dim vJson As String = CP.rJsonDBv4(vSql, "DB105")

        If vJson.Length <= 2 Then
            vJson = vJson.Remove(vJson.Length - 2, 2)  
            vJson += "[{""ro"":"""",""province_short"":""""}]"
        End If

        Response.Write(vJson)
    End Sub

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Protected Sub checkShopCode()
        Dim vSql As String = "select * from shopStock "
        vSql += "where shop_code = '" + Request.QueryString("shop_code") + "'"

        Response.Write(CP.rGetCount(vSql, "DB105"))
    End Sub

    Protected Sub loadStockShopDesc()
        Dim vSql As String = "select shopStock.no,shopStock.shop_code,shopStock.shop_name,"
        vSql += "shopStock.province_code,shopStock.amphur_code,shopStock.storeplacetype_id,shopStock.storeKiosType_id,"
        vSql += "REPLACE(REPLACE(shopStock.shop_location, CHAR(13),' '), CHAR(10),' ') shop_location, "
        vSql += "REPLACE(REPLACE(shopStock.shop_address, CHAR(13),' '), CHAR(10),' ') shop_address, "
        vSql += "REPLACE(REPLACE(shopStock.shop_comment, CHAR(13),' '), CHAR(10),' ') shop_comment, "
        vSql += "shopStock.telephone,shopStock.fax,shopStock.latitude,shopStock.longitude,"
        vSql += "shopStock.shop_temp,shopStock.flag_promote,shopStock.shop_keyword,shopStock.line_id,shopStock.premium_receive_shop,"
        vSql += "approve_status "
        vSql += "from shopStock "

        vSql += "left join approve_shopStock "
        vSql += "on approve_shopStock.shop_code = shopStock.shop_code and approve_status <= 3 "
        vSql += "where shopStock.shop_code = '" + Request.QueryString("shop_code") + "' "

        Dim vFields = New ArrayList
        vFields.Add("no")
        vFields.Add("shop_code")
        vFields.Add("shop_name")
        vFields.Add("shop_location")
        vFields.Add("shop_address")
        vFields.Add("shop_comment")
        vFields.Add("province_code")
        vFields.Add("amphur_code")
        vFields.Add("storeplacetype_id")
        vFields.Add("storeKiosType_id")
        vFields.Add("telephone")
        vFields.Add("fax")
        vFields.Add("latitude")
        vFields.Add("longitude")
        vFields.Add("shop_temp")
        vFields.Add("flag_promote")
        vFields.Add("shop_keyword")
        vFields.Add("line_id")
        vFields.Add("premium_receive_shop")
        vFields.Add("approve_status")

        'Response.Write(vSql)
        Response.Write(CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql, vFields, "DB105"))
    End Sub

    Protected Sub loadStockShopDescProve()
        Dim vSql As String = "select no_approve,no_shopStock,shop_code,shop_name,"
        vSql += "province_code,amphur_code,storeplacetype_id,storeKiosType_id,"
        vSql += "REPLACE(REPLACE(shop_location, CHAR(13),' '), CHAR(10),' ') shop_location, "
        vSql += "REPLACE(REPLACE(shop_address, CHAR(13),' '), CHAR(10),' ') shop_address, "
        vSql += "REPLACE(REPLACE(shop_comment, CHAR(13),' '), CHAR(10),' ') shop_comment, "
        vSql += "telephone,fax,latitude,longitude,"
        vSql += "shop_temp,flag_promote,shop_keyword,line_id,premium_receive_shop,"
        vSql += "approve_status "
        vSql += "from approve_shopStock "
        vSql += "where shop_code = '" + Request.QueryString("shop_code") + "' and approve_status = '" + Request.QueryString("approve_status") + "' "

        Dim vFields = New ArrayList
        vFields.Add("no_approve")
        vFields.Add("no_shopStock")
        vFields.Add("shop_code")
        vFields.Add("shop_name")
        vFields.Add("shop_location")
        vFields.Add("shop_address")
        vFields.Add("shop_comment")
        vFields.Add("province_code")
        vFields.Add("amphur_code")
        vFields.Add("storeplacetype_id")
        vFields.Add("storeKiosType_id")
        vFields.Add("telephone")
        vFields.Add("fax")
        vFields.Add("latitude")
        vFields.Add("longitude")
        vFields.Add("shop_temp")
        vFields.Add("flag_promote")
        vFields.Add("shop_keyword")
        vFields.Add("line_id")
        vFields.Add("premium_receive_shop")
        vFields.Add("approve_status")

        Response.Write(CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql, vFields, "DB105"))
    End Sub

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Protected Sub loadStockShopDayOff()
        Dim vSql As String = "select shopStock_dayoff.shop_code,sat,sun,"
        vSql += "approve_status "
        vSql += "from shopStock_dayoff "

        vSql += "left join approve_shopStock_daytime "
        vSql += "on approve_shopStock_daytime.shop_code = shopStock_dayoff.shop_code and approve_status <= 3 "
        vSql += "where shopStock_dayoff.shop_code = '" + Request.QueryString("shop_code") + "' "

        Dim vFields = New ArrayList
        vFields.Add("shop_code")
        vFields.Add("sat")
        vFields.Add("sun")
        vFields.Add("approve_status")

        'Response.Write(vSql)
        Response.Write(CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql, vFields, "DB105"))
    End Sub

    Protected Sub loadStockShopTime()
        Dim vSql As String = "select shop_code,day_type,shop_open,shop_close,cash_open,cash_close,credit_open,credit_close,day_7,holiday_time,monday_time,friday_time "
        vSql += "from shopStock_time "
        vSql += "where shop_code = '" + Request.QueryString("shop_code") + "' "
        vSql += "order by day_type desc "

        Dim vFields = New ArrayList
        vFields.Add("shop_code")
        vFields.Add("day_type")
        vFields.Add("shop_open")
        vFields.Add("shop_close")
        vFields.Add("cash_open")
        vFields.Add("cash_close")
        vFields.Add("credit_open")
        vFields.Add("credit_close")
        vFields.Add("day_7")
        vFields.Add("holiday_time")
        vFields.Add("monday_time")
        vFields.Add("friday_time")

        'Response.Write(vSql)
        Response.Write(CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql, vFields, "DB105"))
    End Sub

    Protected Sub loadStockShopDayTimeProve()
        Dim vSql As String = "select * from approve_shopStock_daytime "
        vSql += "where shop_code = '" + Request.QueryString("shop_code") + "' and approve_status = '" + Request.QueryString("approve_status") + "' "

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
        vFields.Add("holiday_time")
        vFields.Add("monday_time")
        vFields.Add("friday_time")
        vFields.Add("approve_status")

        'Response.Write(vSql)
        Response.Write(CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql, vFields, "DB105"))
    End Sub

    Protected Sub currentStockShopDayTime()
        Dim vSql As String = "select time_open_weekday, time_open_weekend, day_off "
        vSql += "from vw_all_shopstock_time_str vw1 "
        vSql += "left join vw_all_shopstock_dayoff_str vw2 "
        vSql += "on vw1.shop_code = vw2.shop_code  "
        vSql += "where vw1.shop_code = '" + Request.QueryString("shop_code") + "' "

        'Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
    End Sub

    Protected Sub exampleStockShopDayTime()
        Dim uemail As String = Request.QueryString("uemail")
        Dim shop_code As String = Request.QueryString("shop_code")

        Dim chk_same_evday As String = Request.QueryString("chk_same_evday")
        Dim chk_off_sat As String = Request.QueryString("chk_off_sat")
        Dim chk_off_sun As String = Request.QueryString("chk_off_sun")
        Dim chk_holiday_time5 As String = Request.QueryString("chk_holiday_time5")
        Dim chk_holiday_time2 As String = Request.QueryString("chk_holiday_time2")
        Dim chk_off_holiday As String = Request.QueryString("chk_off_holiday")

        Dim chk_monday_time5 As String = Request.QueryString("chk_monday_time5")
        Dim chk_monday_time2 As String = Request.QueryString("chk_monday_time2")
        Dim chk_friday_time5 As String = Request.QueryString("chk_friday_time5")
        Dim chk_friday_time2 As String = Request.QueryString("chk_friday_time2")

        Dim shop_open5 As String = Request.QueryString("shop_open5")
        Dim shop_close5 As String = Request.QueryString("shop_close5")
        Dim shop_open2 As String = Request.QueryString("shop_open2")
        Dim shop_close2 As String = Request.QueryString("shop_close2")

        Dim day_7 As Integer = 0

        If shop_open2 = shop_open5 And shop_close2 = shop_close5 Then
            day_7 = 1
        End If

        If chk_same_evday = 1 Then
            day_7 = 1
            shop_open2 = shop_open5
            shop_close2 = shop_close5
        End If

        '********** dayoff **********'
        Dim dayoff_mon As Integer = 0
        Dim dayoff_tue As Integer = 0
        Dim dayoff_wed As Integer = 0
        Dim dayoff_thu As Integer = 0
        Dim dayoff_fri As Integer = 0
        Dim dayoff_sat As Integer = 0
        Dim dayoff_sun As Integer = 0

        If chk_off_sat = 1 Then
            dayoff_sat = 1
        End If
        If chk_off_sun = 1 Then
            dayoff_sun = 1
        End If
        ''********** dayoff **********'

        Dim holiday_time As Integer = 0
        Dim ho_shop_open As String
        Dim ho_shop_close As String
        
        If chk_holiday_time5 = 1 Then
            holiday_time = 5
            ho_shop_open = shop_open5
            ho_shop_close = shop_close5

        ElseIf chk_holiday_time2 = 1 Then
            holiday_time = 2
            ho_shop_open = shop_open2
            ho_shop_close = shop_close2
        End If

        If chk_off_holiday = 1 Then
            holiday_time = 0
        End If
        
        Dim monday_time As Integer = 5
        Dim friday_time As Integer = 5

        If chk_monday_time5 = 1 Then
            monday_time = 5
        ElseIf chk_monday_time2 = 1 Then
            monday_time = 2
        End If
        
        If chk_friday_time5 = 1 Then
            friday_time = 5
        ElseIf chk_friday_time2 = 1 Then
            friday_time = 2
        End If

        Dim vSqlIn As String = ""
        vSqlIn += "declare @shop_code varchar(50) = '" + shop_code + "' "
        vSqlIn += "declare @update_by varchar(50) = '" + uemail + "' "

        vSqlIn += "delete shopStock_dayoff_temp where shop_code = @shop_code and update_by = @update_by "
        vSqlIn += "delete shopStock_time_temp where shop_code = @shop_code and update_by = @update_by "

        vSqlIn += "insert into shopStock_dayoff_temp ("
        vSqlIn += "   shop_code, update_by, "
        vSqlIn += "   sat, sun "
        vSqlIn += ") values( "
        vSqlIn += "   @shop_code, @update_by, "
        vSqlIn += "   '" & dayoff_sat & "', '" & dayoff_sun & "' "
        vSqlIn += ") "

        vSqlIn += "insert into shopStock_time_temp ( "
        vSqlIn += "   day_type, shop_code, update_by, "
        vSqlIn += "   day_7, holiday_time, monday_time, friday_time, "
        vSqlIn += "   shop_open, shop_close, "
        vSqlIn += "   cash_open, cash_close, "
        vSqlIn += "   credit_open, credit_close "
        vSqlIn += ") values( "
        vSqlIn += "   5, @shop_code, @update_by, "
        vSqlIn += "   '" & day_7 & "', '" & holiday_time & "', '" & monday_time & "', '" & friday_time & "', "
        vSqlIn += "   '" & shop_open5 & "', '" & shop_close5 & "', "
        vSqlIn += "   '" & shop_open5 & "', '" & shop_close5 & "', "
        vSqlIn += "   '" & shop_open5 & "', '" & shop_close5 & "' "
        vSqlIn += ") "

        vSqlIn += "insert into shopStock_time_temp ( "
        vSqlIn += "   day_type, shop_code, update_by, "
        vSqlIn += "   day_7, holiday_time, monday_time, friday_time, "
        vSqlIn += "   shop_open, shop_close, "
        vSqlIn += "   cash_open, cash_close, "
        vSqlIn += "   credit_open, credit_close "
        vSqlIn += ") values( "
        vSqlIn += "   2, @shop_code, @update_by, "
        vSqlIn += "   '" & day_7 & "', '" & holiday_time & "', '" & monday_time & "', '" & friday_time & "', "
        vSqlIn += "   '" & shop_open2 & "', '" & shop_close2 & "', "
        vSqlIn += "   '" & shop_open2 & "', '" & shop_close2 & "', "
        vSqlIn += "   '" & shop_open2 & "', '" & shop_close2 & "' "
        vSqlIn += ") "

        vSqlIn += "insert into shopStock_time_temp ( "
        vSqlIn += "   day_type, shop_code, update_by, "
        vSqlIn += "   day_7, holiday_time, monday_time, friday_time, "
        vSqlIn += "   shop_open, shop_close, "
        vSqlIn += "   cash_open, cash_close, "
        vSqlIn += "   credit_open, credit_close "
        vSqlIn += ") values( "
        vSqlIn += "   0, @shop_code, @update_by, "
        vSqlIn += "   '" & day_7 & "', '" & holiday_time & "', '" & monday_time & "', '" & friday_time & "', "
        vSqlIn += "   '" & ho_shop_open & "', '" & ho_shop_close & "', "
        vSqlIn += "   '" & ho_shop_open & "', '" & ho_shop_close & "', "
        vSqlIn += "   '" & ho_shop_open & "', '" & ho_shop_close & "' "
        vSqlIn += ") "

        If DB105.ExecuteNonQuery(vSqlIn).ToString() Then
            Dim vSql As String = ""
            vSql += "select time_open_weekday, time_open_weekend, day_off "
            vSql += "from vw_all_shopstock_time_temp_str vw1 "
            vSql += "left join vw_all_shopstock_dayoff_temp_str vw2 "
            vSql += "on vw1.shop_code = vw2.shop_code and vw1.update_by = vw2.update_by "
            vSql += "where vw1.shop_code = '" & shop_code & "' and vw1.update_by = '" & uemail & "' " 

            ' Response.Write(vSql)
            Response.Write(CP.rJsonDBv4(vSql, "DB105"))
        End If
    End Sub

    Protected Sub checkStockShopTimeHardCode()
        Dim vSql As String = "select shop_code, time_open_weekday, time_open_weekend, day_off "
        vSql += "from shopStock_time_hardcode_memo "
        vSql += "where disable = 0 "
        vSql += "and shop_code = '" + Request.QueryString("shop_code") + "' "

        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
    End Sub

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Protected Sub loadStockShopPicture()
        Dim vSql As String = "select shopStock.no,shopStock.shop_code,"
        vSql += "shopStock.picture1,shopStock.picture2,shopStock.picture3,shopStock.img_map, "
        vSql += "approve_status "
        vSql += "from shopStock "

        vSql += "left join approve_shopStock_img "
        vSql += "on approve_shopStock_img.shop_code = shopStock.shop_code and approve_status = 0 "
        vSql += "where shopStock.shop_code = '" + Request.QueryString("shop_code") + "' "

        Dim vFields = New ArrayList
        vFields.Add("no")
        vFields.Add("shop_code")
        vFields.Add("picture1")
        vFields.Add("picture2")
        vFields.Add("picture3")
        vFields.Add("img_map")
        vFields.Add("approve_status")

        'Response.Write(vSql)
        Response.Write(CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql, vFields, "DB105"))
    End Sub

    Protected Sub loadStockShopPictureProve()
        Dim vSql As String = "select * "
        vSql += "from approve_shopStock_img "
        vSql += "where shop_code = '" + Request.QueryString("shop_code") + "' and approve_status = 0 "

        Dim vFields = New ArrayList
        vFields.Add("no_approve")
        vFields.Add("no_shopStock")
        vFields.Add("shop_code")
        vFields.Add("picture1")
        vFields.Add("picture2")
        vFields.Add("picture3")
        vFields.Add("img_map")
        vFields.Add("approve_status")

        'Response.Write(vSql)
        Response.Write(CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql, vFields, "DB105"))
    End Sub

    Protected Sub saveStockShopPicture_Back()
        Dim shop_code As String = Request.Form("shop_code")
        Dim uemail As String = Session("Uemail")

        Dim upload_img1 As String = ""
        Dim upload_img2 As String = ""
        Dim upload_img3 As String = ""
        Dim upload_img_map As String = ""

        If Request.Form("img1") <> "" Then
            upload_img1 = "picture1='" + Request.Form("img1") + "', "
        End If
        If Request.Form("img2") <> "" Then
            upload_img2 = "picture2='" + Request.Form("img2") + "', "
        End If
        If Request.Form("img3") <> "" Then
            upload_img3 = "picture3='" + Request.Form("img3") + "', "
        End If
        If Request.Form("img_map") <> "" Then
            upload_img_map = "img_map='" + Request.Form("img_map") + "', "
        End If

        If upload_img1 <> "" Or upload_img2 <> "" Or upload_img3 <> "" Or upload_img_map <> "" Then
            Dim vSqlIn As String = "update shopStock set "
            vSqlIn += upload_img1 + upload_img2 + upload_img3 + upload_img_map
            vSqlIn += "update_by='" + uemail + "', update_date=getdate() "
            vSqlIn += "where shop_code = '" + shop_code + "' "

            'Response.Write(vSqlIn)
            Response.Write(DB105.ExecuteNonQuery(vSqlIn).ToString())
        Else
            Response.Write("1")
        End If
                    
    End Sub

    Protected Sub saveStockShopPicture()
        Dim uemail As String = Request.Form("uemail")
        Dim upermiss As String = Request.Form("upermiss")

        Dim no_approve As String = Request.Form("no_approve")
        Dim no_shopStock As String = Request.Form("no_shopStock")
        Dim shop_code As String = Request.Form("shop_code")

        Dim picture1 As String = CP.rReplaceQuote(Request.Form("img1"))
        Dim picture2 As String = CP.rReplaceQuote(Request.Form("img2"))
        Dim picture3 As String = CP.rReplaceQuote(Request.Form("img3"))
        Dim img_map As String = CP.rReplaceQuote(Request.Form("img_map"))

        If picture1 <> "" Or picture2 <> "" Or picture3 <> "" Or img_map <> "" Then
            Dim vSqlIn As String = ""

            vSqlIn += "if exists (select * from approve_shopStock_img where no_shopStock = " + no_shopStock + " and approve_status = 0) "
            vSqlIn += "     update approve_shopStock_img set "
            vSqlIn += "     picture1='" + picture1 + "',picture2='" + picture2 + "',"
            vSqlIn += "     picture3='" + picture3 + "',img_map='" + img_map + "',"

            ''''''''''''''''''''''''''''''''''' ADMIN save and autoapprove step1
            If upermiss = "BACKOFFICE_ADMIN" Then
                vSqlIn += "approve_by='" + uemail + "',approve_date=getdate(), approve_status=9, admin_override=1 "
            ''''''''''''''''''''''''''''''''''' ADMIN save and autoapprove step1
            Else
                vSqlIn += "update_by='" + uemail + "',update_date=getdate() "
            End If

            vSqlIn += "     where no_shopStock = " + no_shopStock + " and approve_status = 0 "
            vSqlIn += "else "
            vSqlIn += "     begin "
            vSqlIn += "     insert into approve_shopStock_img ("
            vSqlIn += "     no_shopStock,shop_code,picture1,picture2,picture3,img_map,"
            vSqlIn += "     update_by,update_date) "
            vSqlIn += "     values( "
            vSqlIn += "     '" + no_shopStock + "', '" + shop_code + "', '" + picture1 + "', '" + picture2 + "' , '" + picture3 + "', '"+ img_map + "', "
            vSqlIn += "     '" + uemail + "', getdate()) "

            vSqlIn += "     insert into approve_log_shopStock_img ( "
            vSqlIn += "     no_approve,no_shopStock,shop_code,"
            vSqlIn += "     picture1,picture2,picture3,img_map) "
            vSqlIn += "     select "
            vSqlIn += "     @@IDENTITY,no,shop_code,"
            vSqlIn += "     picture1,picture2,picture3,img_map"
            vSqlIn += "     from shopstock "
            vSqlIn += "     where no = " & no_shopStock & " "
            vSqlIn += "     end "

            ''''''''''''''''''''''''''''''''''' ADMIN save and autoapprove step2
            If upermiss = "BACKOFFICE_ADMIN" Then
                vSqlIn += "update shopStock set "
                vSqlIn += "update_by = t2.update_by, update_date = t2.update_date, "
                vSqlIn += "picture1 = t2.picture1, picture2 = t2.picture2, picture3 = t2.picture3, img_map = t2.img_map "
                vSqlIn += "from shopStock t1 "
                vSqlIn += "inner join approve_shopStock_img t2 "
                vSqlIn += "on t1.no = t2.no_shopStock and t2.no_approve = '" + no_approve + "' "
                vSqlIn += "where t1.no = " + no_shopStock + " "
            End If
            ''''''''''''''''''''''''''''''''''' ADMIN save and autoapprove step2

            'Response.Write(vSqlIn)
            Response.Write(DB105.ExecuteNonQuery(vSqlIn).ToString())
            
            ''''''''''''''''''''''''''''''''''' ADMIN save and autoapprove step3(sent mail prove)
            If upermiss = "BACKOFFICE_ADMIN" Then
                CP.SendMailActionProve(3,no_approve)
            ''''''''''''''''''''''''''''''''''' ADMIN save and autoapprove step3(sent mail prove)
            Else
                CP.SendMailAdmin(3,shop_code)
            End If
        Else
            Response.Write("1")
        End If
                    
    End Sub

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Protected Sub loadStockShopNote()
        Dim no_note As String = Request.Form("no_note")

        Dim vSql As String = "select shn.No no_note,shn.shop_code, shn.start_display, shn.end_display, "
        vSql += "shn.note_desc, nsub.explain_desc, nsub.note_ex_id, shn.close_temp, shn.start_close, shn.end_close, approve_status, shn.upload_file, "
        vSql += "case when shn.upload_date is null then '' else CONVERT(VARCHAR(7), shn.upload_date, 126) end upload_file_path "
        vSql += "from shopStock_note shn "

        vSql += "left join shopStock_note_sub nsub "
        vSql += "on nsub.no = shn.no and disable = 0 "

        vSql += "left join approve_shopStock_note "
        vSql += "on approve_shopStock_note.no_note = shn.no and approve_status = 0 "
        vSql += "where shn.no = '" + Request.QueryString("no_note") + "' "

        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
    End Sub

    Protected Sub loadStockShopNoteProve()
        Dim vSql As String = "select no_approve, no_note, shop_code, start_display, end_display, "
        vSql += "note_desc, explain_desc, note_ex_id, close_temp, start_close, end_close, approve_status, upload_file, "
        vSql += "case when upload_date is null then '' else CONVERT(VARCHAR(7), upload_date, 126) end upload_file_path "
        vSql += "from approve_shopStock_note "

        If Request.QueryString("no_approve") <> Nothing Then
            vSql += "where no_approve = '" + Request.QueryString("no_approve") + "' and approve_status = 0 "
        Else
            vSql += "where no_note = '" + Request.QueryString("no_note") + "' and approve_status = 0 "
        End If

        'Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
    End Sub

    Protected Sub loadAllNotes20190417()
        Dim vSql As String = "select shop_code, shop_name "
        vSql += "from shopStock "
        vSql += "where shop_code = '" + Request.QueryString("shop_code") + "' "

        Dim vSql2 As String = "select stn.No,stn.shop_code,stn.start_display,stn.end_display, "
        vSql2 += "stn.note_desc,stn.close_temp,stn.start_close,stn.end_close,approve_status,ptn.row_delete approve_delete, "
        vSql2 += "stn.follow_id "
        vSql2 += "from shopStock_note stn "

        vSql2 += "left join approve_shopstock_note ptn "
        vSql2 += "on ptn.no_note = stn.no and approve_status = 0 "
        
        vSql2 += "where stn.row_delete = 0 and stn.shop_code = '" + Request.QueryString("shop_code") + "' "

        Dim vFields = New ArrayList
        vFields.Add("shop_code")
        vFields.Add("shop_name")

        Dim vFields2 = New ArrayList
        vFields2.Add("No")
        vFields2.Add("shop_code")
        vFields2.Add("start_display")
        vFields2.Add("end_display")
        vFields2.Add("note_desc")
        vFields2.Add("close_temp")
        vFields2.Add("start_close")
        vFields2.Add("end_close")
        vFields2.Add("approve_status")
        vFields2.Add("approve_delete")
        vFields2.Add("follow_id")

        Dim vJson As String = CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql, vFields, "DB105")

        If vJson.Length > 2 Then
            vJson = vJson.Remove(vJson.Length - 2, 2)  
            vJson += ", ""shop_notes"": "
            vJson += CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql2, vFields2, "DB105")
            vJson += "}]"
        End If

        Response.Write(vJson)
    End Sub

    Protected Sub loadAllNotes()
        Dim vSql As String = "select shop_code, shop_name "
        vSql += "from shopStock "
        vSql += "where shop_code = '" + Request.QueryString("shop_code") + "' "

        Dim vSql2 As String = "select stn.No,stn.shop_code,stn.note_desc,stn.close_temp, "
        vSql2 += "stn.start_display,stn.end_display,stn.start_close,stn.end_close, "
        vSql2 += "stn.start_display_date,stn.end_display_date,stn.start_close_date,stn.end_close_date, "
        vSql2 += "approve_status,ptn.row_delete approve_delete,"
        vSql2 += "stn.follow_id "
        vSql2 += "from vw_shopStock_Note_joined_sub stn "

        vSql2 += "left join approve_shopstock_note ptn "
        vSql2 += "on ptn.no_note = stn.no and approve_status = 0 "

        vSql2 += "where stn.row_delete = 0 "
        vSql2 += "and (stn.end_display_date >= cast(getdate() as date) or stn.end_close_date >= cast(getdate() as date)) "
        vSql2 += "and stn.shop_code = '" + Request.QueryString("shop_code") + "' "

        Dim vFields = New ArrayList
        vFields.Add("shop_code")
        vFields.Add("shop_name")

        Dim vFields2 = New ArrayList
        vFields2.Add("No")
        vFields2.Add("shop_code")
        vFields2.Add("note_desc")
        vFields2.Add("close_temp")
        vFields2.Add("start_display")
        vFields2.Add("end_display")
        vFields2.Add("start_close")
        vFields2.Add("end_close")
        vFields2.Add("approve_status")
        vFields2.Add("approve_delete")
        vFields2.Add("follow_id")
        vFields2.Add("start_display_date")
        vFields2.Add("end_display_date")
        vFields2.Add("start_close_date")
        vFields2.Add("end_close_date")

        Dim vJson As String = CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql, vFields, "DB105")

        If vJson.Length > 2 Then
            vJson = vJson.Remove(vJson.Length - 2, 2)  
            vJson += ", ""shop_notes"": "
            vJson += CP.rJsonDBv3_2(Request.QueryString("qrs"), vSql2, vFields2, "DB105")
            vJson += "}]"
        End If

        Response.Write(vJson)
    End Sub

    Protected Sub newStockShopNote()
        Dim uemail As String = Request.Form("uemail")
        Dim upermiss As String = Request.Form("upermiss")
        
        Dim shop_code As String = Request.Form("shop_code")

        Dim note_desc As String = CP.rReplaceSpecialSting(CP.rReplaceQuote(Request.Form("note_desc")))
        Dim explain_desc As String = CP.rReplaceQuote(Request.Form("explain_desc"))
        Dim note_ex_id As String = Request.Form("note_ex_id")

        Dim start_display As String = Request.Form("start_display")
        Dim end_display As String = Request.Form("end_display")

        Dim close_temp As Integer = Request.Form("close_temp")
        Dim start_close As String = Request.Form("start_close")
        Dim end_close As String = Request.Form("end_close")

        Dim upload_file As String = Request.Form("upload_file")

        If upload_file <> Nothing Then
            upload_file = "'" + upload_file + "', getdate()"
        Else
            upload_file = "'', NULL"
        End if

        Dim follow_id As String = Request.Form("follow_id")

        Dim approve_status As Integer = 0

        If follow_id <> Nothing And follow_id <> "" Then
            approve_status = 3
        End If

        Dim vSqlIn As String = ""
        vSqlIn += "     insert into approve_shopStock_note ("
        vSqlIn += "     no_note,shop_code,note_desc,explain_desc,note_ex_id,close_temp,"
        vSqlIn += "     start_display,end_display,start_close,end_close,"
        vSqlIn += "     update_by,update_date,upload_file,upload_date,"
        vSqlIn += "     follow_id,approve_status) "
        vSqlIn += "     values( "
        vSqlIn += "     '0', '" + shop_code + "', '" + note_desc + "', '" + explain_desc + "', '" + note_ex_id + "', '" & close_temp & "', "
        vSqlIn += "     '" + start_display + "', '" + end_display + "', '" + start_close + "', '" + end_close + "', "
        vSqlIn += "     '" + uemail + "', getdate(), " + upload_file + ", "
        vSqlIn += "     '" + follow_id + "', " & approve_status & ") "

        vSqlIn += "     insert into approve_log_shopStock_note ( "
        vSqlIn += "     no_approve,no_note,shop_code,note_desc,explain_desc,note_ex_id,close_temp,"
        vSqlIn += "     start_display,end_display,start_close,end_close) "
        vSqlIn += "     values( "
        vSqlIn += "     @@IDENTITY,0,'" + shop_code + "','','','','',"
        vSqlIn += "     '','','','') "
                    
        ' Response.Write(vSqlIn)
        Response.Write(DB105.ExecuteNonQuery(vSqlIn).ToString())

        If upermiss <> "BACKOFFICE_ADMIN" Then
            CP.SendMailAdmin(4,shop_code)
        End If
    End Sub

    Protected Sub updateStockShopNote()
        Dim uemail As String = Request.Form("uemail")
        Dim upermiss As String = Request.Form("upermiss")

        Dim no_note As String = Request.Form("no_note")
        Dim no_approve As String = Request.Form("no_approve")
        Dim shop_code As String = Request.Form("shop_code")

        Dim note_desc As String = CP.rReplaceSpecialSting(CP.rReplaceQuote(Request.Form("note_desc")))
        Dim explain_desc As String = CP.rReplaceQuote(Request.Form("explain_desc"))
        Dim note_ex_id As String = Request.Form("note_ex_id")

        Dim start_display As String = Request.Form("start_display")
        Dim end_display As String = Request.Form("end_display")

        Dim close_temp As Integer = Request.Form("close_temp")
        Dim start_close As String = Request.Form("start_close")
        Dim end_close As String = Request.Form("end_close")

        Dim upload_file As String = Request.Form("upload_file")

        Dim upload_file_up As String = ""
        Dim upload_file_in As String = "upload_file,upload_date"

        If upload_file <> Nothing Then
            upload_file_up = "upload_file = '" + upload_file + "', upload_date = getdate(), "
            upload_file_in = "'" + upload_file + "', getdate()"
        End if

        Dim follow_id As String = Request.Form("follow_id")

        If follow_id <> Nothing And follow_id <> "" Then
            follow_id = "NULL"
        Else
            follow_id = "'" & follow_id & "'"
        End If
        'follow id ใช้ insert เข้า shopstock_note เท่านั้น // ไม่ต้อง update ที่อื่นใด เพราะจะทำให้รายงานเพี้ยน

        Dim vSqlIn As String = ""

        vSqlIn += "if exists (select * from approve_shopstock_note where no_approve = '" + no_approve + "' and approve_status = 0) "
        vSqlIn += "     update approve_shopStock_note set "
        vSqlIn += "     note_desc='" + note_desc + "',explain_desc='" + explain_desc + "',note_ex_id='" + note_ex_id + "',close_temp='" & close_temp & "',"
        vSqlIn += "     start_display='" + start_display + "',end_display='" + end_display + "',"
        vSqlIn += "     start_close='" + start_close + "',end_close='" + end_close + "'," + upload_file_up

        ''''''''''''''''''''''''''''''''''' ADMIN save and autoapprove step1
        If upermiss = "BACKOFFICE_ADMIN" Then
            vSqlIn += "approve_by='" + uemail + "',approve_date=getdate(), approve_status=9, admin_override=1, row_delete=0 "
        ''''''''''''''''''''''''''''''''''' ADMIN save and autoapprove step1
        Else
            vSqlIn += "update_by='" + uemail + "',update_date=getdate(), row_delete=0 "
        End If

        vSqlIn += "     where no_approve = '" + no_approve + "' and approve_status = 0 "
        vSqlIn += "else "
        vSqlIn += "     begin "
        vSqlIn += "     insert into approve_shopStock_note ("
        vSqlIn += "     no_note,shop_code,note_desc,explain_desc,note_ex_id,close_temp,"
        vSqlIn += "     start_display,end_display,start_close,end_close,"
        vSqlIn += "     update_by,update_date,upload_file,upload_date) "
        vSqlIn += "     select "
        vSqlIn += "     '" + no_note + "', '" + shop_code + "', '" + note_desc + "', '" + explain_desc + "', '" + note_ex_id + "', '" & close_temp & "', "
        vSqlIn += "     '" + start_display + "', '" + end_display + "', '" + start_close + "', '" + end_close + "', "
        vSqlIn += "     '" + uemail + "', getdate(), " + upload_file_in + " "
        vSqlIn += "     from shopStock_note "
        vSqlIn += "     where no = '" & no_note & "' "

        vSqlIn += "     insert into approve_log_shopStock_note ( "
        vSqlIn += "     no_approve,no_note,shop_code,note_desc,explain_desc,note_ex_id,close_temp,"
        vSqlIn += "     start_display,end_display,start_close,end_close,"
        vSqlIn += "     upload_file,upload_date) "
        vSqlIn += "     select "
        vSqlIn += "     @@IDENTITY,shn.no,shop_code,note_desc,explain_desc,note_ex_id,close_temp,"
        vSqlIn += "     start_display,end_display,start_close,end_close, "
        vSqlIn += "     upload_file,upload_date "
        vSqlIn += "     from shopStock_note shn "
        vSqlIn += "     left join shopStock_note_sub nsub "
        vSqlIn += "     on nsub.no = shn.no and disable = 0 "

        vSqlIn += "     where shn.no = '" & no_note & "' "
        vSqlIn += "     end "

        ''''''''''''''''''''''''''''''''''' ADMIN save and autoapprove step2
        If upermiss = "BACKOFFICE_ADMIN" Then
            vSqlIn += "declare @no_note int "
            vSqlIn += "set @no_note = (select no_note from approve_shopstock_note where no_approve = '" & no_approve & "') "

            vSqlIn += "if (@no_note = 0) "
            vSqlIn += "   begin "
            vSqlIn += "    insert into shopstock_note ( "
            vSqlIn += "    shop_code,note_desc,start_display,end_display, "
            vSqlIn += "    close_temp,start_close,end_close,create_date,create_by, "
            vSqlIn += "    upload_file,upload_date, follow_id) "
            vSqlIn += "    select "
            vSqlIn += "    shop_code,note_desc,start_display,end_display, "
            vSqlIn += "    close_temp,start_close,end_close,update_date,update_by, "
            vSqlIn += "    upload_file,upload_date, " & follow_id & " "
            vSqlIn += "    from approve_shopstock_note "
            vSqlIn += "    where no_approve = '" & no_approve & "' "

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
            vSqlIn += "    where no_approve = '" & no_approve & "' "
            vSqlIn += "   end "
            vSqlIn += "else "
            vSqlIn += "   begin "
            vSqlIn += "    update shopstock_note set "
            vSqlIn += "    update_by = t2.update_by, update_date = t2.update_date, "
            vSqlIn += "    note_desc = t2.note_desc, start_display = t2.start_display, end_display = t2.end_display, "
            vSqlIn += "    close_temp = t2.close_temp, start_close = t2.start_close, end_close = t2.end_close, "
            vSqlIn += "    upload_file = t2.upload_file, upload_date = t2.upload_date "
            vSqlIn += "    from shopstock_note t1 "
            vSqlIn += "    inner join approve_shopstock_note t2 on t1.no = t2.no_note and t2.no_approve = '" & no_approve & "' "
            vSqlIn += "    where t1.no = @no_note "

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
            vSqlIn += "    where no_approve = '" & no_approve & "' "
            vSqlIn += "   end "
        End If
        ''''''''''''''''''''''''''''''''''' ADMIN save and autoapprove step2

        ' Response.Write(vSqlIn)
        Response.Write(DB105.ExecuteNonQuery(vSqlIn).ToString())
            
        ''''''''''''''''''''''''''''''''''' ADMIN save and autoapprove step3(sent mail prove)
        If upermiss = "BACKOFFICE_ADMIN" Then
            CP.SendMailActionProve(4,no_approve)
        ''''''''''''''''''''''''''''''''''' ADMIN save and autoapprove step3(sent mail prove)
        Else
            CP.SendMailAdmin(4,shop_code)
        End If
    End Sub

    Protected Sub removeStockShopNote()
        Dim uemail As String = Request.Form("uemail")
        Dim upermiss As String = Request.Form("upermiss")

        Dim no_note As String = Request.Form("no_note")
        Dim shop_code As String = Request.Form("shop_code")

        Dim vSqlIn As String = ""
        vSqlIn += "if exists (select * from approve_shopstock_note where no_note = '" + no_note + "' and approve_status = 0) "
        vSqlIn += "     update approve_shopStock_note set "
        vSqlIn += "     row_delete=1, update_by='" + uemail + "', update_date=getdate() "
        vSqlIn += "     where no_note = '" + no_note + "' and approve_status = 0 "
        vSqlIn += "else "
        vSqlIn += "    begin "
        vSqlIn += "     insert into approve_shopStock_note ("
        vSqlIn += "     no_note,shop_code,note_desc,explain_desc,note_ex_id,close_temp, "
        vSqlIn += "     start_display,end_display,start_close,end_close, "
        vSqlIn += "     row_delete,update_by,update_date) "
        vSqlIn += "     select "
        vSqlIn += "     shn.no,shop_code,note_desc,explain_desc,note_ex_id,close_temp,"
        vSqlIn += "     start_display,end_display,start_close,end_close, "
        vSqlIn += "     1, '" + uemail + "', getdate() "
        vSqlIn += "     from shopStock_note shn "
        vSqlIn += "     left join shopStock_note_sub nsub "
        vSqlIn += "     on nsub.no = shn.no and disable = 0 "
        vSqlIn += "     where shn.no = '" & no_note & "' "

        vSqlIn += "     insert into approve_log_shopStock_note ( "
        vSqlIn += "     no_approve,no_note,shop_code,note_desc,explain_desc,note_ex_id,close_temp,"
        vSqlIn += "     start_display,end_display,start_close,end_close) "
        vSqlIn += "     select "
        vSqlIn += "     @@IDENTITY,shn.no,shop_code,note_desc,explain_desc,note_ex_id,close_temp,"
        vSqlIn += "     start_display,end_display,start_close,end_close "
        vSqlIn += "     from shopStock_note shn "
        vSqlIn += "     left join shopStock_note_sub nsub "
        vSqlIn += "     on nsub.no = shn.no and disable = 0 "
        vSqlIn += "     where shn.no = '" & no_note & "' "
        vSqlIn += "    end "
            
        Response.Write(DB105.ExecuteNonQuery(vSqlIn).ToString())

        If upermiss <> "BACKOFFICE_ADMIN" Then
            CP.SendMailAdmin(4,shop_code)
        End If
    End Sub

    Protected Sub loadStockShopNoteEx()
        Dim vSql As String = "select note_ex_id, note_ex_title, "
        vSql += "note_ex_example, note_ex_textarea, note_close_shop "
        vSql += "from shopStock_note_ex "
        vSql += "where disable = 0 "

        If Request.QueryString("note_ex_id") <> Nothing Then
            vSql += "and note_ex_id = '" + Request.QueryString("note_ex_id") + "' "
        End If

        vSql += "order by note_ex_order "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
    End Sub

    Protected Sub loadStockShopNoteURL()
        Dim vSql As String = "select no, url_validate, tag_a_replace from shopStock_note_URL where disable = 0 "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
    End Sub

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Protected Sub loadAllNoteByDate()
        Dim vSql As String = "SELECT shop_code, all_note "
        vSql += "FROM note_history "
        vSql += "WHERE shop_code = '" + Request.QueryString("shop_code") + "' "
        vSql += "AND history_date = CONVERT(DATETIME,'" + Request.QueryString("date") + "',103) "

        'Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
    End Sub
    
    Protected Sub loadAllNoteByCurentDate()
        Dim vSql As String = "DECLARE @date DATETIME = CONVERT(DATETIME,'" + Request.QueryString("date") + "',103) "
        vSql += "SELECT * FROM ("
        vSql += "   SELECT shop_code, dbo.appendShopStockNote(shop_code,@date) all_note "
        vSql += "   FROM shopStock_note "
        vSql += "   WHERE shop_code = '" + Request.QueryString("shop_code") + "' "
        vSql += "   GROUP BY shop_code "
        vSql += ") T_all_note "
        vSql += "WHERE all_note is not null  "

        'Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
    End Sub

    Protected Sub loadNotationByDate()
        Dim vSql As String = "select shop_code, notation_date, notation_desc, "
        vSql += "notation_history.notation_type_id, notation_type_name, open_accident, close_accident, "
        vSql += "create_date, create_by, update_date, update_by "
        vSql += "from notation_history "
        vSql += "join notation_type on notation_type.notation_type_id = notation_history.notation_type_id "
        vSql += "WHERE shop_code = '" + Request.QueryString("shop_code") + "' "
        vSql += "AND notation_date = CONVERT(DATETIME,'" + Request.QueryString("date") + "',103) "

        'Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
    End Sub

    Protected Sub saveNotation()
        Dim uemail As String = Request.Form("uemail")
        Dim shop_code As String = Request.Form("shop_code")
        Dim notation_date As String = Request.Form("notation_date")
        Dim notation_desc As String = CP.rReplaceSpecialSting(CP.rReplaceQuote(Request.Form("notation_desc")))
        Dim notation_type As String = Request.Form("notation_type")
        Dim open_accident As String = Request.Form("open_accident")
        Dim close_accident As String = Request.Form("close_accident")

        Dim vSqlIn As String = "DECLARE @date DATETIME = CONVERT(DATETIME,'" + notation_date + "',103) "
        vSqlIn += "DECLARE @shop_code VARCHAR(10) = '" + shop_code + "' "

        vSqlIn += "if exists (select no from notation_history where shop_code = @shop_code and CAST(notation_date AS DATE) = @date) "
        vSqlIn += "    begin "
        vSqlIn += "    update notation_history set "
        vSqlIn += "    notation_desc='" + notation_desc + "', "
        vSqlIn += "    notation_type_id='" + notation_type + "', "
        vSqlIn += "    open_accident='" + open_accident + "', "
        vSqlIn += "    close_accident='" + close_accident + "', "
        vSqlIn += "    update_date=GETDATE(), update_by='" + uemail + "' "
        vSqlIn += "    where shop_code = @shop_code and CAST(notation_date AS DATE) = @date "
        vSqlIn += "    end "
        vSqlIn += "else "
        vSqlIn += "    begin "
        vSqlIn += "    insert into notation_history ( "
        vSqlIn += "    shop_code, notation_date, notation_desc, notation_type_id, open_accident, close_accident, "
        vSqlIn += "    create_date, create_by, update_date, update_by) "
        vSqlIn += "    values ( "
        vSqlIn += "    @shop_code, @date, '" + notation_desc + "', '" + notation_type + "', '" + open_accident + "', '" + close_accident + "', "
        vSqlIn += "    GETDATE(), '" + uemail + "', GETDATE(), '" + uemail + "') "
        vSqlIn += "    end "

        Response.Write(DB105.ExecuteNonQuery(vSqlIn).ToString())
    End Sub

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    Protected Sub loadDisableShopDesc()
        Dim vSql As String = "select shopStock.no, shopStock.shop_code, shopStock.shop_name,"
        vSql += "storeKiosType_name, dis_3bb_shop, dis_contract "
        vSql += "from shopStock "

        vSql += "left join storeKiosType "
        vSql += "on shopStock.storeKiosType_id = storeKiosType.storeKiosType_id "

        vSql += "where shopStock.shop_code = '" + Request.QueryString("shop_code") + "' "

        'Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
    End Sub

    Protected Sub followEndSubmit()
        'submit โดย follow rquest API URL http://posbcs.triplet.co.th/3bbTest/updateStockShopJson.aspx?qrs=followEndSubmit&request_id=..
        Dim vFollow_id As String = Request.QueryString("request_id")

        If Request.QueryString("request_id") <> Nothing Then
            followSubmit(Request.QueryString("request_id"), 100)
        End If
    End Sub

    Protected Sub followRejectSubmit()
        'submit โดย follow rquest API URL http://posbcs.triplet.co.th/3bbTest/updateStockShopJson.aspx?qrs=followRejectSubmit&request_id=..
        Dim vFollow_id As String = Request.QueryString("request_id")

        If Request.QueryString("request_id") <> Nothing Then
            followSubmit(Request.QueryString("request_id"), 105)
        End If
    End Sub

    Protected Sub followSubmit(ByVal vFollow_id As String, ByVal vFollow_Status As Integer)
        Dim vApprove_status As Integer = 0

        If vFollow_Status = 100 Then
            vApprove_status = 0 'รออนมุัติ

        Else If vFollow_Status = 105 Then
            vApprove_status = 8 'ไม่อนุมัติ

        End If

        Dim vSql As String = ""
        vSql += "select * from ( "
        vsql += "    select 1 prove_topic, follow_id, "
        vsql += "    shop_code, approve_status "
        vsql += "    from approve_shopStock "

        vsql += "    union select 2 prove_topic, follow_id, "
        vsql += "    shop_code, approve_status "
        vsql += "    from approve_shopStock_daytime "

        vsql += "    union select 3 prove_topic, '' follow_id, "
        vsql += "    shop_code, approve_status "
        vsql += "    from approve_shopStock_img "

        vsql += "    union select 4 prove_topic, follow_id, "
        vsql += "    shop_code, approve_status "
        vsql += "    from approve_shopstock_note "
        vsql += ") "
        vsql += "prove_alldata "

        vsql += "where follow_id = '" & vFollow_id & "'"

        Dim vDT As New DataTable
        vDT = DB105.GetDataTable(vSql)

        If vDT.Rows().Count() > 0 Then
            Dim vSqlIn As String = ""
            Dim vUrl As String = ""

            Try
                vUrl = HttpContext.Current.Request.Url.AbsoluteUri()
            Catch ex As Exception
            End Try

            If vDT.Rows(0).Item("prove_topic") = 1 Then
                vSqlIn = "insert into Log_followSubmit (follow_id, follow_status, prove_table, byUrl) "
                vSqlIn += "values ('" & vFollow_id & "', '" & vFollow_Status & "', 'approve_shopStock', '" & vUrl & "') "

                vSqlIn += "update approve_shopStock set "
                vSqlIn += "approve_status = '" & vApprove_status & "' "
                vSqlIn += ", approve_by = 'FollowRequest', approve_date = getdate() "
                vSqlIn += "where follow_id = '" & vFollow_id & "' "

            Else If vDT.Rows(0).Item("prove_topic") = 2 Then
                vSqlIn = "insert into Log_followSubmit (follow_id, follow_status, prove_table, byUrl) "
                vSqlIn += "values ('" & vFollow_id & "', '" & vFollow_Status & "', 'approve_shopStock_daytime', '" & vUrl & "') "

                vSqlIn += "update approve_shopStock_daytime set "
                vSqlIn += "approve_status = '" & vApprove_status & "' "
                vSqlIn += ", approve_by = 'FollowRequest', approve_date = getdate() "
                vSqlIn += "where follow_id = '" & vFollow_id & "' "

            Else If vDT.Rows(0).Item("prove_topic") = 3 Then
                vSqlIn = "insert into Log_followSubmit (follow_id, follow_status, prove_table, byUrl) "
                vSqlIn += "values ('" & vFollow_id & "', '" & vFollow_Status & "', 'approve_shopStock_img', '" & vUrl & "') "

                vSqlIn += "update approve_shopStock_img set "
                vSqlIn += "approve_status = '" & vApprove_status & "' "
                vSqlIn += ", approve_by = 'FollowRequest', approve_date = getdate() "
                vSqlIn += "where follow_id = '" & vFollow_id & "' "

            Else If vDT.Rows(0).Item("prove_topic") = 4 Then
                vSqlIn = "insert into Log_followSubmit (follow_id, follow_status, prove_table, byUrl) "
                vSqlIn += "values ('" & vFollow_id & "', '" & vFollow_Status & "', 'approve_shopstock_note', '" & vUrl & "') "

                vSqlIn += "update approve_shopstock_note set "
                vSqlIn += "approve_status = '" & vApprove_status & "' "
                vSqlIn += ", approve_by = 'FollowRequest', approve_date = getdate() "
                vSqlIn += "where follow_id = '" & vFollow_id & "' "
            End If
            
            If DB105.ExecuteNonQuery(vSqlIn).ToString() >= 1 And vApprove_status <> 8 And vApprove_status <> 9 Then
                CP.SendMailAdmin(vDT.Rows(0).Item("prove_topic"), vDT.Rows(0).Item("shop_code"))
            End If
        End If
    End Sub

End Class
