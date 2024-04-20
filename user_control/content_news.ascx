<%@ Control Language="VB" ClassName="content_news" %>
<%@ Register Src="product_best_seller_column.ascx" TagName="product_best_seller_column" TagPrefix="uc13" %>



<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        If Me.Request("id") <> "" Then
            Me.AccessDataSource1.SelectCommand = "SELECT [id], [title], [image], [content], [type], [date], [short_text] FROM [news] WHERE [id] = " & Me.Request("id") & " ORDER BY [id] DESC"
        End If

        ' Page.Title = CType(Me.FormView1.FindControl("lbl_title"), Label).Text


    End Sub






</script><asp:FormView id="FormView1" runat="server" DataSourceID="AccessDataSource1" DataKeyNames="id"  >
<ItemTemplate>
            

  <div id="new_detail" class="page-main">
            <div class="column-main">
                <div class="container">
                    <div class="row">
                        <div class="news-detail-main">
                            <div class="news-detail-inner internal-content">
                                <h2><%# Eval("title") %></h2>
                                
                                <span><%# "(" & Eval("date") &")" %></span>

                                <%# eval("content") %>
                                <br/>
                                <iframe src='<%# "//www.facebook.com/plugins/like.php?href=http://vietmatkinh.com/content_news.aspx?id=" & Eval("id") & "&type=" & Eval("type") & "&amp;send=true&amp;layout=button_count&amp;width=150&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font&amp;height=21"%>' scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:150px; height:21px;" allowTransparency="true"></iframe>

                            </div>
                            <div class="siderbarRight">
                                <div class="product-list">
                                    <div class="heading-title">
                                        <h2>BÁN CHẠY NHẤT</h2>
                                    </div>
                                    <div class="items">
                                    
                                          <uc13:product_best_seller_column ID="product_best_seller_column" runat="server" Visible="true" />
                                    
                                    
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


</ItemTemplate>
    <RowStyle VerticalAlign="Top" />
</asp:FormView> 


<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/data.mdb" ></asp:AccessDataSource>
   
 
      
 