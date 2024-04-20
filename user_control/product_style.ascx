<%@ Control Language="VB" ClassName="product_style" %>

<%@ Register Src="product_banner.ascx" TagName="product_banner" TagPrefix="uc1" %>
<%@ Register src="text_box1.ascx" tagname="text_box1" tagprefix="uc2" %>
<%@ Register src="text_box2.ascx" tagname="text_box2" tagprefix="uc3" %>
<%@ Register src="text_box3.ascx" tagname="text_box3" tagprefix="uc4" %>


<script runat="server">

    Dim brand, allprice, isglasses, material, range, az_new, male_female, product_own, style_glass As String
    
    Dim _page As Integer = 0
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        
        
                         
        If Page.IsPostBack = False Then
                     
            If Me.Request("range") <> "" Then
               
                Me.CheckBoxList_price.SelectedValue = Me.Request("range")
            End If
            
            If Me.Request("material") <> "" Then
               
                Me.CheckBoxList_material.SelectedValue = Me.Request("material").ToString.Replace("-", " ")
            End If
            
            If Me.Request("is") = "m" Then
                Me.list_glass.SelectedValue = "Mắt kính"
            ElseIf Me.Request("is") = "g" Then
                Me.list_glass.SelectedValue = "Gọng kính"
            Else
                Me.list_glass.SelectedValue = ""
            End If
            
                    
            If Me.Request("pg") <> 0 And Me.Request("pg") <> "" Then
                
                Dim index As Integer = Me.Request("pg")
            
                index = (index - 1) * CType(Me.ListView3.FindControl("DataPager1"), DataPager).PageSize
        
                CType(Me.ListView3.FindControl("DataPager1"), DataPager).SetPageProperties(index, CType(Me.ListView3.FindControl("DataPager1"), DataPager).MaximumRows, True)
            
            End If
                
            filterProduct()
            
        End If

        
    End Sub

    
    Sub filterProduct()
       
        
        If Me.Request("brand") <> "" Then
                       
            brand = " brand like '" & Me.Request("brand").Replace("TRáºº", "TRẺ").Replace("Tráº»", "TRẺ").Replace("-", " ").Replace("7", "&").Replace("9", "(").Replace("0", ")") & "'"
        End If
        
        
        If Me.Request("sp_doc") <> "true" Then
            product_own = " "
        Else
            product_own = " promocheck = True"
        End If
        
        
        If Me.Request("style") <> "" Then
            style_glass = " style = " & Me.Request("style")
        Else
            style_glass = " "
        End If
                  
        
                
        If Me.list_glass.SelectedValue <> "" Then
            isglasses = " and isglasses = '" & Me.list_glass.SelectedValue & "'"
        Else
            isglasses = " "
        End If
        
        
          
        
        material = " "
        For Each item As ListItem In CheckBoxList_material.Items
            If item.Selected = True Then
                material = " artist = '" & item.Value & "' or " & material
            End If
        Next
        If material <> " " Then
            material = " and (" & material & "  artist = ' ' )"
        End If
        

         
        allprice = " "
        For Each item As ListItem In CheckBoxList_price.Items
            If item.Selected = True Then
                allprice = " pricerange = " & item.Value & " or " & allprice
            End If
        Next
        If allprice <> " " Then
            allprice = " and (" & allprice & "  pricerange = 0 )"
        End If
        
        
                
        If Me.chb_nu.Checked And Not Me.chb_nam.Checked Then
            male_female = " and sex like 'Nữ'"
        ElseIf Not Me.chb_nu.Checked And Me.chb_nam.Checked Then
            male_female = " and sex like 'Nam'"
        ElseIf Me.chb_nu.Checked And Me.chb_nam.Checked Then
            male_female = " and sex like 'Cả hai'"
        End If
         
        
        If Me.rdb_a2z.Checked Then
            az_new = " order by productname"
        Else
            az_new = " order by id desc"
        End If
        
        
        Dim sql_string As String = "SELECT * FROM [product] where " & brand & product_own & style_glass & isglasses & material & allprice & male_female & az_new
        Me.AccessDataSource1.SelectCommand = sql_string
        
        Dim styleArr() As String = {"Aviator", "Aviator Inspired", "Butterfly", "Cat Eye", "Oval", "Oversized Oval", "Oversized Round", "Oversized Square", "Rimless", "Round", "Semi-Rimless", "Shield-Visor", "Square", "Wayfarer", "Wrap-Around", "", "", "",  "", "", "Gọng cuớc", "Gọng khoan", "Gọng nhựa", "Gọng khung"}
        
        lbl_test.Text = styleArr(Me.Request("style") - 1)
        lbl_test.Visible = True
        
        Me.ListView3.DataBind()
        
        
    End Sub

    Protected Sub ListView3_PagePropertiesChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.PagePropertiesChangingEventArgs)
       
        filterProduct()
        
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
      
    
    
    
    Protected Sub chb_nam_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        filterProduct()
    End Sub
    
    Protected Sub chb_nu_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        filterProduct()
    End Sub

    Protected Sub rdb_a2z_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        filterProduct()
    End Sub
  
    Protected Sub rdb_new_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        filterProduct()
    End Sub
        
    Protected Sub list_glass_SelectedIndexChanged(sender As Object, e As EventArgs)
        filterProduct()
    End Sub
    
    Protected Sub CheckBoxList_price_SelectedIndexChanged(sender As Object, e As EventArgs)
        filterProduct()
    End Sub
    
    Protected Sub CheckBoxList_material_SelectedIndexChanged(sender As Object, e As EventArgs)
        filterProduct()
    End Sub
    
    
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

            
 <h1 class="vmk-title text-left"><asp:Label ID="lbl_test" runat="server" Text="" ></asp:Label></h1>

        

