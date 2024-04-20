<%@ Control Language="VB" ClassName="news" %>

<script runat="server">


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)


        If Me.Request("type") = "" Then
            Me.AccessDataSource1.SelectCommand = "SELECT * FROM [news] where type between 23 and 27  order by id desc"
            Me.ListView3.DataBind()
        Else

            Me.AccessDataSource1.SelectCommand = "SELECT * FROM [news] where type =" & Me.Request("type") & "  order by id desc"
            Me.ListView3.DataBind()

        End If

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
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" style="">
                    <div id="news" class="page-main">
                        <div class="column-main">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="news-main">
                                        <div class="items">

                                            <span runat="server" id="itemPlaceholder" />


                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="paging">
                    Trang 
                   <asp:DataPager ID="DataPager1" runat="server" PageSize="10">
                       <Fields>

                           <asp:NumericPagerField />

                       </Fields>
                   </asp:DataPager>
                </div>



            </LayoutTemplate>


        </asp:ListView>







