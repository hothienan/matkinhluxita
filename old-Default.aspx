<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" %>

<script runat="server">










</script>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    

<meta property="og:url" content="http://matkinh1001.com" />
<meta property="og:image" content='<%# "http://matkinh1001.com/images/products/logo-1001.png" %>' />
<meta property="og:site_name" content="http://matkinh1001.com" />
<meta property="fb:admins" content="100000084147406" />


</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  

    
  <div class="container right-line-black" >
    <div class="row">
      <div class="main-banner">
        <div id="myCarousel" class="carousel slide">
          <div class="carousel-inner">
              

        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/data.mdb" 
            SelectCommand="SELECT * FROM [link_picture] where [position] = 1">
        </asp:AccessDataSource>

        <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" 
            DataSourceID="AccessDataSource1">
            
            <EmptyDataTemplate>
                <span></span>
            </EmptyDataTemplate>
            
                      
            <ItemTemplate>

                   <div class="item ">
                    <a href="<%# Eval("link") %>" target=_blank><img src="images/slides/<%# Eval("picture") %>" alt=""></a>
                    
                  </div>


            </ItemTemplate>
            <LayoutTemplate>
                <div ID="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
      
            </LayoutTemplate>
            
            
        </asp:ListView>
    

            
          </div>
          <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a> <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a> </div>
      </div>


      <div class="right-banner">
        <div id="myCarouse2" class="carousel slide">
          <div class="carousel-inner">
            
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

                   <div class="item ">
                    <a href="<%# Eval("link") %>"  target=_blank><img src="images/slides/<%# Eval("picture") %>" alt=""></a>
                    
                  </div>


            </ItemTemplate>
            <LayoutTemplate>
                <div ID="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
      
            </LayoutTemplate>
            
            
        </asp:ListView>
          </div>
          <a class="left carousel-control" href="#myCarouse2" data-slide="prev">‹</a> <a class="right carousel-control" href="#myCarouse2" data-slide="next">›</a> </div>
      </div>
      <div class="right-banner" style="margin-top:2px">
        <div id="myCarouse3" class="carousel slide">
          <div class="carousel-inner">
            
        <asp:AccessDataSource ID="AccessDataSource3" runat="server" 
            DataFile="~/App_Data/data.mdb" 
            SelectCommand="SELECT * FROM [link_picture] where [position] = 3">
        </asp:AccessDataSource>

        <asp:ListView ID="ListView3" runat="server" DataKeyNames="id" 
            DataSourceID="AccessDataSource3">
            
            <EmptyDataTemplate>
                <span></span>
            </EmptyDataTemplate>
            
                      
            <ItemTemplate>

                   <div class="item ">
                    <a href="<%# Eval("link") %>"  target=_blank><img src="images/slides/<%# Eval("picture") %>" alt=""></a>
                    
                  </div>


            </ItemTemplate>
            <LayoutTemplate>
                <div ID="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
      
            </LayoutTemplate>
            
            
        </asp:ListView>
          </div>
          <a class="left carousel-control" href="#myCarouse3" data-slide="prev">‹</a> <a class="right carousel-control" href="#myCarouse3" data-slide="next">›</a> </div>
      </div>
    </div>
  </div>
  <div class="container " >
    <div class="line-large-black"  style="position:relative">
  
  <div style="position:absolute; left:10px; top:0px; width: 700px">
  <marquee behavior="scroll" scrollamount="3" direction="left">
      <h6></h6></marquee>
  </div>

     <div style="position:absolute; right:50px; top:8px">
<iframe src="//www.facebook.com/plugins/like.php?href=http://matkinh1001.com.au&amp;send=true&amp;layout=button_count&amp;width=150&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font&amp;height=21" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:150px; height:21px;" allowTransparency="true"></iframe>
</div>     
<image src="images/graphics/visa-master.png" alt=""  style="position:absolute; right:5px; top:2px"></image>

    </div>
  </div>
  <div class="container align-bottom-banner" >
    <div class="row">
      <div class="bottom-banner">
        <div id="myCarouse4" class="carousel slide">
          <div class="carousel-inner">
                
        <asp:AccessDataSource ID="AccessDataSource4" runat="server" 
            DataFile="~/App_Data/data.mdb" 
            SelectCommand="SELECT * FROM [link_picture] where [position] = 4">
        </asp:AccessDataSource>

        <asp:ListView ID="ListView4" runat="server" DataKeyNames="id" 
            DataSourceID="AccessDataSource4">
            
            <EmptyDataTemplate>
                <span></span>
            </EmptyDataTemplate>
            
                      
            <ItemTemplate>

                   <div class="item ">
                    <a href="<%# Eval("link") %>"  target=_blank><img src="images/slides/<%# Eval("picture") %>" alt=""></a>
                    
                  </div>


            </ItemTemplate>
            <LayoutTemplate>
                <div ID="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
      
            </LayoutTemplate>
            
            
        </asp:ListView>
          </div>
          <a class="left carousel-control" href="#myCarouse4" data-slide="prev">‹</a> <a class="right carousel-control" href="#myCarouse4" data-slide="next">›</a> </div>
      </div>
      <div class="bottom-banner">
        <div id="myCarouse5" class="carousel slide">
          <div class="carousel-inner">
               
        <asp:AccessDataSource ID="AccessDataSource5" runat="server" 
            DataFile="~/App_Data/data.mdb" 
            SelectCommand="SELECT * FROM [link_picture] where [position] = 5">
        </asp:AccessDataSource>

        <asp:ListView ID="ListView5" runat="server" DataKeyNames="id" 
            DataSourceID="AccessDataSource5">
            
            <EmptyDataTemplate>
                <span></span>
            </EmptyDataTemplate>
            
                      
            <ItemTemplate>

                   <div class="item ">
                    <a href="<%# Eval("link") %>"  target=_blank><img src="images/slides/<%# Eval("picture") %>" alt=""></a>
                    
                  </div>


            </ItemTemplate>
            <LayoutTemplate>
                <div ID="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
      
            </LayoutTemplate>
            
            
        </asp:ListView>
          </div>
          <a class="left carousel-control" href="#myCarouse5" data-slide="prev">‹</a> <a class="right carousel-control" href="#myCarouse5" data-slide="next">›</a> </div>
      </div>
      <div class="bottom-banner">
       <iframe width="310" height="310" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=vi&amp;q=322+Tr%E1%BA%A7n+H%C6%B0ng+%C4%90%E1%BA%A1o,+Nguy%E1%BB%85n+C%C6%B0+Trinh,+Qu%E1%BA%ADn+1,+H%E1%BB%93+Ch%C3%AD+Minh,+Vi%E1%BB%87t+Nam&amp;aq=&amp;sll=10.766914,106.654046&amp;sspn=0.103039,0.154324&amp;ie=UTF8&amp;geocode=FbYjpAAdReVbBg&amp;split=0&amp;hq=&amp;hnear=322+Tr%E1%BA%A7n+H%C6%B0ng+%C4%90%E1%BA%A1o,+Nguy%E1%BB%85n+C%C6%B0+Trinh,+H%E1%BB%93+Ch%C3%AD+Minh,+Vi%E1%BB%87t+Nam&amp;ll=10.757046,106.685765&amp;spn=0.00322,0.004823&amp;t=m&amp;z=15&amp;output=embed"></iframe>
      </div>
    </div>
  </div>

  <script type="text/javascript">
     $(".carousel-inner .item:first-child").addClass("active ");
         
    </script>
   
</asp:Content>

