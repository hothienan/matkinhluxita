<%@ Control Language="VB" ClassName="content_warranty" %>

<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
       
        Me.AccessDataSource1.SelectCommand = "SELECT [id], [title], [image], [content], [type], [date], [short_text] FROM [news] WHERE [type] = 19 "
    
    End Sub






</script><asp:FormView id="FormView1" runat="server" DataSourceID="AccessDataSource1" DataKeyNames="id" >
<ItemTemplate>


<asp:Label ID="Label1" runat="server"  Text='<%# eval("content") %>'></asp:Label>
    <img src="http://matkinh1001.com/images/slides/famous-artist.jpg" width="0"  height="0"/>
      <br/>
      <div style="">
       <iframe src='<%# "//www.facebook.com/plugins/like.php?href=http://matkinh1001.com/warranty.aspx&amp;send=true&amp;layout=button_count&amp;width=150&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font&amp;height=21"  %>' scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:150px; height:21px;" allowTransparency="true"></iframe>
       </div>
</ItemTemplate>
    <RowStyle VerticalAlign="Top" />
</asp:FormView> 


<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
    DataFile="~/App_Data/data.mdb"  >
</asp:AccessDataSource>
   
 


 