<%@ Control Language="VB" ClassName="product" %>

<%@ Register Src="product_banner.ascx" TagName="product_banner" TagPrefix="uc1" %>

<%@ Register Src="product_best_seller.ascx" TagName="product_best_seller" TagPrefix="uc13" %>


<script runat="server">

    Dim brand, allprice, isglasses, material, range, az_new, male_female, product_own, shape_glass, brand_utf8 As String

    Dim _page As Integer = 0

    Dim _firstLoad As Integer = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)

        If Page.IsPostBack = False Then

            If Me.Request("sex") = "other" Then
                Me.chb_nu.Checked = True
                Me.chb_nam.Checked = True
            ElseIf Me.Request("sex") = "men" Then
                Me.chb_nam.Checked = True
            ElseIf Me.Request("sex") = "women" Then
                Me.chb_nu.Checked = True
            End If

            If Me.Request("is") = "eyeglasses" Then
                Me.chb_eyeglasses.Checked = True
                Me.chb_nam.Checked = True
            ElseIf Me.Request("is") = "sunglasses" Then
                Me.chb_sunglasses.Checked = True
            End If



            brand_utf8 = Me.Request("brand").Replace("-", " ").Replace("7", "&").Replace("9", "(").Replace("0", ")").Replace("Phu Kien", "Phụ Kiện")

            If brand_utf8 <> "luxita" Then
                Me.CheckBoxList_brand.SelectedValue = brand_utf8
            End If

            If Me.Request("range") <> "luxita" Then
                Me.CheckBoxList_price.SelectedValue = Me.Request("range")
            End If

            If Me.Request("shape") <> "luxita" Then
                Me.CheckBoxList_shape.SelectedValue = Me.Request("shape")
            End If


            If Me.Request("pg") <> 0 And Me.Request("pg") <> "" Then

                Dim index As Integer = Me.Request("pg")

                index = (index - 1) * CType(Me.ListView3.FindControl("DataPager1"), DataPager).PageSize

                CType(Me.ListView3.FindControl("DataPager1"), DataPager).SetPageProperties(index, CType(Me.ListView3.FindControl("DataPager1"), DataPager).MaximumRows, True)

            End If

            If brand_utf8 <> "luxita" Then
                Dim sql_string As String = "SELECT * FROM [product] where  brand like '" & brand_utf8 & "'  order by id desc"
                Me.AccessDataSource2.SelectCommand = sql_string
                Me.ListView3.DataBind()
            Else
                filterProduct()
            End If



        End If


    End Sub



    Sub filterProduct()


        'brand_utf8 = Me.Request("brand").Replace("-", " ").Replace("7", "&").Replace("9", "(").Replace("0", ")").Replace("Phu Kien", "Phụ Kiện")

        'If brand_utf8 <> "luxita" And _firstLoad = 0 Then
        '    brand = "(  brand like '" & brand_utf8 & "' ) and "
        '    _firstLoad = 1
        'End If

        brand = " "

        For Each item As ListItem In CheckBoxList_brand.Items
            If item.Selected = True Then
                brand = " brand like '" & item.Value & "' or " & brand
            End If
        Next

        If brand <> " " Then
            brand = "(" & brand & "  brand like '' ) and "
        End If



        If Me.chb_sunglasses.Checked = True And Me.chb_eyeglasses.Checked = True Then
            isglasses = " ( isglasses like 'Mắt kính' or  isglasses like 'Gọng kính' ) and "
        ElseIf Me.chb_sunglasses.Checked = True And Me.chb_eyeglasses.Checked = False Then
            isglasses = " isglasses like 'Mắt kính' and "
        ElseIf Me.chb_eyeglasses.Checked = True And Me.chb_sunglasses.Checked = False Then
            isglasses = " isglasses like 'Gọng kính' and "
        ElseIf Me.chb_eyeglasses.Checked = False And Me.chb_sunglasses.Checked = False Then
            isglasses = " ( isglasses like 'Mắt kính' or  isglasses like 'Gọng kính' ) and "
        End If


        If Me.chb_nu.Checked And Not Me.chb_nam.Checked Then
            male_female = " sex like 'Nữ' and "
        ElseIf Not Me.chb_nu.Checked And Me.chb_nam.Checked Then
            male_female = " sex like 'Nam' and "
        ElseIf Me.chb_nu.Checked And Me.chb_nam.Checked Then
            male_female = " sex like 'Cả hai' and "
        End If



        allprice = " "
        For Each item As ListItem In CheckBoxList_price.Items
            If item.Selected = True Then
                allprice = " pricerange = " & item.Value & " or " & allprice
            End If
        Next
        If allprice <> " " Then
            allprice = "(" & allprice & "  pricerange = 0 ) and"
        End If




        shape_glass = " "
        For Each item As ListItem In CheckBoxList_shape.Items
            If item.Selected = True Then
                shape_glass = " style = " & item.Value & " or " & shape_glass
            End If
        Next
        If shape_glass <> " " Then
            shape_glass = " (" & shape_glass & "  style = 0 ) and "
        End If


        material = " "
        For Each item As ListItem In CheckBoxList_material.Items
            If item.Selected = True Then
                material = " artist like '" & item.Value & "' or " & material
            End If
        Next

        If material <> " " Then
            material = " (" & material & "  artist like ' ' ) "
        Else material = " artist like '%' "
        End If




        If Me.DropDownList_sort.SelectedValue = "a2z" Then
            az_new = " order by productname"
        Else
            az_new = " order by id desc"
        End If




        'If Me.Request("sp_doc") <> "true" Then
        '    product_own = " "
        'Else
        '    product_own = " promocheck = True"
        'End If
        product_own = " "


        Dim sql_string As String = "SELECT * FROM [product] where " & male_female & brand & isglasses & allprice & shape_glass & product_own & material & az_new
        Me.AccessDataSource2.SelectCommand = sql_string
        Me.ListView3.DataBind()


        lbl_test.Text = sql_string
        lbl_test.Visible = False





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


    Protected Sub chb_sunglasses_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        filterProduct()
    End Sub

    Protected Sub chb_eyeglasses_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        filterProduct()
    End Sub

    Protected Sub chb_nam_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        filterProduct()
    End Sub

    Protected Sub chb_nu_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        filterProduct()
    End Sub

    Protected Sub DropDownList_sort_SelectedIndexChanged(sender As Object, e As EventArgs)
        filterProduct()
    End Sub

    Protected Sub CheckBoxList_price_SelectedIndexChanged(sender As Object, e As EventArgs)
        filterProduct()
    End Sub

    Protected Sub CheckBoxList_material_SelectedIndexChanged(sender As Object, e As EventArgs)
        filterProduct()
    End Sub

    Protected Sub CheckBoxList_shape_SelectedIndexChanged(sender As Object, e As EventArgs)
        filterProduct()
    End Sub

    Protected Sub CheckBoxList_brand_SelectedIndexChanged(sender As Object, e As EventArgs)
        filterProduct()
    End Sub

    Public Function niceBranding(ByVal _value As String) As String

        Return _value.ToString.Replace("Phụ Kiện", "Phu Kien").Replace(" ", "-").Replace("&", "7").Replace("(", "").Replace(")", "")


    End Function

    Public Function formatColor(ByVal url As Object) As String
        If IsDBNull(url) Then
            Return "luxita"
        Else
            url = url.ToString.Replace("/", "-")
            Return url
        End If
    End Function






