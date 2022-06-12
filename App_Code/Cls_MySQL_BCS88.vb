Imports System.Data
Imports MySql.Data.MySqlClient
Imports System.Configuration

Public Class Cls_MySQL_BCS88
    Private objConn As MySqlConnection
    Private objCmd As MySqlCommand
    Private Trans As MySqlTransaction
    Private strConnString As String

    Public Sub New()
        strConnString = System.Configuration.ConfigurationSettings.AppSettings("BCS88ConnectionString")
    End Sub

    Public Function QueryDataReader(ByVal strSQL As String) As MySqlDataReader
        Dim dtReader As MySqlDataReader
        objConn = New MySqlConnection
        With objConn
            .ConnectionString = strConnString
            .Open()
        End With
        objCmd = New MySqlCommand(strSQL, objConn)
        dtReader = objCmd.ExecuteReader()
        Return dtReader '*** Return DataReader ***'
    End Function

    Public Function QueryDataSet(ByVal strSQL As String) As DataSet
        Dim ds As New DataSet
        Dim dtAdapter As New MySqlDataAdapter
        objConn = New MySqlConnection
        With objConn
            .ConnectionString = strConnString
            .Open()
        End With
        objCmd = New MySqlCommand
        With objCmd
            .Connection = objConn
            .CommandText = strSQL
            .CommandType = CommandType.Text
        End With
        dtAdapter.SelectCommand = objCmd
        dtAdapter.Fill(ds)
        Return ds   '*** Return DataSet ***'
    End Function

    Public Function QueryDataTable(ByVal strSQL As String) As DataTable
        Dim dtAdapter As MySqlDataAdapter
        Dim dt As New DataTable
        objConn = New MySqlConnection
        With objConn
            .ConnectionString = strConnString
            .Open()
        End With
        dtAdapter = New MySqlDataAdapter(strSQL, objConn)
        dtAdapter.Fill(dt)
        Return dt '*** Return DataTable ***'
    End Function

    Public Function QueryExecuteNonQuery(ByVal strSQL As String) As Boolean
        objConn = New MySqlConnection
        With objConn
            .ConnectionString = strConnString
            .Open()
        End With
        Try
            objCmd = New MySqlCommand
            With objCmd
                .Connection = objConn
                .CommandType = CommandType.Text
                .CommandText = strSQL
            End With
            objCmd.ExecuteNonQuery()
            Return True '*** Return True ***'
        Catch ex As Exception
            Return False '*** Return False ***'
        End Try
    End Function

    Public Function QueryExecuteScalar(ByVal strSQL As String) As Object
        Dim obj As Object
        objConn = New MySqlConnection
        With objConn
            .ConnectionString = strConnString
            .Open()
        End With
        Try
            objCmd = New MySqlCommand
            With objCmd
                .Connection = objConn
                .CommandType = CommandType.Text
                .CommandText = strSQL
            End With
            obj = objCmd.ExecuteScalar()  '*** Return Scalar ***'
            Return obj
        Catch ex As Exception
            Return Nothing '*** Return Nothing ***'
        End Try
    End Function

    Public Function TransStart()
        objConn = New MySqlConnection
        With objConn
            .ConnectionString = strConnString
            .Open()
        End With
        Trans = objConn.BeginTransaction(IsolationLevel.ReadCommitted)
    End Function

    Public Function TransExecute(ByVal strSQL As String) As Boolean
        objCmd = New MySqlCommand
        With objCmd
            .Connection = objConn
            .Transaction = Trans
            .CommandType = CommandType.Text
            .CommandText = strSQL
        End With
        objCmd.ExecuteNonQuery()
    End Function

    Public Function TransRollBack()
        Trans.Rollback()
    End Function

    Public Function TransCommit()
        Trans.Commit()
    End Function

    Public Sub Close()
        objConn.Close()
        objConn = Nothing
    End Sub

End Class