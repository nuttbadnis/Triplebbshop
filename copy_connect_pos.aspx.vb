Imports System.Data
Imports MySql.Data.MySqlClient

Partial Class _copy
    Inherits System.Web.UI.Page
    Dim DB105 As New Cls_Data105
    Dim DBMYSQL As New Cls_MySQL
    Dim CP As New Cls_Panu

    Dim vSql_Main As String = "DECLARE @current_date DATETIME = CAST(GETDATE() AS DATE) " + _
        "DECLARE @t table( " + _
        "    history_date datetime,  shop_code varchar(50), " + _
        "    shop_dayoff tinyint, close_temp tinyint, " + _
        "    shop_open varchar(10), shop_close varchar(10), " + _
        "    open_time varchar(5), close_time varchar(5), " + _
        "    open_in_serv varchar(5), close_in_serv varchar(5), in_serv_diff int, " + _
        "    open_status int, close_status int, shop_status int " + _
        "    ); " + _
        "INSERT INTO @t EXEC status_open_close_3bbshop @current_date, @current_date, 0 " + _
        "SELECT shopStock.shop_code, shop_dayoff, shop_status, shop_open, first_up " + _
        "FROM @T temp " + _
        "LEFT JOIN shopStock " + _
        "ON shopStock.shop_code = temp.shop_code " + _
        "INNER JOIN connectPOS " + _
        "ON connectPOS.shop_code = temp.shop_code "

    Dim NL As String = " %0A"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        copyConnectPpat()

        'Dim HH As Integer = DateTime.Now.ToString("HH")
        'Dim mm As Integer = DateTime.Now.ToString("mm")

        'If HH < 18 And (mm mod 8) = 3 Then
            'alertNoData()
            'alertLostConnection()
        'End If
    End Sub

    Public Sub copyConnectPpat()
        Dim vMss As String = ""

        Try
            Dim vMySQL As String = "select shop_code "
            vMySQL += ",DATE_FORMAT(min(shop_up), '%H:%i') first_up "
            vMySQL += ",DATE_FORMAT(max(shop_up), '%H:%i') last_up "
            vMySQL += ",DATE_FORMAT(max(shop_check_time), '%H:%i') last_check "
            vMySQL += ",TIMESTAMPDIFF(MINUTE, max(shop_up), max(shop_check_time)) diff_minute "
            vMySQL += "from POS_Shop_log  "

            vMySQL += "where shop_up != '0000-00-00 00:00:00' "
            vMySQL += "and date(shop_check_time) = date(now()) "
            vMySQL += "and date(shop_up) = date(now()) "

            vMySQL += "group by shop_code "
            vMySQL += "order by shop_code "

            Dim vDT As DataTable
            vDT = DBMYSQL.QueryDataTable(vMySQL)
            DBMYSQL.Close()

            If vDT.Rows().Count() > 0 Then
                Dim vSqlIn As String = "TRUNCATE TABLE connectPOS "

                For i As Integer = 0 To vDT.Rows.Count - 1
                    vSqlIn += "INSERT INTO connectPOS (shop_code,first_up,last_up,last_check,diff_minute) VALUES ("
                    vSqlIn += "'" & vDT.Rows(i).Item("shop_code") & "', "
                    vSqlIn += "'" & vDT.Rows(i).Item("first_up") & "', "
                    vSqlIn += "'" & vDT.Rows(i).Item("last_up") & "', "
                    vSqlIn += "'" & vDT.Rows(i).Item("last_check") & "', "
                    vSqlIn += "'" & vDT.Rows(i).Item("diff_minute") & "' "
                    vSqlIn +=  ")"
                Next

                Dim vEffect As String = DB105.ExecuteNonQuery(vSqlIn).ToString()

                If vEffect >= 1 Then
                    Response.Write(vEffect & " success!! by " & vDT.Rows.Count & " records")
                Else
                    Response.Write("failed!!!")
                    vMss = "Copy to DB105 failed"
                End If
            Else
                vMss = "ไม่มีข้อมูล"
            End If

            If vDT.Rows().Count() < 10 Then
                vMss = "ข้อมูลน้อยผิดปกติ"
            End If

        Catch ex As Exception
            vMss = "ไม่สามามารถเชื่อมต่อได้"
        End Try

        iF vMss.Length > 0 Then
            vMss = "[DB MySql DTS Connection ของพี่พัฒ] *" + vMss + "*"
            vMss += vbCrLf + vbCrLf + "กรุณาตรวจสอบ Job Copy Connect POS"

            CP.lineAlert("POS Monitor", vMss)
        End iF

    End Sub

    Public Sub alertNoData()
        Dim vRes As New DataTable
        Dim vMss As String = ""

        Dim vSql As String = vSql_Main
        vSql += "FULL OUTER JOIN pos_monitor ON pos_monitor.shop_code = temp.shop_code "

        vSql += "WHERE shop_dayoff = 0 "
        vSql += "AND shop_status = 4 AND first_up <> '-' "
        vSql += "AND DATEDIFF(minute, CAST(first_up as time), CAST(GETDATE() as time)) > 10 "
        vSql += "AND DATEADD(minute, 10, CAST(shop_open as time)) < CAST(GETDATE() as time) "
        vSql += "AND CAST(shop_close as time) > CAST(GETDATE() as time) "

        vSql += "AND pos_monitor.shop_code is null "
        
        vRes = DB105.GetDataTable(vSql)

        For i As Integer = 0 To vRes.Rows().Count() - 1
            vMss += vRes.Rows(i).Item("shop_code")
            vMss += ","
        Next

        iF vMss.Length > 0 Then
            vMss = vMss.Remove(vMss.Length - 1, 1)
            vMss = "[HAVE CONNECT BUT NO DATA]" + NL + vMss

            CP.lineAlert("POS Monitor", vMss)
        End iF
    End Sub

    Public Sub alertLostConnection()
        Dim vRes As New DataTable
        Dim vMss As String = ""

        Dim vSql As String = vSql_Main
        vSql += "FULL OUTER JOIN pos_monitor ON pos_monitor.shop_code = temp.shop_code "

        vSql += "WHERE shop_dayoff = 0 "
        vSql += "AND (shop_status = 2 OR shop_status = 3) "
        vSql += "AND connectPOS.diff_minute > 150 "
        vSql += "AND CAST(shop_open as time) < CAST(GETDATE() as time) "
        vSql += "AND CAST(shop_close as time) > CAST(GETDATE() as time) "

        vSql += "AND pos_monitor.shop_code is null "

        vRes = DB105.GetDataTable(vSql)

        For i As Integer = 0 To vRes.Rows().Count() - 1
            vMss += vRes.Rows(i).Item("shop_code")
            vMss += ","
        Next

        iF vMss.Length > 0 Then
            vMss = vMss.Remove(vMss.Length - 1, 1)
            vMss = "[LOST CONNECTION > 2HR]" + NL + vMss

            CP.lineAlert("POS Monitor", vMss)
        End iF
    End Sub
End Class
