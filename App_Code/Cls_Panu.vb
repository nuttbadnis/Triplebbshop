Imports System.IO
Imports System.Net
Imports System.Data
Imports System.Web.Script.Serialization
Imports System.Collections.Generic
Imports System.Net.Mail
Imports System.Net.Mime
Imports System.Net.IPAddress

Public Class Cls_Panu
    Inherits System.Web.UI.Page
    Dim DB106 As New Cls_Data
    Dim DB105 As New Cls_Data105
    Dim DBOnhand As New Cls_DataOnhand
    Dim DBMPer As New Cls_DataMPermiss
    Dim DBCheckList As New Cls_DataCheckList
    Dim CNotify As New Cls_Notify
    Dim DBTBBAPP As New Cls_DataTBBAPP
    Dim DBTBBESTATE As New Cls_DataTBBESTATE
    Dim DBMETERRPT As New Cls_DataMETERRPT
    Dim DBRECONPOINT As New Cls_DataRECONPOINT

    Dim dboMPermiss as String = System.Configuration.ConfigurationSettings.AppSettings("dboMPermiss")

    Dim oauth_client_id as String = System.Configuration.ConfigurationSettings.AppSettings("oauth_client_id")
    Dim oauth_client_Secret as String = System.Configuration.ConfigurationSettings.AppSettings("oauth_client_Secret")
    Dim oauth_redirect_uri as String = System.Configuration.ConfigurationSettings.AppSettings("oauth_redirect_uri")

    Dim POSBCS_domain as String = System.Configuration.ConfigurationSettings.AppSettings("POSBCS_domain")
    Dim POSBCS_ip as String = System.Configuration.ConfigurationSettings.AppSettings("POSBCS_ip")

    Dim group_line_approval as String = System.Configuration.ConfigurationSettings.AppSettings("group_line_approval")

