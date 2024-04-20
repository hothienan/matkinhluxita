<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%

    Response.AppendHeader("Content-type", "application/json")
    Dim conn, conn1 As OleDbConnection
    Dim objAdapter As OleDbDataAdapter
    Dim objTable As DataTable
    Dim objRow As DataRow
    Dim objDataSet As New DataSet()
    Dim cmd As New OleDbCommand
   
   
    Dim _id As Integer
    Dim _pricevip As String
    
    conn = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\13data.mdb")
    
    conn1 = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\data.mdb")
    
    objAdapter = New OleDbDataAdapter("SELECT * FROM product where pricevip <> '00' ", conn)
    objAdapter.Fill(objDataSet, "myTable")
    objTable = objDataSet.Tables("myTable")

  
    For Each x In objTable.Rows
       
        _id = x("id")
        _pricevip = x("pricevip")
        

        conn1.Open()
        cmd = New OleDbCommand("UPDATE product set [pricevip] = '" & _pricevip & "'  WHERE id = " & _id, conn1)
        cmd.ExecuteNonQuery()
        conn1.Close()
        
      
    Next

  
   
    Response.Write("done")
    conn.Close()
%>




