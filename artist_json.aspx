<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%

    Response.AppendHeader("Content-type", "application/json")
    Dim conn As OleDbConnection
    Dim objAdapter As OleDbDataAdapter
    Dim objTable As DataTable
    Dim objRow As DataRow
    Dim objDataSet As New DataSet()
    Dim outp
    Dim c
   
    
    conn = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\data.mdb")
    objAdapter = New OleDbDataAdapter("SELECT * FROM [link_picture] where [position] = 2", conn)
    objAdapter.Fill(objDataSet, "myTable")
    objTable = objDataSet.Tables("myTable")

    outp = ""
    c = Chr(34)
    For Each x In objTable.Rows
        If outp <> "" Then outp = outp & ","
        outp = outp & "{" & c & "Id" & c & ":" & c & x("id") & c & ","
        outp = outp & c & "Picture" & c & ":" & c & x("picture") & c & ","
        outp = outp & c & "Title" & c & ":" & c & x("title") & c & ","
        outp = outp & c & "Content" & c & ":" & c & x("content") & c & "}"
              
    Next

    outp = "{" & c & "records" & c & ":[" & outp & "]}"
   
    Response.Write(outp)
    conn.Close()
%>




