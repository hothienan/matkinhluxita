<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2018.master" %>

<%@ Register Src="user_control/product_best_seller.ascx" TagName="product_best_seller" TagPrefix="uc13" %>
<%@ Register Src="user_control/product_stars.ascx" TagName="product_stars" TagPrefix="uc130" %>
<%@ Register Src="user_control/best_brands.ascx" TagName="best_brands" TagPrefix="uc103" %>
<%@ Register Src="user_control/four_latest_news.ascx" TagName="four_latest_news" TagPrefix="uc200" %>




<script runat="server">

</script>

<%-- Add content controls here --%>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



    <div class="main-banner">
        <div class="container-fluid">
            <div class="row">
                <div class="home-banner">


                    <asp:AccessDataSource ID="AccessDataSource1" runat="server"
                        DataFile="~/App_Data/data.mdb"
                        SelectCommand="SELECT TOP 1 * FROM [link_picture] where [position] = 1"></asp:AccessDataSource>
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id"
                        DataSourceID="AccessDataSource1">

                        <EmptyDataTemplate>
                            <span></span>
                        </EmptyDataTemplate>


                        <ItemTemplate>

                            <!-- <div class="item" style="background-image: url('images/slides/<%# Eval("picture") %>')"> -->
                            <div class="item">
                                <div class="banner-img-homepage">
                                    <img src="images/slides/<%# Eval("picture") %>" alt=""/>
                                </div>
                                <div class="max-width">
                                    <div class="contain">
                                        <div class="caption">
                                            <h1><%# Eval("title")%></h1>
                                            <h2><%# Eval("content")%></h2>
                                            <br />
                                            <a href="<%# Eval("link") %>" class="button">XEM CHI TIẾT</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </ItemTemplate>



                    </asp:ListView>



                </div>
                <div class="logo-dot-banner">
                    <ul>



                        <asp:AccessDataSource ID="AccessDataSource44" runat="server" DataFile="~/App_Data/data.mdb"
                            SelectCommand="SELECT TOP 6 * FROM [link_picture] where [position] = 10"></asp:AccessDataSource>

                        <asp:ListView ID="ListView44" runat="server" DataKeyNames="id"
                            DataSourceID="AccessDataSource44">

                            <EmptyDataTemplate>
                                <span></span>
                            </EmptyDataTemplate>


                            <ItemTemplate>
                                <li>
                                    <a href="<%# Eval("link") %>" >

                                        <img src="images/slides/<%# Eval("picture") %>" alt="">
                                    </a>
                                </li>

                            </ItemTemplate>



                        </asp:ListView>



                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div id="homepage" class="page-main">
        <div class="brand-main">
            <div class="container">
                <div class="row">
                    <div class="heading-title">
                        <h3>THƯƠNG HIỆU HÀNG ĐẦU</h3>
                    </div>
                    <div class="brand-block">

                        <uc103:best_brands ID="best_brands1" runat="server" Visible="true" />

                    </div>
                </div>
            </div>
        </div>

        <div class="gender-main">
            <div class="container-fuild">
                <div class="row">
                    <div class="gender-block">
                        <div class="item">


                            <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/data.mdb"
                                SelectCommand="SELECT TOP 1 * FROM [link_picture] where [position] = 13"></asp:AccessDataSource>

                            <asp:ListView ID="ListView2" runat="server" DataKeyNames="id"
                                DataSourceID="AccessDataSource2">

                                <EmptyDataTemplate>
                                    <span></span>
                                </EmptyDataTemplate>


                                <ItemTemplate>
                                    <a href="<%# Eval("link") %>" target="_blank">

                                        <img src="images/slides/<%# Eval("picture") %>" alt="">
                                    </a>


                                </ItemTemplate>



                            </asp:ListView>


                        </div>
                        <div class="item">
                            <asp:AccessDataSource ID="AccessDataSource3" runat="server"
                                DataFile="~/App_Data/data.mdb"
                                SelectCommand="SELECT TOP 1 * FROM [link_picture] where [position] = 3"></asp:AccessDataSource>

                            <asp:ListView ID="ListView3" runat="server" DataKeyNames="id"
                                DataSourceID="AccessDataSource3">

                                <EmptyDataTemplate>
                                    <span></span>
                                </EmptyDataTemplate>


                                <ItemTemplate>
                                    <a href="<%# Eval("link") %>" target="_blank">

                                        <img src="images/slides/<%# Eval("picture") %>" alt="">
                                    </a>

                                </ItemTemplate>



                            </asp:ListView>
                        </div>
                    </div>
                </div>
            </div>
        </div>


      

        <div class="promoBanner-main" style="display:none">
            <div class="container-fuild">
                <div class="row">
                    <div class="promoBanner-block">
                        <div class="contain">
                            <h2>GIẢM GIÁ 60 % ỐNG KÍNH & TIỆN ÍCH TRÊN CHỌN THƯƠNG HIỆU CÓ
                                        <br class="mobile-no">
                                MÃ TD60</h2>
                            <ul class="subscript">
                                <li><strong>Kính mắt:</strong> Ray-Ban, Gucci, Oakley, Costa</li>
                                <li><strong>Kính râm theo toa:</strong> Ray-Ban, Gucci</li>
                            </ul>
                            <div class="logo-brand">
                                <ul>
                                    <li><a href="#">
                                        <img src="images/RB_logo_desk.png" alt=""></a></li>
                                    <li><a href="#">
                                        <img src="images/OO_logo_desk.png" alt=""></a></li>
                                    <li><a href="#">
                                        <img src="images/PR_logo_desk.png" alt=""></a></li>
                                    <li><a href="#">
                                        <img src="images/MK_logo_desk.png" alt=""></a></li>
                                </ul>
                            </div>
                            <div class="button-box">
                                <a href="#" class="button">CỬA HÀNG KÍNH MẮT</a>
                                <a href="#" class="button">SHOP RX SUNGLASSES</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        
             <div class="news-feature">
                <div class="container">
                    <div class="row">
                        <div class="newsfeature-main">
                            <div class="heading-title">
                                <h2>Tin Tức Nổi Bật</h2>
                            </div>
                            <div class="slider-news">
                                <div class="items">


                        <uc200:four_latest_news ID="four_latest_news1" runat="server" Visible="true" />
                                
                              
                               
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        <div class="FSAblock-main">
            <div class="container-fuild">
                <div class="row">


                    <asp:AccessDataSource ID="AccessDataSource7" runat="server"
                        DataFile="~/App_Data/data.mdb"
                        SelectCommand="SELECT TOP 1 * FROM [link_picture] where [position] = 4"></asp:AccessDataSource>

                    <asp:ListView ID="ListView7" runat="server" DataKeyNames="id"
                        DataSourceID="AccessDataSource7">

                        <EmptyDataTemplate>
                            <span></span>
                        </EmptyDataTemplate>


                        <ItemTemplate>


                            <div class="FSAblock" style="background-image: url('images/slides/<%# Eval("picture") %>')">
                                <div class="item">
                                    <div class="contain">
                                        <h2><%# Eval("title")%></h2>
                                        <h3><%# Eval("content")%></h3>
                                        <div class="see-details"></div>
                                        <div class="button-box">

                                            <a href="<%# Eval("link") %>" class="button">XEM CHI TIẾT</a>
                                        </div>
                                    </div>
                                </div>
                            </div>



                        </ItemTemplate>


                    </asp:ListView>


                </div>
            </div>
        </div>
        <div class="related-product">
            <div class="container">
                <div class="row">
                    <div class="recommentpd-main">
                        <div class="container">
                            <div class="row">
                                <div class="slider-cdp">
                                    <div class="product-list">
                                        <div class="heading-title">
                                            <h2>Kính mắt bán chạy nhất</h2>
                                        </div>

                                        <div class="items">
                                            <uc13:product_best_seller ID="product_best_seller" runat="server" Visible="true" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <script>
/*
        document.getElementsByTagName("BODY")[0].display = false;
        myFunction();

        function myFunction() {
            var person = prompt("Please enter your name");
            if (person == "luxita2018") {

                document.getElementsByTagName("BODY")[0].display = true;
            }
            else {
                document.body.innerHTML = '';
            }
        }
        */
    </script>


</asp:Content>

