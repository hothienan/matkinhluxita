<%@ Control Language="VB" ClassName="search" %>


<script runat="server">

 
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.Response.Redirect("http://vietmatkinh.com/search_product.aspx?id=" & txt_search.Text)
    End Sub





</script>


           
      <asp:TextBox ID="txt_search" runat="server" class="span3 "></asp:TextBox> 
         
<asp:ImageButton ID="Button1" runat="server" onclick="Button1_Click" ImageUrl="~/images/graphics/search.png"  CssClass="btn-search" />