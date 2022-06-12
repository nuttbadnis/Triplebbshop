Imports System.Data
Imports System.Text
Imports System.IO
Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports iTextSharp.text.html
Imports iTextSharp.text.html.simpleparser

Partial Class app_xport_acc_type_team
    Inherits System.Web.UI.Page
    Dim DB105 As New Cls_Data105
    Dim CP As New Cls_Panu
    Dim DBTBBAPP As New Cls_DataTBBAPP

    Dim xCluster As string = ""
    Dim xStartDate As string = ""
    Dim xEndDate As string = ""
    Dim vSql As string = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CP.AnalyticsMemberRPT()

        If Request.QueryString("cluster") <> Nothing Then
            xCluster = Request.QueryString("cluster")
            xStartDate = Request.QueryString("start_date")
            xEndDate = Request.QueryString("end_date")

            vSql += "DECLARE @d1 date = convert(date, '" + xStartDate + "', 103) "
            vSql += "DECLARE @d2 date = convert(date, '" + xEndDate + "', 103) "

            vSql += "EXEC dbo.SP_EXPORT_L20_ACCTYPETEAM '" & xCluster & "', @d1, @d2"
        
            If Request.QueryString("res") <> Nothing Then
                If Request.QueryString("res") = "json" Then
                    Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
                    Exit Sub
                End If
            End If

            ExportData()
        End If
    End Sub

    Private Sub ExportData()
        Dim DT As New DataTable
        DT = DBTBBAPP.GetDataTable(vSql)

        Dim arrStartDate As String() = xStartDate.Split(New Char() {"/"c})
        Dim arrEndDate As String() = xEndDate.Split(New Char() {"/"c})

        Dim vSaveName As String = "MEMBERRPT_L20_ACCTYPETEAM_[" + xCluster + "]"
        vSaveName += "_[" & arrStartDate(2) & arrStartDate(1) & arrStartDate(0) & "-" & arrEndDate(2) & arrEndDate(1) & arrEndDate(0) & "]"
        vSaveName += "_" + DateTime.Now.ToString("yyyyMMdd_HHmmss")
        vSaveName += ".xls"

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
