<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2016.master" %>
<%@ Register src="user_control/product_style.ascx" tagname="product_style" tagprefix="uc13" %>

<script runat="server">










</script>
<%-- Add content controls here --%>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
        

    
          <section id="discount">
            <div class="row ">
                             
      
     <uc13:product_style ID="product_style" runat="server" Visible="true" />


            </div><!-- row -->
           
          </section>



      <script>

          setTimeout(function () { $('.vmk-nav-sidebar').removeClass("slide-right"); }, 1000);


    </script>



    
</asp:Content>

