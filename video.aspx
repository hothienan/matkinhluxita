<%@ Page Title="" Language="VB" MasterPageFile="MasterPage2016.master" %>
<%@ Register src="user_control/video.ascx" tagname="video" tagprefix="uc1" %>
<%@ Register src="user_control/video_menu.ascx" tagname="video_menu" tagprefix="uc2" %>
<%@ Register src="user_control/news_banner.ascx" tagname="news_banner" tagprefix="uc22" %>
<%@ Register src="user_control/video_content.ascx" tagname="video_content" tagprefix="uc222" %>


<script runat="server">










</script>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<style>

    .vmk-container {
        padding-left: 3% !important;
        width: 76% !important;
    }
</style> 

        

<div class="panel-group vmk-filter-sidebar slide-right" id="accordion" role="tablist" aria-multiselectable="true">

  <div class="panel panel-default ">
    <div class="panel-heading" role="tab" id="headingFour">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="true" aria-controls="collapseFour">
          VIDEO
        </a>
      </h4>
    </div>
    <div id="collapseFour" class="panel-collapse collapse  in" role="tabpanel" aria-labelledby="headingFour">
      <div class="panel-body">
                     
         	
                  
 <uc2:video_menu ID="video_menu1" runat="server" />
        

                                     
                          </div>
                          </div>
                         
      </div>
    </div>


     <br/>
    <div class="row">
          <div class="col-sm-8">
               <uc22:news_banner ID="news_banner2" runat="server" Visible="false" />
   
          

     <h1 class="vmk-title text-left hidden">Video</h1>


                 <uc222:video_content ID="video_content2" runat="server" />

  
          </div>

        <div class="col-sm-4 video-list">
            <h4 class="video-others text-left" >Video khác</h4>
               <uc1:video ID="video1" runat="server" />
           
          </div>


    </div>

 



    <link rel="stylesheet" href="<%= ResolveUrl("js/vimeo player/dist/plyr.css")%>">
          	<!-- Plyr core script -->
	<script src="<%= ResolveUrl("js/vimeo player/dist/plyr.js")%>"></script>

	<!-- Docs script -->
	<script src="<%= ResolveUrl("js/vimeo player/dist/demo.js")%>"></script>

	<!-- Rangetouch to fix <input type="range"> on touch devices (see https://rangetouch.com) -->
	<script src="https://cdn.rangetouch.com/0.0.9/rangetouch.js" async></script>

     <script src="<%= ResolveUrl("js/jquery.min.js")%>"></script>  

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

        var _type = getUrlParameter('type');

        

        setTimeout(function () {

            
            $("#" + _type).addClass("active");
            var _title = $(".vmk-menu-info .active").text();

            $(".vmk-title").text(_title);

        }, 3000);

    
        setTimeout(function () { $('.vmk-nav-sidebar').removeClass("slide-right"); }, 1000);




</script>

</asp:Content>

