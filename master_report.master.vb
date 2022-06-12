Imports System.Data

Partial Class master_report
    Inherits System.Web.UI.MasterPage
    Dim CP As New Cls_Panu

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Uemail") IsNot Nothing Then

            hide_uemail.Value() = Session("Uemail")
            user_logon.InnerHtml = "<span class='glyphicon glyphicon-off user_logon' aria-hidden='true'></span> " + Session("Uemail")

            If CP.rCheckPermiss() > 0 Then
                hide_upermiss.Value() = Session("upermiss")
                Session.Remove("upermiss")
            End If
        End If

        If CP.rContractPermiss() = 0 Then
            li_contract.Visible = False
        End If

        checkPermissCamera()
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