<div class="panel-group vmk-filter-sidebar vmk-filter-slide-right" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default hide">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
          CAM KẾT
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
        <uc2:text_box1 ID="text_box11" runat="server" />
      </div>
    </div>
  </div>
  <div class="panel panel-default hide">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          BẢO HÀNH
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
        <uc3:text_box2 ID="text_box21"    runat="server" />
      </div>
    </div>
  </div>
  <div class="panel panel-default hide">
    <div class="panel-heading" role="tab" id="headingThree">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          VẬN CHUYỂN
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body">
        <uc4:text_box3 ID="text_box31"    runat="server" />
      </div>
    </div>
  </div>
  <div class="panel panel-default ">
    <div class="panel-heading" role="tab" id="headingFour">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="true" aria-controls="collapseFour">
          TÙY CHỌN
        </a>
      </h4>
    </div>
    <div id="collapseFour" class="panel-collapse collapse  in" role="tabpanel" aria-labelledby="headingFour">
      <div class="panel-body">
                     
                           <!-- Glass filter -->
                                    
                        <div class="control-group">
                            <div class="controls">
                         <asp:DropDownList ID="list_glass" runat="server" AutoPostBack="true" Visible="true"  OnSelectedIndexChanged="list_glass_SelectedIndexChanged">                                       
                    <asp:ListItem Value="">Cả hai</asp:ListItem>
                    <asp:ListItem Value="Mắt kính">Mắt kính</asp:ListItem>
                    <asp:ListItem Value="Gọng kính">Gọng kính</asp:ListItem>
                </asp:DropDownList>
                        </div>
                          </div>
                         <!-- / Glass filter -->
           
                        <!-- Sequency filter -->
                        <asp:Label ID="lbl_sort" runat="server" Text="Theo thứ tự:" class="hide"></asp:Label>
                         
                              <label class="radio">
                                <asp:RadioButton ID="rdb_a2z" runat="server" AutoPostBack="True" 
                    GroupName="abc" OnCheckedChanged="rdb_a2z_CheckedChanged" Text="A-Z"  /> 
                              </label>
                              <label class="radio">
                                <asp:RadioButton ID="rdb_new" runat="server" GroupName="abc" Checked="True" OnCheckedChanged="rdb_new_CheckedChanged"
                   AutoPostBack="True" text="Mới nhất" /> 
                              </label>
                          
                      
                         <!-- / Sequency filter -->

                        <!-- Sex filter -->


                          <asp:Label ID="lb_sex" runat="server" Text="Giới tính:"  class="hide"></asp:Label>
                         
                              <label class="checkbox">
                                <asp:CheckBox ID="chb_nam" runat="server" 
                    OnCheckedChanged="chb_nam_CheckedChanged" AutoPostBack="True" Text="Nam" /> 
                              </label>

                               <label class="checkbox">
                                 <asp:CheckBox ID="chb_nu" runat="server" 
                    OnCheckedChanged="chb_nu_CheckedChanged" AutoPostBack="True" Text="Nữ" /> 
                              </label>
                         
                    

                        <!-- / Sex filter -->
               
             <!-- Price filter -->
                 <hr/>                    
                    
          

                  <asp:Label ID="lbl_pricerange" runat="server" Text="Chọn mức giá:"  class="hide"></asp:Label>
        <asp:CheckBoxList ID="CheckBoxList_price" runat="server" AutoPostBack="True"  OnSelectedIndexChanged="CheckBoxList_price_SelectedIndexChanged">
            
                    <asp:ListItem Value="41">Trên 5 triệu</asp:ListItem>
                    <asp:ListItem Value="42">Từ 5 triệu - 2 triệu</asp:ListItem>
                    <asp:ListItem Value="43">Từ 2 triệu - 1 triệu</asp:ListItem>
                    <asp:ListItem Value="44">Dưới 1 triệu</asp:ListItem>
        </asp:CheckBoxList>
    

                
           <!-- / Price filter -->

             <!-- Material filter -->
                        <hr/>
                        
 
                                
                        <asp:Label ID="lbl_material" runat="server" Text="Chọn chất liệu:"  class="hide"></asp:Label>
        <asp:CheckBoxList ID="CheckBoxList_material" runat="server" AutoPostBack="True"  OnSelectedIndexChanged="CheckBoxList_material_SelectedIndexChanged">
                     
                    <asp:ListItem Value="Aluminum">Aluminum</asp:ListItem>
                    <asp:ListItem Value="Carbon">Carbon</asp:ListItem>
                    <asp:ListItem Value="Handmade">Handmade</asp:ListItem>
                    <asp:ListItem Value="Hợp kim">Hợp kim</asp:ListItem>
                    <asp:ListItem Value="Lake vàng">Lake vàng</asp:ListItem>
                    <asp:ListItem Value="Nhựa Acetate">Nhựa Acetate</asp:ListItem>
                    <asp:ListItem Value="Nhựa hỗn hợp">Nhựa hỗn hợp</asp:ListItem>
                    <asp:ListItem Value="Stainless Steel">Stainless Steel</asp:ListItem>
                    <asp:ListItem Value="Titanium">Titanium</asp:ListItem>
               
             </asp:CheckBoxList>                                      
                          </div>
                          </div>
                          <!-- / Material filter -->
      </div>
    </div>


 
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

 

     