Imports System.Data
Imports System.Text
Imports System.IO
Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports iTextSharp.text.html
Imports iTextSharp.text.html.simpleparser


Partial Class ajax_data
    Inherits System.Web.UI.Page
    Dim CP As New Cls_Panu
    Dim DBMETERRPT As New Cls_DataMETERRPT
    Dim JDB As String = "DBMETERRPT"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim qrs As String = ""

        If Request.QueryString("qrs") <> Nothing Then
            qrs = Request.QueryString("qrs")
        End If

        If qrs = "xport_E10_FILTER" Then
            xport_E10_FILTER()
        End If

        If qrs = "xport_E20_FILTER" Then
            xport_E20_FILTER()
        End If

        If qrs = "count_FILTER" Then
            count_FILTER()
        End If

        If qrs = "load_FILTER" Then
            load_FILTER()
        End If

        If qrs = "SP_METER_AREA_RO" Then
            SP_METER_AREA_RO()
        End If

        If qrs = "SP_METER_AREA_CLUSTER" Then
            SP_METER_AREA_CLUSTER()
        End If

        If qrs = "SP_METER_AREA_PROVINCE" Then
            SP_METER_AREA_PROVINCE()
        End If

        If qrs = "SP_METER_ALERT_CASE" Then
            SP_METER_ALERT_CASE()
        End If

        If qrs = "SP_INSURANCE_METER_TYPE" Then
            SP_INSURANCE_METER_TYPE()
        End If

        If qrs = "SP_INSURANCE_EXECUTION_TYPE" Then
            SP_INSURANCE_EXECUTION_TYPE()
        End If
    
        If qrs = "SP_INSURANCE_CHECKBALANCE_TYPE" Then
            SP_INSURANCE_CHECKBALANCE_TYPE()
        End If

        If qrs = "SP_E10022" Then
            SP_E10022()
        End If

        If qrs = "SP_E10031" Then
            SP_E10031()
        End If

        If qrs = "SP_E10010_YYMM" Then
            SP_E10010_YYMM()
        End If

        If qrs = "SP_UPDATE_ELECTRIC_MASTER" Then
            SP_UPDATE_ELECTRIC_MASTER()
        End If

        If qrs = "SP_UPDATE_PROVINCE_ELECTRIC_MASTER" Then
            SP_UPDATE_PROVINCE_ELECTRIC_MASTER()
        End If

        If qrs = "SP_UPDATE_E10010_REMARK" Then
            SP_UPDATE_E10010_REMARK()
        End If

        If qrs = "get_last_import" Then
            get_last_import()
        End If
    End Sub

    Function rSqlLoadE10Filter()
        Dim ALL_ALERT_CASE As String = Request.QueryString("ALL_ALERT_CASE")
        Dim CHK_REMARK As String = Request.QueryString("CHK_REMARK")

        Dim BILL_YYMM As String = Request.QueryString("BILL_YYMM")

        Dim RO As String = Request.QueryString("RO")
        Dim CLUSTER As String = Request.QueryString("CLUSTER")
        Dim PROVINCE As String = Request.QueryString("PROVINCE")
        
        Dim ALERT_CASE_ID As String = Request.QueryString("ALERT_CASE_ID")

        Dim avg63 As String = Request.QueryString("avg63")
        Dim lastavg3 As String = Request.QueryString("lastavg3")
        Dim xKeyword As String = Request.QueryString("kw")

        Dim vSql As String = "from VW_E10010 "
        vSql += "where 1 = 1 "

        If ALERT_CASE_ID <> Nothing Then
            vSql += " and ALERT_CASE_ID = '" & ALERT_CASE_ID & "' "
        End If

        If ALL_ALERT_CASE <> Nothing Then
            vSql += " and ALERT_CASE_ID is NOT NULL "
        End If

        If CHK_REMARK <> Nothing Then
            If CHK_REMARK = 1 Then
                vSql += " and REMARK is NOT NULL "
            Else If CHK_REMARK = 2 Then
                vSql += " and REMARK is NULL "
            End If
        End If

        If BILL_YYMM <> Nothing Then
            vSql += " and BILL_YYMM = '" & BILL_YYMM & "' "
        End If

        If RO <> Nothing Then
            vSql += " and RO = '" & RO & "' "
        End If

        If CLUSTER <> Nothing Then
            vSql += " and CLUSTER = '" & CLUSTER & "' "
        End If

        If PROVINCE <> Nothing Then
            vSql += " and PROVINCE = '" & PROVINCE & "' "
        End If

        ' If avg63 <> Nothing Then
        '     vSql += " and DIFF_AVG63_UNIT > '" & avg63 & "' "
        ' End If

        If lastavg3 <> Nothing Then
            vSql += " and DIFF_LASTAVG3_UNIT > '" & lastavg3 & "' "
        End If

        If xKeyword <> Nothing Then
            vSql += " and ( "
            vSql += " LOCATION like '%" & xKeyword & "%' "
            vSql += " or CONTRACT_ID like '%" & xKeyword & "%' "
            vSql += " ) "
        End If

        Return vSql
    End Function

    Function rSqlLoadE20Filter()
        Dim CHK_REMARK As String = Request.QueryString("CHK_REMARK")

        Dim RO As String = Request.QueryString("RO")
        Dim CLUSTER As String = Request.QueryString("CLUSTER")
        Dim PROVINCE As String = Request.QueryString("PROVINCE")

        Dim METER As String = Request.QueryString("METER")
        Dim EXECUTION As String = Request.QueryString("EXECUTION")
        Dim CHECKBALANCE As String = Request.QueryString("CHECKBALANCE")

        Dim xKeyword As String = Request.QueryString("kw")

        Dim vSql As String = "from VW_E20010 "
        vSql += "where 1 = 1 "

        If CHK_REMARK <> Nothing Then
            If CHK_REMARK = 1 Then
                vSql += " and Execution_Note <> '' "
            Else If CHK_REMARK = 2 Then
                vSql += " and Execution_Note = '' "
            End If
        End If

        If RO <> Nothing Then
            vSql += " and RO = '" & RO & "' "
        End If

        If CLUSTER <> Nothing Then
            vSql += " and CLUSTER = '" & CLUSTER & "' "
        End If

        If PROVINCE <> Nothing Then
            vSql += " and PROVINCE = '" & PROVINCE & "' "
        End If

        If METER <> Nothing Then
            vSql += " and Meter_Type_ID = '" & METER & "' "
        End If

        If EXECUTION <> Nothing Then
            vSql += " and execution_type_id = '" & EXECUTION & "' "
        End If

        If CHECKBALANCE <> Nothing Then
            vSql += " and check_balance_type_id = '" & CHECKBALANCE & "' "
        End If

        If xKeyword <> Nothing Then
            vSql += " and ( "
            vSql += " Location_Code like '%" & xKeyword & "%' "
            vSql += " or PEA_NO like '%" & xKeyword & "%' "
            vSql += " ) "
        End If

        Return vSql
    End Function

    Private Sub xport_E10_FILTER()
        Dim vSql As String = "select "
        vSql += "RO RO "
        vSql += ", CLUSTER "
        vSql += ", PROVINCE "
        vSql += ", LOCATION "
        vSql += ", LOCATION_PROVINCE "
        ' vSql += ", LOCATION_NAME "
        vSql += ", CONTRACT_ID 'เลขที่สัญญา' "
        vSql += ", DEVICE 'DEVICE NO' "
        vSql += ", ELECTRIC_GROUP_ACROYM ประเภทใบเสร็จ "
        vSql += ", BILL_YYMM 'รอบบิล' "
        vSql += ", MAX_UNIT "
        vSql += ", MIN_UNIT "
        vSql += ", AVG3_UNIT "
        vSql += ", AVG6_UNIT "
        vSql += ", LAST_UNIT "
        vSql += ", DIFF_LASTAVG3_UNIT [UNIT LAST-AVG3 %] "
        vSql += ", MAX_AMOUNT "
        vSql += ", MIN_AMOUNT "
        vSql += ", AVG3_AMOUNT "
        vSql += ", AVG6_AMOUNT "
        vSql += ", LAST_AMOUNT "
        vSql += ", DIFF_LASTAVG3_AMOUNT [AMOUNT LAST-AVG3 %] "
        vSql += ", ALERT_CASE_TITLE [ALERT CASE] "
        vSql += ", BILL_YYMM 'เดือนที่จด' "
        vSql += ", REMARK 'หมายเหตุ' "
        vSql += rSqlLoadE10Filter()
        vSql += "ORDER BY RO, CLUSTER, PROVINCE, LOCATION_PROVINCE, LOCATION, CONTRACT_ID "

        ' Response.Write(vSql)

        Dim vSaveName As String = "METERRPT_E10"
        vSaveName += "_" + DateTime.Now.ToString("yyyyMMdd_HHmmss")
        vSaveName += ".xls"
        
        Dim DT As New DataTable
        DT = DBMETERRPT.GetDataTable(vSql)

        'Create a dummy GridView
        Dim GridView1 As New GridView()
        GridView1.AllowPaging = False
        GridView1.DataSource = dt
        GridView1.DataBind()
 
        Response.Clear()
        Response.Buffer = True
        Response.AddHeader("content-disposition", _
             "attachment;filename=" + vSaveName)
        Response.Charset = ""
        Response.ContentType = "application/vnd.ms-excel"
        Dim sw As New StringWriter()
        Dim hw As New HtmlTextWriter(sw)
 
        For i As Integer = 0 To GridView1.Rows.Count - 1
          'Apply text style to each Row
           GridView1.Rows(i).Attributes.Add("class", "textmode")
        Next
        GridView1.RenderControl(hw)
 
        'style to format numbers to string
        Dim style As String = "<style> .textmode{mso-number-format:\@;}</style>"
        Response.Write(style)
        Response.Output.Write(sw.ToString())
        Response.Flush()
        Response.End()
    End Sub

    Private Sub xport_E20_FILTER()
        Dim vSql As String = "select "
        vSql += "RO "
        vSql += ", CLUSTER "
        vSql += ", Province "
        vSql += ", Location_Code "
        vSql += ", CA 'เลขที่สัญญา' "
        vSql += ", PEA_NO 'รหัสเครื่องวัด' "
        vSql += ", meter_type_name 'ประเภทมิเตอร์' "
        vSql += ", Insurance_Amount 'จำนวนเงินประกัน (บาท)' "
        vSql += ", Notification_Insurance 'วันที่ลงทะเบียน/ยื่นการไฟฟ้า' "
        vSql += ", execution_type_name 'ผลการดำเนินการ' "
        vSql += ", Execution_Note 'เหตุผลในการดำเนินการ' "
        vSql += ", Check_Balance_name 'ตรวจสอบยอดเงินกับบัญชี' "
        vSql += rSqlLoadE20Filter()
        vSql += "ORDER BY RO, CLUSTER, PROVINCE, Location_Code, CA "

        'Response.Write(vSql)

        Dim vSaveName As String = "METERRPT_E20"
        vSaveName += "_" + DateTime.Now.ToString("yyyyMMdd_HHmmss")
        vSaveName += ".xls"
        
        Dim DT As New DataTable
        DT = DBMETERRPT.GetDataTable(vSql)

        'Create a dummy GridView
        Dim GridView1 As New GridView()
        GridView1.AllowPaging = False
        GridView1.DataSource = dt
        GridView1.DataBind()
 
        Response.Clear()
        Response.Buffer = True
        Response.AddHeader("content-disposition", _
             "attachment;filename=" + vSaveName)
        Response.Charset = ""
        Response.ContentType = "application/vnd.ms-excel"
        Dim sw As New StringWriter()
        Dim hw As New HtmlTextWriter(sw)
 
        For i As Integer = 0 To GridView1.Rows.Count - 1
          'Apply text style to each Row
           GridView1.Rows(i).Attributes.Add("class", "textmode")
        Next
        GridView1.RenderControl(hw)
 
        'style to format numbers to string
        Dim style As String = "<style> .textmode{mso-number-format:\@;}</style>"
        Response.Write(style)
        Response.Output.Write(sw.ToString())
        Response.Flush()
        Response.End()
    End Sub

    Protected Sub count_FILTER()
        Dim ELECTRIC_ID As String = Request.QueryString("ELECTRIC_ID")
        Dim vSql As String = "select count(1) COUNT_DATA "
        If ELECTRIC_ID = "e10" Then
            vSql += rSqlLoadE10Filter()
        Else
            vSql += rSqlLoadE20Filter()
        End If
        Dim vDT As New DataTable
        vDT = DBMETERRPT.GetDataTable(vSql)

        Response.Write(vDT.Rows(0).Item("COUNT_DATA"))
    End Sub

    Protected Sub load_FILTER()
        Dim xRowStart As Integer = Request.QueryString("row_start")
        Dim xRowEnd As Integer = Request.QueryString("row_end")
        Dim xColumn As String = Request.QueryString("column")
        Dim xSort As String = Request.QueryString("sort")
        Dim ELECTRIC_ID As String = Request.QueryString("ELECTRIC_ID")

        Dim vColumnSort As String = ""
        
        If xColumn <> Nothing And xSort <> Nothing Then
            vColumnSort = xColumn & " " & xSort & ", " 
            ' ex. xColumn = RO / xSort = desc / vColumnSort = "RO desc"
        End If

        Dim vSql As String
        vSql = "WITH ALL_FILTER AS ( "
        If ELECTRIC_ID = "e10" Then
            vSql += "   select ROW_NUMBER() OVER (ORDER BY " & vColumnSort & " RO, CLUSTER, LOCATION_PROVINCE, LOCATION, CONTRACT_ID) row_no, * "
            vSql += rSqlLoadE10Filter()
            vSql += ") "
        Else
            vSql += "   select ROW_NUMBER() OVER (ORDER BY " & vColumnSort & " RO, CLUSTER, PROVINCE, Location_Code, CA) row_no, * "
            vSql += rSqlLoadE20Filter()
            vSql += ") "         
        End If
        vSql += "SELECT * FROM ALL_FILTER "


        If xRowStart <> Nothing And xRowEnd <> Nothing  Then
            vSql += "WHERE row_no BETWEEN " & xRowStart & " AND " & xRowEnd & ";"
        End If

        'Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, JDB))
    End Sub
    
    Protected Sub SP_METER_AREA_RO()
        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_METER_AREA_RO "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, JDB))
    End Sub
    
    Protected Sub SP_METER_AREA_CLUSTER()
        Dim RO As String = Request.QueryString("RO")

        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_METER_AREA_CLUSTER '" & RO & "' "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, JDB))
    End Sub
    
    Protected Sub SP_METER_AREA_PROVINCE()
        Dim RO As String = Request.QueryString("RO")
        Dim CLUSTER As String = Request.QueryString("CLUSTER")

        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_METER_AREA_PROVINCE '" & RO & "', '" & CLUSTER & "' "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, JDB))
    End Sub
    
    Protected Sub SP_METER_ALERT_CASE()
        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_METER_ALERT_CASE "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, JDB))
    End Sub

    Protected Sub SP_INSURANCE_METER_TYPE()
        Dim vSql As String = ""
        vSql += "select * from Insurance_Meter_Type "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, JDB))
    End Sub
    
    Protected Sub SP_INSURANCE_EXECUTION_TYPE()
        Dim vSql As String = ""
        vSql += "select * from Insurance_Execution_Type "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, JDB))
    End Sub
    
    Protected Sub SP_INSURANCE_CHECKBALANCE_TYPE()
        Dim vSql As String = ""
        vSql += "select * from Insurance_Check_Balance_Type "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, JDB))
    End Sub
    
    Protected Sub SP_E10022()
        Dim LOCATION As String = Request.QueryString("LOCATION")
        Dim METER_ID As String = Request.QueryString("METER_ID")
        Dim CONTRACT_ID As String = Request.QueryString("CONTRACT_ID")

        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_E10022 '" & LOCATION & "', '" & METER_ID & "', '" & CONTRACT_ID & "' "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, JDB))
    End Sub
    
    Protected Sub SP_E10031()
        Dim METER_ID As String = Request.QueryString("METER_ID")
        Dim ELECTRIC_BILL_ID As String = Request.QueryString("ELECTRIC_BILL_ID")

        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_E10031 '" & METER_ID & "', '" & ELECTRIC_BILL_ID & "' "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, JDB))
    End Sub
    
    Protected Sub SP_E10010_YYMM()
        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_E10010_YYMM "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, JDB))
    End Sub

    Protected Sub SP_UPDATE_ELECTRIC_MASTER()
        Dim uemail As String = Request.Form("uemail")
        Dim CONTRACT_ID As String = Request.Form("CONTRACT_ID")

        Dim LOCATION_CODE As String = Request.Form("LOCATION_CODE")
        Dim LOCATION_NAME As String = Request.Form("LOCATION_NAME")
        Dim LOCATION_PROVINCE As String = Request.Form("LOCATION_PROVINCE")

        Dim ELECTRIC_GROUP_ID As String =  ""
        Dim SOURCE_GROUP_ID As String =  ""
        Dim NAME As String =  ""
        Dim ADDRESS As String =  ""
        Dim DEVICE As String =  ""
        Dim MRU As String =  ""
        Dim PEACODE As String =  ""
        Dim PEANAME As String =  ""
        Dim COMPANY_ID As String =  ""
        Dim CONTRACT_REF_NO As String =  ""
        Dim START_PAY As String =  ""
        Dim END_PAY As String =  ""
        Dim END_CONTRACT As String =  ""
        Dim STATUS As String =  ""

        Dim vSqlIn As String = ""
        vSqlIn += "EXEC dbo.SP_UPDATE_ELECTRIC_MASTER '" & uemail & "', '" & CONTRACT_ID & "' "
        vSqlIn += ", '" & LOCATION_CODE & "'"
        vSqlIn += ", '" & LOCATION_NAME & "'"
        vSqlIn += ", '" & LOCATION_PROVINCE & "'"

        'ใส่่ Parameter เผื่อไว้ ถ้าจะให้อัพเดท ต้องไปแก้ที่ SP
        vSqlIn += ", '" & ELECTRIC_GROUP_ID & "'"
        vSqlIn += ", '" & SOURCE_GROUP_ID & "'"
        vSqlIn += ", '" & NAME & "'"
        vSqlIn += ", '" & ADDRESS & "'"
        vSqlIn += ", '" & DEVICE & "'"
        vSqlIn += ", '" & MRU & "'"
        vSqlIn += ", '" & PEACODE & "'"
        vSqlIn += ", '" & PEANAME & "'"
        vSqlIn += ", '" & COMPANY_ID & "'"
        vSqlIn += ", '" & CONTRACT_REF_NO & "'"
        vSqlIn += ", '" & START_PAY & "'"
        vSqlIn += ", '" & END_PAY & "'"
        vSqlIn += ", '" & END_CONTRACT & "'"
        vSqlIn += ", '" & STATUS & "'"

        ' Response.Write(vSqlIn)
        Response.Write(DBMETERRPT.ExecuteNonQuery(vSqlIn).ToString())
    End Sub

    Protected Sub SP_UPDATE_PROVINCE_ELECTRIC_MASTER()
        Dim uemail As String = Request.Form("uemail")
        Dim CONTRACT_ID As String = Request.Form("CONTRACT_ID")
        Dim PROVINCE As String = Request.Form("PROVINCE")

        Dim vSqlIn As String = ""
        vSqlIn += "EXEC dbo.SP_UPDATE_PROVINCE_ELECTRIC_MASTER '" & uemail & "', '" & CONTRACT_ID & "', '" & PROVINCE & "'"

        ' Response.Write(vSqlIn)
        Response.Write(DBMETERRPT.ExecuteNonQuery(vSqlIn).ToString())
    End Sub

    Protected Sub SP_UPDATE_E10010_REMARK()
        Dim uemail As String = Request.Form("uemail")
        Dim ELECTRIC_MASTER_ID As String = Request.Form("ELECTRIC_MASTER_ID")
        Dim BILL_YYMM As String = Request.Form("BILL_YYMM")

        Dim ELECTRIC_BILL_ID As String = Request.Form("ELECTRIC_BILL_ID")
        Dim REMARK As String = Request.Form("REMARK")
        Dim EBILL_FILE As String = Request.Form("EBILL_FILE")

        Dim vSqlIn As String = ""
        vSqlIn += "EXEC dbo.SP_UPDATE_E10010_REMARK '" & uemail & "', '" & ELECTRIC_MASTER_ID & "', '" & BILL_YYMM & "' "
        vSqlIn += ", '" & ELECTRIC_BILL_ID & "'"
        vSqlIn += ", '" & REMARK & "'"
        vSqlIn += ", '" & EBILL_FILE & "'"

        ' Response.Write(vSqlIn)
        Response.Write(DBMETERRPT.ExecuteNonQuery(vSqlIn).ToString())
    End Sub
    
    Protected Sub get_last_import()
        Dim ELECTRIC_ID As String = Request.QueryString("ELECTRIC_ID")
        Dim vSql As String = ""

        If ELECTRIC_ID = "e10" Then
            vSql = "select max(create_date) last_import from ELECTRIC_BILL "
        Else
            vSql = "select max(create_date) last_import from Insurance_Electricity_Meter_Insurance_Master "
        End If

        'Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, JDB))
    End Sub
    
End Class
