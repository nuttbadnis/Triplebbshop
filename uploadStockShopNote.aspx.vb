Imports System.IO

Partial Class uploadStockShopNote
    Inherits System.Web.UI.Page
    Dim CUL As New Cls_UploadFile

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        uploadFileNsave()
    End Sub

    Private Sub uploadFileNsave()
        Dim shop_code As String = Request.Form("file_shop_code")
        Dim no_note As String = Request.Form("file_no_note")

       If no_note = "" Then
       		no_note = "0"
       End If

        Dim vRename AS String
        Dim vResult As Integer = 0
        Dim vError As Integer = 1
        Dim vPrefix As String = "ATT_" & shop_code & "_" & no_note

        If InStr(Request.ContentType, "multipart/form-data") Then
            Dim vFileUpload As HttpFileCollection
            vFileUpload = Request.Files

            ' Dim arrStr() As String
            ' arrStr = vFileUpload.AllKeys

            ' Response.Write("File ID: " & arrStr(0) & "<br> File Name/Path: " & vFileUpload(0).FileName & "<br>")

            Dim vFileType As String
            Dim vFileName AS String
            Dim vTempFile As String = ""
            Dim vTempPath As String = Server.MapPath("temp\")

            Dim vUploadPath As String = "F:\"
            vUploadPath &= CUL.rGetPathParent() & "File\upload" 
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

        ClientScript.RegisterStartupScript(Page.GetType, "", "window.top.window.uploadResult('" & vResult & "','" & vRename & "', '" & vError & "');", True)
    End Sub
End Class
