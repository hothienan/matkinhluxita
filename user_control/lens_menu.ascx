<%@ Control Language="VB" ClassName="lens_menu" %>

<script runat="server">


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)

        
    End Sub

   
  





</script>    


      

<div class="panel-group vmk-filter-sidebar slide-right" id="accordion" role="tablist" aria-multiselectable="true">
 
  <div class="panel panel-default ">
    <div class="panel-heading" role="tab" id="headingFour">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="true" aria-controls="collapseFour">
          Tròng kính độ
        </a>
      </h4>
    </div>
    <div id="collapseFour" class="panel-collapse collapse  in" role="tabpanel" aria-labelledby="headingFour">
      <div class="panel-body">
                      
                <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
            DataFile="~/App_Data/data.mdb" 
            SelectCommand="SELECT * FROM [news] where [type] = 39">
        </asp:AccessDataSource>
               
           <ul class="nav vmk-menu-info">
                       
                         <asp:ListView ID="ListView2" runat="server" DataKeyNames="id" 
            DataSourceID="AccessDataSource2">
            
            <EmptyDataTemplate>
                <span></span>
            </EmptyDataTemplate>
            
                      
            <ItemTemplate>
                         
                
        <li class="vmk-news" id='<%#  Eval("id")%>'><a href='<%# "/content_lens.aspx?id=" & Eval("id") & "&type=" & Eval("type")%>' ><%# Eval("title")%><br/><small>Xuất xứ: <%# Eval("short_text")%></small> <i class="pull-left icon-chevron-left icon-white"></i></a></li>

             
  
            </ItemTemplate>

            
            
        </asp:ListView>    

</ul>

      </div>   

    </div>  

    </div>

     <div class="panel panel-default ">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
          Tròng kính mát
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body ">
       

                       
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/data.mdb" 
            SelectCommand="SELECT * FROM [news] where [type] = 38">
        </asp:AccessDataSource>
               
           <ul class="nav vmk-menu-info">
                       
                         <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" 
            DataSourceID="AccessDataSource1">
            
            <EmptyDataTemplate>
                <span></span>
            </EmptyDataTemplate>
            
                      
            <ItemTemplate>
                         

            <li class="vmk-news" id='<%#  Eval("id")%>'><a href='<%# "/content_lens.aspx?id=" & Eval("id") & "&type=" & Eval("type")%>' ><%# Eval("title")%><br/> <small>Xuất xứ: <%# Eval("short_text")%></small> <i class="pull-left icon-chevron-left icon-white"></i></a></li>

                       


            </ItemTemplate>

            
            
        </asp:ListView>    

               </ul>

      </div>
    </div>
  
    </div>


    
     <div class="panel panel-default ">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          Tính năng lớp phủ
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse " role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body ">
       

                       
                <asp:AccessDataSource ID="AccessDataSource3" runat="server" 
            DataFile="~/App_Data/data.mdb" 
            SelectCommand="SELECT [content],[type] FROM [news] WHERE [type] = 40 ">
        </asp:AccessDataSource>
               
           
                       
                         <asp:ListView ID="ListView3" runat="server" DataKeyNames="type" 
            DataSourceID="AccessDataSource3">
            
            <EmptyDataTemplate>
                <span></span>
            </EmptyDataTemplate>
            
                      
            <ItemTemplate>
                         

           <asp:Label ID="Label1" runat="server"   Text='<%# eval("content") %>'></asp:Label>         


            </ItemTemplate>

            
            
        </asp:ListView>    

             

      </div>
    </div>
  
    </div>

  
    </div>

