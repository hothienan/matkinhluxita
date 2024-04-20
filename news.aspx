<%@ Page Title="" Language="VB" MasterPageFile="MasterPage2018.master" %>
<%@ Register src="user_control/news.ascx" tagname="news" tagprefix="uc1" %>
<%@ Register src="user_control/news_banner.ascx" tagname="news_banner" tagprefix="uc22" %>

<script runat="server">










</script>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 
    <uc22:news_banner ID="news_banner2" runat="server" />

      <div class="breadcrumb-main">
            <div class="container-fluid">
                <div class="row">
                    <div class="breadcrumb">
                        <ul>
                            <li><a href="default.aspx">Trang chủ</a></li>
                            <li><span>Tin tức</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
 
      

      




 <uc1:news ID="news1" runat="server" />
   

</asp:Content>

