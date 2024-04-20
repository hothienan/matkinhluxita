<%@ Control Language="VB" ClassName="product_detail_vmk" %>
<%@ Register Src="product_similar.ascx" TagName="product_similar" TagPrefix="uc300" %>
<%@ Register Src="product_similar_color.ascx" TagName="product_similar_color" TagPrefix="uc400" %>
<%@ Register Src="emailControl.ascx" TagName="emailControl" TagPrefix="uc1" %>
<%@ Register Src="product_detail_meta.ascx" TagName="product_detail_meta" TagPrefix="uc600" %>

<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        If Me.Request("id") <> "" Then
            Me.AccessDataSource1.SelectCommand = "SELECT * FROM [product] WHERE [id] = " & Me.Request("id") & " ORDER BY [id] DESC"

            Page.Title = CType(Me.FormView1.FindControl("lbl_brand"), Label).Text & " " & CType(Me.FormView1.FindControl("lbl_title"), Label).Text

            Dim _count As Integer

            _count = Convert.ToInt32(CType(Me.FormView1.FindControl("likenumber"), Label).Text) + 1

            Me.AccessDataSource2.UpdateCommand = "UPDATE product SET  child_product = " & _count & " where id=" & Me.Request("id")

            Me.AccessDataSource2.Update()



        End If

    End Sub



    Public Function removeNonPicture(ByVal picture As Object) As String

        If IsDBNull(picture) Then
            Return "hide"
        Else
            Return "item"
        End If
    End Function

    Public Function photos360(ByVal picture As Object) As String

        If picture = True Then
            Return "<a href='#myModal360'  class='btn btn-default btn-sm' data-toggle='modal' type='button'><i class='fa fa-camera-retro fa-lg'></i> 360</a>"
        Else
            Return ""
        End If

    End Function

    Public Function welove(ByVal love As Object) As String

        Return Math.Round(love / 3)


    End Function

    Public Function hiddenMadein(ByVal madein As Object) As String

        If IsDBNull(madein) Then
            Return "style='display:none'"
        Else
            Return ""
        End If
    End Function

    Public Function backButton(ByVal str As Object) As String

        If str = "mika" Then
            Return "javascript:history.back();"
        Else
            Return ""
        End If
    End Function


    Public Function formatPrice(ByVal price As String) As String
        If price = "00" Or price = "0.0" Or price = "0" Then
            Return "Call để có giá tốt"
        Else
            Return price & " <small>VND</small>"
        End If
    End Function


    Public Function formatPriceMall(ByVal pricemall As String) As String
        If pricemall = "00" Or pricemall = "0.0" Or pricemall = "0" Then
            Return "Call để có giá tốt"
        Else
            Return pricemall & " <small>VND</small>"
        End If
    End Function


    Public Function formatPriceVIP(ByVal price As Object) As String
        If IsDBNull(price) Or price.ToString = "" Or price.ToString = " " Or price.ToString = "0" Or price.ToString = "00" Or price.ToString = "0.0" Then
            Return ""
        Else
            Return price & " <small>VND</small> <img src='/images/graphics/vipcard.png' class='vipcard hide' />"
        End If
    End Function

    Public Function hiddenPrice(ByVal price As Object) As String
        If IsDBNull(price) Or price.ToString = "" Or price.ToString = " " Or price.ToString = "0" Or price.ToString = "00" Or price.ToString = "0.0" Or price.ToString = "-01" Then
            Return "style='display:none'"
        Else
            Return ""
        End If
    End Function








</script>

