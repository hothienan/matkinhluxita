<%@ Control Language="VB" ClassName="title_product" %>

<script runat="server">







</script>
<asp:AccessDataSource DataFile="~/App_Data/data.mdb" ID="SqlDataSource1" runat="server" 
    
    SelectCommand="SELECT typename FROM product_type WHERE (id = ?)">
    <SelectParameters>
        <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
    </SelectParameters>
</asp:AccessDataSource>
<asp:FormView ID="from_view" runat="server" DataSourceID="SqlDataSource1">


    <ItemTemplate>
       
        <asp:Label ID="typenameLabel" runat="server" Text='<%# "Sản phẩm - " & eval("typename") %>' />
       
    </ItemTemplate>
</asp:FormView>
