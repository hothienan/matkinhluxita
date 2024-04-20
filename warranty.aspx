<%@ Page Title="" Language="VB" MasterPageFile="MasterPage2018.master" %>
<%@ Register src="user_control/content_warranty.ascx" tagname="content_warranty" tagprefix="uc1" %>

<script runat="server">










</script>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


       <div class="breadcrumb-main">
            <div class="container-fluid">
                <div class="row">
                    <div class="breadcrumb">
                        <ul>
                            <li><a href="default.aspx">Trang chủ</a></li>
                            <li><span>Chính sách</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    

 <uc1:content_warranty ID="content_warranty1" runat="server" />
        
  
   
</asp:Content>

