<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">

    Protected Sub Page_Load(sender As Object, e As EventArgs)

        If SQL_injection(Me.Request("id")) Or SQL_injection(Me.Request("likeProduct")) Then
            Me.Response.Redirect("http://vietmatkinh.com")
        End If
        
        Me.AccessDataSource1.SelectCommand = "SELECT child_product, [id] FROM [product] WHERE [id] = " & Me.Request("id") & " ORDER BY [id] DESC"
        
        Dim likeProduct As Integer = CType(Request("likeProduct"), Integer)
        If likeProduct > 0 Then
            
            likeProduct = CType(CType(Me.FormView1.FindControl("lbl_like_num"), Label).Text, Integer)
            
            likeProduct = likeProduct + 1
            
            Me.AccessDataSource1.UpdateCommand = "UPDATE product set [child_product] = " & likeProduct & "  WHERE [id] = " & Me.Request("id")
            Me.AccessDataSource1.Update()
        End If
            
     
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
   <asp:FormView id="FormView1" runat="server" DataSourceID="AccessDataSource1" DataKeyNames="id"  >
<ItemTemplate>
    <asp:Label ID="lbl_like_num" runat="server"  Text='<%# eval("child_product") %>'></asp:Label></a>
    </ItemTemplate>   
</asp:FormView> 


<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
    DataFile="~/App_Data/data.mdb"  >
</asp:AccessDataSource>


    </form>
</body>
</html>
