Imports System.Data

Partial Class _json
    Inherits System.Web.UI.Page
    Dim CP As New Cls_Panu

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim qrs As String = ""

        If Request.QueryString("qrs") <> Nothing Then
            qrs = Request.QueryString("qrs")
        End If

        If qrs = "loadRO" Then
            loadRO()
        End If

        If qrs = "loadCluster" Then
            loadCluster()
        End If

        If qrs = "loadProvince" Then
            loadProvince()
        End If

        If qrs = "getDateDefault" Then
            getDateDefault()
        End If

        If qrs = "SP_ACCAM_DAILY_FIRST_LOGIN" Then
            SP_ACCAM_DAILY_FIRST_LOGIN()
        End If

        If qrs = "loadROACC" Then
            loadROACC()
        End If

        If qrs = "loadClusterACC" Then
            loadClusterACC()
        End If

        If qrs = "SP_R10010" Then
            SP_R10010()
        End If

        If qrs = "SP_R10011" Then
            SP_R10011()
        End If

        If qrs = "SP_R_NUM" Then
            SP_R_NUM()
        End If

        If qrs = "SP_R_YYMM" Then
            SP_R_YYMM()
        End If

        If qrs = "SP_FORECAST_DAILY_FIRST_LOGIN" Then
            SP_FORECAST_DAILY_FIRST_LOGIN()
        End If

        If qrs = "SP_A20_COUNT_GROUP" Then
            SP_A20_COUNT_GROUP()
        End If

        If qrs = "SP_TBB_APP_TARGET_DAILY" Then
            SP_TBB_APP_TARGET_DAILY()
        End If

        If qrs = "SP_TBB_APP_TARGET_PROV_DAILY" Then
            SP_TBB_APP_TARGET_PROV_DAILY()
        End If

        If qrs = "SP_TBB_APP_TARGET_PERTEAM" Then
            SP_TBB_APP_TARGET_PERTEAM()
        End If

        If qrs = "SP_TBB_APP_TARGET_PROV_PERTEAM" Then
            SP_TBB_APP_TARGET_PROV_PERTEAM()
        End If

        If qrs = "SP_NUMTEXT_DASH_MAIL_DAILY" Then
            SP_NUMTEXT_DASH_MAIL_DAILY()
        End If

        If qrs = "SP_TBB_APP_TARGET75_PERTEAM_DAILY" Then
            SP_TBB_APP_TARGET75_PERTEAM_DAILY()
        End If

        If qrs = "SP_TBB_APP_TARGET75_SUSPEND_PERTEAM_DAILY" Then
            SP_TBB_APP_TARGET75_SUSPEND_PERTEAM_DAILY()
        End If

        If qrs = "SP_TBB_APP_TARGET75_PERTEAM_DAILY_v2002" Then
            SP_TBB_APP_TARGET75_PERTEAM_DAILY_v2002()
        End If

        If qrs = "SP_TBB_APP_TARGET75_SUSPEND_PERTEAM_DAILY_v2002" Then
            SP_TBB_APP_TARGET75_SUSPEND_PERTEAM_DAILY_v2002()
        End If

        If qrs = "SP_TBB_APP_TARGET75_PROV_PERTEAM_DAILY" Then
            SP_TBB_APP_TARGET75_PROV_PERTEAM_DAILY()
        End If

        If qrs = "SP_TBB_X_POINT_MONTHLY" Then
            SP_TBB_X_POINT_MONTHLY()
        End If

        If qrs = "SP_TBB_APP_APPUSED_A10_DAILY" Then
            SP_TBB_APP_APPUSED_A10_DAILY()
        End If

        If qrs = "SP_TBB_APP_APPUSED_PROV_A10_DAILY" Then
            SP_TBB_APP_APPUSED_PROV_A10_DAILY()
        End If

        If qrs = "SP_TBB_APP_NEWCUST_A10_DAILY" Then
            SP_TBB_APP_NEWCUST_A10_DAILY()
        End If

        If qrs = "SP_TBB_APP_NEWCUST_PROV_A10_DAILY" Then
            SP_TBB_APP_NEWCUST_PROV_A10_DAILY()
        End If

        If qrs = "SP_TBB_APP_NEWCUST_A10_MONTH" Then
            SP_TBB_APP_NEWCUST_A10_MONTH()
        End If

        If qrs = "SP_TBB_APP_NEWCUST_PROV_A10_MONTH" Then
            SP_TBB_APP_NEWCUST_PROV_A10_MONTH()
        End If

        If qrs = "SP_TBB_APP_NEWCUST_RESIDENT_A10_MONTH" Then
            SP_TBB_APP_NEWCUST_RESIDENT_A10_MONTH()
        End If

        If qrs = "SP_TBB_APP_NEWCUST_RESIDENT_PROV_A10_MONTH" Then
            SP_TBB_APP_NEWCUST_RESIDENT_PROV_A10_MONTH()
        End If

        If qrs = "SP_RECONCILE_3BBPOINT_ACC_NULL" Then
            SP_RECONCILE_3BBPOINT_ACC_NULL()
        End If

        If qrs = "getMaxDateReconcile" Then
            getMaxDateReconcile()
        End If

        If qrs = "SP_FLAG_EVENT_A40" Then
            SP_FLAG_EVENT_A40()
        End If

        If qrs = "SP_DD_YYYYMM_A10" Then
            SP_DD_YYYYMM_A10()
        End If

        If qrs = "SP_EMPLOYEE_MOBILE" Then
            SP_EMPLOYEE_MOBILE()
        End If

        If qrs = "SP_TBB_APP_A40T10_DAILY" Then
            SP_TBB_APP_A40T10_DAILY()
        End If

        If qrs = "SP_TBB_APP_A40T10_PROV_DAILY" Then
            SP_TBB_APP_A40T10_PROV_DAILY()
        End If
        
        If qrs = "keepSessionRO" Then
            Session("tbb_app_ro") = Request.QueryString("ro")
            Session("tbb_app_cluster") = ""
            Session("tbb_app_province") = ""
        End If

        If qrs = "keepSessionCluster" Then
            Session("tbb_app_cluster") = Request.QueryString("cluster")
            Session("tbb_app_province") = ""
        End If

        If qrs = "keepSessionProvince" Then
            Session("tbb_app_province") = Request.QueryString("province")
        End If
    End Sub

    Protected Sub loadRO()
        Dim vSql As String 
        vSql = "select RO, 'RO' + RO ro_name "
        vSql += "from Temp_RO_CLUSTER_PROVINCE "
        vSql += "group by RO "
        vSql += "order by RO "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub loadCluster()
        Dim xRo As String = Request.QueryString("ro")

        Dim vSql As String 
        vSql = "select RO, Cluster, 'RO' + RO ro_name, 'RO' + RO + ': ' + Cluster cluster_name "
        vSql += "from Temp_RO_CLUSTER_PROVINCE "

        If xRo <> Nothing Then
            vSql += "where RO = '" & xRo & "' "
        End If

        vSql += "group by RO, Cluster "
        vSql += "order by RO, Cluster "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub loadProvince()
        Dim xRo As String = Request.QueryString("ro")
        Dim xCluster As String = Request.QueryString("cluster")

        Dim vSql As String 
        vSql = "select RO, Cluster, Province "
        vSql += "from Temp_RO_CLUSTER_PROVINCE "
        vSql += "where 1 = 1 "

        If xRo <> Nothing Then
            vSql += "and RO = '" & xRo & "' "
        End If

        If xCluster <> Nothing Then
            vSql += "and Cluster = '" & xCluster & "' "
        End If

        vSql += "order by RO, Cluster, Province "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub getDateDefault()
        Dim vSql As String 
        vSql = "declare @d1 date = '2019-10-01' "
        vSql += "select @d1 min_date, CONVERT(VARCHAR(10), @d1) str_min_date "
        vSql += ", max_FIRST_LOGIN max_date, CONVERT(VARCHAR(10), max_FIRST_LOGIN) str_max_date "
        vSql += "from TEMP_DTM_ALL_ACCOUNT "

        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

    Protected Sub SP_ACCAM_DAILY_FIRST_LOGIN()
        Dim xLevel As String = Request.QueryString("level")
        Dim xArea As String = Request.QueryString("area")
        Dim xYYYYMM As String = Request.QueryString("yyyymm")

        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_ACCAM_DAILY_FIRST_LOGIN '" & xLevel & "', '" & xArea & "', '" & xYYYYMM & "' "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub loadROACC()
        Dim vSql As String 
        vSql = "select RO RO_CLUSTERS_ACC from ALL_RO_TABLE "
        vSql += "where RO is not null "
        vSql += "group by RO "
        vSql += "order by RO "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub loadClusterACC()
        Dim xRo As String = Request.QueryString("ro")

        Dim vSql As String 
        vSql = "select RO RO_CLUSTERS_ACC, CLUSTER_EXTRA CLUSTERS from ALL_RO_TABLE "
        vSql += "where CLUSTER_EXTRA <> '' "

        If xRo <> Nothing Then
            vSql += "and RO = '" & xRo & "' "
        End If

        vSql += "group by RO, CLUSTER_EXTRA "
        vSql += "order by RO, CLUSTER_EXTRA "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_R10010()
        Dim xYYMM As String = Request.QueryString("yymm")

        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_R10010 '" & xYYMM & "' "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_R10011()
        Dim xYYMM As String = Request.QueryString("yymm")

        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_R10011 '" & xYYMM & "' "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_R_NUM()
        Dim xNUM As String = Request.QueryString("spnum")

        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_R" & xNUM & " "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_R_YYMM()
        Dim xNUM As String = Request.QueryString("spnum")
        Dim xYYMM As String = Request.QueryString("yymm")

        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_R" & xNUM & " '" & xYYMM & "' "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_FORECAST_DAILY_FIRST_LOGIN()
        Dim xLevel As String = Request.QueryString("level")
        Dim xArea As String = Request.QueryString("area")
        Dim xYYYYMM As String = Request.QueryString("yyyymm")

        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_FORECAST_DAILY_FIRST_LOGIN '" & xLevel & "', '" & xArea & "', '" & xYYYYMM & "' "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_A20_COUNT_GROUP()
        Dim xType As String = Request.QueryString("type")
        Dim xYYMM As String = Request.QueryString("yymm")

        Dim vSql As String = ""
        vSql += "select TYPE_GROUP, YYMM "
        vSql += ", COUNT_GROUP, COUNT_VALUE "
        vSql += "from A20_COUNT_GROUP "
        vSql += "where 1 = 1 "

        If xType <> Nothing Then
            vSql += "and TYPE_GROUP = '" & xType & "' "
        End If

        If xYYMM <> Nothing Then
            vSql += "and YYMM in (" & xYYMM & ") "
        End If

        vSql += "order by 1,2,3 "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_TBB_APP_TARGET_DAILY()

        Dim xCluster As String = Request.QueryString("cluster")

        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_TBB_APP_TARGET_DAILY "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_TBB_APP_TARGET_PROV_DAILY()

        Dim xCluster As String = Request.QueryString("cluster")

        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_TBB_APP_TARGET_PROV_DAILY '" & xCluster & "' "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_TBB_APP_TARGET_PERTEAM()

        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_TBB_APP_TARGET_PERTEAM "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_TBB_APP_TARGET_PROV_PERTEAM()

        Dim xCluster As String = Request.QueryString("cluster")

        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_TBB_APP_TARGET_PROV_PERTEAM '" & xCluster & "' "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_NUMTEXT_DASH_MAIL_DAILY()

        Dim vSql As String = ""
        vSql += "EXEC SP_NUMTEXT_DASH_MAIL_DAILY  "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_TBB_APP_TARGET75_PERTEAM_DAILY()

        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_TBB_APP_TARGET75_PERTEAM_DAILY "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_TBB_APP_TARGET75_SUSPEND_PERTEAM_DAILY()

        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_TBB_APP_TARGET75_SUSPEND_PERTEAM_DAILY "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_TBB_APP_TARGET75_PERTEAM_DAILY_v2002()

        Dim vSql As String = ""
        vSql += "EXEC TBB_App_Report_v2002.dbo.SP_TBB_APP_TARGET75_PERTEAM_DAILY "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_TBB_APP_TARGET75_SUSPEND_PERTEAM_DAILY_v2002()

        Dim vSql As String = ""
        vSql += "EXEC TBB_App_Report_v2002.dbo.SP_TBB_APP_TARGET75_SUSPEND_PERTEAM_DAILY "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_TBB_APP_TARGET75_PROV_PERTEAM_DAILY()
        Dim xCluster As String = Request.QueryString("cluster")

        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_TBB_APP_TARGET75_PROV_PERTEAM_DAILY '" & xCluster & "' "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_TBB_X_POINT_MONTHLY()
        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_TBB_X_POINT_MONTHLY "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_TBB_APP_APPUSED_A10_DAILY()

        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_TBB_APP_APPUSED_A10_DAILY "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_TBB_APP_APPUSED_PROV_A10_DAILY()
        Dim xCluster As String = Request.QueryString("cluster")

        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_TBB_APP_APPUSED_PROV_A10_DAILY '" & xCluster & "' "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_TBB_APP_NEWCUST_A10_DAILY()

        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_TBB_APP_NEWCUST_A10_DAILY "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_TBB_APP_NEWCUST_PROV_A10_DAILY()
        Dim xCluster As String = Request.QueryString("cluster")

        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_TBB_APP_NEWCUST_PROV_A10_DAILY '" & xCluster & "' "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_TBB_APP_NEWCUST_A10_MONTH()
        Dim xYYYYMM As String = Request.QueryString("yyyymm")

        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_TBB_APP_NEWCUST_A10_MONTH '" & xYYYYMM & "' "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_TBB_APP_NEWCUST_PROV_A10_MONTH()
        Dim xCluster As String = Request.QueryString("cluster")
        Dim xYYYYMM As String = Request.QueryString("yyyymm")

        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_TBB_APP_NEWCUST_PROV_A10_MONTH '" & xCluster & "', '" & xYYYYMM & "' "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_TBB_APP_NEWCUST_RESIDENT_A10_MONTH()
        Dim xYYYYMM As String = Request.QueryString("yyyymm")

        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_TBB_APP_NEWCUST_RESIDENT_A10_MONTH '" & xYYYYMM & "' "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_TBB_APP_NEWCUST_RESIDENT_PROV_A10_MONTH()
        Dim xCluster As String = Request.QueryString("cluster")
        Dim xYYYYMM As String = Request.QueryString("yyyymm")

        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_TBB_APP_NEWCUST_RESIDENT_PROV_A10_MONTH '" & xCluster & "', '" & xYYYYMM & "' "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_RECONCILE_3BBPOINT_ACC_NULL()

        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_RECONCILE_3BBPOINT_ACC_NULL "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub getMaxDateReconcile()
        Dim vSql As String 
        vSql = "select cast(max(DATA_DATE) as date) max_date "
        vSql += ", CONVERT(VARCHAR(10), max(DATA_DATE)) str_max_date "
        vSql += "from RECONCILE_3BBPOINT_DAILY "

        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_FLAG_EVENT_A40()

        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_FLAG_EVENT_A40 "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_DD_YYYYMM_A10()
        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_DD_YYYYMM_A10 "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_EMPLOYEE_MOBILE()
        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_EMPLOYEE_MOBILE "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_TBB_APP_A40T10_DAILY()
        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_TBB_APP_A40T10_DAILY "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub

    Protected Sub SP_TBB_APP_A40T10_PROV_DAILY()

        Dim xCluster As String = Request.QueryString("cluster")

        Dim vSql As String = ""
        vSql += "EXEC dbo.SP_TBB_APP_A40T10_PROV_DAILY '" & xCluster & "' "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DBTBBAPP"))
    End Sub
End Class
