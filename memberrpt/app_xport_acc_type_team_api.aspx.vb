Imports System.Data

Partial Class app_xport_acc_type_team
    Inherits System.Web.UI.Page
    Dim CP As New Cls_Panu

    Dim xCluster As string = ""
    Dim xStartDate As string = ""
    Dim xEndDate As string = ""
    Dim vSql As string = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("cluster") <> Nothing Then
            xCluster = Request.QueryString("cluster")
            xStartDate = Request.QueryString("start_date")
            xEndDate = Request.QueryString("end_date")

            vSql += "DECLARE @d1 date = convert(date, '" + xStartDate + "', 103) "
            vSql += "DECLARE @d2 date = convert(date, '" + xEndDate + "', 103) "

            vSql += "EXEC dbo.SP_EXPORT_L20_ACCTYPETEAM '" & xCluster & "', @d1, @d2"
        
            Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
        End If
    End Sub
End Class
