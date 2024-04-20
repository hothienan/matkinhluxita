<%@ Control Language="VB" ClassName="product_banner_artist" %>

<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        If Me.Request("artist") <> "" Then
            Me.AccessDataSource1.SelectCommand = "SELECT * FROM [artist] WHERE [typename] = '" & Me.Request("artist").Replace("-", " ") & "' ORDER BY [id] DESC"
       
                
        End If

    End Sub
     
    Public Function removeNonPicture(ByVal picture As Object) As String
                      
        If IsDBNull(picture) Then
           
            
                Return ""
           
        Else
            Return "<img src='images/slides/" & CType(picture, String).ToString & "' alt='viet mat kinh' style='height:174px' />"
        End If
      
      
    End Function
    
    
    





</script>


<asp:FormView id="FormView1" runat="server" DataSourceID="AccessDataSource1" DataKeyNames="id"  >
<ItemTemplate>
    
   
      
       <%# removeNonPicture(Eval("image_sheet"))%>

</ItemTemplate>

    <RowStyle VerticalAlign="Top" />
</asp:FormView> 


<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
    DataFile="~/App_Data/data.mdb"  >
</asp:AccessDataSource>
   
 

