<%@ Page Title="" Language="VB" MasterPageFile="MasterPage2016.master" %>

<%@ Register src="user_control/product_detail_vmk.ascx" tagname="product_detail_vmk" tagprefix="uc200" %>

<%@ Register src="user_control/order_detail.ascx" tagname="order_detail" tagprefix="uc100" %>
<%@ Register src="user_control/product_similar.ascx" tagname="product_similar" tagprefix="uc300" %>
<%@ Register src="user_control/product_similar_color.ascx" tagname="product_similar_color" tagprefix="uc400" %>

<%@ Register src="user_control/famous_picture_new.ascx" tagname="famous_picture_new" tagprefix="uc500" %>
<%@ Register src="user_control/product_detail_meta.ascx" tagname="product_detail_meta" tagprefix="uc600" %>

<%@ Register src="user_control/post_comment.ascx" tagname="post_comment" tagprefix="uc222" %>

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

         
  <div class="col-sm-8"><uc200:product_detail_vmk ID="product_detail_vmk1" runat="server" /></div>
  <div class="col-sm-4" style="margin-left: -15px;" >

      <uc500:famous_picture_new ID="famous_picture_new1" runat="server" />
       <uc100:order_detail ID="order_detail2" runat="server" />
       <uc222:post_comment ID="post_comment2" runat="server" />
  </div>

   </div><!-- row -->
          

                  
     <div class="row ">   
<div class="col-sm-12">
                <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Sản phẩm khác màu</a></li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Sản phẩm đề nghị</a></li>
   
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="home"><uc400:product_similar_color ID="product_similar_color1" runat="server" /></div>
    <div role="tabpanel" class="tab-pane" id="profile"><uc300:product_similar ID="product_similar2" runat="server" /></div>
    
  </div>

    </div>      
                
            </div><!-- row -->
           
          </section>



 
</asp:Content>

