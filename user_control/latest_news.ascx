<%@ Control Language="VB" ClassName="latest_news" %>

<script runat="server">


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        
        If Not Page.IsPostBack Then
         
            Me.AccessDataSource1.SelectCommand = "SELECT * FROM [news] where [type] = 20 order by id desc"
            Me.gvVietnamTour.DataBind()
        End If
                        
    End Sub

  
    Protected Sub gvVietnamTour_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs)
      
        Me.AccessDataSource1.SelectCommand = "SELECT * FROM [news]  where [type] = 20  order by id desc"
        Me.gvVietnamTour.DataBind()
    End Sub





</script>

<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
    DataFile="~/App_Data/data.mdb" >
</asp:AccessDataSource>

<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
                <asp:GridView ID="gvVietnamTour"  runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataKeyNames="id" 
            DataSourceID="AccessDataSource1" PageSize="3" ShowHeader="False" Width="260px" 
                    onpageindexchanging="gvVietnamTour_PageIndexChanging" GridLines="None">
            <Columns>
                
                <asp:TemplateField>
                    <ItemTemplate>
                           
                    
                                <div style="border:1px solid #ccc; width:670px; margin-bottom:10px; padding:10px">
                        
                        <asp:HyperLink ID="hlTitle" runat="server" 
                            NavigateUrl='<%# "../news/" & Eval("id")  & "/" &  Eval("type") &  "/" & Eval("seo_text")  & ".aspx"  %>' >                      
                                            
                        
                         <div style=" width:180px; height:120px;border:1px solid #ccc; text-align:center; vertical-align:top; display:inline-block; float:left">
                        <asp:Image ID="Image1" runat="server"  
                            ImageUrl='<%# "../images/news/" &  Eval("image") %>'  />
                    
                    </div></asp:HyperLink>
                   
                   <div style="font-weight:bold; width:460px; height:120px; margin-left:10px; text-align:left; vertical-align:top; display:inline-block; float:left">
                    <asp:HyperLink ID="hldetail" runat="server"  
                                        
                       NavigateUrl='<%# "../news/" & Eval("id")  & "/" &  Eval("type") &  "/" & Eval("seo_text")  & ".aspx"  %>'
                      Text='<%# Eval("title") %>'></asp:HyperLink>
                        <br/> 
                            
                         <asp:Label ID="Label2" runat="server" 
                                Text='<%# Eval("short_text") %>' />


                              

                                  <asp:HyperLink ID="HyperLink1" runat="server"  
                                        
                       NavigateUrl='<%# "../news/" & Eval("id")  & "/" &  Eval("type") &  "/" & Eval("seo_text")  & ".aspx"  %>'
                      Text='Chi tiết'></asp:HyperLink>
                       </div>  
                       
                     
                       <div style="clear:both"></div>        
                    </div>

                    </ItemTemplate>
                </asp:TemplateField>
             
            </Columns>
            <PagerStyle CssClass="paging-grid" HorizontalAlign="Right" />
                   
                   
        </asp:GridView>
    </ContentTemplate>
</asp:UpdatePanel>
<asp:UpdateProgress ID="UpdateProgress2" runat="server">
    <ProgressTemplate>
        loading...
    </ProgressTemplate>
</asp:UpdateProgress>

