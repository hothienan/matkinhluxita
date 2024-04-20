<%@ Control Language="VB" ClassName="product_menu5" %>

<script runat="server">


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)

        
    End Sub

   
  





</script>    
  <div class="vmk-menu-hover" id="menu-show5">
 

<div class="vmk-lens-section">
    
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>

<div class="row">
                 
                 
    <h5>Tròng kính độ</h5>
             
                       <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
            DataFile="~/App_Data/data.mdb" 
            SelectCommand="SELECT * FROM [news] where [type] = 39">
        </asp:AccessDataSource>
                            
                         <asp:ListView ID="ListView2" runat="server" DataKeyNames="id" 
            DataSourceID="AccessDataSource2">
            
            <EmptyDataTemplate>
                <span></span>
            </EmptyDataTemplate>
            
                      
            <ItemTemplate>
                         


              <div class=" col-sm-2 text-center vmk-lens ">
<a href='<%# "/content_lens.aspx?id=" & Eval("id") & "&type=" & Eval("type")%>' >
                <img src="/images/news/<%# Eval("image")%>" class="img-responsive img-circle center-block" alt="">
                <div class="vmk-slide-up">
                    <h4><%# Eval("title")%></h4>
                 <span class="text-muted"><%# Eval("short_text")%></span><br/>
                <br/>
                </div><!-- vmk-slide-up -->

    </a>
              </div>





            </ItemTemplate>

            
            
        </asp:ListView>

    </div>

        
<div class="row">
                 
                 
    <h5>Tròng kính mát</h5>
             
                       <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/data.mdb" 
            SelectCommand="SELECT * FROM [news] where [type] = 38">
        </asp:AccessDataSource>
                            
                         <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" 
            DataSourceID="AccessDataSource1">
            
            <EmptyDataTemplate>
                <span></span>
            </EmptyDataTemplate>
            
                      
            <ItemTemplate>
                         


              <div class=" col-sm-2 text-center vmk-lens ">
<a href='<%# "../content_lens.aspx?id=" & Eval("id") & "&type=" & Eval("type")%>' >
                <img src="/images/news/<%# Eval("image")%>" class="img-responsive img-circle center-block" alt="">
                <div class="vmk-slide-up">
                    <h4><%# Eval("title")%></h4>
                 <span class="text-muted"><%# Eval("short_text")%></span><br/>
                <br/>
                </div><!-- vmk-slide-up -->
    </a>
              </div>





            </ItemTemplate>

            
            
        </asp:ListView>

    </div>

     

    </ContentTemplate>
</asp:UpdatePanel>
<asp:UpdateProgress ID="UpdateProgress2" runat="server">
    <ProgressTemplate>
        loading...
    </ProgressTemplate>
</asp:UpdateProgress>

       <div class="btn-close-menu"><i class="fa fa-close fa-lg"></i></div>
  </div>  </div> 