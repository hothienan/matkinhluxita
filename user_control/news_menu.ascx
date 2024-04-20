<%@ Control Language="VB" ClassName="news_menu" %>

<script runat="server">


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        If Not Page.IsPostBack Then
            Me.AccessDataSource1.SelectCommand = "SELECT id, title FROM [news_type] where short_text = 'post' order by id"

        End If


    End Sub







</script>


<div class="submenu">
    <div class="column-menu">
        <div class="col-0">
            <ul>
                               

                <asp:ListView ID="ListView3" runat="server" DataKeyNames="id"
                    DataSourceID="AccessDataSource1">



                    <EmptyDataTemplate>
                        <span>Không có</span>
                    </EmptyDataTemplate>



                    <ItemTemplate>                        

                        <li><a href='<%# ResolveUrl("../news.aspx?type=" & Eval("id"))  %>' title=""><%# Eval("title")%></a></li>
                        
                    </ItemTemplate>

                </asp:ListView>



            </ul>
        </div>
    </div>
</div>


<asp:AccessDataSource DataFile="~/App_Data/data.mdb" ID="AccessDataSource1" runat="server"></asp:AccessDataSource>

