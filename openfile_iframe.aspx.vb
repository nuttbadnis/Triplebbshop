﻿Partial Class openfile_iframe
    Inherits System.Web.UI.Page
    Dim CP As New Cls_Panu
    Dim CUF As New Cls_UploadFile

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("file") = Nothing Then
            Response.Write("not file!!")
        Else If Request.QueryString("path") = Nothing Then
            Response.Write("not path!!")
        Else
            Dim path_file As String = Request.QueryString("path") 
            path_file = path_file.Replace("-","/") + "/" 
            path_file += Request.QueryString("file")
            
            Response.Redirect("http://" + CUF.rGetHost() + "/" + CUF.rGetPathParent() + "File/upload/" + path_file)
        End If
    End Sub
End Class