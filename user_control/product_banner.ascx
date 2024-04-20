<%@ Control Language="VB" ClassName="product_banner" %>

<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        If Me.Request("brand") <> "" Then
            Me.AccessDataSource1.SelectCommand = "SELECT * FROM [sub_product_type] WHERE [typename] = '" & Me.Request("brand") & "' ORDER BY [id] DESC"
       
                
        End If

    End Sub
     
    Public Function removeNonPicture(ByVal picture As Object) As String
                      
        If IsDBNull(picture) Then
           
            
                Return ""
           
        Else
            Return "<img src='" & Me.ResolveUrl("../images/slides/" & CType(picture, String).ToString) & "' alt='matkinh101' style='height:174px' />"
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
   
 

