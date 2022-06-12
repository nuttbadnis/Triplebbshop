Imports System.Data

Partial Class _maintenance
    Inherits System.Web.UI.Page
    Dim CP As New Cls_Panu
    Dim DBTBBAPP As New Cls_DataTBBAPP

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    	xmaintenance()

        CP.Analytics()
    End Sub

    Public Sub xmaintenance()
        Try
        
            Dim vDT As New DataTable
            Dim vSql As String = "EXEC XXX_MEMBERRPT_MAINTAIN"
            vDT = DBTBBAPP.GetDataTable(vSql)

            If vDT.Rows().Count() > 0 Then
            	If vDT.Rows(0).Item("maintain_mss") <> "" Then
            		txt_h2.InnerHtml() = vDT.Rows(0).Item("maintain_mss")
            	End If
            End If

        Catch ex As Exception

        End Try
        
    End Sub
End Class
