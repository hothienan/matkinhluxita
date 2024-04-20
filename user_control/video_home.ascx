<%@ Control Language="VB" ClassName="video_home" %>

<script runat="server">


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
                
        Me.AccessDataSource1.SelectCommand = "SELECT  TOP 4 * FROM [news] where type = 41  order by id desc"
        Me.ListView3.DataBind()

        Me.AccessDataSource2.SelectCommand = "SELECT  TOP 4 * FROM [news] where type = 42  order by id desc"
        Me.ListView3.DataBind()
        
        Me.AccessDataSource3.SelectCommand = "SELECT  TOP 4 * FROM [news] where type = 43  order by id desc"
        Me.ListView3.DataBind()
 
       
    End Sub






</script>


<asp:AccessDataSource ID="AccessDataSource1" runat="server"
    DataFile="~/App_Data/data.mdb"></asp:AccessDataSource>
<asp:AccessDataSource ID="AccessDataSource2" runat="server"
    DataFile="~/App_Data/data.mdb"></asp:AccessDataSource>
<asp:AccessDataSource ID="AccessDataSource3" runat="server"
    DataFile="~/App_Data/data.mdb"></asp:AccessDataSource>

<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>

        <div class="row">
             <h4 class="vmk-title-video-category text-left ">SẢN PHẤM MỚI <a href="video_type.aspx?type=41" class="btn btn-default btn-sm">Xem tất cả <i class="fa fa-chevron-right "></i></a></h4>
           
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="id"
            DataSourceID="AccessDataSource1">



            <EmptyDataTemplate>
                <span>Không có</span>
            </EmptyDataTemplate>



            <ItemTemplate>



                <div class="col-sm-3 vmk-video-item">
                    <a href="<%# "video.aspx?id=" & Eval("id") & "&type=" & Eval("type")%>">


                        <img src='<%# Eval("image")%>' class="img-responsive center-block " alt="">

                        <h4 class="vmk-video-title">'<%# Eval("title") %>'</h4>
                        <span class="text-muted vmk-video-description"><i class="fa fa-heart "></i><b style="font-size: 14px"> Quan tâm (<%# Eval("gia")%>)</b> &nbsp;&nbsp;(<%# Eval("date") %>)</span><br />


                    </a>
                </div>


            </ItemTemplate>



        </asp:ListView>
        </div>

        <div class="row">
             <h4 class="vmk-title-video-category text-left ">KỸ THUẬT <a href="video_type.aspx?type=42" class="btn btn-default btn-sm">Xem tất cả <i class="fa fa-chevron-right "></i></a></h4>
            

        <asp:ListView ID="ListView2" runat="server" DataKeyNames="id"
            DataSourceID="AccessDataSource2">



            <EmptyDataTemplate>
                <span>Không có</span>
            </EmptyDataTemplate>



            <ItemTemplate>



                <div class="col-sm-3 vmk-video-item">
                    <a href="<%# "video.aspx?id=" & Eval("id") & "&type=" & Eval("type")%>">


                        <img src='<%# Eval("image")%>' class="img-responsive center-block " alt="">

                        <h4 class="vmk-video-title">'<%# Eval("title") %>'</h4>
                        <span class="text-muted vmk-video-description"><i class="fa fa-heart "></i><b style="font-size: 14px"> Quan tâm (<%# Eval("gia")%>)</b> &nbsp;&nbsp;(<%# Eval("date") %>)</span><br />


                    </a>
                </div>


            </ItemTemplate>



        </asp:ListView>
        </div>

        <div class="row">
            <h4 class="vmk-title-video-category text-left ">CHUYỆN BÊN LỀ <a href="video_type.aspx?type=43" class="btn btn-default btn-sm">Xem tất cả <i class="fa fa-chevron-right "></i></a></h4>

        <asp:ListView ID="ListView3" runat="server" DataKeyNames="id"
            DataSourceID="AccessDataSource3">



            <EmptyDataTemplate>
                <span>Không có</span>
            </EmptyDataTemplate>



            <ItemTemplate>



                <div class="col-sm-3 vmk-video-item">
                    <a href="<%# "video.aspx?id=" & Eval("id") & "&type=" & Eval("type")%>">


                        <img src='<%# Eval("image")%>' class="img-responsive center-block " alt="">

                        <h4 class="vmk-video-title">'<%# Eval("title") %>'</h4>
                        <span class="text-muted vmk-video-description"><i class="fa fa-heart "></i><b style="font-size: 14px"> Quan tâm (<%# Eval("gia")%>)</b> &nbsp;&nbsp;(<%# Eval("date") %>)</span><br />


                    </a>
                </div>


            </ItemTemplate>



        </asp:ListView>
        </div>


    </ContentTemplate>
</asp:UpdatePanel>
<asp:UpdateProgress ID="UpdateProgress2" runat="server">
    <ProgressTemplate>
        loading...
    </ProgressTemplate>
</asp:UpdateProgress>

