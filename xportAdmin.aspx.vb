Imports System.Data
Imports System.Text
Imports System.IO
Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports iTextSharp.text.html
Imports iTextSharp.text.html.simpleparser

Partial Class xportAdmin
    Inherits System.Web.UI.Page
    Dim DB105 As New Cls_Data105
    Dim CP As New Cls_Panu

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CP.Analytics()
        
        ExportMM()
    End Sub

    Private Sub ExportMM()
        Dim vSaveName As String = "admin_report"

        Dim xStatus As String = Request.QueryString("status")
        Dim pig_month As String = "getdate()"

        If Request.QueryString("pig_month") <> Nothing And Request.QueryString("pig_month") <> "" Then
            pig_month = "convert(date, '01/" + Request.QueryString("pig_month") + "', 103)"

            vSaveName += "_" + Request.QueryString("pig_month").Replace("/", "")
        End If

        Dim vSql As String
        vSql = "declare @date date = " + pig_month + " "

        vSql += "select follow_id as 'Follow Request' "
        vSql += ", RO, CLUSTER, shop_code as 'รหัสสาขา', shop_name as 'ชื่อสาขา' "
        vSql += ", status_name as 'สถานะ' "
        vSql += ", start_close_date as 'เริ่มปิดวันที่' "
        vSql += ", end_close_date as 'ปิดถึงวันที่' "
        vSql += ", diff_date as จำนวนวันที่ปิด "
        vSql += ", create_date as 'วันที่สร้าง', create_by as 'ผู้สร้าง' "
        vSql += ", note_desc as 'หมายเหตุแสดงบนเว็บ 3BB', explain_desc as 'คำอธิบายชี้แจงผู้อนุมัติ' "
        vSql += "from ( "

        vSql += "   select follow_id "
        vSql += "   , RO, CLUSTER, unionall.shop_code, shop_name "
        vSql += "   , approve_status, status_name, note_desc, explain_desc  "
        vSql += "   , start_close_date, end_close_date "
        vSql += "   , DATEDIFF(day, start_close_date, end_close_date) + 1 as diff_date "
        vSql += "   , unionall.create_date, unionall.create_by "

        vSql += "   from ( "
        vSql += "       select follow_id "
        vSql += "       , shop_code, approve_status, note_desc, explain_desc "
        vSql += "       , dbo.dateTH2EN(start_close) start_close_date "
        vSql += "       , dbo.dateTH2EN(end_close) end_close_date "
        vSql += "       , update_date create_date, update_by create_by "
        vSql += "       from approve_shopStock_note approve "
        vSql += "       where close_temp = 1 and follow_id is not null "
        vSql += "       and year(dbo.dateTH2EN(start_close)) = year(@date) "
        vSql += "       and month(dbo.dateTH2EN(start_close)) = month(@date) "
        vSql += "       and approve_status <> 9 "

        vSql += "       union all "

        vSql += "       select approve.follow_id "
        vSql += "       , approve.shop_code, approve_status, note.note_desc, note.explain_desc "
        vSql += "       , note.start_close_date, note.end_close_date "
        vSql += "       , note.create_date, note.create_by "
        vSql += "       from approve_shopStock_note approve "
        vSql += "       left join vw_shopStock_Note_joined_sub note "
        vSql += "       on note.shop_code = approve.shop_code "
        vSql += "       and note.follow_id = approve.follow_id "
        vSql += "       where approve.close_temp = 1 and approve.follow_id is not null "
        vSql += "       and year(start_close_date) = year(@date) "
        vSql += "       and month(start_close_date) = month(@date) "
        vSql += "       and approve_status = 9 "
        vSql += "   ) unionall "

        vSql += "   left join vw_shopStock_joined_pos shopStock "
        vSql += "   on shopStock.shop_code = unionall.shop_code "

        vSql += "   left join approve_status "
        vSql += "   on approve_status.status_id = unionall.approve_status "

        vSql += "   where 1 = 1 "

        If xStatus <> Nothing Then
            vSql += "   and approve_status = " + xStatus + " "

            vSaveName += "_status" + xStatus
        End If

        vSql += ") th "
        vSql += "order by ro, cluster, shop_code, approve_status, start_close_date, end_close_date "

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