#Region "Checking"

    Public Sub SessionUemail()
        Dim Uemail As String = HttpContext.Current.Request.QueryString("em")

        If Uemail <> Nothing Then
            If Uemail.Trim() <> "" Then
                If Uemail = "clear" Then
                    Session.Clear()
                Else
                    Session("Uemail") = Uemail
                End If
            End If
        End If
    End Sub

    Public Function rCheckApprove()
        Dim vRes As New DataTable

        Dim vSql As String
        vSql += "select no_approve "
        vSql += "from approve_shopStock "
        vSql += "where approve_status = 0"

        vSql += "union " 
        vSql += "select no_approve " 
        vSql += "from approve_shopStock_daytime " 
        vSql += "where approve_status = 0"

        vSql += "union "
        vSql += "select no_approve "
        vSql += "from approve_shopStock_img "
        vSql += "where approve_status = 0"

        vSql += "union " 
        vSql += "select no_approve " 
        vSql += "from approve_shopstock_note " 
        vSql += "where approve_status = 0"

        vRes = DB105.GetDataTable(vSql)

        Return vRes.Rows().Count()
    End Function

    Public Function rCheckVerify()
        Dim vRes As New DataTable

        Dim vSql As String
        vSql += "SELECT request_id, request_status_id, request_status_name " 
        vSql += "FROM vw_REQUEST_CHECKLIST_MAIN "
        vSql += "where request_status_id = 50 "

        vRes = DBCheckList.GetDataTable(vSql)

        Return vRes.Rows().Count()
    End Function

    Public Sub checkLogin()
        checkQueryStringUemail()

        If Session("Uemail") Is Nothing Then
            Session("current_url") = HttpContext.Current.Request.Url.AbsoluteUri()
            HttpContext.Current.Response.Redirect("https://api.jasmine.com/authen1/oauth/authorize?response_type=code&client_id=" + oauth_client_id + "&redirect_uri=" + oauth_redirect_uri)
            ClientScript.RegisterStartupScript(Page.GetType, "open", "window.close()", True)
        End If
    End Sub

    Public Sub checkQueryStringUemail()
        '' เช็คเพื่อน ยัด Session uemail ข้าม web (domain >>> ip)

        Dim vUrl As String = HttpContext.Current.Request.Url.AbsoluteUri()
        Dim vQueryStringUemail As String = HttpContext.Current.Request.QueryString("uemail")

        If vQueryStringUemail <> Nothing Then
            Session("Uemail") = vQueryStringUemail

            vUrl = vUrl.Replace("?uemail=", "")
            vUrl = vUrl.Replace("&uemail=", "")
            vUrl = vUrl.Replace(vQueryStringUemail, "")

            HttpContext.Current.Response.Redirect(vUrl)
        End If

    End Sub

    Public Sub checkRedirect()
        '' เช็คเพื่อน ถ้าเป็นหน้าที่ใช้ api googlemap ให้ไปใช้ ip แทน domain

        Dim vUrl As String = HttpContext.Current.Request.Url.AbsoluteUri()

        If vUrl.ToLower().Contains(POSBCS_domain) And _
        (vUrl.ToLower().Contains("report_map.aspx") Or vUrl.ToLower().Contains("updatestockshop.aspx")) Then

            vUrl = vUrl.Replace(POSBCS_domain, POSBCS_ip)

            If Session("Uemail") IsNot Nothing Then
                If vUrl.ToLower().Contains("?") Then
                    vUrl += "&"
                Else 
                    vUrl += "?"
                End If
                vUrl += "uemail=" + Session("Uemail")
            End If

            HttpContext.Current.Response.Redirect(vUrl)

        Else If vUrl.ToLower().Contains(POSBCS_ip) And Not _
        (vUrl.ToLower().Contains("report_map.aspx") Or vUrl.ToLower().Contains("updatestockshop.aspx")) Then

            vUrl = vUrl.Replace(POSBCS_ip, POSBCS_domain)

            If Session("Uemail") IsNot Nothing Then
                If vUrl.ToLower().Contains("?") Then
                    vUrl += "&"
                Else 
                    vUrl += "?"
                End If
                vUrl += "uemail=" + Session("Uemail")
            End If

            HttpContext.Current.Response.Redirect(vUrl)

        End If
    End Sub

    Public Function rCheckPermit(ByVal permission_id As String, Optional ByVal permission_session As String = "upermiss")
        Dim vRes As New DataTable
        Dim vCount As Integer = 0

        Dim vSql As String = "select * from vw_user_mpermiss "
        vSql += "where permission_id in ('SUPPOS', '" + permission_id + "') "
        vSql += "and uemail = '" + Session("Uemail")  + "'"
        vRes = DBMPer.GetDataTable(vSql)
        vCount += vRes.Rows().Count()

        If vCount > 0 Then
            Session(permission_session) = "" + permission_id + ""
        End If

        Return vCount
    End Function

    Public Function rCheckPermiss()
        Dim vRes As New DataTable
        Dim vCount As Integer = 0

        Dim vSql As String = "select * from vw_user_mpermiss "
        vSql += "where permission_id in('SUPPOS', 'BACKOFFICE_ADMIN') "
        vSql += "and uemail = '" + Session("Uemail")  + "'"
        
        vRes = DBMPer.GetDataTable(vSql)
        vCount += vRes.Rows().Count()

        If vCount > 0 Then
            Session("upermiss") = "BACKOFFICE_ADMIN"
        Else

            ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
            vSql = "select * from vw_user_mpermiss "
            vSql += "where permission_id in('BACKOFFICE_EDITOR') "
            vSql += "and uemail = '" + Session("Uemail")  + "'"
            vRes = DBMPer.GetDataTable(vSql)
            vCount += vRes.Rows().Count()

            If vCount > 0 Then
                Session("upermiss") = "BACKOFFICE_EDITOR"
            End If

            ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        End If

        '******************************** Maintenance
        'Session().Clear()
        'Dim page As Page = HttpContext.Current.Handler
        'Page.ClientScript.RegisterStartupScript(Me.GetType(), "alertscript", "alert('ปิดปรับปรุงไม่สามารถ Login ได้'); window.location = 'default.aspx';", True)
        '******************************** Maintenance

        Return vCount
    End Function

    Public Function rCheckPermissMNG()
        Dim vRes As New DataTable
        Dim vCount As Integer = 0

        Dim vSql As String = "select * from vw_user_mpermiss "
        vSql += "where permission_id in('RO_DIRECTOR') "
        vSql += "and uemail = '" + Session("Uemail")  + "'"
        vRes = DBMPer.GetDataTable(vSql)
        vCount += vRes.Rows().Count()

        If vCount > 0 Then
            Session("upermiss") = "RO_DIRECTOR"
        Else

            ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
            vSql = "select * from vw_user_mpermiss "
            vSql += "where permission_id in('CLUSTER_MANAGER') "
            vSql += "and uemail = '" + Session("Uemail")  + "'"
            vRes = DBMPer.GetDataTable(vSql)
            vCount += vRes.Rows().Count()

            If vCount > 0 Then
                Session("upermiss") = "CLUSTER_MANAGER"
                vCount = 4
            Else
                vSql = "select * from vw_user_mpermiss "
                vSql += "where permission_id in('PROVINCE_MANAGER') "
                vSql += "and uemail = '" + Session("Uemail")  + "'"
                vRes = DBMPer.GetDataTable(vSql)
                vCount += vRes.Rows().Count()

                If vCount > 0 Then
                    Session("upermiss") = "PROVINCE_MANAGER"
                    vCount = 5
                End If
            End If

            ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        End If
        
        Return vCount
    End Function

    Public Function rCheckPermissPOS()
        Dim vRes As New DataTable
        Dim vCount As Integer = 0

        Dim vSql As String = "select * from vw_user_mpermiss "
        vSql += "where permission_id = 'SUPPOS' "
        vSql += "and uemail = '" + Session("Uemail")  + "'"
        
        vRes = DBMPer.GetDataTable(vSql)
        vCount += vRes.Rows().Count()

        If vCount > 0 Then
            Session("upermiss") = "SUPPOS"
        End If

        Return vCount
    End Function

    Public Function rCheckPermissList()
        Dim vRes As New DataTable
        Dim vCount As Integer = rCheckPermiss()

        If vCount > 0 Then
            If Session("upermiss") = "BACKOFFICE_ADMIN" Then
                Session("shoplist") = "ALL"

            Else If Session("upermiss") = "BACKOFFICE_EDITOR" Then
                'exec MPermiss.dbo.st_AreaPermiss 'BACKOFFICE_EDITOR', 'apinya.t'
                Dim vSql As String = "exec st_AreaPermiss '" + Session("upermiss") + "', '" + Session("Uemail")  + "'"

                vRes = DBMPer.GetDataTable(vSql)

                Dim shoplist As String = ""

                For i As Integer = 0 To vRes.Rows().Count() - 1
                    shoplist += vRes.Rows(i).Item("shop_code") + ","
                Next

                If shoplist <> Nothing Then
                    shoplist = shoplist.Remove(shoplist.Length - 1, 1)
                    Session("shoplist") = shoplist.ToUpper()
                End If
            End If
        End If

        Return vCount
    End Function

    Public Function rCheckPermissList_bsck()
        Dim vRes As New DataTable
        Dim vCount As Integer = 0

        Dim vSql As String = "select * from _s140 where F03 in('SYSADMIN', '3BB_SHOP_ADMIN') and F02 = '" + Session("Uemail")  + "'"
        vRes = DB106.GetDataTableSys(vSql)
        vCount += vRes.Rows().Count()

        If vCount > 0 Then
            Session("upermiss") = "ADMIN"
        Else

            ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
            vSql = "select * from _s140 where F03 in('3BB_SHOP_EDITOR') AND F02 = '" + Session("Uemail")  + "'"
            vRes = DB106.GetDataTableSys(vSql)
            vCount += vRes.Rows().Count()

            If vCount > 0 Then
                Session("upermiss") = "USER"

            ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
                Dim shoplist As String = ""

                vSql = "select * from m00860 where F02 = '" + Session("Uemail")  + "'"
                vRes = DB106.GetDataTable(vSql)

                For i As Integer = 0 To vRes.Rows().Count() - 1
                    shoplist += vRes.Rows(i).Item("f03") + ","
                Next

                If shoplist <> Nothing Then
                    shoplist = shoplist.Remove(shoplist.Length - 1, 1)
                    Session("shoplist") = shoplist.ToLower()
                End If
            ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

            End If
        End If

        Return vCount
    End Function

    Public Function rContractPermiss()
        Dim vRes As New DataTable
        Dim vCount As Integer = 0

        ' Dim vSql As String = "select * from _s140 where F03 in('SYSADMIN', '3BB_CONTRACT_ADMIN', '3BB_CONTRACT_EDITOR') and F02 = '" + Session("Uemail")  + "'"
        Dim vSql As String = "select * from vw_user_mpermiss "
        vSql += "where permission_id in('SUPPOS', 'CONTRACT_ADMIN') "
        vSql += "and uemail = '" + Session("Uemail")  + "'"
        vRes = DBMPer.GetDataTable(vSql)
        vCount += vRes.Rows().Count()

        If vCount > 0 Then
            Session("ctpermiss") = "CONTRACT_ADMIN"
            vCount = 1
        Else
            vSql = "select * from vw_user_mpermiss "
            vSql += "where permission_id in('CONTRACT_EDITOR') "
            vSql += "and uemail = '" + Session("Uemail")  + "'"
            vRes = DBMPer.GetDataTable(vSql)
            vCount += vRes.Rows().Count()

            If vCount > 0 Then
                Session("ctpermiss") = "CONTRACT_EDITOR"
                vCount = 2
            Else
                vSql = "select * from vw_user_mpermiss "
                vSql += "where permission_id in('CONTRACT_VIEWER') "
                vSql += "and uemail = '" + Session("Uemail")  + "'"
                vRes = DBMPer.GetDataTable(vSql)
                vCount += vRes.Rows().Count()

                If vCount > 0 Then
                    Session("ctpermiss") = "CONTRACT_VIEWER"
                    vCount = 3
                End If
            End If
        End If

        Return vCount
    End Function

    Public Function rCheckListPermiss()
        Dim vRes As New DataTable
        Dim vCount As Integer = 0

        Dim vSql As String = "select * from vw_user_mpermiss "
        vSql += "where permission_id in('SUPPOS', 'CHECKLIST_ADMIN') "
        vSql += "and uemail = '" + Session("Uemail")  + "'"
        vRes = DBMPer.GetDataTable(vSql)
        vCount += vRes.Rows().Count()

        If vCount > 0 Then
            Session("chkpermiss") = "CHECKLIST_ADMIN"
            vCount = 1
        Else
            vSql = "select * from vw_USER_SHOP_ACTIVE "
            vSql += "where uemail = '" + Session("Uemail")  + "'"
            vRes = DBCheckList.GetDataTable(vSql)
            vCount += vRes.Rows().Count()

            If vCount > 0 Then
                Session("chkpermiss") = "USER_ACTIVE_POS"
                vCount = 2
            Else
                vSql = "select * from vw_user_mpermiss "
                vSql += "where permission_id in('RO_DIRECTOR') "
                vSql += "and uemail = '" + Session("Uemail")  + "'"
                vRes = DBMPer.GetDataTable(vSql)
                vCount += vRes.Rows().Count()

                If vCount > 0 Then
                    Session("chkpermiss") = "RO_DIRECTOR"
                    vCount = 3
                Else
                    vSql = "select * from vw_user_mpermiss "
                    vSql += "where permission_id in('CLUSTER_MANAGER') "
                    vSql += "and uemail = '" + Session("Uemail")  + "'"
                    vRes = DBMPer.GetDataTable(vSql)
                    vCount += vRes.Rows().Count()

                    If vCount > 0 Then
                        Session("chkpermiss") = "CLUSTER_MANAGER"
                        vCount = 4
                    Else
                        vSql = "select * from vw_user_mpermiss "
                        vSql += "where permission_id in('PROVINCE_MANAGER') "
                        vSql += "and uemail = '" + Session("Uemail")  + "'"
                        vRes = DBMPer.GetDataTable(vSql)
                        vCount += vRes.Rows().Count()

                        If vCount > 0 Then
                            Session("chkpermiss") = "PROVINCE_MANAGER"
                            vCount = 5
                        Else
                            vSql = "select * from vw_user_mpermiss "
                            vSql += "where permission_id in('CHECKLIST_ASSISTANT') "
                            vSql += "and uemail = '" + Session("Uemail")  + "'"
                            vRes = DBMPer.GetDataTable(vSql)
                            vCount += vRes.Rows().Count()

                            If vCount > 0 Then
                                Session("chkpermiss") = "CHECKLIST_ASSISTANT"
                                vCount = 6
                            End If
                        End If
                    End If
                End If
            End If
        End If

        Return vCount
    End Function

    Public Function rManagerPermiss()
        Dim vRes As New DataTable
        Dim vCount As Integer = 0

        Dim vSql As String = "select * from vw_user_mpermiss "
        vSql += "where permission_id in('SUPPOS') "
        vSql += "and uemail = '" + Session("Uemail")  + "'"
        vRes = DBMPer.GetDataTable(vSql)
        vCount += vRes.Rows().Count()

        If vCount > 0 Then
            ' Session("chkpermiss") = "CHECKLIST_ADMIN"
            vCount = 1
        Else
            vSql = "select * from vw_user_mpermiss "
            vSql += "where permission_id in('RO_DIRECTOR') "
            vSql += "and uemail = '" + Session("Uemail")  + "'"
            vRes = DBMPer.GetDataTable(vSql)
            vCount += vRes.Rows().Count()

            If vCount > 0 Then
                ' Session("chkpermiss") = "RO_DIRECTOR"
                vCount = 2
            Else
                vSql = "select * from vw_user_mpermiss "
                vSql += "where permission_id in('CLUSTER_MANAGER') "
                vSql += "and uemail = '" + Session("Uemail")  + "'"
                vRes = DBMPer.GetDataTable(vSql)
                vCount += vRes.Rows().Count()

                If vCount > 0 Then
                    ' Session("chkpermiss") = "CLUSTER_MANAGER"
                    vCount = 3
                Else
                    vSql = "select * from vw_user_mpermiss "
                    vSql += "where permission_id in('APP_REPORTER') "
                    vSql += "and uemail = '" + Session("Uemail")  + "'"
                    vRes = DBMPer.GetDataTable(vSql)
                    vCount += vRes.Rows().Count()

                    If vCount > 0 Then
                        ' Session("chkpermiss") = "APP_REPORTER"
                        vCount = 4
                    End If
                    
                    ' vSql = "select * from vw_user_mpermiss "
                    ' vSql += "where permission_id in('PROVINCE_MANAGER') "
                    ' vSql += "and uemail = '" + Session("Uemail")  + "'"
                    ' vRes = DBMPer.GetDataTable(vSql)
                    ' vCount += vRes.Rows().Count()

                    ' If vCount > 0 Then
                    '     Session("chkpermiss") = "PROVINCE_MANAGER"
                    '     vCount = 4
                    ' End If
                End If
            End If
        End If

        Return vCount
    End Function

    Public Function rSqlCheckListPermissShop(ByVal uemail As String) As String
        Dim vSql As string = ""
        vSql += "DECLARE @UEMAIL varchar(50) = '" & uemail & "'; "
        vSql += "DECLARE @TEMP_PERMISS_SHOP table(permission varchar(50), shop_code varchar(5));  "

        ' insert by priority'
        vSql += "INSERT INTO @TEMP_PERMISS_SHOP "
        vSql += "select 'USER_ACTIVE_POS' permission, shop_code from vw_USER_SHOP_ACTIVE  "
        vSql += "where uemail = @UEMAIL "

        vSql += "INSERT INTO @TEMP_PERMISS_SHOP "
        vSql += "select permission_id, shop_code from " + dboMPermiss + ".dbo.vw_user_shop_code  "
        vSql += "where permission_id in ('RO_DIRECTOR') and uemail = @UEMAIL "
        vSql += "and shop_code not in (select shop_code from @TEMP_PERMISS_SHOP) "

        vSql += "INSERT INTO @TEMP_PERMISS_SHOP "
        vSql += "select permission_id, shop_code from " + dboMPermiss + ".dbo.vw_user_shop_code  "
        vSql += "where permission_id in ('CLUSTER_MANAGER') and uemail = @UEMAIL "
        vSql += "and shop_code not in (select shop_code from @TEMP_PERMISS_SHOP) "

        vSql += "INSERT INTO @TEMP_PERMISS_SHOP "
        vSql += "select permission_id, shop_code from " + dboMPermiss + ".dbo.vw_user_shop_code  "
        vSql += "where permission_id in ('PROVINCE_MANAGER') and uemail = @UEMAIL "
        vSql += "and shop_code not in (select shop_code from @TEMP_PERMISS_SHOP) "

        vSql += "INSERT INTO @TEMP_PERMISS_SHOP "
        vSql += "select permission_id, shop_code from " + dboMPermiss + ".dbo.vw_user_shop_code  "
        vSql += "where permission_id in ('CHECKLIST_ASSISTANT') and uemail = @UEMAIL "
        vSql += "and shop_code not in (select shop_code from @TEMP_PERMISS_SHOP) "

        Return vSql
    End Function

    Public Function rSqlCheckListPermissUser(ByVal shop_code As String) As String
        Dim vSql As string = ""
        vSql += "DECLARE @SHOP varchar(5) = '" & shop_code & "'; "
        vSql += "DECLARE @TEMP_PERMISS_USER table(permission varchar(50), uemail varchar(50), shop_code varchar(5));  "

        vSql += "INSERT INTO @TEMP_PERMISS_USER "
        vSql += "select 'USER_ACTIVE_POS' permission, uemail, shop_code from vw_USER_SHOP_ACTIVE  "
        vSql += "where shop_code = @SHOP "
        vSql += "order by uemail "

        vSql += "INSERT INTO @TEMP_PERMISS_USER "
        vSql += "select permission_id, uemail, shop_code from MPermiss.dbo.vw_user_shop_code  "
        vSql += "where permission_id in ('RO_DIRECTOR') and shop_code = @SHOP "
        vSql += "order by uemail "

        vSql += "INSERT INTO @TEMP_PERMISS_USER "
        vSql += "select permission_id, uemail, shop_code from MPermiss.dbo.vw_user_shop_code  "
        vSql += "where permission_id in ('CLUSTER_MANAGER') and shop_code = @SHOP "
        vSql += "order by uemail "

        vSql += "INSERT INTO @TEMP_PERMISS_USER "
        vSql += "select permission_id, uemail, shop_code from MPermiss.dbo.vw_user_shop_code  "
        vSql += "where permission_id in ('PROVINCE_MANAGER') and shop_code = @SHOP "
        vSql += "order by uemail "

        vSql += "INSERT INTO @TEMP_PERMISS_USER "
        vSql += "select permission_id, uemail, shop_code from MPermiss.dbo.vw_user_shop_code  "
        vSql += "where permission_id in ('CHECKLIST_ASSISTANT') and shop_code = @SHOP "
        vSql += "order by uemail "

        Return vSql
    End Function

    Public Function rCheckAreaPermiss(ByVal vShop_code As String, ByVal vPermission_id As String)
        Dim vRes As New DataTable
        Dim vRet As Integer = 0

        Dim vSql As String = "select ro, cluster, province, "
        vSql += "rmsdat.dbo.checkAreaPermiss(ro, cluster, province, '" & vShop_code & "') AreaPermiss "
        vSql += "from vw_user_mpermiss "
        vSql += "where uemail = '" & Session("Uemail")  & "' "
        vSql += "and permission_id = '" & vPermission_id & "' "

        vRes = DBMPer.GetDataTable(vSql)

        If vRes.Rows().Count() > 0 Then
            vRet = vRes.Rows(0).Item("AreaPermiss")
        End If

        Return vRet
    End Function

    Public Function rCheckUserActivePos(ByVal vShop_code As String)
        Dim vRes As New DataTable

        Dim vSql As String = "select * from vw_USER_SHOP_ACTIVE "
        vSql += "where uemail = '" + Session("Uemail")  + "'"
        vSql += "and shop_code = '" & vShop_code & "'"
        vRes = DBCheckList.GetDataTable(vSql)

        Return vRes.Rows().Count()
    End Function
