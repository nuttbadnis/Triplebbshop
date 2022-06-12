Imports System.Data
Imports System.Net
Imports System.Net.Mail
Imports System.Net.Mime
Imports System.Net.IPAddress

Partial Class _json
    Inherits System.Web.UI.Page
    Dim DB105 As New Cls_Data105
    Dim DBMPer As New Cls_DataMPermiss
    Dim CP As New Cls_Panu

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim qrs As String = ""

        If Request.QueryString("qrs") <> Nothing Then
            qrs = Request.QueryString("qrs")
        End If

        If qrs = "loadRO" Then
            loadRO()
        End If

        If qrs = "loadCluster" Then
            loadCluster()
        End If

        If qrs = "loadProvince" Then
            loadProvince()
        End If

        If qrs = "loadUserByID" Then
            loadUserByID()
        End If

        If qrs = "reSyncJas" Then
            reSyncJas()
        End If

        If qrs = "autoEmp" Then
            autoEmp()
        End If

        If qrs = "checkEmpPermiss" Then
            checkEmpPermiss()
        End If

        If qrs = "checkEmpPermissJson" Then
            checkEmpPermissJson()
        End If

        If qrs = "removeUPermiss" Then
            removeUPermiss()
        End If

        If qrs = "saveNewUPermiss" Then
            saveNewUPermiss()
        End If

        If qrs = "saveEditUPermiss" Then
            saveEditUPermiss()
        End If

        If qrs = "loadData" Then
            loadData()
        End If
    End Sub

    Protected Sub loadRO()
        Dim vSql As String = "select ro, 'RO' + ro ro_name "
        vSql += "from [10.11.5.106].[RMSDAT01].[dbo].[vw_branch_shop] "
        vSql += "group by ro "
        vSql += "order by ro "

        Response.Write(CP.rJsonDBv4(vSql, "DBMPer"))
    End Sub

    Protected Sub loadCluster()
        Dim xRo As String = Request.QueryString("ro")

        Dim vSql As String = "select ro, cluster "
        vSql += "from [10.11.5.106].[RMSDAT01].[dbo].[vw_branch_shop] "

        If xRo <> Nothing Then
            vSql += "where ro = '" & xRo & "' "
        End If

        vSql += "group by ro, cluster "
        vSql += "order by ro, cluster "

        Response.Write(CP.rJsonDBv4(vSql, "DBMPer"))
    End Sub

    Protected Sub loadProvince()
        Dim xRo As String = Request.QueryString("ro")
        Dim xCluster As String = Request.QueryString("cluster")

        Dim vSql As String = "select ro, cluster, province_code, province_short, province_short + ': ' + province_name province_name "
        vSql += "from [10.11.5.106].[RMSDAT01].[dbo].[vw_branch_shop] "

        If xRo <> Nothing Then
            vSql += "where ro = '" & xRo & "' "
        End If

        If xCluster <> Nothing Then
            vSql += "where cluster = '" & xCluster & "' "
        End If

        vSql += "group by ro, cluster, province_code, province_short, province_name "
        vSql += "order by ro, cluster, province_short, province_name "

        Response.Write(CP.rJsonDBv4(vSql, "DBMPer"))
    End Sub

    Protected Sub reSyncJas()
        Dim xResponse As Integer = 0
        Dim vSqlIn As String = ""
        Dim xUemail As String = Request.Form("uemail")
        Dim vToken As String = Request.Form("token")

        If xUemail <> Nothing And vToken <> Nothing Then
            Dim vDT_OAUTH As New DataTable 
            vDT_OAUTH = CP.rGetDataOAuthDT(xUemail, vToken)

            If vDT_OAUTH.Rows.Count > 0 Then
                For i2 As Integer = 0 To vDT_OAUTH.Rows.Count - 2
                    If xUemail & "@jasmine.com" = vDT_OAUTH.Rows(i2).Item("email") _
                    AND (vDT_OAUTH.Rows(i2).Item("dateExpired") = "" Or vDT_OAUTH.Rows(i2).Item("dateExpired") = "null") _
                    And vDT_OAUTH.Rows(i2).Item("accountStatus") = "true" Then

                        vSqlIn = "update employee set "
                        vSqlIn += "jas_employeeId = '" & vDT_OAUTH.Rows(i2).Item("employeeId") & "' "
                        vSqlIn += ", jas_thaiFullname = '" & vDT_OAUTH.Rows(i2).Item("thaiFullname") & "' "
                        vSqlIn += ", jas_engFullname = '" & vDT_OAUTH.Rows(i2).Item("engFullname") & "' "
                        vSqlIn += ", jas_position = '" & vDT_OAUTH.Rows(i2).Item("position") & "' "
                        vSqlIn += ", jas_department = '" & vDT_OAUTH.Rows(i2).Item("department") & "' "
                        vSqlIn += ", jas_update = getdate() "
                        vSqlIn += "where uemail = '" & xUemail & "' "

                        If DBMPer.ExecuteNonQuery(vSqlIn).ToString() > 0 Then
                            xResponse = 1
                        End If
                    End If
                Next
            End If
        End If

        Response.Write(xResponse)
    End Sub

    Protected Sub autoEmp()
        Dim xKeyword As String = Request.QueryString("kw")
        Dim xToken As String = Request.QueryString("token")

        Dim vJson As String = CP.rGetDataOAuthjson(xKeyword, xToken)
        
        Response.Write(vJson)
    End Sub

    Protected Sub checkEmpPermiss()
        Dim vSql As String = "select authen_id from vw_user_mpermiss "
        vSql += "where uemail = '" + Request.QueryString("uemail") + "' "
        vSql += "and permission_id = '" + Request.QueryString("permission") + "' "

        Response.Write(CP.rGetCount(vSql, "DBMPer"))
    End Sub

    Protected Sub checkEmpPermissJson()
        Dim vSql As String = "select uemail, ro, cluster, province, jas_thaiFullname from vw_user_mpermiss "
        vSql += "where uemail = '" + Request.QueryString("uemail") + "' "
        vSql += "and permission_id = '" + Request.QueryString("permission") + "' "
        vSql += "order by ro, cluster, province "

        Response.Write(CP.rJsonDBv4(vSql, "DBMPer"))
    End Sub

    Protected Sub loadUserByID()
        Dim xNewid As String = Request.QueryString("new_id")
        Dim xAuthen_id As String = Request.QueryString("authen_id")
        Dim xPermission As String = Request.QueryString("permission_id")

        Dim vSql As String = ""
        vSql += "declare @authen_id varchar(100) = '" & xAuthen_id & "' "

        If xNewid <> Nothing Then
            vSql += "set @authen_id = (select top 1 authen_id from vw_user_mpermiss where emp_id = '" & xNewid & "' or jas_employeeId = '" & xNewid & "' order by no desc) "
        End If

        vSql += "select authen_id, emp_id, uemail, ro, cluster, province, pvzone, "
        vSql += "jas_employeeId, jas_thaiFullname, jas_position, jas_department, jas_update "
        vSql += "from vw_user_mpermiss "
        vSql += "where authen_id = @authen_id "
        vSql += "and permission_id = '" & xPermission & "' "

        Response.Write(CP.rJsonDBv4(vSql, "DBMPer"))
    End Sub

    Protected Sub removeUPermiss()
        Dim vSqlIn As String = "EXEC dbo.SP_removeUPermiss '" & Request.Form("update_by") & "', '" & Request.Form("authen_id") & "', '" & Request.Form("permission") & "' "
        
        ' Dim vSqlIn As String = "update user_authen set disable = 1 "
        ' vSqlIn += ", update_date = getdate() "
        ' vSqlIn += ", update_by = '" & Request.Form("update_by") & "' "
        ' vSqlIn += "where emp_id = '" + Request.Form("emp_id") + "' "
        ' vSqlIn += "and permission_id = '" + Request.Form("permission") + "' "
        ' vSqlIn += "and disable = 0 "

        ' Response.Write(vSqlIn)
        Response.Write(DBMPer.ExecuteNonQuery(vSqlIn).ToString())
    End Sub

    Protected Sub saveNewUPermiss()
        Dim xPermission As String = Request.Form("permission")
        Dim xCreate_by As String = Request.Form("create_by")
        Dim xUemail As String = Request.Form("uemail")
        Dim xNewid As String = Request.Form("new_id")
        Dim xRo As String = Request.Form("ro")
        Dim xCluster As String = Request.Form("cluster")
        Dim xProvince As String = Request.Form("province")

        Dim vSqlIn As String = "EXEC dbo.SP_saveNewUPermiss '" & xCreate_by & "', '" & xNewid + "', '" & xPermission & "', '" & xUemail & "', '" & xRo & "', '" & xCluster & "', '" & xProvince & "' "
        
        ' Dim vSqlIn As String = "declare @new_id varchar(50) "
        ' vSqlIn += "set @new_id = (select emp_id from employee where uemail = '" & xUemail & "') "

        ' vSqlIn += "if @new_id is null "
        ' vSqlIn += "begin "
        ' vSqlIn += "    set @new_id = '" & xNewid & "' "
        ' vSqlIn += "    insert into employee (emp_id, uemail, create_by, create_date) "
        ' vSqlIn += "    values (@new_id, '" & xUemail & "', '" & xCreate_by & "', getdate()) "
        ' vSqlIn += "end "

        ' vSqlIn += "if @new_id is not null "
        ' vSqlIn += "begin "
        ' vSqlIn += "     insert into user_authen (permission_id, emp_id, ro, cluster, province, create_by, create_date) "
        ' vSqlIn += "     values ('" & xPermission & "', @new_id, '" & xRo & "', '" & xCluster & "', '" & xProvince & "', '" & xCreate_by & "', getdate()) "
        ' vSqlIn += "end "

        Response.Write(DBMPer.ExecuteNonQuery(vSqlIn).ToString())
    End Sub

    Protected Sub saveEditUPermiss()
        Dim xPermission As String = Request.Form("permission")
        Dim xUpdate_by As String = Request.Form("update_by")
        Dim xUemail As String = Request.Form("uemail")
        Dim xAuthen_id As String = Request.Form("authen_id")
        Dim xRo As String = Request.Form("ro")
        Dim xCluster As String = Request.Form("cluster")
        Dim xProvince As String = Request.Form("province")
        Dim xEmp_id As String = Request.Form("emp_id")

        Dim vSqlIn As String = "EXEC dbo.SP_saveEditUPermiss '" & xUpdate_by & "', '" & xAuthen_id + "', '" & xPermission & "', '" & xUemail & "', '" & xRo & "', '" & xCluster & "', '" & xProvince & "', '" & xEmp_id & "' "
        
        ' Dim vSqlIn As String = "update employee set "
        ' vSqlIn += "uemail = '" & xUemail & "' "
        ' vSqlIn += ", update_by = '" & xUpdate_by & "' "
        ' vSqlIn += ", update_date = getdate() "
        ' vSqlIn += "where emp_id = '" & xEmp_id & "' "
        ' vSqlIn += "and uemail <> '" & xUemail & "' "

        ' vSqlIn += "update user_authen set "
        ' vSqlIn += "ro = '" & xRo & "' "
        ' vSqlIn += ", cluster = '" & xCluster & "' "
        ' vSqlIn += ", province = '" & xProvince & "' "
        ' vSqlIn += ", update_by = '" & xUpdate_by & "' "
        ' vSqlIn += ", update_date = getdate() "
        ' vSqlIn += "where emp_id = '" & xEmp_id & "' "
        ' vSqlIn += "and permission_id = '" & xPermission & "' "

        Response.Write(DBMPer.ExecuteNonQuery(vSqlIn).ToString())
    End Sub

    Protected Sub loadData()
        Dim xPermission As String = Request.QueryString("permission_id")

        Dim vSql As String = "select authen_id, emp_id, uemail, ro, cluster, province, "
        vSql += "jas_employeeId, jas_thaiFullname, jas_position, jas_department, jas_update "
        vSql += "from vw_user_mpermiss "
        vSql += "where permission_id = '" & xPermission & "' "
        vSql += "order by uemail "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBMPer"))
    End Sub
End Class
