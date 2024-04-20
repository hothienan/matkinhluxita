<%@ Control Language="VB" ClassName="about_menu" %>

<script runat="server">


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)


    End Sub







</script>



<div class="submenu">
    <div class="column-menu">
        <div class="col-0">
            <ul>                

                <li><a href="<%= ResolveUrl("../about.aspx")%>">Giới thiệu</a></li>
                <li><a href="<%= ResolveUrl("../history.aspx")%>">Lịch sử phát triển</a></li>
                <li><a href="<%= ResolveUrl("../warranty.aspx")%>">Chính sách</a></li>
                <li><a href="<%= ResolveUrl("../industry.aspx")%>">Nghiệp vụ</a></li>
                <li><a href="<%= ResolveUrl("../payment.aspx")%>">Thanh toán</a></li>
                <li><a href="<%= ResolveUrl("../jobs.aspx")%>">Tuyển dụng</a></li>
                <li><a href="<%= ResolveUrl("../branchs.aspx")%>">Đại lý</a></li>
                

            </ul>
        </div>
    </div>
</div>


<asp:AccessDataSource DataFile="~/App_Data/data.mdb" ID="AccessDataSource1" runat="server"></asp:AccessDataSource>

