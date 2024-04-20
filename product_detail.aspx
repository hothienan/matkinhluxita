<%@ Page Title="" Language="VB" MasterPageFile="MasterPage2018.master" %>

<%@ Register Src="user_control/product_detail_vmk.ascx" TagName="product_detail_vmk" TagPrefix="uc200" %>



<script runat="server">










</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="breadcrumb-main">
        <div class="container-fluid">
            <div class="row">
                <div class="breadcrumb">
                    <ul>
                        <li><a href="default.aspx">Trang chủ</a></li>
                        <li><span>Sản phẩm</span></li>
                        <li><span></span></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div id="product_detail" class="page-main">
        <div class="column-main">
            <div class="container-fluid">
                <div class="row">
                
                <uc200:product_detail_vmk ID="product_detail_vmk1" runat="server" />

                </div>
            </div>
        </div>
    </div>


    



</asp:Content>

