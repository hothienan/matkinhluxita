<%@ Control Language="VB" ClassName="title_news" %>

<script runat="server">






</script>
<asp:AccessDataSource DataFile="~/App_Data/data.mdb" ID="SqlDataSource1" runat="server" 
    SelectCommand="SELECT title FROM [news_type] WHERE ([Id] = @Id)">
    <SelectParameters>
        <asp:QueryStringParameter Name="Id" QueryStringField="type" Type="Int64" />
    </SelectParameters>
</asp:AccessDataSource>
<asp:FormView ID="from_view" runat="server" DataSourceID="SqlDataSource1">
    <ItemTemplate>
    <asp:Label ID="Label_news" runat="server"  CssClass="title-web" Text='<%# eval("title") %>'></asp:Label>
    </ItemTemplate>
</asp:FormView>
