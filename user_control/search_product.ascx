<%@ Control Language="VB" ClassName="search_product" %>


<script runat="server">
 Dim _page As Integer = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        
        If Me.Request("id") <> "" Then
            Me.AccessDataSource1.SelectCommand = "SELECT * FROM [product] where brand like '%" & Me.Request("id") & "%' or productname like '%" & Me.Request("id") & "%' or madein like '%" & Me.Request("id") & "%' order by productname"
            Me.ListView3.DataBind()
            
        End If
                  
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
        If IsDBNull(price) Or price.ToString = "" Or price.ToString = " " Or price.ToString = "0" Or price.ToString = "00" Or price.ToString = "0.0" Then
            Return ""
        ElseIf price.ToString = "-01" Then
            Return "Call để có giá tốt"
        Else
            Return price & " <small>VND</small> <img src='/images/graphics/vipcard.png' class='vipcard' />"
        End If
    End Function
    
        
    Public Function hiddenPrice(ByVal price As Object) As String
        If IsDBNull(price) Or price.ToString = "" Or price.ToString = " " Or price.ToString = "0" Or price.ToString = "00" Or price.ToString = "0.0" Then
            Return ""
        ElseIf price.ToString = "-01" Then
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
            Return "0"
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
 <h1 class="vmk-title text-left" >Kết quả tìm kiếm</h1>

  

  

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
              	<a href="<%# ResolveUrl("../product_detail_vmk/" & formatURL(Eval("id")) & "/" & formatURL(Eval("type")) & "/" & formatURL(Server.UrlEncode(Eval("price"))) & "/" & formatURL(Eval("pricerange")) & "/" & formatURL(Eval("productname")) & "/" & formatURL(Eval("color").ToString.Replace("/", "-")) & "/" & formatURL(Eval("style")) & "/" & formatURL(Server.UrlEncode(Eval("brand").Replace("&", "7")).ToString.Replace("+", "-")) & "/" & formatURL(_page) & "/m/m.aspx")%>" >                      
                                        
                                
                         <img src="<%# "/images/base-img.jpg"%>" class="img-responsive center-block" alt="">                   
                <img src="<%# "/images/products/" & Eval("image")%>" class="img-responsive center-block lazy-photo" alt="">

                
                      <div class="vmk-discount" <%# hiddenDiscount(Eval("discount"))%>>- <%# Eval("discount")%>%</div>
                <div class="vmk-slide-up">
                  <h4><%# Eval("productname") %> <%# eval("color") %></h4>
                     <span class="text-muted vmk-market-price"><%# formatPrice(Eval("pricemall"))  %><br/></span>
                    <span class="text-muted vmk-our-price"  <%# hiddenPrice(Eval("pricevip"))%> ><%# formatPrice(Eval("price"))%><br/></span>
                    <span class="text-muted vmk-our-price vmk-vip-price"><%# formatPriceVIP(Eval("pricevip"))  %><br/></span>
                  <div class="btn btn-default vmk-product-detail"  role="button">Xem chi tiết</div>
                </div><!-- vmk-slide-up -->

       <%# removeNonPicture1(Eval("isnew"))%>
       <%# removeNonPicture2(Eval("ispolar"))%>
   </a>
              </div>


                        
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

              