<asp:FormView ID="FormView1" runat="server" DataSourceID="AccessDataSource1" DataKeyNames="id" RenderOuterTable="false">
    <ItemTemplate>

        <asp:Label Text='<%# Eval("child_product")%>' ID="likenumber" runat="server" Visible="false"></asp:Label>
        <div class="product-details-main">
            <div class="product-media">
                <div class="slider-pdp">
                    <div class="items">
                        <div class="item" <%# hiddenMadein(Eval("image")) %>>
                            <div class="pd-img-pos">
                                <div class="pd-img-fix">
                                    <img src='<%= ResolveUrl("../images/products/")%><%# Eval("image")%>' alt="" />
                                </div>
                            </div>
                        </div>
                        <div class="item" <%# hiddenMadein(Eval("image1")) %>>
                            <div class="pd-img-pos">
                                <div class="pd-img-fix">
                                    <img src='<%= ResolveUrl("../images/products/")%><%# Eval("image1")%>' alt="" />
                                </div>
                            </div>
                        </div>
                        <div class="item" <%# hiddenMadein(Eval("image2")) %>>
                            <div class="pd-img-pos">
                                <div class="pd-img-fix">
                                    <img src='<%= ResolveUrl("../images/products/")%><%# Eval("image2")%>' alt="" />
                                </div>
                            </div>
                        </div>
                        <!--
                        <div class="item" <%# hiddenMadein(Eval("image3")) %>>
                            <div class="pd-img-pos">
                                <div class="pd-img-fix">
                                    <img src='<%= ResolveUrl("../images/products/")%><%# Eval("image3")%>' alt="" />
                                </div>
                            </div>
                        </div>
                        -->
                    </div>
                    <div class="items-thumbnails">
                        <div class="item" <%# hiddenMadein(Eval("image")) %>>
                            <div class="pd-img-pos">
                                <div class="pd-img-fix">
                                    <img src='<%= ResolveUrl("../images/products/")%><%# Eval("image")%>' alt="" />
                                </div>
                            </div>
                        </div>
                        <div class="item" <%# hiddenMadein(Eval("image1")) %>>
                            <div class="pd-img-pos">
                                <div class="pd-img-fix">
                                    <img src='<%= ResolveUrl("../images/products/")%><%# Eval("image1")%>' alt="" />
                                </div>
                            </div>
                        </div>
                        <div class="item" <%# hiddenMadein(Eval("image2")) %>>
                            <div class="pd-img-pos">
                                <div class="pd-img-fix">
                                    <img src='<%= ResolveUrl("../images/products/")%><%# Eval("image2")%>' alt="" />
                                </div>
                            </div>
                        </div>
                        <!--
                        <div class="item" <%# hiddenMadein(Eval("image3")) %>>
                            <div class="pd-img-pos">
                                <div class="pd-img-fix">
                                    <img src='<%= ResolveUrl("../images/products/")%><%# Eval("image3")%>' alt="" />
                                </div>
                            </div>
                        </div>
                    	-->
                    </div>
                </div>


            </div>
            <div class="product-detail">

                <div class="prod-details">
                    <div class="title">
                        <h1><%# Eval("productname") %> <%# eval("color") %></h1>
                    </div>
                    <div class="prod-features">
                        <span><%#Eval("isglasses") %></span><span class="divider"><%#Eval("brand") %></span>
                    </div>
                    <div class="sku"><span class="productID"><%# Eval("material")%></span></div>
                </div>
                <div class="swatch-option image">

                    <uc400:product_similar_color ID="product_similar_color1" runat="server" />


                </div>
                <div class="size-option">
                    <div class="title">
                        <h4>KÍCH THước KHUNG: <small><%#Eval("size") %></small><span>* Một số màu có thể có nhiều kích cỡ hơn. </span></h4>
                    </div>
                </div>
                <div class="prod-prices-holder">
                    <div class="old-price"><span class="prices-holder">Chính hãng</span><span class="price"><%# formatPriceMall(Eval("pricemall"))%></span></div>
                    <div class="special-price"><span class="prices-holder">Luxita.vn</span><span class="call"><%# formatPrice(Eval("price"))%></span></div>
                    <!-- <span class="price">3,699,000 <small>vnd</small></span> -->
                </div>


                <div class="add-to-box">
                    <div class="add-to-cart">
                        <!-- <input type="hidden" name="qty" id="qty" maxlength="12" value="0"> -->
                        <button class="button" type="button"><span class="addtocart-pdp">Thanh toán ngay</span></button>
                    </div>
                </div>

                <!-- popup Checkout -->

                <uc1:emailControl ID="emailControl1" runat="server" Visible="true" />

                <!-- end -->




                <div class="pdp-shipping-availability">
                    <span class="instock">TRONG KHO.</span> <span class="instock-ready">MIỄN PHÍ VẬN CHUYỂN</span>
                </div>
            </div>

            <div class="product-tabs" style="display: none !important">
                <div id="tabs">
                    <ul class="tabs-nav">
                        <li><a href="#productDescription">Mô tả</a></li>
                        <li><a href="#productReview">Đánh giá</a></li>
                    </ul>
                    <div id="productDescription" class="content">
                        <h4>Mô tả sản phẩm</h4>

                        <ul>
                            <li><strong>Thương hiệu:</strong>
                                <asp:Label ID="lbl_brand" runat="server" Text='<%#Eval("brand") %>'></asp:Label></li>
                            <li><strong>Kiểu mẫu:</strong>
                                <asp:Label ID="lbl_title" runat="server" Text='<%# Eval("productname") & " " & Eval("color") %>'></asp:Label></li>
                            <li><strong>Màu:</strong>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("material")%>'></asp:Label></li>
                            <li><strong>Size:</strong>
                                <asp:Label ID="Label8" runat="server" Text='<%#Eval("size") %>'></asp:Label></li>

                            <li <%# hiddenMadein(Eval("madein")) %>><strong>Hiệu xuất xứ:</strong>
                                <asp:Label ID="Label4" runat="server" Text='<%#Eval("madein") %>'></asp:Label></li>
                            <li><strong>Giới tính:</strong>
                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("sex") %>'></asp:Label></li>
                            <li><strong>Phụ kiện:</strong>
                                <asp:Label ID="Label2" runat="server" Text='Fullbox'></asp:Label></li>
                            <li><strong>Bảo hành:</strong>
                                <asp:Label ID="Label6" runat="server" Text='12 tháng'></asp:Label></li>



                        </ul>
                    </div>
                    <div id="productReview" class="content">
                        <center><h4>Chưa có đánh giá nào!</h4></center>
                    </div>
                </div>
            </div>

            <div class="product-recomment">
                <div class="recommentpd-main">
                    <div class="container">
                        <div class="row">
                            <div class="slider-cdp">
                                <div class="product-list">
                                    <div class="heading-title">
                                        <h2>Sản phẩm đề xuất cho bạn</h2>
                                    </div>
                                    <div class="items">

                                        <uc300:product_similar ID="product_similar2" runat="server" />


                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>



    </ItemTemplate>
    <RowStyle VerticalAlign="Top" />
</asp:FormView>


<asp:AccessDataSource ID="AccessDataSource1" runat="server"
    DataFile="~/App_Data/data.mdb"></asp:AccessDataSource>



<asp:AccessDataSource ID="AccessDataSource2" runat="server"
    DataFile="~/App_Data/data.mdb"></asp:AccessDataSource>


