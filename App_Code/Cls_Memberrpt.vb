Imports System.IO
Imports System.Net
Imports System.Data
Imports System.Web.Script.Serialization
Imports System.Collections.Generic
Imports System.Net.Mail
Imports System.Net.Mime
Imports System.Net.IPAddress

Public Class Cls_Memberrpt
    Inherits System.Web.UI.Page
    Dim CNotify As New Cls_Notify
    Dim DBTBBAPP As New Cls_DataTBBAPP
    Dim CP As New Cls_Panu

    Function checkDepartApprove() As Integer
        If CP.rCheckPermit("SUPPOS", "ses_permiss_mbrpt") > 0 Then
            Return 1

        Else If CP.rCheckPermit("RO_DIRECTOR", "ses_permiss_mbrpt") > 0 Then
            Return 1

        Else If CP.rCheckPermit("CLUSTER_MANAGER", "ses_permiss_mbrpt") > 0 Then
            Return 1

        Else If CP.rCheckPermit("PROVINCE_MANAGER", "ses_permiss_mbrpt") > 0 Then
            Return 1

        Else If CP.rCheckPermit("MEMBERRPT_VERIFY_ESTATE", "ses_permiss_mbrpt") > 0 Then
            Return 1

        ' Else If Session("Uemail") = "tasanee.k" Then
        '     Session("ses_permiss_mbrpt") = "SUPPOS"
        '     Return 1

        End If

        Return 0
    End Function

    Public Sub redisProdGetPoint(ByVal account_num As String)
        Dim HttpWReq As HttpWebRequest
        Dim httpWRes As HttpWebResponse = Nothing
        Dim address As Uri
        Dim vUri As String = "http://bcsvasapi.triplet.co.th/bcs-vas-red-api/resources/vas/redis/customer/get/point/account.json?account_num=" + account_num

        address = New Uri(vUri)
        HttpWReq = DirectCast(WebRequest.Create(address), HttpWebRequest)
        HttpWReq.Method = "GET"
        HttpWReq.ContentType = "application/x-www-form-urlencoded"
        HttpWReq.Headers("accesstoken") = "vastoken"
        httpWRes = DirectCast(HttpWReq.GetResponse(), HttpWebResponse)

        Dim reader As StreamReader = New StreamReader(httpWRes.GetResponseStream())
        Dim json As String = reader.ReadToEnd()

        HttpContext.Current.Response.Write(json)
    End Sub

    Public Sub redisTestGetPoint(ByVal account_num As String)
        Dim HttpWReq As HttpWebRequest
        Dim httpWRes As HttpWebResponse = Nothing
        Dim address As Uri
        Dim vUri As String = "http://10.11.84.104/bcs-vas-red-api/resources/vas/redis/customer/get/point/account.json?account_num=" + account_num

        address = New Uri(vUri)
        HttpWReq = DirectCast(WebRequest.Create(address), HttpWebRequest)
        HttpWReq.Method = "GET"
        HttpWReq.ContentType = "application/x-www-form-urlencoded"
        HttpWReq.Headers("accesstoken") = "vastoken"
        httpWRes = DirectCast(HttpWReq.GetResponse(), HttpWebResponse)

        Dim reader As StreamReader = New StreamReader(httpWRes.GetResponseStream())
        Dim json As String = reader.ReadToEnd()

        HttpContext.Current.Response.Write(json)
    End Sub

End Class

