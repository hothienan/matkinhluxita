<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">

    Protected Sub Page_Load(sender As Object, e As EventArgs)

 
        Dim vimeo_type As String = CType(Request("vimeo_type"), String)
        Dim vimeo_id As String = CType(Request("vimeo_id"), String)
        Dim vimeo_title As String = CType(Request("vimeo_title"), String)
        Dim vimeo_description As String = CType(Request("vimeo_description"), String)
        Dim vimeo_thumbnail As String = CType(Request("vimeo_thumbnail"), String)
     
        
        Me.DataSource1.InsertCommand = "INSERT INTO news([title], [image], [content], [short_text], [date], [type]) VALUES ('" & vimeo_title & "','" & vimeo_thumbnail & "','" & vimeo_description & "','" & vimeo_id & "','" & Now & "','" & vimeo_type & "')"
            Me.DataSource1.Insert()
  
      
     
    End Sub
    
    
    Function token() As Boolean
        Dim _do As Boolean = False
        
        Dim _UTC As Double
        
        _UTC = (DateTime.Now - New DateTime(1970, 1, 1, 0, 0, 0, 0)).TotalSeconds
        
         
        If Me.Session("vmk_token").ToString = "" Then
            Me.Session("vmk_token") = _UTC
            _do = True
        Else
            If CType(_UTC - Me.Session("vmk_token"), Double) > 2 Then
                Me.Session("vmk_token") = _UTC
                
                _do = True
            End If
        End If
        
        Return _do
        
    End Function
    
    
    Function SQL_injection(ByVal input As String) As Boolean
       
        Dim _warning As Boolean = False
        
        Dim known_bad() As String = {"select", "insert", "update", "delete", "drop", "--", "'"}
       

        For i = LBound(known_bad) To UBound(known_bad)
            
            If (InStr(1, input, known_bad(i), vbTextCompare) <> 0) Then

                _warning = True


            End If

        Next
        
        Return _warning
        
    End Function
    









</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">


    <asp:AccessDataSource ID="DataSource1" runat="server" DataFile="~/App_Data/data.mdb">
    </asp:AccessDataSource>


    </form>
</body>
</html>
