<%@ Control Language="VB" ClassName="product_artist" %>

<%@ Register Src="product_banner_artist.ascx" TagName="product_banner_artist" TagPrefix="uc1" %>


<%@ Register src="text_box1.ascx" tagname="text_box1" tagprefix="uc2" %>
<%@ Register src="text_box2.ascx" tagname="text_box2" tagprefix="uc3" %>
<%@ Register src="text_box3.ascx" tagname="text_box3" tagprefix="uc4" %>

<script runat="server">

    
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        
        
                         
        If Page.IsPostBack = False Then
            If Me.Request("artist") <> "" Then
                
              
                Me.AccessDataSource1.SelectCommand = "SELECT * FROM [artist_used] where  artist like '" & Me.Request("artist").Replace("-", " ") & "'  order by id desc"
               
                Me.ListView3.DataBind()
             
                
            End If
        
        End If
        
        lbl_test.Text = Me.Request("artist").Replace("-"," ")
        lbl_test.Visible = True
        
    End Sub


    Protected Sub ListView3_PagePropertiesChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.PagePropertiesChangingEventArgs)
       
        Me.AccessDataSource1.SelectCommand = "SELECT * FROM [artist_used] where  artist like '" & Me.Request("artist").Replace("-", " ") & "'  order by id desc"
               
        Me.ListView3.DataBind()
             
        
    End Sub
    
    
    
    Public Function formatURL(ByVal url As Object) As String
        If IsDBNull(url) Then
            Return 0
        Else
            Return url
        End If
    End Function
      
    
    
 





</script>
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
  
        
        <uc1:product_banner_artist ID="product_banner_artist1" runat="server" Visible="false" />
        
 

        
          <section id="famous-artist">
            <div class="row ">

              <h1 class="vmk-title  text-left"><asp:Label ID="lbl_test" runat="server" Text="" ></asp:Label></h1>

                          
<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
    DataFile="~/App_Data/data.mdb"  >
</asp:AccessDataSource>

             <asp:ListView ID="ListView3" runat="server" DataKeyNames="id" 
            DataSourceID="AccessDataSource1" 
            onpagepropertieschanging="ListView3_PagePropertiesChanging" >
           
                                       
            <EmptyDataTemplate>
                
            </EmptyDataTemplate>
              
            
            <ItemTemplate>
                      
         
                
              <div class="col-xs-6 col-sm-3 text-center vmk-star">
                  <a href="<%# "product_artist_detail.aspx?id=" & Eval("productId")%>" >
                    <asp:Image ID="Image1" runat="server" 
                            ImageUrl='<%# "../images/slides/" &  Eval("artist_image") %>' class="img-responsive  center-block" />
                           
                <div class="vmk-slide-up">
                  <h4><%# Eval("brand")%></h4>
                  <span class="text-muted"><%# Eval("productname")  %></span>
                    <br/>
                </div><!-- vmk-slide-up -->

                       </a>
              </div>


                        
          </ItemTemplate>
            <LayoutTemplate>

           

                <div ID="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                 <div class="clearfix"></div><br/>
                <div class="paging">Trang 
                   <asp:DataPager ID="DataPager1" runat="server" PageSize="9">
                        <Fields>

                            <asp:NumericPagerField />
                            
                        </Fields>
                    </asp:DataPager>


                </div>

                
      
            </LayoutTemplate>            
                      
            
        </asp:ListView>


    


            </div><!-- row -->

          </section>


                
              
    </ContentTemplate>
</asp:UpdatePanel>
<asp:UpdateProgress ID="UpdateProgress2" runat="server">
    <ProgressTemplate>
        loading...</ProgressTemplate></asp:UpdateProgress>
        
      
  
     