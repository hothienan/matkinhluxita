<%@ Control Language="VB" ClassName="login" Debug="true"  %>

<script runat="server">

   
 





</script>


    <div id="fb-status"></div>
   <div id="fb-root"></div>

  <script type="text/javascript">
      window.fbAsyncInit = function () {
          // init the FB JS SDK
          FB.init({
              appId: '218022091662448', // App ID from the App Dashboard
              channelUrl: '', // Channel File for x-domain communication
              status: true, // check the login status upon init?
              cookie: true, // set sessions cookies to allow your server to access the session?
              xfbml: true  // parse XFBML tags on this page?
          });


          $("#fbConnect, #fbConnectComment").click(function () {
              FB.login(function (response) {
                  if (response.authResponse) {
                    //  $("#fb-status").html('Welcome!  Fetching your information.... ');
                      FB.api('/me', function (response) {
                          //console.log(response);

                          $("#fbLogout").html('<img src="//graph.facebook.com/' + response.id + '/picture" alt="" />' + '&nbsp;&nbsp;Hi, ' + response.first_name + " " +response.last_name + '&nbsp;&nbsp;<i class="fa fa-sign-out fa-lg" ></i>');
                         
						  $('.avatar_facebook').val(response.id);
                          $('.username_facebook').val( response.first_name + " " + response.last_name);
                          $('.user_email').val(response.email);
                         // console.log(response.gender + "-" + response.email + "-" + response.first_name + "-" + response.last_name + "-" + response.id);
						    
                          $.post("ajaxLogin.aspx", { fb_gender: response.gender, fb_email: response.email, fb_firstname: response.first_name, fb_lastname: response.last_name, fb_id: response.id }, function (result) {
                              if (result != "") {
                                 
                                  console.log('ok');

                                  location.reload();
                              }

                          });
            



                      });
                  } else {
                      $("#fb-status").html('User cancelled login or did not fully authorize.');
                  }
              }, { scope: 'email,user_likes' });

          });


          $("#fbLogout").click(function () {

              FB.logout(function (response) {
                 // $("#fb-status").html(' user is now logged out.');
                 
                  location.reload();
              });
          });



          FB.getLoginStatus(function (response) {

              $("#vmk-comment-form").hide();

            
              if (response.status === 'connected') {
                  // the user is logged in and has authenticated your
                  // app, and response.authResponse supplies
                  // the user's ID, a valid access token, a signed
                  // request, and the time the access token 
                  // and signed request each expire

         


                  FB.api('/me', function (response) {
                     // console.log(response);


                      if (response.email.search("@") > 0) {

                          $("#fbLogout").html('<img src="//graph.facebook.com/' + response.id + '/picture" alt="" />' + '&nbsp;&nbsp;Hi, ' + response.first_name + " " + response.last_name + '&nbsp;&nbsp;<i class="fa fa-sign-out fa-lg" ></i>');
                          $("#fbConnect, #fbConnectComment").hide();


                          $("#fbLogout").show();
                          $("#vmk-comment-form").show();

                          $('.user_email').val(response.email);
                          $('.avatar_facebook').val(response.id);
                          $('.username_facebook').val(response.first_name + " " + response.last_name);

                          $.post("ajaxLogin.aspx", { fb_gender: response.gender, fb_email: response.email, fb_firstname: response.first_name, fb_lastname: response.last_name, fb_id: response.id }, function (result) {
                              if (result != "") {

                                  console.log('ok');

                              }

                          });

                      }


                  });


                  var uid = response.authResponse.userID;
                  var accessToken = response.authResponse.accessToken;
              } else if (response.status === 'not_authorized') {
                  // the user is logged in to Facebook, 
                  // but has not authenticated your app
                  $("#fbConnect, #fbConnectComment").show(); $("#fbLogout").hide();
                  $("#vmk-comment-form").hide();
              } else {
                  // the user isn't logged in to Facebook.
                  $("#fbConnect, #fbConnectComment").show(); $("#fbLogout").hide();
                  $("#vmk-comment-form").hide();
              }
          });




      }; // and init




      // Load the SDK's source Asynchronously
      (function (d) {
          var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
          if (d.getElementById(id)) { return; }
          js = d.createElement('script'); js.id = id; js.async = true;
          js.src = "//connect.facebook.net/en_US/all.js";
          ref.parentNode.insertBefore(js, ref);
      } (document));

       

    </script>



<div id="fbConnect" class="fb-btn "><i class="fa fa-facebook fa-lg" ></i>&nbsp;&nbsp;Đăng nhập</div>
<div id="fbLogout" class="fb-btn-avatar " ></div>




