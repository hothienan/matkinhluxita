<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">

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
    
    Protected Sub Page_Load(sender As Object, e As EventArgs)
      
        
        'If token() = True Then
            
        Me.DataSource1.SelectCommand = "SELECT *  FROM [member] WHERE [email] = '" & Me.Request("fb_email") & "'"
        
        Dim firstname As String = CType(Request("fb_firstname"), String)
        Dim lastname As String = CType(Request("fb_lastname"), String)
        Dim email As String = CType(Request("fb_email"), String)
        Dim gender As String = CType(Request("fb_gender"), String)
        Dim _id As String = CType(Request("fb_id"), String)
     
        
        Me.GridView1.DataBind()
        If Me.GridView1.Rows.Count > 0 Then
            ' Me.Session("username") = firstname & " " & lastname
            ' Me.Session("avatar") = _id
            
        Else
            Me.DataSource1.InsertCommand = "INSERT INTO member([gender], [firstname], [lastname], [email], [cellphone]) VALUES ('" & gender & "','" & firstname & "','" & lastname & "','" & email & "','" & _id & "')"
            Me.DataSource1.Insert()
            '  Me.Session("username") = firstname & " " & lastname
            ' Me.Session("avatar") = _id
           
            
        End If
  
        '  End If
     
    End Sub









</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="DataSource1">
        <Columns>
            <asp:BoundField DataField="email" />
            
        </Columns>
    </asp:GridView>
    <asp:AccessDataSource ID="DataSource1" runat="server" DataFile="~/App_Data/data.mdb">
    </asp:AccessDataSource>


    </form>
</body>
</html>