#End Region

#Region "SendMail & LineAlert"

    Public Sub SendMailAdmin(ByVal vProve_Topic As Integer,ByVal vShop_code As String)
        Dim vSubject As String = ""

        If vProve_Topic = 1 Then
            vSubject = "มีการเปลี่ยนแปลงข้อมูลสำนักงาน"
        Else If vProve_Topic = 2 Then
            vSubject = "มีการเปลี่ยนแปลงเวลาทำการ"
        Else If vProve_Topic = 3 Then
            vSubject = "มีการเปลี่ยนแปลงรูปภาพ"
        Else If vProve_Topic = 4 Then
            vSubject = "มีการเพิ่มหรือเปลี่ยนแปลง หมายเหตุพิเศษ-ปิดศูนย์ชั่วคราว"
        End If

        Try
            Dim vMss As String = vShop_code.ToUpper() + " " + vSubject + " รออนุมัติ @" + DateTime.Now.ToString("HH:mm:ss")
            lineAlert(group_line_approval, vMss)

            Dim mail As New MailMessage()
            'mail.From = New MailAddress("TestApprove.system@jasmine.com")
            mail.From = New MailAddress("3bbShopManagement.system@jasmine.com")

            'mail.To.Add("panupong.pa@jasmine.com")
            mail.To.Add("content3bb@jasmine.com")
            mail.To.Add("pawarisa.j@jasmine.com")
            mail.To.Add("thanaphatara.s@jasmine.com")
            mail.To.Add("natta.y@jasmine.com")
            mail.To.Add("watcharaporn.mek@jasmine.com")
            mail.To.Add("waraporn.kaw@jasmine.com")

            mail.CC.Add("panupong.pa@jasmine.com")

            mail.Subject = "Back Office 3BB Shop มีข้อมูลรออนุมัติ"

            mail.Body = vbCr + "<font face='tahoma' size='2'><h5>3BB Shop " + vMss + "</h5>"
            mail.Body += vbCr + "<p><a href='http://posbcs.triplet.co.th/3bbShop/admin_approval.aspx'>กรุณา Login เข้าสู่ระบบ เพื่อทำการอนุมัติ</a></p></font>"
            
            mail.IsBodyHtml = True

            Dim smtp As New SmtpClient("smtp.jasmine.com")
            smtp.Credentials = New NetworkCredential("chancharas.w", "311227")

            smtp.Send(mail)

        Catch ex As Exception

        End Try
    End Sub

    Public Sub SendMailActionProve(ByVal vProve_Topic As Integer, ByVal vNo_Approve As String)
        Dim vRes As New DataTable

        Dim vSql As String
        vSql += "select * "

        If vProve_Topic = 1 Then
            vSql += "from approve_shopStock "
        Else If vProve_Topic = 3 Then
            vSql += "from approve_shopStock_img "
        Else If vProve_Topic = 2 Then
            vSql += "from approve_shopStock_daytime "
        Else If vProve_Topic = 4 Then
            vSql += "from approve_shopStock_note "
        End If

        vSql += "where no_approve = '" & vNo_Approve & "' "

        vRes = DB105.GetDataTable(vSql)

        If vRes.Rows().Count() > 0 Then
            Try
                Dim vMss As String = ""

                Dim mail As New MailMessage()
                'mail.From = New MailAddress("TestApprove.system@jasmine.com")
                mail.From = New MailAddress("3bbShopManagement.system@jasmine.com")

                mail.To.Add(vRes.Rows(0).Item("update_by") + "@jasmine.com")
                
                mail.CC.Add("panupong.pa@jasmine.com")

                If vRes.Rows(0).Item("approve_status") = 9 Then
                    vMss = vRes.Rows(0).Item("shop_code").ToUpper() + " การเปลี่ยนแปลงข้อมูล 3BB Shop อนุมัติแล้ว"
                    mail.Subject = vMss

                    mail.Body = vbCr + "<font face='tahoma' size='2'><h5>" + vMss + "</h5>"
                         
                    If vRes.Rows(0).Item("admin_comment").Trim() <> "" Then
                        Dim vMailBody As String = "ข้อความจากแอดมิน: " + vRes.Rows(0).Item("admin_comment")
                        mail.Body += vbCr + "<h5>" + vMailBody + "</h5>"
                        'vMss += "%0A" + vMailBody
                    End If

                    If vRes.Rows(0).Item("admin_override") = 1 Then
                        mail.Body += vbCr + "<h5>หมายเหตุ: มีการแก้ไขข้อมูลล่าสุดโดยผู้ดูแล</h5>"
                    End If

                    mail.Body += vbCr + "<p><a href='http://posbcs.triplet.co.th/3bbShop/default.aspx?shop_code=" + vRes.Rows(0).Item("shop_code").ToUpper() + "'>คลิกเพื่อดูข้อมูลสำนักงาน</a></p></font>"
            
                Else If vRes.Rows(0).Item("approve_status") = 8 Then
                    vMss = vRes.Rows(0).Item("shop_code").ToUpper() + " การเปลี่ยนแปลงข้อมูล 3BB Shop ไม่อนุมัติ"
                    mail.Subject = vMss

                    mail.Body = vbCr + "<font face='tahoma' size='2'><h5>" + vMss + "</h5>"

                    Dim vMailBody As String = "เนื่องจาก: " + vRes.Rows(0).Item("admin_comment")
                    mail.Body += vbCr + "<h5>" + vMailBody + "</h5>"
                    'vMss += "%0A" + vMailBody

                    mail.Body += vbCr + "<p><a href='http://posbcs.triplet.co.th/3bbShop/default.aspx?shop_code=" + vRes.Rows(0).Item("shop_code").ToUpper() + "'>คลิกเพื่อดูข้อมูลสำนักงาน</a></p></font>"
                End If

                '####### Check permiss lineAlertApprove เฉพาะ Request ของ User เท่านั้น
                vMss += "%0A" + "โดย " + vRes.Rows(0).Item("approve_by")
                ' ' vSql = "select * from _s140 where F03 in('SYSADMIN', '3BB_SHOP_ADMIN') and F02 = '" + vRes.Rows(0).Item("update_by")  + "'"
                ' vSql = "select * from vw_user_mpermiss "
                ' vSql += "where permission_id in('SUPPOS', 'BACKOFFICE_ADMIN') "
                ' vSql += "and uemail = '" + vRes.Rows(0).Item("update_by")  + "'"
                ' vRes = DBMPer.GetDataTable(vSql)

                ' If vRes.Rows().Count() = 0 Then
                    vMss += " @" + DateTime.Now.ToString("HH:mm:ss")
                    lineAlert(group_line_approval, vMss)
                ' End If
                '####### Check permiss lineAlertApprove เฉพาะ Request ของ User เท่านั้น

                mail.IsBodyHtml = True

                Dim smtp As New SmtpClient("smtp.jasmine.com")
                smtp.Credentials = New NetworkCredential("chancharas.w", "311227")

                smtp.Send(mail)

            Catch ex As Exception

            End Try
        End If

    End Sub

    Public Function lineAlert(ByVal line_group As String, ByVal msg As String) As Boolean
        ' msg = "http://10.11.15.102:8055/LINE/100000000/" + line_group + "/" + msg + "?passkey=botbcs"
        ' Return requestAddress(msg)

        Dim vAppSys As String = "3BB Shop"
        Dim vUrl As String = HttpContext.Current.Request.Url.AbsoluteUri()

        If vUrl.ToLower().Contains("/3bbshop") Then
            Return CNotify.lineNotify(line_group, msg, vAppSys)
        Else 
            Return False
        End If
    End Function

    Public Function requestAddress(ByVal URL As String) As Boolean
        Try
            Dim request As WebRequest = WebRequest.Create(URL)
            Dim response As WebResponse = request.GetResponse()
        Catch ex As Exception
            Return False
        End Try
        Return True
    End Function

