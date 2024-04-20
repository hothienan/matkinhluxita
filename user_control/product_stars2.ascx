<%@ Control Language="VB" ClassName="product_stars2" %>


<script runat="server">







</script>



 <div class="slide-show">
      
        
                       <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
            DataFile="~/App_Data/data.mdb" 
            SelectCommand="SELECT * FROM [link_picture] where [position] = 2">
        </asp:AccessDataSource>
                            
                         <asp:ListView ID="ListView2" runat="server" DataKeyNames="id" 
            DataSourceID="AccessDataSource2">
            
            <EmptyDataTemplate>
                <span></span>
            </EmptyDataTemplate>
            
                      
            <ItemTemplate>
                         


              <div class=" col-sm-3 text-center vmk-star">

                <img src="/images/slides/<%# Eval("picture") %>" class="img-responsive img-circle center-block" alt="">
                <div class="vmk-slide-up">
                    <h4><%# Eval("title")%></h4>
                 <span class="text-muted"><%# Eval("content")%></span><br/>
                <br/>
                </div><!-- vmk-slide-up -->
              </div>





            </ItemTemplate>

            
            
        </asp:ListView>


    <div class="slideshow-control">
                  	<span class="prev" ><i class="fa fa-chevron-left fa-fw fa-lg"></i></span>
                  	<span class="next" ><i class="fa fa-chevron-right fa-fw fa-lg"></i></span>
                  </div>

      </div>