<%@ Control Language="VB" ClassName="four_latest_news" %>

<script runat="server">


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)


        Me.AccessDataSource1.SelectCommand = "SELECT TOP 12 * FROM [news] where type between 23 and 27  order by id desc"
        Me.ListView3.DataBind()

        Session("userID") = "mika"

    End Sub






</script>


<asp:AccessDataSource ID="AccessDataSource1" runat="server"
    DataFile="~/App_Data/data.mdb"></asp:AccessDataSource>


<asp:ListView ID="ListView3" runat="server" DataKeyNames="id"
    DataSourceID="AccessDataSource1">



    <EmptyDataTemplate>
        <span>Không có</span>
    </EmptyDataTemplate>



    <ItemTemplate>



        <div class="item">
            <div class="news-inner">
                <div class="news-imgage">
                    <a href="<%# "../content_news.aspx?id=" & Eval("id") & "&type=" & Eval("type") %>">
                        <img src="<%# "../images/news/" & Eval("image") %>" alt="" onerror="this.src='../images/default_img.jpg';" /></a>
                </div>
                <div class="contain">
                    <h4 class="title">
                        <a href="<%# "../content_news.aspx?id=" & Eval("id") & "&type=" & Eval("type") %>"><%# Eval("title") %></a>
                    </h4>
                    <div class="subscript">
                        <%# Eval("short_text") %>
                    </div>
                    <div class="btn">
                        <a href="<%# "../content_news.aspx?id=" & Eval("id") & "&type=" & Eval("type") %>">Xem thêm ...</a>
                    </div>
                </div>
            </div>
        </div>


    </ItemTemplate>

</asp:ListView>


