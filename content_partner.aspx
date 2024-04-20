<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" %>
<%@ Register src="user_control/content_partner.ascx" tagname="content" tagprefix="uc1" %>


<script runat="server">

    









</script>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="fix_content03">

<uc1:content ID="content2" runat="server" />

      <br/>
 </div>
    <script type="text/javascript">
        $("#mn5").addClass("active");          
    </script>
</asp:Content>

