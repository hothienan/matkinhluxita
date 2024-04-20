<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2018.master" %>
<%@ Register src="user_control/product.ascx" tagname="product" tagprefix="uc13" %>

<script runat="server">










</script>
<%-- Add content controls here --%>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
           
          


<div class="main-banner">
    <div class="container-fluid">
        <div class="row">
            <div class="category-banner">
                <div class="item">
                    <img src="images/banner-product.jpg" alt="" />
                </div>
            </div>
        </div>
    </div>
</div>
<div class="breadcrumb-main">
    <div class="container-fluid">
        <div class="row">
            <div class="breadcrumb">
                <ul>
                    <li><a href="default.aspx">Trang chủ</a></li>
                    <li><span>Sản phẩm</span></li>
                </ul>
            </div>
        </div>
    </div>
</div>     
      
     <uc13:product ID="product1" runat="server" Visible="true" />




    
</asp:Content>

