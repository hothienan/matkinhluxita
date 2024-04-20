<%@ Page Title="" Language="VB" MasterPageFile="MasterPage2016.master" %>

<%@ Register src="user_control/product_artist_detail.ascx" tagname="product_artist_detail" tagprefix="uc200" %>

<%@ Register src="user_control/order_detail.ascx" tagname="order_detail" tagprefix="uc100" %>

<%@ Register src="user_control/famous_picture_new.ascx" tagname="famous_picture_new" tagprefix="uc500" %>
<%@ Register src="user_control/product_detail_meta.ascx" tagname="product_detail_meta" tagprefix="uc600" %>

<script runat="server">










</script>
  
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <style>

        .vmk-container {
            width: 78% !important;
        }


    </style>

       <uc600:product_detail_meta ID="product_detail_meta2" runat="server" />
      
 

       
          <section id="product-detail">
            <div class="row ">

         
  <div class="col-sm-8"><uc200:product_artist_detail ID="product_artist_detail1" runat="server" /></div>
  <div class="col-sm-4">

      <uc500:famous_picture_new ID="famous_picture_new1" runat="server" />
                 
   
  
       <uc100:order_detail ID="order_detail2" runat="server" />

  </div>

   </div><!-- row -->
          


          </section>



  <script type="text/javascript">


    </script>


 
</asp:Content>

