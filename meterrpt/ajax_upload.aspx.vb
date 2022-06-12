Imports System.IO
Imports System.Data

Partial Class ajax_upload
    Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        uploadFileNsave()
    End Sub

    Private Sub uploadFileNsave()
        Dim file_prefix As String = Request.Form("file_prefix")

        Dim vRename AS String
        Dim vResult As Integer = 0
        Dim vError As Integer = 1
        Dim vPrefix As String = file_prefix '& "_"

        If InStr(Request.ContentType, "multipart/form-data") Then
            Dim vFileUpload As HttpFileCollection
            vFileUpload = Request.Files

            Dim vFileType As String
            Dim vFileName AS String
            Dim vTempFile As String = ""
            Dim vTempPath As String = Server.MapPath("temp\")

            Dim vUploadPath As String = "F:\"
            vUploadPath &= rGetPathParent() & "File\meterrpt" 
            vUploadPath &= "\" & DateTime.Now.ToString("yyyy")
            vUploadPath &= "\" & DateTime.Now.ToString("MM")

            IF Not Directory.Exists(vTempPath) then
                Directory.CreateDirectory(vTempPath)
            End IF

            If vFileUpload(0).FileName <> "" Then
                IF Not Directory.Exists(vUploadPath) then
                    Directory.CreateDirectory(vUploadPath)
                End IF

                vUploadPath &= "\"

                vFileName = System.IO.Path.GetFileName(vFileUpload(0).FileName)

                If vFileName.Length >= 1 Then
                    vTempFile = vFileName    'FileName
                    vFileType = System.IO.Path.GetExtension(vFileName) 
                End If

                vRename = vPrefix 
                vRename &= DateTime.Now.ToString("_yyMMdd_HHmmss")
                vRename &= vFileType

                vFileUpload(0).SaveAs(Server.MapPath("temp\" & vTempFile))

                Dim TheFile As FileInfo = New FileInfo(vTempPath & vTempFile)
                If TheFile.Exists Then
                    System.IO.File.Move(vTempPath & vTempFile, vUploadPath & vRename)  'Move File
                    vResult = 1
                Else
                    vRename = ""

                    Throw New FileNotFoundException()
                End If


            End If
        End If

        vError = 0

        ClientScript.RegisterStartupScript(Page.GetType, "", "window.top.window.AjaxUploadResult('" & vRename & "', '" & vError & "');", True)
    End Sub

    Public Function rGetPathParent() As String
        'example url = http://posbcs.triplet.co.th/FlowDemo/testupload.aspx
        'Request.Url.AbsolutePath = /FlowDemo/testupload.aspx
        'vPath(1) = FlowDemo

        Dim vPath As Array = HttpContext.Current.Request.Url.AbsolutePath.Split("/")
        Return vPath(1)
    End Function

    Public Function rGetHost() As String
        Return HttpContext.Current.Request.Url.Host
    End Function
End Class
