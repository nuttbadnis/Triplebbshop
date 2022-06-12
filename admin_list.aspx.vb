Imports System.Data

Partial Class admin_list
    Inherits System.Web.UI.Page
    Dim DB106 As New Cls_Data
    Dim DBMPer As New Cls_DataMPermiss
    Dim CP As New Cls_Panu

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        hide_this_edit.Value() = "BACKOFFICE_ADMIN"
        hide_this_edit_by.Value() = "SUPPOS"

        If Session("Uemail") IsNot Nothing Then

            hide_uemail.Value() = Session("Uemail")
            user_logon.InnerHtml = "<span class='glyphicon glyphicon-off user_logon' aria-hidden='true'></span> " + Session("Uemail")

            If CP.rCheckPermiss() > 0 Then
                CP.rCheckPermissPOS()
                hide_upermiss.Value() = Session("upermiss")
                hide_token.Value() = Session("token")
                Session.Remove("upermiss")
            End If
        End If

        If CP.rContractPermiss() = 0 Then
            li_contract.Visible = False
        End If

        ' loadData()

        CP.Analytics()
    End Sub

    Sub loadData()

        Dim vRes As New DataTable
        Dim vTable As String = ""

        Dim vSql As String = "select authen_id, emp_id, uemail, ro, cluster, province, "
        vSql += "jas_employeeId, jas_thaiFullname, jas_position, jas_department, jas_update "
        vSql += "from vw_user_mpermiss "
        vSql += "where permission_id = '" & hide_this_edit.Value & "' "
        vSql += "order by uemail "

        vRes = DBMPer.GetDataTable(vSql)

        If vRes.Rows().Count() > 0 Then
            For i As Integer = 0 To vRes.Rows().Count() - 1
                vTable += "<tr id='" + vRes.Rows(i).Item("authen_id") + "'>"
                vTable += "<td>" + vRes.Rows(i).Item("uemail") + "</td>"
                ' vTable += "<td>" + vRes.Rows(i).Item("ro") + "</td>"
                ' vTable += "<td>" + vRes.Rows(i).Item("cluster") + "</td>"
                ' vTable += "<td>" + vRes.Rows(i).Item("province") + "</td>"
                vTable += "<td>" + vRes.Rows(i).Item("jas_employeeId") + "</td>"
                vTable += "<td>" + vRes.Rows(i).Item("jas_thaiFullname") + "</td>"
                vTable += "<td>" + vRes.Rows(i).Item("jas_position") + "</td>"
                vTable += "<td>" + vRes.Rows(i).Item("jas_department") + "</td>"

                If hide_upermiss.Value = hide_this_edit_by.Value Then
                    vTable += "<td align='center' width='120'>"
                    vTable += "<button title='Sync Jasmine' type='button' class='btn btn-info btn-sm' onclick='reSyncJas(""" + vRes.Rows(i).Item("authen_id") + """,""" + vRes.Rows(i).Item("uemail") + """)'><span class='glyphicon glyphicon-refresh'></span></button> "
                    vTable += "<button title='Edit' type='button' class='btn btn-warning btn-sm' onclick='editUser(""" + vRes.Rows(i).Item("emp_id") + """,""" + vRes.Rows(i).Item("authen_id") + """,""" + vRes.Rows(i).Item("uemail") + """,""" + vRes.Rows(i).Item("ro") + """,""" + vRes.Rows(i).Item("cluster") + """,""" + vRes.Rows(i).Item("province") + """)'><span class='glyphicon glyphicon-edit'></span></button> "
                    vTable += "<button title='Remove' type='button' class='btn btn-danger btn-sm' onclick='removeConfirm(""" + vRes.Rows(i).Item("authen_id") + """,""" + vRes.Rows(i).Item("uemail") + """)'><span class='glyphicon glyphicon-remove'></span></button>"
                    vTable += "</td>"
                Else
                    vTable += "<td align='center' width='40'>"
                    vTable += "<button title='Sync Jasmine' type='button' class='btn btn-info btn-sm' onclick='reSyncJas(""" + vRes.Rows(i).Item("authen_id") + """,""" + vRes.Rows(i).Item("uemail") + """)'><span class='glyphicon glyphicon-refresh'></span></button> "
                    vTable += "</td>"
                    
                    btn_new.Visible = False
                End If
                vTable += "</tr>"
            Next
        End If

        table_editor.InnerHtml = vTable
    End Sub
End Class
