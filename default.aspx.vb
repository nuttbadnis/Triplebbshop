Imports System.Data

Partial Class _Default
    Inherits System.Web.UI.Page
    Dim CP As New Cls_Panu

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CP.SessionUemail()

        If Request.QueryString("code") <> Nothing Then
            Session("Uemail") = CP.SetOAuthSingleSignOn(Request.QueryString("code"))
            
            If Session("current_url") <> Nothing Then
                Response.Redirect(Session("current_url"))
            Else
                Response.Redirect("~/default.aspx")
            End If
        End If

        If Session("Uemail") IsNot Nothing Then
            hide_uemail.Value() = Session("Uemail")
            user_logon.InnerHtml = "<span class='glyphicon glyphicon-off user_logon' aria-hidden='true'></span> " + Session("Uemail")

            If CP.rCheckPermissList() > 0 Then
                hide_upermiss.Value() = Session("upermiss")
                hide_shoplist.Value() = Session("shoplist")

                Dim vCountPending As String = CP.rCheckApprove()

                If Session("upermiss") = "BACKOFFICE_ADMIN" And vCountPending > 0 Then
                    Page.ClientScript.RegisterStartupScript(Me.GetType(), "alertscript", "adminAlert(" & vCountPending & ");", True)
                End If
                
                Session.Remove("upermiss")
                Session.Remove("shoplist")
            Else
                ' hide_upermiss.Value() = "BACKOFFICE_VIEWER"
            End If
        End If

        If CP.rContractPermiss() = 0 Then
            li_contract.Visible = False
        End If

        checkPermissCamera()

        CP.Analytics()
    End Sub

    Sub checkPermissCamera()
        hide_camera_permit.Value() = 0

        If Session("Uemail") <> Nothing Then
            Dim xLink As String = "http://camera3bb.triplet.co.th/api4.php?email=" + Session("Uemail") + "@jasmine.com"
            Dim sourceString As String = New System.Net.WebClient().DownloadString(xLink)

            Dim vSqlIn As String = ""
            Dim vDT As New DataTable
            vDT = CP.ConvertJSONToDataTable(sourceString)

            If vDT.Rows().Count() > 0 Then
                hide_camera_permit.Value() = vDT.Rows(0).Item("permission")
            End If
        End If
    End Sub
End Class