#End Region

#Region "Json Data"

    Function rJsonDB(ByVal vTable As String, ByVal vSql As String, ByVal vField() As String, Optional ByVal vDB As String = "DB106") As String
        Dim vJson As String = ""
        Dim eTemp As String = ""

        Dim vRes As New DataTable
        vRes = rGetDataTable(vSql, vDB)

        For i As Integer = 0 To vRes.Rows().Count() - 1
            vJson += "{"
            For Each e As String In vField
                eTemp = "Null"
                If Not IsDbNull(vRes.Rows(i).Item(e)) Then
                    eTemp = vRes.Rows(i).Item(e)
                End If
                vJson += " """ + e + """:""" + rValidJson(eTemp) + """ ,"
            Next
            vJson = vJson.Remove(vJson.Length - 1, 1)
            vJson += "},"
        Next

        If vJson <> Nothing Then
            vJson = "{ """ + vTable + """ : [" + vJson
            vJson = vJson.Remove(vJson.Length - 1, 1)
            vJson += "]}"
        Else
            vJson = "{ """ + vTable + """ : []}"
        End If

        '******TAG SQL******'
        vJson = vJson.Remove(vJson.Length - 1, 1) + ", ""sql"" : """ + vSql + """ }"
        '******TAG SQL******'

        Return vJson
    End Function

    ''v2: update from v1
    ''append string
    ''change vFields is Array to Dictionary
    Function rJsonDBv2(ByVal vTable As String, ByVal vSql As String, ByVal vFields As Dictionary(Of String, String), Optional ByVal vDB As String = "DB106") As String
        Dim vJson As String = ""
        Dim vTemp As String = ""

        Dim vRes As New DataTable
        vRes = rGetDataTable(vSql, vDB)

        For i As Integer = 0 To vRes.Rows().Count() - 1
            vJson += "{"
            For Each k As KeyValuePair(Of String, String) In vFields
                vTemp = "Null"
                If Not IsDbNull(vRes.Rows(i).Item(k.Value)) Then
                    vTemp = vRes.Rows(i).Item(k.Value)
                End If
                vJson += " """ + k.Value + """:""" + rValidJson(vTemp) + """ ,"
            Next 
            vJson = vJson.Remove(vJson.Length - 1, 1)
            vJson += "},"
        Next

        If vJson <> Nothing Then
            vJson = "{ """ + vTable + """ : [" + vJson
            vJson = vJson.Remove(vJson.Length - 1, 1)
            vJson += "]}"
        Else
            vJson = "{ """ + vTable + """ : []}"
        End If

        '******TAG SQL******'
        vJson = vJson.Remove(vJson.Length - 1, 1) + ", ""sql"" : """ + vSql + """ }"
        '******TAG SQL******'

        Return vJson
    End Function

    ''v3: update from v2
    ''append string
    ''change vFields is Dictionary to ArrayList
    Function rJsonDBv3(ByVal vTable As String, ByVal vSql As String, ByVal vFields As ArrayList, Optional ByVal vDB As String = "DB106") As String
        Dim vJson As String = ""
        Dim vTemp As String = ""

        Dim vRes As New DataTable
        vRes = rGetDataTable(vSql, vDB)

        For i As Integer = 0 To vRes.Rows().Count() - 1
            vJson += "{"
            For Each vf As String In vFields
                vTemp = "Null"
                If Not IsDbNull(vRes.Rows(i).Item(vf)) Then
                    vTemp = vRes.Rows(i).Item(vf)
                End If
                vJson += " """ + vf + """:""" + rValidJson(vTemp) + """ ,"
            Next
            vJson = vJson.Remove(vJson.Length - 1, 1)
            vJson += "},"
        Next

        If vJson <> Nothing Then
            vJson = "{ """ + vTable + """ : [" + vJson
            vJson = vJson.Remove(vJson.Length - 1, 1)
            vJson += "]}"
        Else
            vJson = "{ """ + vTable + """ : []}"
        End If

        '******TAG SQL******'
        vJson = vJson.Remove(vJson.Length - 1, 1) + ", ""sql"" : """ + vSql + """ }"
        '******TAG SQL******'

        Return vJson
    End Function

    ''v3.2: update from v3
    ''array style
    ''upgrade vJson to List+Dictionary
    ''*** changed return value to List (is not have tag header AND tag sql)
    Function rJsonDBv3_2(ByVal vTable As String, ByVal vSql As String, ByVal vFields As ArrayList, Optional ByVal vDB As String = "DB106") As String
        Dim vJson = New List(Of Dictionary(Of String, String))()
        Dim vTemp As String = ""

        Dim vRes As New DataTable
        vRes = rGetDataTable(vSql, vDB)

        For i As Integer = 0 To vRes.Rows().Count() - 1
            Dim vRes_row = New Dictionary(Of String, String)

            For Each vf As String In vFields
                vTemp = "Null"
                If Not IsDbNull(vRes.Rows(i).Item(vf)) Then
                    vTemp = vRes.Rows(i).Item(vf)
                End If
                vRes_row.Add(vf, CStr(vTemp))
            Next 

            vJson.Add(vRes_row)
        Next

        Dim serializer as New JavaScriptSerializer()
        Dim arrayJson As String = serializer.Serialize(vJson)
        Return arrayJson
    End Function

    ''v4: update from v3.2
    ''array style
    ''upgrade vJson to List+Dictionary
    ''*** changed auto vFields (input just vSql ,wow it Easy)
    Function rJsonDBv4(ByVal vSql As String, Optional ByVal vDB As String = "DB106dat") As String
        Dim vJson = New List(Of Dictionary(Of String, String))()
        Dim vTemp As String = ""
        
        Dim vRes As New DataTable
        vRes = rGetDataTable(vSql, vDB)
        Dim vFields = New ArrayList

        ' If vRes.Columns.Count = 0 Then
            
        '     vFields.Add("sss")

        ' Else
        '     vFields.Add("xxx")

        ' End If

        For c As Integer = 0 To vRes.Columns.Count - 1
            vFields.Add(vRes.Columns(c).ColumnName)
        Next
        
        For i As Integer = 0 To vRes.Rows().Count() - 1
            Dim vRes_row = New Dictionary(Of String, String)

            For Each vf As String In vFields
                vTemp = "Null"
                If Not IsDbNull(vRes.Rows(i).Item(vf)) Then
                    vTemp = vRes.Rows(i).Item(vf)
                End If
                vRes_row.Add(vf, CStr(vTemp))
            Next 

            vJson.Add(vRes_row)
        Next
            Dim serializer as New JavaScriptSerializer()
            serializer.MaxJsonLength = 50000000
            Dim arrayJson As String = serializer.Serialize(vJson)
            Return arrayJson

    End Function

    Function rJsonDBv4s(ByVal vSql As String, Optional ByVal vDB As String = "DB106dat") As String
        Dim vJson As String = ""
        Dim vTemp As String = ""

        Dim vRes As New DataTable
        vRes = rGetDataTable(vSql, vDB)

        Dim vFields = New ArrayList
        For c As Integer = 0 To vRes.Columns.Count - 1
            vFields.Add(vRes.Columns(c).ColumnName)
        Next

        For i As Integer = 0 To vRes.Rows().Count() - 1
            vJson += "{"
            For Each vf As String In vFields
                vTemp = "Null"
                If Not IsDbNull(vRes.Rows(i).Item(vf)) Then
                    vTemp = vRes.Rows(i).Item(vf)
                End If
                vJson += " """ + vf + """:""" + CStr(vTemp) + """ ,"
            Next
            vJson = vJson.Remove(vJson.Length - 1, 1)
            vJson += "},"
        Next

        If vJson <> Nothing Then
            vJson = "[" + vJson
            vJson = vJson.Remove(vJson.Length - 1, 1)
            vJson += "]"
        Else
            vJson = "[]"
        End If

        '******TAG SQL******'
        'vJson = vJson.Remove(vJson.Length - 1, 1) + ", ""sql"" : """ + vSql + """ }"
        '******TAG SQL******'

        Return vJson
    End Function

    Function rGetCount(ByVal vSql As String, Optional ByVal vDB As String = "DB106") As String
        Dim vRes As New DataTable
        Dim vJson As String = ""

        If vDB = "DB105" Then
            vRes = DB105.GetDataTable(vSql)
        ElseIf vDB = "DBOnhand" Then
            vRes = DBOnhand.GetDataTable(vSql)
        ElseIf vDB = "DBMPer" Then
            vRes = DBMPer.GetDataTable(vSql)
        ElseIf vDB = "DBCheckList" Then
            vRes = DBCheckList.GetDataTable(vSql)
        ElseIf vDB = "DBTBBAPP" Then
            vRes = DBTBBAPP.GetDataTable(vSql)
        ElseIf vDB = "DBTBBESTATE" Then
            vRes = DBTBBESTATE.GetDataTable(vSql)
        ElseIf vDB = "DBMETERRPT" Then
            vRes = DBMETERRPT.GetDataTable(vSql)
        ElseIf vDB = "DBRECONPOINT" Then
            vRes = DBRECONPOINT.GetDataTable(vSql)
        Else
            vRes = DB106.GetDataTable(vSql)
        End If

        Return vRes.Rows().Count()
    End Function

    Function rGetDataTable(ByVal vSql As String, Optional ByVal vDB As String = "DB106") As DataTable
        Dim vRes As New DataTable
        
        If vDB = "DB105" Then
            vRes = DB105.GetDataTable(vSql)
        ElseIf vDB = "DBOnhand" Then
            vRes = DBOnhand.GetDataTable(vSql)
        ElseIf vDB = "DBMPer" Then
            vRes = DBMPer.GetDataTable(vSql)
        ElseIf vDB = "DBCheckList" Then
            vRes = DBCheckList.GetDataTable(vSql)
        ElseIf vDB = "DBTBBAPP" Then
            vRes = DBTBBAPP.GetDataTable(vSql)
        ElseIf vDB = "DBTBBESTATE" Then
            vRes = DBTBBESTATE.GetDataTable(vSql)
        ElseIf vDB = "DBMETERRPT" Then
            vRes = DBMETERRPT.GetDataTable(vSql)
        ElseIf vDB = "DBRECONPOINT" Then
            vRes = DBRECONPOINT.GetDataTable(vSql)
        Else
            vRes = DB106.GetDataTable(vSql)
        End If

        return vRes
    End Function

    Function rMergeJson(ByVal vJsonA As String, ByVal vJsonB As String) As String
        vJsonA = vJsonA.Remove(vJsonA.Length - 1, 1) + ", "
        vJsonB = vJsonB.Remove(0, 1)

        Return vJsonA + vJsonB
    End Function

    Function rAddTagJson(ByVal vJson As String, ByVal vTag As String, ByVal vData As String) As String
        Return vJson.Remove(vJson.Length - 1, 1) + ", """ + vTag + """ : """ + vData + """ }"
    End Function
#End Region

#Region "OAuth"
    Public Function SetOAuthSingleSignOn(ByVal code As String)
        Dim DS As New DataSet
        Dim DT As New DataTable
        Dim HttpWReq As HttpWebRequest
        Dim httpWRes As HttpWebResponse = Nothing
        Dim address As Uri
        Dim strData As New StringBuilder
        Dim vUri As String = "https://api.jasmine.com/authen1/oauth/token?client_id=" + oauth_client_id + "&redirect_uri=" + oauth_redirect_uri + "&grant_type=authorization_code&code=" + code

        address = New Uri(vUri)
        HttpWReq = DirectCast(WebRequest.Create(address), HttpWebRequest)
        HttpWReq.Method = "POST"
        HttpWReq.ContentType = "application/x-www-form-urlencoded"

        SetBasicAuthHeader(HttpWReq, oauth_client_id, oauth_client_Secret)

        httpWRes = DirectCast(HttpWReq.GetResponse(), HttpWebResponse)

        Dim reader As StreamReader = New StreamReader(httpWRes.GetResponseStream())
        Dim json As String = reader.ReadToEnd()

        Dim vHeader() As String
        Dim Token() As String
        Dim Access_Token As String = ""
        vHeader = Split(json.ToString, ",")
        If vHeader.Length > 2 Then
            Token = Split(vHeader(0).ToString, ":")
            Access_Token = Replace(Token(1).ToString, """", "").ToString.Trim
        End If

        Dim Request As HttpWebRequest
        Dim Response As HttpWebResponse
        Request = DirectCast(WebRequest.Create(New Uri("https://api.jasmine.com/authen1/me")), HttpWebRequest)
        HttpWReq.Method = "GET"
        HttpWReq.ContentType = "application/x-www-form-urlencoded"
        Request.Headers("Authorization") = "Bearer " + Access_Token

        Response = DirectCast(Request.GetResponse(), HttpWebResponse)
        reader = New StreamReader(Response.GetResponseStream())
        json = reader.ReadToEnd()

        DT = ConvertJSONToDataTable(json)
        Dim username As String() = DT.Rows(0).Item("username").ToString.Split("@")
        'Session("Uemail") = username(0)
        Session("token") = Access_Token

        Return username(0)
    End Function

    Private Sub SetBasicAuthHeader(ByVal request As WebRequest, ByVal userName As String, ByVal userPassword As String)
        Dim authInfo As String = userName + ":" + userPassword
        authInfo = Convert.ToBase64String(Encoding.Default.GetBytes(authInfo))
        request.Headers("Authorization") = "Basic " + authInfo
    End Sub

    Public Function ConvertJSONToDataTable(ByVal jsonString As String) As DataTable
        Dim dt As New DataTable
        'strip out bad characters
        Dim jsonParts As String() = jsonString.Replace("[{", "{").Replace("}]", "}").Split("},{")

        'hold column names
        Dim dtColumns As New List(Of String)

        'get columns
        For Each jp As String In jsonParts
            'only loop thru once to get column names
            Dim propData As String() = jp.Replace("{", "").Replace("}", "").Split(New Char() {","}, StringSplitOptions.RemoveEmptyEntries)
            For Each rowData As String In propData
                Try
                    If rowData.Split(":").Length - 1 <> 0 Then
                        Dim idx As Integer = rowData.IndexOf(":")
                        Dim n As String = rowData.Substring(0, idx - 1)
                        Dim v As String = rowData.Substring(idx + 1)
                        If Not dtColumns.Contains(n) Then
                            dtColumns.Add(n.Replace("""", ""))
                        End If
                    End If
                Catch ex As Exception
                    Throw New Exception(String.Format("Error Parsing Column Name : {0}", rowData))
                End Try

            Next
            Exit For
        Next

        'build dt
        For Each c As String In dtColumns
            dt.Columns.Add(c)
        Next
        'get table data
        For Each jp As String In jsonParts
            Dim propData As String() = jp.Replace("{", "").Replace("}", "").Split(New Char() {","}, StringSplitOptions.RemoveEmptyEntries)
            Dim nr As DataRow = dt.NewRow
            For Each rowData As String In propData
                Try
                    Dim idx As Integer = rowData.IndexOf(":")
                    Dim n As String = rowData.Substring(0, idx - 1).Replace("""", "")
                    Dim v As String = rowData.Substring(idx + 1).Replace("""", "")
                    nr(n) = v
                Catch ex As Exception
                    Continue For
                End Try

            Next
            dt.Rows.Add(nr)
        Next
        Return dt
    End Function

    Public Function rGetDataOAuthjson(ByVal vSearch As String, ByVal vToken As String) As String
        Dim DT, DT2 As New DataTable
        Dim json As String

        Dim reader As StreamReader
        Dim Request As HttpWebRequest
        Dim Response As HttpWebResponse

        Try
            Request = DirectCast(WebRequest.Create(New Uri("https://app.jasmine.com/contact-resource-api/v2/" + vSearch + "/")), HttpWebRequest)
            Request.Method = "GET"
            Request.ContentType = "application/x-www-form-urlencoded"
            Request.Headers("token") = vToken
            Request.Headers("scope") = "employee-information"
            Response = DirectCast(Request.GetResponse(), HttpWebResponse)
            reader = New StreamReader(Response.GetResponseStream())
            json = reader.ReadToEnd()
            DT = ConvertJSONToDataTable(json)

            DT2.Columns.Add("employeeId")
            DT2.Columns.Add("thaiFullname")
            DT2.Columns.Add("engFullname")
            DT2.Columns.Add("email")
            DT2.Columns.Add("position")
            DT2.Columns.Add("department")
            DT2.Columns.Add("section")
            DT2.Columns.Add("division")

            If DT.Rows.Count > 0 Then
                For i As Integer = 0 To DT.Rows.Count - 2
                    If (DT.Rows(i).Item("dateExpired") = "" Or DT.Rows(i).Item("dateExpired") = "null") _
                    And DT.Rows(i).Item("accountStatus") = "true" Then
                    'Or rCDateText(DT.Rows(i).Item("dateExpired")) > rGetDateNow) 

                        Dim DR As DataRow = DT2.NewRow
                        DR("employeeId") = DT.Rows(i).Item("employeeId")
                        DR("thaiFullname") = DT.Rows(i).Item("thaiFullname")
                        DR("engFullname") = DT.Rows(i).Item("engFullname")
                        DR("email") = DT.Rows(i).Item("email")
                        DR("position") = DT.Rows(i).Item("position")
                        DR("department") = DT.Rows(i).Item("department")
                        DR("section") = DT.Rows(i).Item("section")
                        DR("division") = DT.Rows(i).Item("division")
                        DT2.Rows.Add(DR)

                    End If
                Next
            End If

            json = rConvertDataTableToJSONv1(DT2)

        Catch ex As Exception
            json = "[]"
        End Try

        Return json
    End Function

    Public Function rGetDataOAuthDT(ByVal vSearch As String, ByVal vToken As String) As DataTable
        Dim DT As New DataTable
        Dim DataOAuth = New Dictionary(Of String, String)

        Dim json As String
        Dim reader As StreamReader

        Dim Request As HttpWebRequest
        Dim Response As HttpWebResponse

        Try
            Request = DirectCast(WebRequest.Create(New Uri("https://app.jasmine.com/contact-resource-api/v2/" + vSearch + "@jasmine.com/")), HttpWebRequest)
            Request.Method = "GET"
            Request.ContentType = "application/x-www-form-urlencoded"
            Request.Headers("token") = vToken
            Request.Headers("scope") = "employee-information"
            Response = DirectCast(Request.GetResponse(), HttpWebResponse)
            reader = New StreamReader(Response.GetResponseStream())
            json = reader.ReadToEnd()
            DT = ConvertJSONToDataTable(json)

        Catch ex As Exception

        End Try

        Return DT
    End Function
    
    Function rConvertDataTableToJSONv1(ByVal vRes As DataTable) As String
        Dim vJson As String = ""
        Dim vTemp As String = ""

        Dim vFields = New ArrayList
        For c As Integer = 0 To vRes.Columns.Count - 1
            vFields.Add(vRes.Columns(c).ColumnName)
        Next

        For i As Integer = 0 To vRes.Rows().Count() - 1
            vJson += "{"
            For Each vf As String In vFields
                vTemp = "Null"
                If Not IsDbNull(vRes.Rows(i).Item(vf)) Then
                    vTemp = vRes.Rows(i).Item(vf)
                End If
                vJson += " """ + vf + """:""" + CStr(vTemp) + """ ,"
            Next
            vJson = vJson.Remove(vJson.Length - 1, 1)
            vJson += "},"
        Next

        If vJson <> Nothing Then
            vJson = "[" + vJson
            vJson = vJson.Remove(vJson.Length - 1, 1)
            vJson += "]"
        Else
            vJson = "[]"
        End If

        Return vJson
    End Function
#End Region

#Region "Analytics"

    Public Sub Analytics()
        ' HttpContext.Current.Response.Redirect("https://posbcs.triplet.co.th/3bbShop/xmaintenance.aspx")
        
        Dim vUrl As String = HttpContext.Current.Request.Url.AbsoluteUri()

        If Not vUrl.ToLower().Contains("login") And Not vUrl.ToLower().Contains("logoutoauth") Then
            ' checkRedirect()
            checkQueryStringUemail()
        End If

        ' Else If vUrl.ToLower().Contains("/3bbshop") Then
        If vUrl.ToLower().Contains("/3bbshop") Then
            Dim vPage As String = rGetPageName()
            Dim vUemail As String = Session("Uemail")
            Dim vIP As String = HttpContext.Current.Request.UserHostAddress()
            Dim vBrowser As String = rGetBrowserName()
            Dim vOS As String = rGetOS()
            'Dim vComname As String = rGetClientComName()

            Dim vSqlIn = "INSERT INTO analyticsites (page,url,uemail,ip,browser,os_version) VALUES ("
            vSqlIn += "'" & vPage & "', "
            vSqlIn += "'" & vUrl & "', "
            vSqlIn += "'" & vUemail & "', "
            vSqlIn += "'" & vIP & "', "
            vSqlIn += "'" & vBrowser & "', "
            vSqlIn += "'" & vOS & "' "
            vSqlIn += ")"

            DB105.ExecuteNonQuery(vSqlIn)
        End If
    End Sub

    Public Sub AnalyticsMemberRPT()
        Dim vUrl As String = HttpContext.Current.Request.Url.AbsoluteUri()

        If Not vUrl.ToLower().Contains(POSBCS_domain) Or Not vUrl.ToLower().Contains(POSBCS_ip) Then
            Dim vPage As String = rGetPageName()
            Dim vUemail As String = Session("Uemail")
            Dim vIP As String = HttpContext.Current.Request.UserHostAddress()
            Dim vBrowser As String = rGetBrowserName()
            Dim vOS As String = rGetOS()

            Dim vSqlIn = "INSERT INTO analyticsites_memberrpt (page,url,uemail,ip,browser,os_version) VALUES ("
            vSqlIn += "'" & vPage & "', "
            vSqlIn += "'" & vUrl & "', "
            vSqlIn += "'" & vUemail & "', "
            vSqlIn += "'" & vIP & "', "
            vSqlIn += "'" & vBrowser & "', "
            vSqlIn += "'" & vOS & "' "
            vSqlIn += ")"

            DB105.ExecuteNonQuery(vSqlIn)

            checkXmaintenance()
        End If
    End Sub

    Public Sub checkXmaintenance()
        Try

            Dim vDT As New DataTable
            Dim vSql As String = "EXEC XXX_MEMBERRPT_MAINTAIN "
            vDT = DBTBBAPP.GetDataTable(vSql)

            If vDT.Rows().Count() > 0 Then
                If vDT.Rows(0).Item("maintain_memberrpt") = 1 Then
                    HttpContext.Current.Response.Redirect("~/memberrpt/xmaintenance.aspx")
                End If
            End If

        Catch ex As Exception
            HttpContext.Current.Response.Redirect("~/memberrpt/xmaintenance.aspx")
        End Try
        
    End Sub

    Public Function rGetPageName(Optional ByVal vRecursive As String = "") As String
        Dim vRes As String = HttpContext.Current.Request.Url.AbsoluteUri()

        If vRecursive <> "" Then
            vRes = vRecursive
        End If

        Dim vTemp As String = vRes

        Try
            vRes = vRes.Substring(vRes.LastIndexOf("/") + 1)
            vRes = vRes.Substring(0, vRes.IndexOf("."))
        
            return vRes
        Catch ex As Exception
            vRes = vTemp
            vRes = vRes.Substring(0, vRes.LastIndexOf("/"))

            return rGetPageName(vRes)
        End Try

    End Function

    Public Function rGetClientComName() As String
        Try
            Return System.Net.Dns.GetHostByAddress(HttpContext.Current.Request.UserHostAddress()).HostName
        Catch ex As Exception
            Return "unknown"
        End Try
    End Function

    Public Function rGetBrowserName() As String
        Dim userAgent As String = HttpContext.Current.Request.UserAgent
        If userAgent.Contains("Firefox") Then
            Return userAgent.Substring(userAgent.IndexOf("Firefox"))
        ElseIf userAgent.Contains("Chrome") Then
            Dim agentPart As String = userAgent.Substring(userAgent.IndexOf("Chrome"))
            Return agentPart.Substring(0, agentPart.IndexOf("Safari") - 1)
        End If

        Return HttpContext.Current.Request.Browser.Browser & "/" & HttpContext.Current.Request.Browser.Version
    End Function

    Public Function rGetOS() As String
        Dim vClientAgent As String = HttpContext.Current.Request.UserAgent().ToLower()

        If vClientAgent.IndexOf("windows nt 10.0") >= 0 Then
            Return "Windows 10"
        ElseIf vClientAgent.IndexOf("windows nt 6.3") >= 0 Then
            Return "Windows 8.1"
        ElseIf vClientAgent.IndexOf("windows nt 6.2") >= 0 Then
            Return "Windows 8"
        ElseIf vClientAgent.IndexOf("windows nt 6.1") >= 0 Then
            Return "Windows 7"
        ElseIf vClientAgent.IndexOf("windows nt 6.0") >= 0 Then
            Return "Windows Vista"
        ElseIf vClientAgent.IndexOf("windows nt 5.2") >= 0 Then
            Return "Windows Server 2003"
        ElseIf vClientAgent.IndexOf("windows nt 5.1") >= 0 Then
            Return "Windows XP"
        ElseIf vClientAgent.IndexOf("windows nt 5.01") >= 0 Then
            Return "Windows 2000 (SP1)"
        ElseIf vClientAgent.IndexOf("windows nt 5.0") >= 0 Then
            Return "Windows 2000"
        ElseIf vClientAgent.IndexOf("windows nt 4.5") >= 0 Then
            Return "Windows NT 4.5"
        ElseIf vClientAgent.IndexOf("windows nt 4.0") >= 0 Then
            Return "Windows NT 4.0"
        ElseIf vClientAgent.IndexOf("win 9x 4.90") >= 0 Then
            Return "Windows ME"
        ElseIf vClientAgent.IndexOf("windows 98") >= 0 Then
            Return "Windows 98"
        ElseIf vClientAgent.IndexOf("windows 95") >= 0 Then
            Return "Windows 95"
        ElseIf vClientAgent.IndexOf("windows ce") >= 0 Then
            Return "Windows CE"
        ElseIf (vClientAgent.Contains("ipad")) Then
            Return String.Format("iPad OS {0}", GetMobileVersion(vClientAgent, "OS"))
        ElseIf (vClientAgent.Contains("iphone")) Then
            Return String.Format("iPhone OS {0}", GetMobileVersion(vClientAgent, "OS"))
        ElseIf (vClientAgent.Contains("linux") AndAlso vClientAgent.Contains("kfapwi")) Then
            Return "Kindle Fire"
        ElseIf (vClientAgent.Contains("rim tablet") OrElse (vClientAgent.Contains("bb") AndAlso vClientAgent.Contains("mobile"))) Then
            Return "Black Berry"
        ElseIf (vClientAgent.Contains("Windows phone")) Then
            Return String.Format("Windows Phone {0}", GetMobileVersion(vClientAgent, "Windows Phone"))
        ElseIf (vClientAgent.Contains("mac os")) Then
            Return "Mac OS"
        ElseIf vClientAgent.IndexOf("android") >= 0 Then
            Return String.Format("Android {0}", GetMobileVersion(vClientAgent, "ANDROID"))
        Else
            Return "OS is unknown."
        End If
    End Function

    Private Function GetMobileVersion(userAgent As String, device As String) As String
        Dim ReturnValue As String = String.Empty
        Dim RawVersion As String = userAgent.Substring(userAgent.IndexOf(device) + device.Length).TrimStart()

        For Each character As Char In RawVersion
            If IsNumeric(character) Then
                ReturnValue &= character
            ElseIf (character = "." OrElse character = "_") Then
                ReturnValue &= "."
            Else
                Exit For
            End If
        Next

        Return ReturnValue
    End Function
#End Region
    
#Region "NoCat"

    Protected Sub rEcho(ByVal vStr As String)
        HttpContext.Current.Response.Write(vStr)
    End Sub

    Function rAlphabet(ByVal vABC As String) As String
        Dim Alphabet As String = " ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        If Regex.IsMatch(vABC, "^[0-9 ]+$") Then
            Return vABC
        Else
            Dim vR As String = vABC.ToUpper()
            vR = Alphabet.IndexOf(vR, 0)
            vR = vR Mod 10

            Return vR
        End If
    End Function

    Function rGetIpHost() As String
        Dim vHostName As String = System.Net.Dns.GetHostName()
        Dim vIPAddress As String = System.Net.Dns.GetHostByName(vHostName).AddressList(0).ToString()

        Return vIPAddress
    End Function

    Function rReplaceQuote(ByVal vValue As String) As String
        If vValue <> Nothing Then
            Return vValue.Replace("'", "''")
        Else
            Return vValue
        End if
    End Function

    Function rReplaceSpecialSting(ByVal vValue As String) As String
        If vValue <> Nothing Then
            'vValue = Regex.Replace(vValue, "[^\u0E00-\u0E7Fa-zA-Z0-9' .,:;<>(){}_+*/=!@#$%&?\^\-\[\]\'\""\\]|^'|'$|''", " ")
            vValue = Regex.Replace(vValue, "[^\u0E00-\u0E7Fa-zA-Z0-9' .,:;<>(){}_+*/=!@#$%&?\^\-\[\]\'\""\\]", " ")
            vValue = Regex.Replace(vValue, " {2,}", " ") 'replace space > 2 space
            Return vValue
        Else
            Return vValue
        End if
    End Function

    Function rValidJson(ByVal vValue As String) As String
        If vValue <> Nothing Then
            vValue = rReplaceSpecialSting(vValue)
            vValue = vValue.Replace("\", "\\")
            vValue = vValue.Replace("""", "\""")
            Return vValue
        Else
            Return vValue
        End if
    End Function

    Function rReplaceSpaceToPercent(ByVal vValue As String) As String
        If vValue <> Nothing Then
            Return vValue.Replace(" ", "%")
        Else
            Return vValue
        End If
    End Function

    Function rReplaceSpecialSting_back(ByVal vValue As String) As String
        If vValue <> Nothing Then
            'Return vValue.Replace("""", "\""")
            vValue = vValue.Replace("""", "\""").Replace(vbCr, " ").Replace(vbLf, " ")
            Return Regex.Replace(vValue, " {2,}", " ")
        Else
            Return vValue
        End if
    End Function

    Function rReplaceDBQuote(ByVal vValue As String) As String
        If vValue <> Nothing Then
            'Return vValue.Replace("""", "\""")
            vValue = vValue.Replace("""", "\""").Replace(vbCr, "").Replace(vbLf, "")
            Return Regex.Replace(vValue, " {2,}", " ")
        Else
            Return vValue
        End if
    End Function

    Function rJustOneSpace(ByVal vValue As String) As String
        If vValue <> Nothing Then
            Return Regex.Replace(vValue, " {2,}", " ")
        Else
            Return vValue
        End if
    End Function

    Function rReplaceConvertHTML(ByVal vValue As String) As String
        If vValue <> Nothing Then
            vValue = vValue.Replace("|BR|", "<br>")
            vValue = vValue.Replace("|nbs|", "&nbsp;")
            vValue = vValue.Replace("|und1|", "<u>")
            vValue = vValue.Replace("|und2|", "</u>")
            Return rReplaceQuote(vValue)
        Else
            Return vValue
        End if
    End Function
#End Region

End Class

