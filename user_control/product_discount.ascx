<%@ Control Language="VB" ClassName="product_discount" %>


<script runat="server">


    Dim _page As Integer = 0
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        
        Me.AccessDataSource1.SelectCommand = "SELECT * FROM [product] WHERE [discount] > 38 and [discount] < 100 ORDER BY [id] DESC"
       
        
    End Sub


    Protected Sub ListView3_PagePropertiesChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.PagePropertiesChangingEventArgs)
       
 
        Dim CurrentPage As Integer = (e.StartRowIndex / e.MaximumRows) + 1
        _page = CurrentPage
           
       
        
    End Sub
    
    Public Function formatPrice(ByVal price As String) As String
        If price = "00" Or price = "0.0" Or price = "0" Then
            Return "Call để có giá tốt"
        Else
            Return price & " <small>VND</small>"
        End If
    End Function
      
    
    Public Function formatPriceVIP(ByVal price As Object) As String
          If IsDBNull(price) or price.ToString = "" or price.ToString = " " or price.ToString = "0" or price.ToString = "00" or price.ToString = "0.0" Then
            Return ""
        Else
            Return price & " <small>VND</small> <img src='/images/graphics/vipcard.png' class='vipcard' />"
        End If
    End Function
    
        
    Public Function hiddenPrice(ByVal price As Object) As String
        If IsDBNull(price) Or price.ToString = "" Or price.ToString = " " Or price.ToString = "0" Or price.ToString = "00" Or price.ToString = "0.0" Then
            Return ""
        Else
            Return "style='display:none'"
        End If
    End Function
    
    
    Public Function hiddenDiscount(ByVal price As Object) As String
        If price.ToString > 38 And price.ToString < 100 Then
            Return ""
        Else
            Return "style='display:none'"
        End If
    End Function
    
    Public Function formatURL(ByVal url As Object) As String
        If IsDBNull(url) Then
            Return 0
        Else
            Return url
        End If
    End Function
      
    
    
    Public Function removeNonPicture1(ByVal picture As Object) As String
                      
        If picture = False Then
                       
            Return ""
           
        Else
            Return "<div class='flag-new'></div>"
        End If
      
      
    End Function
    
    Public Function removeNonPicture2(ByVal picture As Object) As String
                      
        If picture = False Then
                       
            Return ""
           
        Else
            Return "<div class='flag-polar'></div>"
        End If
      
      
    End Function
    





</script>
      
  
<h1 class="vmk-title text-left">Cơ hội săn hàng Sản phẩm giảm giá</h1>


<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
    DataFile="~/App_Data/data.mdb"  >
</asp:AccessDataSource>

             <asp:ListView ID="ListView3" runat="server" DataKeyNames="id" 
            DataSourceID="AccessDataSource1" 
            onpagepropertieschanging="ListView3_PagePropertiesChanging" >
           
                                       
            <EmptyDataTemplate>
                
            </EmptyDataTemplate>
              
            
            <ItemTemplate>
                      
                
              <div class="col-xs-6 col-sm-3 text-center vmk-product">
              	<a href="<%# ResolveUrl("../product_detail_vmk/" & formatURL(Eval("id")) & "/" & formatURL(Eval("type")) & "/" & formatURL(Server.UrlEncode(Eval("price"))) & "/" & formatURL(Eval("pricerange")) & "/" & formatURL(Eval("productname")) & "/" & formatURL(Eval("color").ToString.Replace("/", "-")) & "/" & formatURL(Eval("style")) & "/" & formatURL(Server.UrlEncode(Eval("brand")).ToString.Replace("+", "-")) & "/" & formatURL(_page) & "/m/m.aspx")%>" >
                                    
                   <img src="<%# "/images/base-img.jpg"%>" class="img-responsive center-block" alt="">                   
                <img src="<%# "/images/products/" & Eval("image")%>" class="img-responsive center-block lazy-photo" alt="">
                <div class="vmk-discount" <%# hiddenDiscount(Eval("discount"))%> >- <%# Eval("discount")%>%</div>
                <div class="vmk-slide-up">
                  <h4><%# Eval("productname") %> <%# eval("color") %></h4>
                  <span class="text-muted vmk-market-price"><%# formatPrice(Eval("pricemall"))  %></span><br/>
                  <span class="text-muted vmk-our-price"  <%# hiddenPrice(Eval("pricevip"))%> ><%# formatPrice(Eval("price"))%></span>
                    <span class="text-muted vmk-our-price"><%# formatPriceVIP(Eval("pricevip"))  %></span><br/>
                  <div class="btn btn-default vmk-product-detail"  role="button">Xem chi tiết</div>
                </div><!-- vmk-slide-up -->

       <%# removeNonPicture1(Eval("isnew"))%>
       <%# removeNonPicture2(Eval("ispolar"))%>
   </a>
              &nbsp;&nbsp;&nbsp;</div>


                        
          </ItemTemplate>
            <LayoutTemplate>

           

                <div ID="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                 <div class="clearfix"></div><br/>
                <div class="paging">Trang 
                   <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                        <Fields>

                            <asp:NumericPagerField />
                            
                        </Fields>
                    </asp:DataPager>


                </div>

                
      
            </LayoutTemplate>            
                      
            
        </asp:ListView>

              
