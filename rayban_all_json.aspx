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
    objAdapter = New OleDbDataAdapter("SELECT * FROM product WHERE productname LIKE '%" & Me.Request("_search") & "%' OR color LIKE '%" & Me.Request("_search") & "%'  order by id desc", conn)
    objAdapter.Fill(objDataSet, "myTable")
    objTable = objDataSet.Tables("myTable")

    outp = ""
    c = Chr(34)
    For Each x In objTable.Rows
        If outp <> "" Then outp = outp & ","
        outp = outp & "{" & c & "Id" & c & ":" & c & x("id") & c & ","
        outp = outp & c & "Price" & c & ":" & c & x("price") & c & ","
        outp = outp & c & "Pricemall" & c & ":" & c & x("pricemall") & c & ","
        outp = outp & c & "Pricevip" & c & ":" & c & x("pricevip") & c & ","
        outp = outp & c & "Name" & c & ":" & c & x("productname") & c & ","
        outp = outp & c & "Image" & c & ":" & c & x("image") & c & ","
        outp = outp & c & "Color" & c & ":" & c & x("color") & c & ","
        outp = outp & c & "Image" & c & ":" & c & x("image") & c & ","
        outp = outp & c & "Type" & c & ":" & c & x("type") & c & ","
        outp = outp & c & "Style" & c & ":" & c & x("style") & c & ","
        outp = outp & c & "Pricerange" & c & ":" & c & x("pricerange") & c & ","
        outp = outp & c & "Brand" & c & ":" & c & x("brand") & c & "}"
      
    Next

    outp = "{" & c & "records" & c & ":[" & outp & "]}"
   
    Response.Write(outp)
    conn.Close()
%>




