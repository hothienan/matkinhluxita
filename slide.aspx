﻿<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" %>


<%@ Register src="user_control/four_latest_news.ascx" tagname="four_latest_news" tagprefix="uc2" %>


<script runat="server">










</script>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  

    <style>
  


.main-banner {
   
    margin: 11px 0px 0px -15px;
    width: 613px;
      border:4px solid #ccc;
   
}

.side-banner1 {
   width:295px;
   margin-left:-5px;
   margin-top:11px;
   border:4px solid #ccc;
   
}

.side-banner2 {
   width:295px;
   margin-left:-5px;
   margin-top:15px;
   border:4px solid #ccc;
  
   
}


 .bottom-banner {
   
    margin: 15px 10px 10px 5px;
    float: left;
    width: 295px;
    border:4px solid #ccc;
    height:330px;
}

        .bottom-banner .carousel-control {
            top: 325px;
        
        }

       .bottom-banner .carousel .item {

    height:330px;
}

#main-menu-panel .tab-content{
	width:100%;
}

 .tab-content{
	width:420px;
}

</style>

    
  <div class="container align-bottom-banner" >
    <div class="row">
        <div class="span-8">
      <div class="main-banner">
     <!--   <div id="myCarouse1" class="carousel slide">
          <div class="carousel-inner">  -->
                
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/data.mdb" 
            SelectCommand="SELECT * FROM [link_picture] where [position] = 1">
        </asp:AccessDataSource>


               <div class="box_skitter box_skitter_large" style="margin:0 auto">
<ul>

        <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" 
            DataSourceID="AccessDataSource1">
            
            <EmptyDataTemplate>
                <span></span>
            </EmptyDataTemplate>
            
                      
            <ItemTemplate>

                   <li class="item ">
                    <a href="<%# Eval("link") %>"  target=_blank><img src="../images/slides/<%# Eval("picture") %>" alt="">

                       </a>
                    
                  </li>


            </ItemTemplate>
            <LayoutTemplate>
                <div ID="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
      
            </LayoutTemplate>
            
            
        </asp:ListView>
    </ul>
                    </div>

        <!--  </div>
          <a class="left carousel-control" href="#myCarouse1" data-slide="prev">‹</a> <a class="right carousel-control" href="#myCarouse1" data-slide="next">›</a> </div>
      </div> -->
        </div>

        <div class="span-4">
       <div class="side-banner1">
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
                    <a href="<%# Eval("link") %>"  target=_blank><img src="images/slides/<%# Eval("picture") %>" alt="">

               
                    </a>
                    
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
       <div class="side-banner2">
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
                    <a href="<%# Eval("link") %>"  target=_blank><img src="images/slides/<%# Eval("picture") %>" alt="">

                 
                    </a>
                    
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
                    <a href="<%# Eval("link") %>"  target=_blank><img src="images/slides/<%# Eval("picture") %>" alt="">

                    <div class="carousel-caption">
                       <h4><%# Eval("title")%></h4>
                      <p><%# Eval("content")%></p>
                  
                    </div>

                    </a>
                    
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
                    <a href="<%# Eval("link") %>"  target=_blank><img src="images/slides/<%# Eval("picture") %>" alt="">

                         <div class="carousel-caption">
                      <h4><%# Eval("title")%></h4>
                      <p><%# Eval("content")%></p>
                      
                    </div>

                    </a>
                    
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
        <div id="myCarouse6" class="carousel slide">
          <div class="carousel-inner">
               
        <asp:AccessDataSource ID="AccessDataSource6" runat="server" 
            DataFile="~/App_Data/data.mdb" 
            SelectCommand="SELECT * FROM [link_picture] where [position] = 6">
        </asp:AccessDataSource>

        <asp:ListView ID="ListView6" runat="server" DataKeyNames="id" 
            DataSourceID="AccessDataSource6">
            
            <EmptyDataTemplate>
                <span></span>
            </EmptyDataTemplate>
            
                      
            <ItemTemplate>

                   <div class="item ">
                    <a href="<%# Eval("link") %>"  target=_blank><img src="images/slides/<%# Eval("picture") %>" alt="">

                         <div class="carousel-caption">
                      <h4><%# Eval("title")%></h4>
                      <p><%# Eval("content")%></p>
                      
                    </div>

                    </a>
                    
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
          <a class="left carousel-control" href="#myCarouse6" data-slide="prev">‹</a> <a class="right carousel-control" href="#myCarouse6" data-slide="next">›</a> </div>
      </div>
    </div>
  </div>

      <div class="container " >
    
            <div class="span4 col-left">Bạn cần biết</div> <div class="span8 col-right"></div>
          
           <uc2:four_latest_news ID="four_latest_news1" runat="server" />

  </div>


  <script type="text/javascript">
     $(".carousel-inner .item:first-child").addClass("active ");
    

     $(".box_skitter_large").skitter({
         animation: "randomSmart",
         dots: true,
         interval: 3000,
         progressbar: true,
         progressbar_css: {
             top: '10px',
             left: '510px',
             height: 10,
             borderRadius: '2px',
             width: 200,
             backgroundColor: '#333',
             opacity: 0
         },
         show_randomly: true
     });

    </script>


    


   
</asp:Content>

