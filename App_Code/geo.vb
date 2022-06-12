Imports Microsoft.VisualBasic

Public Class geo
    Public Function CalculateDistance(ByVal lat1 As Double, ByVal lon1 As Double, ByVal lat2 As Double, ByVal lon2 As Double) As Double
        Dim t As Double = lon1 - lon2
        Dim distance As Double = Math.Sin(Degree2Radius(lat1)) * Math.Sin(Degree2Radius(lat2)) + Math.Cos(Degree2Radius(lat1)) * Math.Cos(Degree2Radius(lat2)) * Math.Cos(Degree2Radius(t))
        distance = Math.Acos(distance)
        distance = Radius2Degree(distance)
        distance = distance * 60 * 1.1515

        Return distance
    End Function
    Private Function Degree2Radius(ByVal deg As Double) As Double
        Return (deg * Math.PI / 180.0)
    End Function
    Private Function Radius2Degree(ByVal rad As Double) As Double
        Return rad / Math.PI * 180.0
    End Function



    Public Function distance(ByVal lat1 As Double, ByVal lon1 As Double, _
       ByVal lat2 As Double, ByVal lon2 As Double, _
       Optional ByVal unit As Char = "M"c) As Double
        Dim theta As Double = lon1 - lon2
        Dim dist As Double = Math.Sin(deg2rad(lat1)) * Math.Sin(deg2rad(lat2)) + _
              Math.Cos(deg2rad(lat1)) * Math.Cos(deg2rad(lat2)) * _
              Math.Cos(deg2rad(theta))
        dist = Math.Acos(dist)
        dist = rad2deg(dist)
        dist = dist * 60 * 1.1515
        If unit = "K" Then
            dist = dist * 1.609344
        ElseIf unit = "N" Then
            dist = dist * 0.8684
        End If
        Return dist
    End Function
    Public Function Haversine(ByVal lat1 As Double, ByVal lon1 As Double, _
           ByVal lat2 As Double, ByVal lon2 As Double, _
           Optional ByVal unit As Char = "M"c) As Double
        Dim R As Double = 6371 'earth radius in km
        Dim dLat As Double
        Dim dLon As Double
        Dim a As Double
        Dim c As Double
        Dim d As Double
        dLat = deg2rad(lat2 - lat1)
        dLon = deg2rad((lon2 - lon1))
        a = Math.Sin(dLat / 2) * Math.Sin(dLat / 2) + Math.Cos(deg2rad(lat1)) * _
          Math.Cos(deg2rad(lat2)) * Math.Sin(dLon / 2) * Math.Sin(dLon / 2)
        c = 2 * Math.Atan2(Math.Sqrt(a), Math.Sqrt(1 - a))
        d = R * c
        Select Case unit.ToString.ToUpper
            Case "M"c
                d = d * 0.62137119
            Case "N"c
                d = d * 0.5399568
        End Select
        Return d
    End Function
    Private Function deg2rad(ByVal deg As Double) As Double
        Return (deg * Math.PI / 180.0)
    End Function
    Private Function rad2deg(ByVal rad As Double) As Double
        Return rad / Math.PI * 180.0
    End Function

End Class
