<%@ Page Title="" Language="VB" MasterPageFile="MasterPage2018.master" %>
<%@ Register src="user_control/content_branchs.ascx" tagname="content_branchs" tagprefix="uc1" %>
<%@ Register src="user_control/about_us_banner.ascx" tagname="about_us_banner" tagprefix="uc22" %>

<script runat="server">










</script>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


             <div class="breadcrumb-main">
            <div class="container-fluid">
                <div class="row">
                    <div class="breadcrumb">
                        <ul>
                            <li><a href="default.aspx">Trang chủ</a></li>
                            <li><span>Đại lý</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    


 <uc1:content_branchs ID="content_branchs1" runat="server" />
        
 
   
</asp:Content>

