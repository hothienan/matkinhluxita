<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2016.master" %>
<%@ Register src="user_control/product_discount.ascx" tagname="product_discount" tagprefix="uc13" %>
<script runat="server">










</script>
<%-- Add content controls here --%>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    
    

    
          <section id="discount">
            <div class="row ">

              

      
     <uc13:product_discount ID="product_discount" runat="server" Visible="true" />


            </div><!-- row -->
           
          </section>





    
</asp:Content>

