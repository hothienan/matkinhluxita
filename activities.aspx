<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" %>
<%@ Register src="user_control/latest_news.ascx" tagname="latest_news" tagprefix="uc1" %>
<script runat="server">










</script>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">
        $("#mn4").addClass("acrive ");          
    </script>


     <div class="fix_spct">
        	<div class="top_bg color_red">Khuyến mãi</div>
    <div class="fix_right">
            

        <div class="fix_banner">
        	<div class="banner padding-content">
            	<uc1:latest_news ID="latest_news1" runat="server" />
            
            </div> 
        </div><!-- CHANGE -->

    


        </div>
        </div><!-- fix_spct -->
        
        


</asp:Content>

