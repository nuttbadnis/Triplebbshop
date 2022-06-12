Imports System.Data
Imports System.Text
Imports System.IO
Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports iTextSharp.text.html
Imports iTextSharp.text.html.simpleparser

Partial Class xporCovidReport
    Inherits System.Web.UI.Page
    Dim DB105 As New Cls_Data105
    Dim CP As New Cls_Panu

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CP.Analytics()
        
            ExportData()
    End Sub

    Private Sub ExportData()
            Dim vSql As String 
            vSql += "EXEC dbo.SP_REPORT_COVID_EXPORT "
            
            Dim vSaveName As String = "COVID_REPORT"
            vSaveName += "_" + DateTime.Now.ToString("yyyyMMdd_HHmmss")
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
