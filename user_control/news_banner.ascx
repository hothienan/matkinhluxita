<%@ Control Language="VB" ClassName="news_banner" %>

<script runat="server">









</script>
<div class="main-banner">
    <div class="container-fluid">
        <div class="row">
            <div class="category-banner">
                <div class="item">



                    <asp:AccessDataSource ID="AccessDataSource1" runat="server"
                        DataFile="~/App_Data/data.mdb"
                        SelectCommand="SELECT * FROM [link_picture] where [position] = 8"></asp:AccessDataSource>

                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id"
                        DataSourceID="AccessDataSource1">

                        <EmptyDataTemplate>
                            <span></span>
                        </EmptyDataTemplate>


                        <ItemTemplate>


                            <img src="images/slides/<%# Eval("picture") %>" alt="">
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div id="itemPlaceholderContainer" runat="server" style="">
                                <span runat="server" id="itemPlaceholder" />
                            </div>
                            <div style="">
                            </div>

                        </LayoutTemplate>


                    </asp:ListView>



                </div>
            </div>
        </div>
    </div>
</div>

