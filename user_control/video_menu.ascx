<%@ Control Language="VB" ClassName="video_menu" %>

<script runat="server">


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        If Not Page.IsPostBack Then
            Me.AccessDataSource1.SelectCommand = "SELECT id, title FROM [news_type] where short_text = 'video' order by id"
       
        End If
        
        
    End Sub

   





</script>     


           <ul class="nav vmk-menu-info">

               
 <asp:ListView ID="ListView3" runat="server" DataKeyNames="id" 
            DataSourceID="AccessDataSource1" >
           
           
                                       
            <EmptyDataTemplate>
                <span>Không có</span>
            </EmptyDataTemplate>
                     
              
            
            <ItemTemplate>

        <li class="vmk-news" id='<%#  Eval("id")%>'><a href="<%# "video_type.aspx?type=" & Eval("id")  %>"><%# Eval("title")%> <i class="pull-left icon-chevron-left icon-white"></i></a></li>

            </ItemTemplate>
            
        </asp:ListView>




  </ul>

<asp:AccessDataSource DataFile="~/App_Data/data.mdb" ID="AccessDataSource1" runat="server"  >   
</asp:AccessDataSource>
         
