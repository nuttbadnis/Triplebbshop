Imports System.Data
Imports System.Web.Script.Serialization
Imports System.Collections.Generic

Partial Class _json
    Inherits System.Web.UI.Page
    Dim DB106 As New Cls_Data
    Dim DB105 As New Cls_Data105
    Dim CP As New Cls_Panu

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim qrs As String = ""

        If Request.QueryString("qrs") <> Nothing Then
            qrs = Request.QueryString("qrs")
        End If

        If qrs = "chartStatOpenGoodSum" Then
            chartStatOpenGoodSum()
        End If

        If qrs = "chartStatOpenGoodSumPv" Then
            chartStatOpenGoodSumPv()
        End If

        If qrs = "chartStatOpenGoodSumShop" Then
            chartStatOpenGoodSumShop()
        End If

    End Sub

    Protected Sub chartStatOpenGoodSum()
        Dim vSql As String = "DECLARE @start_date DATE = '2020-01-01' "
        vSql += "DECLARE @current_date DATETIME = CAST(GETDATE() AS DATE) "

        vSql += "DECLARE @this_curday INT = 0 "
        vSql += "DECLARE @HH INT = SUBSTRING(convert(varchar, getdate(), 108), 1, 2) "

        vSql += "if @HH >= 15 "
        vSql += "begin "
        vSql += "    SET @this_curday = 1 "
        vSql += "end "

        vSql += "DECLARE @t table( "
        vSql += "    history_date datetime,  shop_code varchar(50), "
        vSql += "    shop_dayoff tinyint, close_temp tinyint, "
        vSql += "    shop_open varchar(10), shop_close varchar(10), "
        vSql += "    open_time varchar(5), close_time varchar(5), "
        vSql += "    open_in_serv varchar(5), close_in_serv varchar(5), in_serv_diff int, "
        vSql += "    open_status int, close_status int, shop_status int "
        vSql += "); "

        vSql += "INSERT INTO @t EXEC st_open_close_3bbshop @current_date, @current_date, 0 "

        vSql += "select 'RO' + a.ro label "
        vSql += ", total-cnt_deley-subtract y "
        vSql += "from ( "
        vSql += "    select ro, count(1) + (case when @this_curday = 0 then 0 else 1 end) total "
        vSql += "    from ( "
        vSql += "        select history_date, m1.f18 ro from openshop_history "

        vSql += "        left join rmsdat.dbo.m00030 m1 "
        vSql += "        on m1.f02 = openshop_history.shop_code "

        vSql += "        where history_date >= @start_date "
        vSql += "        group by history_date, m1.f18 "
        vSql += "    ) aa "
        vSql += "    group by ro "
        vSql += ") a "

        vSql += "join ( "
        vSql += "    select aa.ro, case when cnt is null then 0 else cnt end cnt_deley "
        vSql += "    from ( "
        vSql += "        select distinct area as ro FROM [RMSDAT].[dbo].[vw_branch_shop] where [area] <> '' "
        vSql += "    )aa "
        vSql += "    left join ( "
        vSql += "        select ro, count(1) cnt from ( "
        vSql += "            select history_date, m1.f18 ro from openshop_history "

        vSql += "            left join notation_history "
        vSql += "            on notation_history.shop_code = openshop_history.shop_code "
        vSql += "            and notation_history.notation_date = openshop_history.history_date "

        vSql += "            left join rmsdat.dbo.m00030 m1 "
        vSql += "            on m1.f02 = openshop_history.shop_code "

        vSql += "            where history_date >= @start_date "
        vSql += "            and open_status = 1 and (open_accident = 0 or open_accident is null) "

        vSql += "            group by history_date, m1.f18 "
        vSql += "        ) aa "
        vSql += "        group by ro "
        vSql += "    ) bb "
        vSql += "    on aa.ro = bb.ro "
        vSql += ") b "
        vSql += "on a.ro = b.ro "

        vSql += "join ( "
        vSql += "    select aa.ro, "
        vSql += "    case "
        vSql += "        when @this_curday = 0 then 0 "
        vSql += "        when bb.ro is null then 0 "
        vSql += "        else 1 "
        vSql += "    end subtract "
        vSql += "    from ( "
        vSql += "        select distinct area ro from rmsdat.dbo.vw_branch_shop m1 "
        vSql += "    ) aa "
        vSql += "    left join ( "
        vSql += "        SELECT m1.f18 ro "
        vSql += "        FROM @T temp "

        vSql += "        LEFT JOIN shopStock "
        vSql += "        ON shopStock.shop_code = temp.shop_code "

        vSql += "        LEFT JOIN rmsdat.dbo.m00030 m1 "
        vSql += "        ON m1.f02 = shopStock.shop_code "

        vSql += "        LEFT JOIN notation_history "
        vSql += "        ON notation_history.notation_date = temp.history_date "
        vSql += "        AND notation_history.shop_code = temp.shop_code "

        vSql += "        where open_status = 1 and (open_accident = 0 or open_accident is null) "
        vSql += "        GROUP BY m1.f18 "
        vSql += "    ) bb "
        vSql += "    on aa.ro = bb.ro "
        vSql += ") c "
        vSql += "on a.ro = c.ro "
        vSql += "order by 1 "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
    End Sub

    Protected Sub chartStatOpenGoodSumPv()
        Dim vSql As String = "DECLARE @start_date DATE = '2020-01-01' "
        vSql += "DECLARE @current_date DATETIME = CAST(GETDATE() AS DATE) "

        vSql += "DECLARE @ro VARCHAR(5) = '" & Request.QueryString("ro") & "' "
        vSql += "SET @ro = REPLACE(@ro, '-', '/') "

        vSql += "DECLARE @this_curday INT = 0 "
        vSql += "DECLARE @HH INT = SUBSTRING(convert(varchar, getdate(), 108), 1, 2) "
        
        vSql += "if @HH >= 15 "
        vSql += "begin "
        vSql += "    SET @this_curday = 1 "
        vSql += "end "

        vSql += "DECLARE @t table( "
        vSql += "    history_date datetime,  shop_code varchar(50), "
        vSql += "    shop_dayoff tinyint, close_temp tinyint, "
        vSql += "    shop_open varchar(10), shop_close varchar(10), "
        vSql += "    open_time varchar(5), close_time varchar(5), "
        vSql += "    open_in_serv varchar(5), close_in_serv varchar(5), in_serv_diff int, "
        vSql += "    open_status int, close_status int, shop_status int "
        vSql += "); "

        vSql += "INSERT INTO @t EXEC st_open_close_3bbshop @current_date, @current_date, 0 "

        vSql += "select a.province_short, '[ ' + a.cluster + '] ' + a.province_short label "
        vSql += ", total-cnt_deley-subtract y "
        vSql += "from ( "
        vSql += "    select cluster, province_short, count(1) + (case when @this_curday = 0 then 0 else 1 end) total "
        vSql += "    from ( "
        vSql += "        select history_date, province_short, cluster from openshop_history "

        vSql += "        left join rmsdat.dbo.vw_branch_shop branch "
        vSql += "        on branch.shop_code = openshop_history.shop_code "

        vSql += "        where history_date >= @start_date "
        vSql += "        and branch.area = @ro "
        vSql += "        group by history_date, province_short, cluster "
        vSql += "    ) aa "
        vSql += "    group by cluster, province_short "
        vSql += ") a "

        vSql += "join ( "
        vSql += "    select aa.province_short, case when cnt is null then 0 else cnt end cnt_deley "
        vSql += "    from ( "
        vSql += "        select distinct province_short FROM [RMSDAT].[dbo].[vw_branch_shop] "
        vSql += "        where area = @ro "
        vSql += "    )aa "
        vSql += "    left join ( "
        vSql += "        select province_short, count(1) cnt from ( "
        vSql += "            select history_date, branch.province_short from openshop_history "

        vSql += "            left join notation_history "
        vSql += "            on notation_history.shop_code = openshop_history.shop_code "
        vSql += "            and notation_history.notation_date = openshop_history.history_date "

        vSql += "            left join rmsdat.dbo.vw_branch_shop branch "
        vSql += "            on branch.shop_code = openshop_history.shop_code "

        vSql += "            where history_date >= @start_date "
        vSql += "            and branch.area = @ro "
        vSql += "            and open_status = 1 and (open_accident = 0 or open_accident is null) "

        vSql += "            group by history_date, branch.province_short "
        vSql += "        ) aa "
        vSql += "        group by province_short "
        vSql += "    ) bb "
        vSql += "    on aa.province_short = bb.province_short "
        vSql += ") b "
        vSql += "on a.province_short = b.province_short "

        vSql += "join ( "
        vSql += "    select aa.province_short, "
        vSql += "    case "
        vSql += "        when @this_curday = 0 then 0 "
        vSql += "        when bb.province_short is null then 0 "
        vSql += "        else 1 "
        vSql += "    end subtract "
        vSql += "    from ( "
        vSql += "        select distinct province_short FROM rmsdat.dbo.vw_branch_shop "
        vSql += "        where area = @ro "
        vSql += "    ) aa "
        vSql += "    left join ( "
        vSql += "        SELECT province_short "
        vSql += "        FROM @T temp "

        vSql += "        LEFT JOIN shopStock "
        vSql += "        ON shopStock.shop_code = temp.shop_code "

        vSql += "        LEFT JOIN rmsdat.dbo.vw_branch_shop branch "
        vSql += "        ON branch.shop_code = shopStock.shop_code "

        vSql += "        LEFT JOIN notation_history "
        vSql += "        ON notation_history.notation_date = temp.history_date "
        vSql += "        AND notation_history.shop_code = temp.shop_code "

        vSql += "        where open_status = 1 and (open_accident = 0 or open_accident is null) "
        vSql += "        GROUP BY province_short "
        vSql += "    ) bb "
        vSql += "    on aa.province_short = bb.province_short "
        vSql += ") c "
        vSql += "on a.province_short = c.province_short "
        vSql += "order by a.cluster, a.province_short "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
    End Sub

    Protected Sub chartStatOpenGoodSumShop()
        Dim vSql As String = "DECLARE @start_date DATE = '2020-01-01' "
        vSql += "DECLARE @current_date DATETIME = CAST(GETDATE() AS DATE) "
        vSql += "DECLARE @pv VARCHAR(5) = '" & Request.QueryString("pv") & "' "

        vSql += "DECLARE @this_curday INT = 0 "
        vSql += "DECLARE @HH INT = SUBSTRING(convert(varchar, getdate(), 108), 1, 2) "
        
        vSql += "if @HH >= 15 "
        vSql += "begin "
        vSql += "    SET @this_curday = 1 "
        vSql += "end "

        vSql += "DECLARE @t table( "
        vSql += "    history_date datetime,  shop_code varchar(50), "
        vSql += "    shop_dayoff tinyint, close_temp tinyint, "
        vSql += "    shop_open varchar(10), shop_close varchar(10), "
        vSql += "    open_time varchar(5), close_time varchar(5), "
        vSql += "    open_in_serv varchar(5), close_in_serv varchar(5), in_serv_diff int, "
        vSql += "    open_status int, close_status int, shop_status int "
        vSql += "); "

        vSql += "INSERT INTO @t EXEC st_open_close_3bbshop @current_date, @current_date, 0 "

        vSql += "select label, ROUND( CAST(cnt AS float) / CAST(total AS float) * 100 ,0 ) y "
        vSql += "from ( "
        vSql += "    select a.shop_code label "
        vSql += "    , total, cnt_deley+subtract cnt_deley, total-cnt_deley-subtract cnt "
        vSql += "    from ( "
        vSql += "        select aa.shop_code, count(1) + "
        vSql += "        (case "
        vSql += "            when @this_curday = 0 then 0 "
        vSql += "            when bb.shop_code is null then 0 "
        vSql += "            else 1 "
        vSql += "        end) total "
        vSql += "        from ( "
        vSql += "            select history_date, openshop_history.shop_code from openshop_history "

        vSql += "            left join rmsdat.dbo.vw_branch_shop branch "
        vSql += "            on branch.shop_code = openshop_history.shop_code "

        vSql += "            where history_date >= @start_date "
        vSql += "            and branch.province_short = @pv "
        vSql += "            and open_status <> 3 "

        vSql += "            group by history_date, openshop_history.shop_code "
        vSql += "        ) aa "
        vSql += "        left join (SELECT shop_code FROM @T temp where open_status <> 3) bb "
        vSql += "        on aa.shop_code = bb.shop_code "
        vSql += "        group by aa.shop_code, bb.shop_code "
        vSql += "    ) a "
        vSql += "    join ( "
        vSql += "        select aa.shop_code, case when cnt is null then 0 else cnt end cnt_deley "
        vSql += "        from ( "
        vSql += "            select distinct branch.shop_code FROM rmsdat.dbo.vw_branch_shop branch "
        vSql += "            join vw_shop_active vw on vw.shop_code = branch.shop_code "
        vSql += "            where province_short = @pv "
        vSql += "        )aa "
        vSql += "        left join ( "
        vSql += "            select shop_code, count(1) cnt from ( "
        vSql += "                select history_date, branch.shop_code from openshop_history "

        vSql += "                left join notation_history "
        vSql += "                on notation_history.shop_code = openshop_history.shop_code "
        vSql += "                and notation_history.notation_date = openshop_history.history_date "

        vSql += "                left join rmsdat.dbo.vw_branch_shop branch "
        vSql += "                on branch.shop_code = openshop_history.shop_code "

        vSql += "                where history_date >= @start_date "
        vSql += "                and branch.province_short = @pv "
        vSql += "                and open_status = 1 and (open_accident = 0 or open_accident is null) "

        vSql += "                group by history_date, branch.shop_code "
        vSql += "            ) aa "
        vSql += "            group by shop_code "
        vSql += "        ) bb "
        vSql += "        on aa.shop_code = bb.shop_code "
        vSql += "    ) b "
        vSql += "    on a.shop_code = b.shop_code "
        vSql += "    join ( "
        vSql += "        select aa.shop_code, "
        vSql += "        case "
        vSql += "            when @this_curday = 0 then 0 "
        vSql += "            when bb.shop_code is null then 0 "
        vSql += "            else 1 "
        vSql += "        end subtract "
        vSql += "        from ( "
        vSql += "            select distinct branch.shop_code FROM rmsdat.dbo.vw_branch_shop branch "
        vSql += "            join vw_shop_active vw on vw.shop_code = branch.shop_code "
        vSql += "            where province_short = @pv "
        vSql += "        ) aa "
        vSql += "        left join ( "
        vSql += "            SELECT temp.shop_code "
        vSql += "            FROM @T temp "

        vSql += "            LEFT JOIN shopStock "
        vSql += "            ON shopStock.shop_code = temp.shop_code "

        vSql += "            LEFT JOIN notation_history "
        vSql += "            ON notation_history.notation_date = temp.history_date "
        vSql += "            AND notation_history.shop_code = temp.shop_code "

        vSql += "            where open_status = 1 and (open_accident = 0 or open_accident is null) "
        vSql += "            GROUP BY temp.shop_code "
        vSql += "        ) bb "
        vSql += "        on aa.shop_code = bb.shop_code "
        vSql += "    ) c "
        vSql += "    on a.shop_code = c.shop_code "
        vSql += ") a "
        vSql += "order by 1 "

        ' Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
    End Sub

End Class
