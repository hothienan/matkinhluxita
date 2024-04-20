<%@ Control Language="VB" ClassName="product_detail_meta" %>

<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        If Me.Request("id") <> "" Then
            
            Me.AccessDataSource1.SelectCommand = "SELECT * FROM [product] WHERE [id] = " & Me.Request("id") & " ORDER BY [id] DESC"
            Me.FormView1.DataBind()
            
            'Dim tag1 As HtmlMeta = New HtmlMeta()
        
            'Dim tag2 As HtmlMeta = New HtmlMeta()
        
            'Dim tag3 As HtmlMeta = New HtmlMeta()
        
            'Dim tag4 As HtmlMeta = New HtmlMeta()
        
            'Dim tag5 As HtmlMeta = New HtmlMeta()
        
            'tag1.Attributes.Add("property", "og:title")
            'tag1.Content = CType(Me.FormView1.FindControl("lbl_title"), Label).Text  ' don't HtmlEncode() string. HtmlMeta already escapes characters.  
            'Page.Header.Controls.Add(tag1)
        
            'tag2.Attributes.Add("property", "og:image")
            'tag2.Content = CType(Me.FormView1.FindControl("lbl_image"), Label).Text
            'Page.Header.Controls.Add(tag2)
         
            'tag3.Attributes.Add("property", "og:url")
            'tag3.Content = Me.Request.Url.ToString.Replace("%2c", ",")
            'Page.Header.Controls.Add(tag3)
        
            'tag4.Attributes.Add("property", "og:type")
            'tag4.Content = "website"
            'Page.Header.Controls.Add(tag4)
        
            'tag5.Attributes.Add("property", "fb:admins")
            'tag5.Content = "100000084147406"
            'Page.Header.Controls.Add(tag5)
  
            
        End If
        
      

    End Sub
    





</script>
<asp:FormView id="FormView1" runat="server" DataSourceID="AccessDataSource1" DataKeyNames="id"  >
<ItemTemplate>

    <asp:Label ID="lbl_title" runat="server" Text='<%# eval("brand") & " " &  eval("productname") & " " &  eval("color") %>' Visible="false"></asp:Label> 
    <asp:Label ID="lbl_image" runat="server" Text='<%# "http://vietmatkinh.com/images/products/" &  eval("image") %>' Visible="false"></asp:Label> 
 

</ItemTemplate>
    <RowStyle VerticalAlign="Top" />
</asp:FormView> 


<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
    DataFile="~/App_Data/data.mdb"  >
</asp:AccessDataSource>
   
 

   