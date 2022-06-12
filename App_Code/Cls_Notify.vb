Imports Microsoft.VisualBasic
Imports System.Net
Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading
Imports System.Text

Public Class Cls_Notify
    Dim DBPOSSUP As New Cls_DataPOSSUP

#Region "Line Notify"

    Public Function lineNotify(ByVal lineGroup As String, ByVal txtNotiMsg As String, ByVal appSys As String) As Boolean
        Dim vDT As New DataTable

        Dim vSql As String
        vSql = "select * from LineNotifyToken "
        vSql += "where disable = 0 "
        vSql += "and group_name = '" + lineGroup + "' "

        vDT = DBPOSSUP.GetDataTable(vSql)

        Try
            Dim request = CType(WebRequest.Create("https://notify-api.line.me/api/notify"), HttpWebRequest)
            Dim postData = String.Format("message={0}", txtNotiMsg)
            Dim data = Encoding.UTF8.GetBytes(postData)

            If Not String.IsNullOrEmpty(txtNotiMsg.Trim) Then
                With request
                    .Method = "POST"
                    .ContentType = "application/x-www-form-urlencoded"
                    .ContentLength = data.Length
                    .Headers.Add("Authorization", "Bearer " + vDT.Rows(0).Item("token"))
                End With
            End If

            Using stream As System.IO.Stream = request.GetRequestStream()
                stream.Write(data, 0, data.Length)
            End Using

            keepLogNotify(lineGroup, txtNotiMsg, appSys, True)

            Return True

        Catch ex As Exception
            keepLogNotify(lineGroup, txtNotiMsg, appSys, False)

            Return False
        End Try

    End Function

    Public Function keepLogNotify(ByVal lineGroup As String, ByVal txtNotiMsg As String, ByVal appSys As String, ByVal notiSuccess As String) As Boolean
        Dim vSqlIn = "INSERT INTO LineNotifyLog (group_name, submit_in_app, msg, noti_success) VALUES ("
            vSqlIn += "'" & lineGroup & "', "
            vSqlIn += "'" & appSys & "', "
            vSqlIn += "'" & rLimitString(txtNotiMsg, 500) & "', "
            vSqlIn += "'" & notiSuccess & "' "
            vSqlIn += ")"

        DBPOSSUP.ExecuteNonQuery(vSqlIn)
    End Function

#End Region

    Function rLimitString(ByVal vStr As String, ByVal vLimit As Integer) As String
        If vStr.Length < vLimit Then
            Return vStr
        Else
            Return vStr.Substring(0, vLimit - 5) & "..."
        End If

    End Function

End Class

