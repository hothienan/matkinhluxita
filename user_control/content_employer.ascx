<%@ Control Language="VB" ClassName="content_employer" %>

<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        If Me.Request("id") <> "" Then
            Me.AccessDataSource1.SelectCommand = "SELECT [id], [title], [image], [content], [type], [date], [short_text] FROM [news] WHERE [id] = " & Me.Request("id") & " ORDER BY [id] DESC"
        End If

    End Sub






</script><asp:FormView id="FormView1" runat="server" DataSourceID="AccessDataSource1" DataKeyNames="id" Width="660px" >
<ItemTemplate>
    <table>
        <tr>
            <td align="center" rowspan="2" valign="top">
                    <asp:Image ID="Image1" runat="server"  
                        ImageUrl='<%# "../images/news/" & Eval("image") %>' CssClass="image-grid" BorderWidth=5  /></td>
            <td valign="top">
                &nbsp;
                <asp:Label ID="Label4" runat="server" Text='<%# Eval("title") %>' CssClass="title-grid" ></asp:Label>
                <asp:Label ID="Label3" runat="server" Text='<%# "(" & Eval("date") &")" %>' CssClass="title-grid" ></asp:Label></td>
        </tr>
        <tr>
            <td valign="top">
                &nbsp;
                <asp:Label ID="Label2" runat="server"  Text='<%# Eval("short_text") %>' CssClass="short-text-grid"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="2" valign="top">
            <br />
                  <asp:Label ID="Label1" runat="server" CssClass="content-grid"  Text='<%# eval("content") %>'></asp:Label></td>
        </tr>
    </table>

</ItemTemplate>
    <RowStyle VerticalAlign="Top" />
</asp:FormView> 


<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
    DataFile="~/App_Data/data.mdb"  SelectCommand="SELECT * FROM [counter]">
</asp:AccessDataSource>
   
 


 