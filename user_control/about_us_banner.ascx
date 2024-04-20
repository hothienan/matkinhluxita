<%@ Control Language="VB" ClassName="about_us_banner" %>

<script runat="server">

   
    
    
    





</script>                
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/data.mdb" 
            SelectCommand="SELECT * FROM [link_picture] where [position] = 9">
        </asp:AccessDataSource>

        <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" 
            DataSourceID="AccessDataSource1">
            
            <EmptyDataTemplate>
                <span></span>
            </EmptyDataTemplate>
            
                      
            <ItemTemplate>

                 
                    <a href="<%# Eval("link") %>"  target=_blank><img src="images/slides/<%# Eval("picture") %>" alt="">

                       </a>
                  
            </ItemTemplate>
            <LayoutTemplate>
                <div ID="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
      
            </LayoutTemplate>
            
            
        </asp:ListView>
          