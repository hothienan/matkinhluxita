<%@ Page Title="" Language="VB" MasterPageFile="MasterPage2016.master" %>
<%@ Register src="user_control/content_lens.ascx" tagname="content_lens" tagprefix="uc1" %>
<%@ Register src="user_control/lens_menu.ascx" tagname="lens_menu" tagprefix="uc2" %>

<script runat="server">










</script>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <style>

        .table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th {
        border-bottom: 1px solid #ddd;
        
        }

        .title-right {
            color: red;
        }

    </style>

        

              
     <uc2:lens_menu ID="lens_menu2" runat="server" />

              


        <h1 class="vmk-title text-left">TRÒNG KÍNH</h1>

 <uc1:content_lens ID="content_lens1" runat="server" />
        
      <br/>
   
   
<script>




    var getUrlParameter = function getUrlParameter(sParam) {
        var sPageURL = decodeURIComponent(window.location.search.substring(1)),
            sURLVariables = sPageURL.split('&'),
            sParameterName,
            i;

        for (i = 0; i < sURLVariables.length; i++) {
            sParameterName = sURLVariables[i].split('=');

            if (sParameterName[0] === sParam) {
                return sParameterName[1] === undefined ? true : sParameterName[1];
            }
        }
    };

    var _type = getUrlParameter('id');



    setTimeout(function () {

        $("#" + _type).addClass("active");

        var _title = $(".vmk-menu-info .active").html();

        $(".vmk-title").html(_title);

        $(".vmk-title small").html("");

    }, 2000);


    setTimeout(function () { $('.vmk-nav-sidebar').removeClass("slide-right"); }, 1000);



</script>

</asp:Content>


