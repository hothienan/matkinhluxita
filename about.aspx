<%@ Page Title="" Language="VB" MasterPageFile="MasterPage2018.master" %>

<%@ Register Src="user_control/content_about.ascx" TagName="content_about" TagPrefix="uc1" %>
<%@ Register Src="user_control/about_us_banner.ascx" TagName="about_us_banner" TagPrefix="uc22" %>

<script runat="server">










</script>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <uc22:about_us_banner ID="about_us_banner2" runat="server" />


    <div class="breadcrumb-main">
            <div class="container-fluid">
                <div class="row">
                    <div class="breadcrumb">
                        <ul>
                            <li><a href="default.aspx">Trang chủ</a></li>
                            <li><span>Giới thiệu</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

    <uc1:content_about ID="content_about1" runat="server" />



</asp:Content>

