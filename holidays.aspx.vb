Imports System.Data

Partial Class holidays
    Inherits System.Web.UI.Page
    Dim DB105 As New Cls_Data105
    Dim CP As New Cls_Panu

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("Uemail") IsNot Nothing Then
            hide_uemail.Value() = Session("Uemail")
            user_logon.InnerHtml = "<span class='glyphicon glyphicon-off user_logon' aria-hidden='true'></span> " + Session("Uemail")

            If CP.rCheckPermiss() > 0 Then
                hide_upermiss.Value() = Session("upermiss")
                Session.Remove("upermiss")
            End If
        End If

        If CP.rContractPermiss() = 0 Then
            li_contract.Visible = False
        End If

        Dim vRes As New DataTable
        Dim vSql As String = "select year(max(dayoff_date)) max_year, year(getdate()) this_year from calendar_dayoff where dayoff_disable = 0 "

        vRes = DB105.GetDataTable(vSql)

        Dim this_year As Integer = vRes.Rows(0).Item("this_year")
        Dim max_year As Integer = vRes.Rows(0).Item("max_year")

        vSql = "select dd_dim + '/' + mm_dim dm_date "
        vSql += ", yyyy_th, dw_name_th, dayoff_desc "
        vSql += ", case when cast(dayoff_date as date) > cast(getdate() as date) then 1 else 0 end next_off "
        vSql += "from calendar_dayoff df "
        vSql += "join DummyDB.dbo.DummyDate dm on dm.date_dim = df.dayoff_date "
        vSql += "where dayoff_disable = 0 and YEAR(dayoff_date) = " & (max_year) & " "
        vSql += "order by dayoff_date desc "

        vRes = DB105.GetDataTable(vSql)

        table_holidays_1.InnerHtml = rTable(vRes, this_year, max_year)

        max_year = max_year - 1
        vSql = "select dd_dim + '/' + mm_dim dm_date "
        vSql += ", yyyy_th, dw_name_th, dayoff_desc "
        vSql += ", case when cast(dayoff_date as date) > cast(getdate() as date) then 1 else 0 end next_off "
        vSql += "from calendar_dayoff df "
        vSql += "join DummyDB.dbo.DummyDate dm on dm.date_dim = df.dayoff_date "
        vSql += "where dayoff_disable = 0 and YEAR(dayoff_date) = " & (max_year) & " "
        vSql += "order by dayoff_date desc "

        vRes = DB105.GetDataTable(vSql)

        table_holidays_2.InnerHtml = rTable(vRes, this_year, max_year)

        CP.Analytics()
    End Sub

    Function rTable(ByVal vRes As DataTable, ByVal this_year As Integer, ByVal max_year As Integer) As String
        Dim vTable As String = ""
        Dim tr_color As String = ""

        If vRes.Rows().Count() > 0 Then
            If this_year > max_year Then
                tr_color = "style='color: #999;'"
            End If

            vTable = "<table class=""table"">"
            vTable += "<thead><tr " + tr_color + ">"
            vTable += "<th colspan='3'>" & vRes.Rows(0).Item("yyyy_th") & "</th>"
            vTable += "<th class='T_Rt'><span class='glyphicon icon-sort-amount-desc'></span></th>"
            vTable += "</tr></thead>"
            vTable += "<tbody>"

            For i As Integer = 0 To vRes.Rows().Count() - 1
                tr_color = ""

                If vRes.Rows(i).Item("next_off") = 0 Then
                    tr_color = "style='color: #999;'"
                End If

                vTable += "<tr " + tr_color + ">"
                vTable += "<td>" & vRes.Rows(i).Item("dm_date") & "/" & vRes.Rows(i).Item("yyyy_th") &  "</td>"
                vTable += "<td>" + vRes.Rows(i).Item("dayoff_desc") + "</td>"
                vTable += "<td>" + vRes.Rows(i).Item("dw_name_th") + "</td>"
                vTable += "<td class='T_Rt'>" & (vRes.Rows().Count() - i) & ".</td>"
                vTable += "</tr>"
            Next

            vTable += "</tbody></table>"
        End If

        Return vTable
    End Function
End Class
