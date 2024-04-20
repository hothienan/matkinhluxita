<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" %>

<%@ Register src="user_control/title_product.ascx" tagname="title_product" tagprefix="uc1" %>
<%@ Register src="user_control/latest_product.ascx" tagname="latest_product" tagprefix="uc2" %>

<script runat="server">










</script>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <script type="text/javascript">
      $("#mn3").addClass("acrive ");          
    </script>


    <div class="fix_spct">
        	<div class="top_bg color_red padd_10">Sản phẩm mới
            </div>
            <div class="box_sp">
            	<div class="w_1010">
        


                    <uc2:latest_product ID="latest_product1" runat="server" />
        
        

                </div>
            </div>
        </div><!-- fix_spct -->
 

   
</asp:Content>