</script>
<asp:Label ID="lbl_test" runat="server" Text=""></asp:Label>

<div id="category" class="page-main">
    <div class="column-main">
        <div class="container-fluid">
            <div class="row">
                <div class="sidebar">
                    <div class="title">
                        <h3>LỌC KẾT QUẢ</h3>
                    </div>
                    <div class="filter-main">
                        <div class="filter-options">


                            <asp:AccessDataSource ID="AccessDataSource3" runat="server" SelectCommand="SELECT * FROM [sub_product_type] order by typename"
                                DataFile="~/App_Data/data.mdb"></asp:AccessDataSource>


                          
                            <div class="item">
                                <h3>Loại kính</h3>
                                <ul class="filler-">
                                    <li class="multi-selected">

                                        <asp:CheckBox ID="chb_eyeglasses" runat="server"
                                            OnCheckedChanged="chb_eyeglasses_CheckedChanged" AutoPostBack="True" Text="Gọng kính" />

                                    </li>
                                    <li>

                                        <asp:CheckBox ID="chb_sunglasses" runat="server"
                                            OnCheckedChanged="chb_sunglasses_CheckedChanged" AutoPostBack="True" Text="Kính mát" />
                                    </li>

                                </ul>
                            </div>


                            <div class="item" id="myUL">
                                <h3>Thương hiệu</h3>
                                <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Tìm kiếm ...">


                                <asp:CheckBoxList ID="CheckBoxList_brand" DataValueField="typename" DataTextField="typename" runat="server" AutoPostBack="True" OnSelectedIndexChanged="CheckBoxList_brand_SelectedIndexChanged" DataSourceID="AccessDataSource3" RepeatLayout="UnorderedList" CssClass="filler- brand">
                                </asp:CheckBoxList>



                                <style>
                                    .brand {
                                        height: 320px;
                                        overflow-y: scroll;
                                    }

                                        .brand label {
                                            text-transform: capitalize;
                                        }
                                </style>


                            </div>


                            <div class="item">
                                <h3>Giới tính</h3>
                                <ul class="filler-">
                                    <li class="multi-selected">

                                        <asp:CheckBox ID="chb_nam" runat="server"
                                            OnCheckedChanged="chb_nam_CheckedChanged" AutoPostBack="True" Text="Nam" />

                                    </li>
                                    <li>

                                        <asp:CheckBox ID="chb_nu" runat="server"
                                            OnCheckedChanged="chb_nu_CheckedChanged" AutoPostBack="True" Text="Nữ" />
                                    </li>

                                </ul>
                            </div>

                            <div class="item">
                                <h3>Giá</h3>


                                <asp:CheckBoxList ID="CheckBoxList_price" runat="server" AutoPostBack="True" OnSelectedIndexChanged="CheckBoxList_price_SelectedIndexChanged" RepeatLayout="UnorderedList" CssClass="filler-">

                                    <asp:ListItem Value="41">Trên 5 triệu</asp:ListItem>
                                    <asp:ListItem Value="42">Từ 5 triệu - 2 triệu</asp:ListItem>
                                    <asp:ListItem Value="43">Từ 2 triệu - 1 triệu</asp:ListItem>
                                    <asp:ListItem Value="44">Dưới 1 triệu</asp:ListItem>
                                </asp:CheckBoxList>


                            </div>


                            <div class="item">
                                <h3>Kiểu dáng</h3>



                                <asp:CheckBoxList ID="CheckBoxList_shape" runat="server" AutoPostBack="True" OnSelectedIndexChanged="CheckBoxList_shape_SelectedIndexChanged" RepeatLayout="UnorderedList" CssClass="filler- brand">

                                    <asp:ListItem Value="1">Aviator</asp:ListItem>
                                    <asp:ListItem Value="2">Aviator Inspired</asp:ListItem>
                                    <asp:ListItem Value="3">Butterfly</asp:ListItem>
                                    <asp:ListItem Value="4">Cat Eye</asp:ListItem>
                                    <asp:ListItem Value="5">Oval</asp:ListItem>
                                    <asp:ListItem Value="6">Oversized Oval</asp:ListItem>
                                    <asp:ListItem Value="7">Oversized Round</asp:ListItem>
                                    <asp:ListItem Value="8">Oversized Square</asp:ListItem>
                                    <asp:ListItem Value="9">Rimless</asp:ListItem>
                                    <asp:ListItem Value="10">Round</asp:ListItem>
                                    <asp:ListItem Value="11">Semi-Rimless</asp:ListItem>
                                    <asp:ListItem Value="12">Shield / Visor</asp:ListItem>
                                    <asp:ListItem Value="13">Square</asp:ListItem>
                                    <asp:ListItem Value="14">Wayfarer</asp:ListItem>
                                    <asp:ListItem Value="15">Wrap-Around</asp:ListItem>
                                    <asp:ListItem Value="20">Gọng cuớc</asp:ListItem>
                                    <asp:ListItem Value="21">Gọng khoan</asp:ListItem>
                                    <asp:ListItem Value="22">Gọng khung</asp:ListItem>
                                    <asp:ListItem Value="23">Gọng nhựa</asp:ListItem>

                                </asp:CheckBoxList>




                            </div>




                            <div class="item">
                                <h3>Chất liệu</h3>

                                <asp:CheckBoxList ID="CheckBoxList_material" runat="server" AutoPostBack="True" OnSelectedIndexChanged="CheckBoxList_material_SelectedIndexChanged" RepeatLayout="UnorderedList" CssClass="filler-">

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
                    </div>
                </div>
                <div class="product-categories">
                    <div class="product-list">

                        <div class="toolbar">
                            <div class="sortby">
                                <div class="sortby">
                                    <label>Sắp xếp: </label>
                                    <span class="select-style">

                                        <asp:DropDownList ID="DropDownList_sort" runat="server" AutoPostBack="true" Visible="true" OnSelectedIndexChanged="DropDownList_sort_SelectedIndexChanged">
                                            <asp:ListItem Value="newest">Mới nhất</asp:ListItem>
                                            <asp:ListItem Value="a2z">A-Z</asp:ListItem>

                                        </asp:DropDownList>

                                    </span>
                                </div>
                            </div>
                        </div>


                        <asp:AccessDataSource ID="AccessDataSource2" runat="server"
                            DataFile="~/App_Data/data.mdb"></asp:AccessDataSource>

                        <asp:ListView ID="ListView3" runat="server" DataKeyNames="id"
                            DataSourceID="AccessDataSource2"
                            OnPagePropertiesChanging="ListView3_PagePropertiesChanging">


                            <EmptyDataTemplate>
                            </EmptyDataTemplate>


                            <ItemTemplate>

                                <div class="item">
                                    <div class="product-inner">
                                        <div class="product-imgage">
                                            <a href="<%# ResolveUrl("../product_detail/" & formatURL(Eval("id")) & "/" & formatURL(Eval("type")) & "/" & formatURL(Server.UrlEncode(Eval("price"))) & "/" & formatURL(Eval("pricerange")) & "/" & formatURL(Eval("productname").ToString.Replace(" ", "").Replace("#", "-")) & "/" & formatColor(Eval("color")) & "/" & formatURL(Eval("style")) & "/" & niceBranding(Eval("brand")) & "/" & formatURL(_page) & "/luxita/luxita.aspx")%>">
                                                <img src="<%# "/images/products/" & Eval("image")%>" alt="rayban-rx5154-eyeglasses-5649-51-angle"></a>
                                        </div>
                                        <div class="product-content">
                                            <div class="product-title">
                                                <a href="<%# ResolveUrl("../product_detail/" & formatURL(Eval("id")) & "/" & formatURL(Eval("type")) & "/" & formatURL(Server.UrlEncode(Eval("price"))) & "/" & formatURL(Eval("pricerange")) & "/" & formatURL(Eval("productname").ToString.Replace(" ", "").Replace("#", "-")) & "/" & formatColor(Eval("color")) & "/" & formatURL(Eval("style")) & "/" & niceBranding(Eval("brand")) & "/" & formatURL(_page) & "/luxita/luxita.aspx")%>"><%# Eval("productname") %> <%# eval("color") %></a>
                                                <div class="sku"><%# Eval("brand") %></div>
                                            </div>
                                            <div class="product-price"><span class="del"><%# formatPrice(Eval("pricemall"))  %></span> <strong class="price"><%# formatPrice(Eval("price"))  %></strong></div>
                                            <div class="product-color" <%# hiddenDiscount(Eval("discount"))%>>-<%# Eval("discount")%>%</div>
                                        </div>

                                    </div>
                                </div>




                            </ItemTemplate>
                            <LayoutTemplate>



                                <div id="itemPlaceholderContainer" runat="server">
                                    <div class="items">

                                        <span runat="server" id="itemPlaceholder" />
                                    </div>
                                </div>



                                <div class="loadmore-button">
                                    Trang 
                                       <asp:DataPager ID="DataPager1" runat="server" PageSize="16">
                                           <Fields>

                                               <asp:NumericPagerField />

                                           </Fields>
                                       </asp:DataPager>

                                </div>


                            </LayoutTemplate>


                        </asp:ListView>



                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<script>

    function myFunction() {
        // Declare variables
        var input, filter, ul, li, label, i, txtValue;
        input = document.getElementById('myInput');
        filter = input.value.toUpperCase();
        ul = document.getElementById("myUL");
        li = ul.getElementsByTagName('li');


        // Loop through all list items, and hide those who don't match the search query
        for (i = 0; i <= li.length; i++) {
            label = li[i].getElementsByTagName("label")[0];
            txtValue = label.textContent || label.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                li[i].style.color = "#333333";
                li[i].style.visibility = "visible";
                li[i].style.height = "27px";

            } else {
                li[i].style.color = "white";
                li[i].style.visibility = "hidden";
                li[i].style.height = "0px";

            }
        }
    }
</script>
