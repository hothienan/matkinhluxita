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
    objAdapter = New OleDbDataAdapter("SELECT * FROM sub_product_type WHERE id = " & Me.Request("_search"), conn)
    objAdapter.Fill(objDataSet, "myTable")
    objTable = objDataSet.Tables("myTable")

    outp = ""
    c = Chr(34)
    For Each x In objTable.Rows
        If outp <> "" Then outp = outp & ","
        outp = outp & "{" & c & "Id" & c & ":" & c & x("id") & c & ","
        outp = outp & c & "brandName" & c & ":" & c & x("typename") & c & ","
        outp = outp & c & "brandLink" & c & ":" & c & x("link_brand") & c & ","
        outp = outp & c & "brandImage1" & c & ":" & c & x("image_sheet") & c & ","
        outp = outp & c & "brandImage2" & c & ":" & c & x("sub_banner1") & c & ","
        outp = outp & c & "brandImage2" & c & ":" & c & x("sub_banner2") & c & "}"
      
    Next

    outp = "{" & c & "records" & c & ":[" & outp & "]}"
   
    Response.Write(outp)
    conn.Close()
%>




