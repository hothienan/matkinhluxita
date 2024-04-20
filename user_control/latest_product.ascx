<%@ Control Language="VB" ClassName="latest_product" %>


<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
            

               <asp:ListView 
    ID="ListView2" runat="server" DataKeyNames="id" 
    DataSourceID="AccessDataSource2" GroupItemCount="3"><EmptyDataTemplate><table id="Table1" 
            runat="server" style=""><tr><td>Đang xây dựng</td></tr></table></EmptyDataTemplate><EmptyItemTemplate><td id="Td3" runat="server" />
</EmptyItemTemplate><GroupTemplate><tr ID="itemPlaceholderContainer" runat="server"><td 
            ID="itemPlaceholder" runat="server"></td></tr></GroupTemplate><ItemTemplate><td id="Td5" 
            runat="server" style="">
            
                     <div class="fix_sp">
                		<div class="sp">
                        	<p> <asp:HyperLink ID="HyperLink3" runat="server" 
                            NavigateUrl='<%# "../product_detail.aspx?id=" & Eval("id") & "&type=" & Eval("type") %>' >
                        
                             <asp:Label ID="Label2" runat="server" 





                                Text='<%# Eval("productname") %>' /></asp:HyperLink></p>                        	<asp:HyperLink ID="HyperLink2" runat="server"  
                            NavigateUrl='<%# "../images/products/" &  Eval("image") %>' rel="lightbox[roadtrip]">
              <asp:Image ID="Image1" runat="server" 
                            ImageUrl='<%# "../images/products/" &  Eval("image") %>' BorderWidth=0 />
                            </asp:HyperLink>
                            <div class="bg_price">
                            	<div class="price fl"><asp:Label ID="Label1" runat="server"  Text='<%# Eval("price")  %>' /></div>
                                <div class="fr submit_buy ">
                                  
                                    <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# "../product_detail.aspx?id=" & Eval("id") & "&type=" & Eval("type") %>' >
                        Chi tiết</asp:HyperLink>
                                     
                                </div>
                            </div>
                    	</div><!-- sp -->
                    </div><!-- fix_sp -->            
  
                    <br/>
            
            
            </td></ItemTemplate><LayoutTemplate>
            
            <table id="Table2" 
            runat="server"><tr id="Tr1" runat="server"><td id="Td6" runat="server"><table 
                ID="groupPlaceholderContainer" runat="server" border="0" ><tr 
                ID="groupPlaceholder" runat="server"></tr></table></td></tr><tr id="Tr2" 
            runat="server"><td id="Td7" runat="server" style=" font-size:16px; color:red"><asp:DataPager ID="DataPager1" 
                    runat="server" PageSize="9" ><Fields><asp:NumericPagerField /></Fields></asp:DataPager></td></tr></table></LayoutTemplate></asp:ListView>
            
            <asp:AccessDataSource 
    ID="AccessDataSource2" runat="server" DataFile="~/App_Data/data.mdb" 
    SelectCommand="SELECT [productname], [id], [price], [image], [type] FROM [product] ORDER BY [id] DESC"></asp:AccessDataSource>


    </ContentTemplate>
</asp:UpdatePanel>
<asp:UpdateProgress ID="UpdateProgress2" runat="server">
    <ProgressTemplate>
        loading...</ProgressTemplate></asp:UpdateProgress>
        
      
       <br/>