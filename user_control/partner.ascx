<%@ Control Language="VB" ClassName="partner" %>


<script runat="server">


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        
        If Not Page.IsPostBack Then
         
            Me.AccessDataSource1.SelectCommand = "SELECT * FROM [news] where type = 12 order by id desc"
            Me.gvVietnamTour.DataBind()
        End If
                        
    End Sub

  
    Protected Sub gvVietnamTour_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs)
        Me.gvVietnamTour.PageIndex = e.NewPageIndex
        Me.AccessDataSource1.SelectCommand = "SELECT * FROM [news]  where type = 12  order by id desc"
        Me.gvVietnamTour.DataBind()
    End Sub





</script>

<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
    DataFile="~/App_Data/data.mdb" >
</asp:AccessDataSource>

<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
                <asp:GridView ID="gvVietnamTour"  runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" 
            DataSourceID="AccessDataSource1" ForeColor="#333333" 
            GridLines="None" PageSize="9" ShowHeader="False" Width="660px" 
                    onpageindexchanging="gvVietnamTour_PageIndexChanging">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                
                <asp:TemplateField>
                    <ItemTemplate>
                        
   
                            
                        <table style="width:100%;">
                            <tr>
                                <td rowspan="2"  >
                                <div class="colume-image-grid">
                        <asp:HyperLink ID="hlTitle" runat="server" CssClass="title-grid" 
                            NavigateUrl='<%# "../content_partner.aspx?id=" & Eval("id")  & "&type=" &  Eval("type") %>' >
                        <asp:Image ID="Image1" runat="server" CssClass="image-grid"
                            ImageUrl='<%# "../images/news/" &  Eval("image") %>' BorderWidth=5  />
                    </asp:HyperLink>
                    </div>
                    </td>
                                <td align="left">
                                    <asp:Label ID="lbTitle" runat="server" CssClass="title-grid" 
                                         Text='<%# Eval("title") %>'></asp:Label>
                                    <br />
                                    <asp:Label ID="lblPrice" runat="server" CssClass="content-grid" 
                                        Text='<%# Eval("short_text") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:HyperLink ID="hldetail" runat="server" CssClass="link-grid" 
                                        NavigateUrl='<%# "../content_partner.aspx?id=" & Eval("id")  & "&type=" &  Eval("type") %>' Text="chi tiết"></asp:HyperLink>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
             
            </Columns>
            <FooterStyle  Font-Bold="True" ForeColor="White" BackColor="#990000" />
            <HeaderStyle  Font-Bold="True" ForeColor="White" BackColor="#990000" />
            <PagerStyle CssClass="paging-grid" HorizontalAlign="Right" ForeColor="#333333" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                   
                   
        </asp:GridView>
    </ContentTemplate>
</asp:UpdatePanel>
<asp:UpdateProgress ID="UpdateProgress2" runat="server">
    <ProgressTemplate>
        loading...
    </ProgressTemplate>
</asp:UpdateProgress>

