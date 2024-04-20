<%@ Control Language="VB" ClassName="text_box1" %>

<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
       
        Me.AccessDataSource1.SelectCommand = "SELECT [content],[type] FROM [news] WHERE [type] = 30 "
      

    End Sub






</script><asp:FormView id="FormView1" runat="server" DataSourceID="AccessDataSource1" DataKeyNames="type"  >
<ItemTemplate>
    
   
            

                      <asp:Label ID="Label1" runat="server"   Text='<%# eval("content") %>'></asp:Label>

</ItemTemplate>
    <RowStyle VerticalAlign="Top" />
</asp:FormView> 


<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
    DataFile="~/App_Data/data.mdb" >
</asp:AccessDataSource>
   
 


 