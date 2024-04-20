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
   
   
    Dim _id, _price, _pricemall, _pricevip, _discount As Integer
    
    conn = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\data.mdb")
    
    conn1 = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\data.mdb")
    
    objAdapter = New OleDbDataAdapter("SELECT * FROM product", conn)
    objAdapter.Fill(objDataSet, "myTable")
    objTable = objDataSet.Tables("myTable")

  
    For Each x In objTable.Rows
       
        _id = CType(x("id"), Integer)
        _price = CType(x("price"), Integer)
        _pricemall = CType(x("pricemall"), Integer)
        _pricevip = CType(x("pricevip"), Integer)
        _discount = CType(x("discount"), Integer)
        
        If IsDBNull(_discount) Then
        
            If _pricemall <> 0 And Not IsDBNull(_pricevip) Then
            
                If _pricevip <> 0 And Not IsDBNull(_pricevip) Then
                
                    _discount = Math.Round(_pricemall - _pricevip) * 100 / _pricemall
                Else
                    If _price <> 0 And Not IsDBNull(_price) Then
                
                        _discount = Math.Round(_pricemall - _price) * 100 / _pricemall
                    
                    Else
                        _discount = 0
                    End If
            
                
                End If
            
            End If
            
        End If
        
        conn1.Open()
        cmd = New OleDbCommand("UPDATE product set [discount] = " & _discount & "  WHERE id = " & _id, conn1)
        cmd.ExecuteNonQuery()
        conn1.Close()
        
      
    Next

  
   
    Response.Write(_discount)
    conn.Close()
%>




