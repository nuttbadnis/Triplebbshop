Imports System.Data
Imports System.Net
Imports System.Net.Mail
Imports System.Net.Mime
Imports System.Net.IPAddress

Partial Class updateStockShopTime
    Inherits System.Web.UI.Page
    Dim DB105 As New Cls_Data105
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
        
        CP.Analytics()
    End Sub

    Sub Submit_ShopStock(ByVal Source As Object, ByVal E As EventArgs)
        SaveData()
    End Sub

    Private Sub SaveData()
        Dim uemail As String = hide_uemail.Value
        Dim upermiss As String = hide_upermiss.Value

        Dim no_approve As String = hide_no_approve.Value
        Dim shop_code As String = Request.QueryString("shop_code")
        Dim follow_id As String = hide_follow_id.Value

        Dim approve_status As Integer = 0

        If follow_id <> Nothing And follow_id <> "" Then
            approve_status = 3
        End If

        Dim shop_open5 As String = txt_shop_open5.Value
        Dim shop_close5 As String = txt_shop_close5.Value
        Dim cash_open5 As String = txt_cash_open5.Value
        Dim cash_close5 As String = txt_cash_close5.Value
        Dim credit_open5 As String = txt_credit_open5.Value
        Dim credit_close5 As String = txt_credit_close5.Value

        Dim shop_open2 As String = txt_shop_open2.Value
        Dim shop_close2 As String = txt_shop_close2.Value
        Dim cash_open2 As String = txt_cash_open2.Value
        Dim cash_close2 As String = txt_cash_close2.Value
        Dim credit_open2 As String = txt_credit_open2.Value
        Dim credit_close2 As String = txt_credit_close2.Value

        Dim day_7 As Integer = 0

        If shop_open2 = shop_open5 And _
            shop_close2 = shop_close5 And _
            cash_open2 = cash_open5 And _
            cash_close2 = cash_close5 And _
            credit_open2 = credit_open5 And _
            credit_close2 = credit_close5 Then
            day_7 = 1
        End If

        If chk_same_evday.Checked Then
            day_7 = 1
            shop_open2 = shop_open5
            shop_close2 = shop_close5
            cash_open2 = cash_open5
            cash_close2 = cash_close5
            credit_open2 = credit_open5
            credit_close2 = credit_close5
        End If

        '********** dayoff **********'
        Dim dayoff_mon As Integer = 0
        Dim dayoff_tue As Integer = 0
        Dim dayoff_wed As Integer = 0
        Dim dayoff_thu As Integer = 0
        Dim dayoff_fri As Integer = 0
        Dim dayoff_sat As Integer = 0
        Dim dayoff_sun As Integer = 0

        If chk_off_sat.Checked Then
            dayoff_sat = 1
        End If
        If chk_off_sun.Checked Then
            dayoff_sun = 1
        End If
        ''********** dayoff **********'

        ''********** replace รับชำระ ด้วยเวลาเปิดปิดสำนักงาน 30/08/2016
        cash_open5 = shop_open5
        credit_open5 = shop_open5
        cash_close5 = shop_close5
        credit_close5 = shop_close5

        cash_open2 = shop_open2
        credit_open2 = shop_open2
        cash_close2 = shop_close2
        credit_close2 = shop_close2
        ''********** replace รับชำระ ด้วยเวลาเปิดปิดสำนักงาน 30/08/2016


        ''********** แก้ไขข้อมูล วันนักขัตฤกษ์ 03/09/2016
        Dim holiday_time As Integer = 0
        Dim ho_shop_open As String
        Dim ho_shop_close As String
        Dim ho_cash_open As String
        Dim ho_cash_close As String
        Dim ho_credit_open As String
        Dim ho_credit_close As String

        
        If chk_holiday_time5.Checked Then
            holiday_time = 5

            ho_shop_open = shop_open5
            ho_shop_close = shop_close5
            ho_cash_open = cash_open5
            ho_cash_close = cash_close5
            ho_credit_open = credit_open5
            ho_credit_close = credit_close5

        ElseIf chk_holiday_time2.Checked Then
            holiday_time = 2

            ho_shop_open = shop_open2
            ho_shop_close = shop_close2
            ho_cash_open = cash_open2
            ho_cash_close = cash_close2
            ho_credit_open = credit_open2
            ho_credit_close = credit_close2
        End If

        If chk_off_holiday.Checked Then
            holiday_time = 0
        End If
        ''********** แก้ไขข้อมูล วันนักขัตฤกษ์ 03/09/2016

        ''********** เพื่มตัวเลือกวันจันทร์ วันศุกร์ ใช้เวลาทำการเดียวกับ เมื่อ 18/05/2020
        Dim monday_time As Integer = 5
        Dim friday_time As Integer = 5

        If chk_monday_time5.Checked Then
            monday_time = 5
        ElseIf chk_monday_time2.Checked Then
            monday_time = 2
        End If

        If chk_friday_time5.Checked Then
            friday_time = 5
        ElseIf chk_friday_time2.Checked Then
            friday_time = 2
        End If
        ''********** เพื่มตัวเลือกวันจันทร์ วันศุกร์ ใช้เวลาทำการเดียวกับ เมื่อ 18/05/2020

        Dim vSqlIn As String = ""
        
        vSqlIn += "if exists (select * from approve_shopStock_daytime where shop_code = '" + shop_code + "' and approve_status = 0) "
        vSqlIn += "     begin "
        vSqlIn += "     update approve_shopStock_daytime set "
        vSqlIn += "     day_7='" & day_7 & "',dayoff_sat='" & dayoff_sat & "',dayoff_sun='" & dayoff_sun & "',"
        vSqlIn += "     wd_shop_open='" + shop_open5 + "',wd_shop_close='" + shop_close5 + "',"
        vSqlIn += "     wd_cash_open='" + cash_open5 + "',wd_cash_close='" + cash_close5 + "',"
        vSqlIn += "     wd_credit_open='" + credit_open5 + "',wd_credit_close='" + credit_close5 + "',"
        vSqlIn += "     we_shop_open='" + shop_open2 + "',we_shop_close='" + shop_close2 + "',"
        vSqlIn += "     we_cash_open='" + cash_open2 + "',we_cash_close='" + cash_close2 + "',"
        vSqlIn += "     we_credit_open='" + credit_open2 + "',we_credit_close='" + credit_close2 + "',"
        vSqlIn += "     ho_shop_open='" + ho_shop_open + "',ho_shop_close='" + ho_shop_close + "',"
        vSqlIn += "     ho_cash_open='" + ho_cash_open + "',ho_cash_close='" + ho_cash_close + "',"
        vSqlIn += "     ho_credit_open='" + ho_credit_open + "',ho_credit_close='" + ho_credit_close + "',"
        vSqlIn += "     holiday_time='" & holiday_time & "',"
        vSqlIn += "     monday_time='" & monday_time & "',"
        vSqlIn += "     friday_time='" & friday_time & "',"

        ''''''''''''''''''''''''''''''''''' ADMIN save and autoapprove step1(approve)
        If upermiss = "BACKOFFICE_ADMIN" Then
            vSqlIn += "approve_by='" + uemail + "',approve_date=getdate(), approve_status=9, admin_override=1 "
        ''''''''''''''''''''''''''''''''''' ADMIN save and autoapprove step1(approve)
        Else
            vSqlIn += "update_by='" + uemail + "',update_date=getdate(), follow_id='" & follow_id & "', approve_status='" & approve_status & "' "
        End If
        
        vSqlIn += "     where shop_code = '" + shop_code + "' and approve_status = 0 "
        vSqlIn += "     end "

        vSqlIn += "else "
        vSqlIn += "     begin "
        vSqlIn += "     insert into approve_shopStock_daytime ("
        vSqlIn += "     shop_code,day_7,dayoff_sat,dayoff_sun,"
        vSqlIn += "     wd_shop_open,wd_shop_close,"
        vSqlIn += "     wd_cash_open,wd_cash_close,"
        vSqlIn += "     wd_credit_open,wd_credit_close,"
        vSqlIn += "     we_shop_open,we_shop_close,"
        vSqlIn += "     we_cash_open,we_cash_close,"
        vSqlIn += "     we_credit_open,we_credit_close,"
        vSqlIn += "     ho_shop_open,ho_shop_close,"
        vSqlIn += "     ho_cash_open,ho_cash_close,"
        vSqlIn += "     ho_credit_open,ho_credit_close,"
        vSqlIn += "     holiday_time,follow_id,approve_status,"
        vSqlIn += "     monday_time,friday_time,"
        vSqlIn += "     update_by,update_date) "
        vSqlIn += "     values( "
        vSqlIn += "     '" + shop_code + "', '" & day_7 & "', '" & dayoff_sat & "' , '" & dayoff_sun & "', "
        vSqlIn += "     '" + shop_open5 + "', '" + shop_close5 + "', "
        vSqlIn += "     '" + cash_open5 + "', '" + cash_close5 + "', "
        vSqlIn += "     '" + credit_open5 + "', '" + credit_close5 + "', "
        vSqlIn += "     '" + shop_open2 + "', '" + shop_close2 + "', "
        vSqlIn += "     '" + cash_open2 + "', '" + cash_close2 + "', "
        vSqlIn += "     '" + credit_open2 + "', '" + credit_close2 + "', "
        vSqlIn += "     '" + ho_shop_open + "', '" + ho_shop_close + "', "
        vSqlIn += "     '" + ho_cash_open + "', '" + ho_cash_close + "', "
        vSqlIn += "     '" + ho_credit_open + "', '" + ho_credit_close + "', "
        vSqlIn += "     '" & holiday_time & "', '" & follow_id & "', '" & approve_status & "', "
        vSqlIn += "     '" & monday_time & "', '" & friday_time & "', "
        vSqlIn += "     '" + uemail + "', getdate()) "

        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        vSqlIn += "     insert into approve_log_shopStock_daytime ( "
        vSqlIn += "     no_approve,shop_code,day_7,"
        vSqlIn += "     dayoff_sat,dayoff_sun,"
        vSqlIn += "     wd_shop_open,wd_shop_close,"
        vSqlIn += "     wd_cash_open,wd_cash_close,"
        vSqlIn += "     wd_credit_open,wd_credit_close,"
        vSqlIn += "     we_shop_open,we_shop_close,"
        vSqlIn += "     we_cash_open,we_cash_close,"
        vSqlIn += "     we_credit_open,we_credit_close,"
        vSqlIn += "     ho_shop_open,ho_shop_close,"
        vSqlIn += "     ho_cash_open,ho_cash_close,"
        vSqlIn += "     ho_credit_open,ho_credit_close, "
        vSqlIn += "     holiday_time,monday_time,friday_time) "
        vSqlIn += "     select "
        vSqlIn += "     @@IDENTITY,dayoff.shop_code,d2.day_7, "
        vSqlIn += "     sat dayoff_sat,sun dayoff_sun, "
        vSqlIn += "     d5.shop_open wd_shop_open,d5.shop_close wd_shop_close, "
        vSqlIn += "     d5.cash_open wd_cash_open,d5.cash_close wd_cash_close, "
        vSqlIn += "     d5.credit_open wd_credit_open,d5.credit_close wd_credit_close, "
        vSqlIn += "     d2.shop_open we_shop_open,d2.shop_close we_shop_close, "
        vSqlIn += "     d2.cash_open we_cash_open,d2.cash_close we_cash_close, "
        vSqlIn += "     d2.credit_open we_credit_open,d2.credit_close we_credit_close, "
        vSqlIn += "     ho.shop_open ho_shop_open,ho.shop_close ho_shop_close, "
        vSqlIn += "     ho.cash_open ho_cash_open,ho.cash_close ho_cash_close, "
        vSqlIn += "     ho.credit_open ho_credit_open,ho.credit_close ho_credit_close, "
        vSqlIn += "     ho.holiday_time,ho.monday_time,ho.friday_time "
        vSqlIn += "     from shopStock_dayoff dayoff "
        vSqlIn += "     join shopStock_time d2 "
        vSqlIn += "     on d2.shop_code = dayoff.shop_code  "
        vSqlIn += "     and d2.day_type = 2 "
        vSqlIn += "     join shopStock_time d5 "
        vSqlIn += "     on d5.shop_code = dayoff.shop_code  "
        vSqlIn += "     and d5.day_type = 5 "
        vSqlIn += "     join shopStock_time ho "
        vSqlIn += "     on ho.shop_code = dayoff.shop_code  "
        vSqlIn += "     and ho.day_type = 0 "
        vSqlIn += "     where dayoff.shop_code = '" + shop_code + "' "
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        vSqlIn += "     end "

        ''''''''''''''''''''''''''''''''''' ADMIN save and autoapprove step2(save)
        If upermiss = "BACKOFFICE_ADMIN" Then
            vSqlIn += "update shopStock_dayoff set "
            vSqlIn += "sat = t2.dayoff_sat, sun = t2.dayoff_sun "
            vSqlIn += "from shopStock_dayoff t1 "
            vSqlIn += "inner join approve_shopStock_daytime t2 on t1.shop_code = t2.shop_code and t2.no_approve = '" + no_approve + "' "
            vSqlIn += "where t1.shop_code = '" + shop_code + "' "

            vSqlIn += "update shopstock_time set "
            vSqlIn += "update_by = t2.update_by, update_date = t2.update_date, day_7 = t2.day_7, "
            vSqlIn += "shop_open = t2.wd_shop_open, shop_close = t2.wd_shop_close, "
            vSqlIn += "cash_open = t2.wd_cash_open, cash_close = t2.wd_cash_close, "
            vSqlIn += "credit_open = t2.wd_credit_open, credit_close = t2.wd_credit_close, "
            vSqlIn += "holiday_time = t2.holiday_time, "
            vSqlIn += "monday_time = t2.monday_time, "
            vSqlIn += "friday_time = t2.friday_time "
            vSqlIn += "from shopstock_time t1 "
            vSqlIn += "inner join approve_shopStock_daytime t2 on t1.shop_code = t2.shop_code and t2.no_approve = '" + no_approve + "' "
            vSqlIn += "where t1.shop_code = '" + shop_code + "' and day_type = 5 "

            vSqlIn += "update shopstock_time set "
            vSqlIn += "update_by = t2.update_by, update_date = t2.update_date, day_7 = t2.day_7, "
            vSqlIn += "shop_open = t2.we_shop_open, shop_close = t2.we_shop_close, "
            vSqlIn += "cash_open = t2.we_cash_open, cash_close = t2.we_cash_close, "
            vSqlIn += "credit_open = t2.we_credit_open, credit_close = t2.we_credit_close, "
            vSqlIn += "holiday_time = t2.holiday_time, "
            vSqlIn += "monday_time = t2.monday_time, "
            vSqlIn += "friday_time = t2.friday_time "
            vSqlIn += "from shopstock_time t1 "
            vSqlIn += "inner join approve_shopStock_daytime t2 on t1.shop_code = t2.shop_code and t2.no_approve = '" + no_approve + "' "
            vSqlIn += "where t1.shop_code = '" + shop_code + "' and day_type = 2 "

            vSqlIn += "update shopstock_time set "
            vSqlIn += "update_by = t2.update_by, update_date = t2.update_date, day_7 = t2.day_7, "
            vSqlIn += "shop_open = t2.ho_shop_open, shop_close = t2.ho_shop_close, "
            vSqlIn += "cash_open = t2.ho_cash_open, cash_close = t2.ho_cash_close, "
            vSqlIn += "credit_open = t2.ho_credit_open, credit_close = t2.ho_credit_close, "
            vSqlIn += "holiday_time = t2.holiday_time, "
            vSqlIn += "monday_time = t2.monday_time, "
            vSqlIn += "friday_time = t2.friday_time "
            vSqlIn += "from shopstock_time t1 "
            vSqlIn += "inner join approve_shopStock_daytime t2 on t1.shop_code = t2.shop_code and t2.no_approve = '" + no_approve + "' "
            vSqlIn += "where t1.shop_code = '" + shop_code + "' and day_type = 0 "
        End If
        ''''''''''''''''''''''''''''''''''' ADMIN save and autoapprove step2(save)

        ' MyMessage.InnerHtml = vSqlIn

        If DB105.ExecuteNonQuery(vSqlIn).ToString() >= 1 Then
            ''''''''''''''''''''''''''''''''''' ADMIN save and autoapprove step3(sent mail prove)
            If upermiss = "BACKOFFICE_ADMIN" Then
                CP.SendMailActionProve(2,no_approve)
            ''''''''''''''''''''''''''''''''''' ADMIN save and autoapprove step3(sent mail prove)
            Else
                CP.SendMailAdmin(2,shop_code)
            End If

            Response.Redirect("admin_approval.aspx")
        Else
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alertscript", "alert('failed! ติดต่อ support pos');", True)
        End If
    End Sub
    
End Class
