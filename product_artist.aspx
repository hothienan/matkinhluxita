<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2016.master" %>
<%@ Register src="user_control/product_artist.ascx" tagname="product_artist" tagprefix="uc13" %>

<script runat="server">










</script>
<%-- Add content controls here --%>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
        

    
          <section id="discount">
            <div class="row ">
                             
      
     <uc13:product_artist ID="product_artist" runat="server" Visible="true" />


            </div><!-- row -->
            <hr/>
          </section>


    <script>

        //setTimeout(function () { $('.vmk-nav-sidebar').removeClass("vmk-filter-slide-right"); }, 3000);

    </script>


    
</asp:Content>

