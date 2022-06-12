Imports System.Data

Partial Class itcamera_save_db
    Inherits System.Web.UI.Page
    Dim DB105 As New Cls_Data105
    Dim CP As New Cls_Panu

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Request.QueryString("go") <> Nothing Then
            save()
        Else
            Response.Write("parameter go")
        End If
    End Sub

    Sub save()
    	
        Dim xLink As String = "http://camera3bb.triplet.co.th/api1.php"

        Dim sourceString As String = New System.Net.WebClient().DownloadString(xLink)

        Dim vSqlIn As String = "truncate table shop_camera_temp "
        Dim vDT As New DataTable
        vDT = CP.ConvertJSONToDataTable(sourceString)

        If vDT.Rows().Count() > 0 Then
        	For i As Integer = 0 To vDT.Rows.Count - 1
            	If Not IsDbNull(vDT.Rows(i).Item("shop_code")) Then
                    If vDT.Rows(i).Item("link").Substring(vDT.Rows(i).Item("link").Length - 2, 2) = "_1" Then
                       vSqlIn += "if not exists (select * from shop_camera_temp where shop_code = '" & vDT.Rows(i).Item("shop_code") & "') begin "
                	   vSqlIn += "INSERT INTO shop_camera_temp (shop_code,camera_model) VALUES ("
                       vSqlIn += "'" & vDT.Rows(i).Item("shop_code") & "', "
                       vSqlIn += "'" & vDT.Rows(i).Item("model") & "' "
                       vSqlIn +=  ") end "
                    End If
				End If
            Next
		End If

		If DB105.ExecuteNonQuery(vSqlIn).ToString() >= 1 Then
            ' Response.Write("update temp success!!")

            Dim vSql As String = "select * from shop_camera_temp"
            vDT = DB105.GetDataTable(vSql)

            If vDT.Rows().Count() > 0 Then
                vSqlIn = "truncate table shop_camera "
                vSqlIn += "insert into shop_camera (shop_code, camera_model) "
                vSqlIn += "select * from shop_camera_temp "

                If DB105.ExecuteNonQuery(vSqlIn).ToString() >= 1 Then
                    ' Response.Write("<br>")
                    Response.Write("update success!!")
                End If
            End If
		End If
    End Sub
End Class
