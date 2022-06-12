Imports System.Data

Partial Class _Json
    Inherits System.Web.UI.Page
    Dim CP As New Cls_Panu
    
    Dim vWhere_main As String = "((shop_temp = 0 and pos_active = 1) or (shop_temp != 0 and shop_temp != 1)) and delete_date is null " + _
        "and storeKiosType.hide_vas = 0 and shopStock.shop_code != 'bkkkk' "

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim qrs As String = ""

        If Request.QueryString("qrs") <> Nothing Then
            qrs = Request.QueryString("qrs")
        End If

        If qrs = "load3bbShop" Then
            load3bbShop()
        End If
    End Sub

    Protected Sub load3bbShop()

        Dim vSql As String = "select m30.f03 ro, shop_code, shop_name  "

        vSql += "from shopStock "

        vSql += "left join RMSDAT.dbo.m00030 m30 "
        vSql += "on m30.f02 = shopStock.shop_code "

        vSql += "left join storeKiosType "
        vSql += "on shopStock.storeKiosType_id = storeKiosType.storeKiosType_id "

        vSql += "where m30.f03 is not null "
        vSql += "and ((shop_temp = 0 and pos_active = 1) or (shop_temp != 0 and shop_temp != 1)) "
        vSql += "and storeKiosType.hide_vas = 0 and shopStock.shop_code != 'tssss' "
        vSql += "and delete_date is null "

        vSql += "order by ro, shop_code "

        'Response.Write(vSql)
        Response.Write(CP.rJsonDBv4(vSql, "DB105"))
    End Sub

End Class
