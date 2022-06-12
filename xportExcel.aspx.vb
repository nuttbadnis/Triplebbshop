Imports System.Data
Imports System.Text
Imports System.IO
Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports iTextSharp.text.html
Imports iTextSharp.text.html.simpleparser

Partial Class xportExcel
    Inherits System.Web.UI.Page
    Dim DB105 As New Cls_Data105
    Dim CP As New Cls_Panu

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CP.Analytics()
        
        ExportMM()
    End Sub

    Private Sub ExportMM()
        Dim vSaveName As String = "openshop_history_"
        Dim xStartDate As String = Request.QueryString("start")
        Dim xEndDate As String = Request.QueryString("end")
        Dim xMonth As String = Request.QueryString("month")
        Dim xRO As String = Request.QueryString("ro")
        Dim xShopCode As String = Request.QueryString("shop_code")

        Dim vSql As String = "select m30.f03 RO, openshop_history.shop_code รหัสสาขา, shopStock.shop_name ชื่อสาขา, "
        vSql += "convert(varchar(10), history_date, 103) วันที่, "
        vSql += "shop_open เปิดทำการ, open_time บันทึกเปิด, "
        vSql += "case when open_status = 3 and close_temp = 1 then 'ปิดชั่วคราว' else open_status.status_name end สถานะเปิด, "
        vSql += "shop_close ปิดทำการ, pmt_time บันทึกนำส่งเงิน, close_time บันทึกปิด, "
        vSql += "case when close_status = 3 and close_temp = 1 then 'ปิดชั่วคราว' else close_status.status_name end สถานะปิด, "
        ' vSql += "' ' ' ', open_in_serv ตอนเปิด, "
        vSql += "open_in_serv ตอนเปิด, "
        vSql += "close_in_serv + ' ' + case in_serv_diff when 0 then '' else '+' + cast(in_serv_diff as varchar) end ตอนปิด, "
        vSql += "case when all_note is null then '-' else dbo.replaceHTML(all_note) end หมายเหตุเฉพาะกรณี, "
        vSql += "case when notation_desc is null then '-' else notation_desc end โน๊ตประจำวัน "
        vSql += "from openshop_history "

        vSql += "left join shopStock "
        vSql += "on shopStock.shop_code = openshop_history.shop_code "

        vSql += "left join rmsdat.dbo.m00030 m30 "
        vSql += "on m30.f02 = shopStock.shop_code "

        vSql += "join open_status on open_status.status_id = openshop_history.open_status "
        vSql += "join close_status on close_status.status_id = openshop_history.close_status "

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

        If xRO <> Nothing Then
            vSql += "and m30.f03 = '" + xRO + "' "

            vSaveName += "RO" + xRO + "_"
        End If

        If xShopCode <> Nothing Then
            vSql += "and openshop_history.shop_code = '" + xShopCode + "' "

            vSaveName += xShopCode + "_"
        End If

        If xStartDate <> Nothing And xEndDate <> Nothing Then
            vSql += "and history_date >= convert(date, '" + xStartDate + "', 103) "
            vSql += "and history_date <= convert(date,'" + xEndDate + "', 103) "

            vSaveName += xStartDate.Replace("/", "")

            If xStartDate <> xEndDate Then
                vSaveName += "_to_" + xEndDate.Replace("/", "")
            End If
        End If

        If xMonth <> Nothing Then
            vSql += "and month(history_date) = LEFT('" + xMonth + "',2) "
            vSql += "and YEAR(history_date)= right('" + xMonth + "',4)"

            vSaveName += xMonth.Replace("/", "")
        End If

        vSql += "order by history_date,m30.f03,openshop_history.shop_code "

        vSaveName += ".xls"

        Dim DT As New DataTable
        DT = DB105.GetDataTable(vSql)

        'Create a dummy GridView
        Dim GridView1 As New GridView()
        GridView1.AllowPaging = False
        GridView1.DataSource = dt
        GridView1.DataBind()
 
        Response.Clear()
        Response.Buffer = True
        Response.AddHeader("content-disposition", _
             "attachment;filename=" + vSaveName)
        Response.Charset = ""
        Response.ContentType = "application/vnd.ms-excel"
        Dim sw As New StringWriter()
        Dim hw As New HtmlTextWriter(sw)
 
        For i As Integer = 0 To GridView1.Rows.Count - 1
          'Apply text style to each Row
           GridView1.Rows(i).Attributes.Add("class", "textmode")
        Next
        GridView1.RenderControl(hw)
 
        'style to format numbers to string
        Dim style As String = "<style> .textmode{mso-number-format:\@;}</style>"
        Response.Write(style)
        Response.Output.Write(sw.ToString())
        Response.Flush()
        Response.End()
        ' Response.Write(vSql)
    End Sub
End Class
