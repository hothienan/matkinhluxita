<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" %>
<%@ Register src="user_control/project.ascx" tagname="project" tagprefix="uc1" %>
<script runat="server">










</script>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="fix_content03">
 <uc1:project ID="project1" runat="server" />
 </div>
    <script type="text/javascript">
        $("#mn3").addClass("active");          
    </script>
</asp:Content>

