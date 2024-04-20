<%@ Page Language="VB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.Session.Remove("username")
        Me.Response.Redirect("default.aspx")
    End Sub









</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <div id="fb-status"></div>
   <div id="fb-root"></div>
        logout</div>
    </form>

    
  <script>
      window.fbAsyncInit = function () {
          // init the FB JS SDK
          FB.init({
              appId: '218022091662448', // App ID from the App Dashboard
              channelUrl: '', // Channel File for x-domain communication
              status: true, // check the login status upon init?
              cookie: true, // set sessions cookies to allow your server to access the session?
              xfbml: true  // parse XFBML tags on this page?
          });



              FB.logout(function (response) {
                  $("#fb-status").html(' user is now logged out.');

              });
         


          FB.getLoginStatus(function (response) {
              if (response.status === 'connected') {
                  // the user is logged in and has authenticated your
                  // app, and response.authResponse supplies
                  // the user's ID, a valid access token, a signed
                  // request, and the time the access token 
                  // and signed request each expire

                  var uid = response.authResponse.userID;
                  var accessToken = response.authResponse.accessToken;
              } else if (response.status === 'not_authorized') {
                  // the user is logged in to Facebook, 
                  // but has not authenticated your app

              } else {
                  // the user isn't logged in to Facebook.

              }
          });




      };  // and init




      // Load the SDK's source Asynchronously
      (function (d) {
          var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
          if (d.getElementById(id)) { return; }
          js = d.createElement('script'); js.id = id; js.async = true;
          js.src = "//connect.facebook.net/en_US/all.js";
          ref.parentNode.insertBefore(js, ref);
      } (document));

       

    </script>



</body>
</html>
