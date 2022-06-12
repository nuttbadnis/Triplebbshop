Imports System.Data

Partial Class itcamera
    Inherits System.Web.UI.Page
    Dim CP As New Cls_Panu
    Dim DB105 As New Cls_Data105
    Dim DB106 As New Cls_Data

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' CP.checkLogin()
        
        CP.Analytics()
    End Sub
End Class
