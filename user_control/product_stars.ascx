<%@ Control Language="VB" ClassName="product_stars" %>


<script runat="server">







</script>




 <div class="owl-carousel">
      
        
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
                         


              <div class=" col-sm-12 text-center vmk-star item">

                <img src="images/slides/<%# Eval("picture") %>" class="img-responsive img-circle center-block" alt="">
                <div class="vmk-slide-up">
                    <h4><%# Eval("title")%></h4>
                 <span class="text-muted"><%# Eval("content")%></span><br/>
                <br/>
                </div><!-- vmk-slide-up -->
              </div>





            </ItemTemplate>

            
            
        </asp:ListView>


      </div>