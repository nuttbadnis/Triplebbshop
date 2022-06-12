Partial Class shopConnect
    Inherits System.Web.UI.Page
    Dim CP As New Cls_Panu

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CP.Analytics()
        Response.Redirect("../3bbShopConnect/showdata.php?shop_code=" + Request.QueryString("shop_code"))
    End Sub
End Class
