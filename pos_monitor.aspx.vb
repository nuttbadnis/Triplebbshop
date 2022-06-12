Imports System.Data

Partial Class pos_monitor
    Inherits System.Web.UI.Page
    Dim DB105 As New Cls_Data105
    Dim CP As New Cls_Panu

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim vRes As New DataTable

        Dim vTable As String = ""
        Dim vSql As String = ""
        vSql += "select * "
        vSql += "from pos_monitor "

        vRes = DB105.GetDataTable(vSql)

        If vRes.Rows().Count() > 0 Then
            vTable = "<table class='table' style='width: auto; margin: 15px auto; text-align: center;'><tbody>"

            For i As Integer = 0 To vRes.Rows().Count() - 1
                vTable += "<tr>"
                vTable += "<td>" & (i+1) & ".</td>"
                vTable += "<td>" + vRes.Rows(i).Item("shop_code") + "</td>"
                vTable += "<td>" + vRes.Rows(i).Item("remark") + "</td>"
                vTable += "<td><a OnClick='JavaScript:fnDel(""" + vRes.Rows(i).Item("shop_code") + """);' class='button-a'><span class='glyphicon glyphicon-remove'></span></a></td>"
                vTable += "</tr>"
            Next

            vTable += "</tbody></table>"
        End If

        table_pos_monitor.InnerHtml = vTable
    End Sub

    Sub Submit_Del(ByVal Source As Object, ByVal E As EventArgs)
        Dim vSqlIn As String = ""
        vSqlIn += "delete pos_monitor where shop_code = '" + hide_shop_code.Value + "' "

        If DB105.ExecuteNonQuery(vSqlIn).ToString() >= 1 Then
            Response.Redirect("pos_monitor.aspx")
        Else
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alertscript", "alert('Error?');", True)
        End If
    End Sub

    Sub Submit_Save(ByVal Source As Object, ByVal E As EventArgs)
        If txt_shop_code.Value.Trim() <> "" AND txt_shop_code.Value.Trim().Length() = 5 Then
            SaveData()
        Else
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alertscript", "alert('Shop Code Invalid!!');", True)
        End If

    End Sub

    Public Sub SaveData()
        Dim vSqlIn As String = ""
        vSqlIn += "insert into pos_monitor (shop_code, remark) "
        vSqlIn += "values ('" + txt_shop_code.Value.Trim().ToUpper() + "', '" + txt_remark.Value + "') "

        If DB105.ExecuteNonQuery(vSqlIn).ToString() >= 1 Then
            Response.Redirect("pos_monitor.aspx")
        Else
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alertscript", "alert('Error?');", True)
        End If
    End Sub
End Class
