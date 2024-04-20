<%@ Control Language="VB" ClassName="content_contact" %>
<script runat="server">
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)

        Me.AccessDataSource1.SelectCommand = "SELECT [id], [title], [image], [content], [type], [date], [short_text] FROM [news] WHERE [type] = 22 "

    End Sub






</script><asp:FormView id="FormView1" runat="server" DataSourceID="AccessDataSource1" DataKeyNames="id">
    <ItemTemplate>
        <div id="contact" class="page-main">
            <div class="contact-main">
                <div class="container-fuild">
                    <div class="row">


                         <asp:Label ID="Label1" runat="server"  visible="true" Text='<%# eval("content") %>'></asp:Label>

                   
                    </div>
                </div>
            </div>
            
        </div>
             
    </ItemTemplate>
    <RowStyle VerticalAlign="Top" />
</asp:FormView>
<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/data.mdb">
</asp:AccessDataSource>