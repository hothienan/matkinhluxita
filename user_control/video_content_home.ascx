<%@ Control Language="VB" ClassName="video_content_home" %>
<%@ Import Namespace="Email" %>


<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
       
        
        If Me.Request("id") = "" And Me.Request("type") = "" Then
            Me.AccessDataSource1.SelectCommand = "SELECT * FROM [news] where type between 41 and 43 order by id desc"
            
        ElseIf Me.Request("id") <> "" And Me.Request("type") <> "" Then
                        
            Me.AccessDataSource1.SelectCommand = "SELECT * FROM [news] where [id] =" & Me.Request("id") & " and [type] =" & Me.Request("type") & " order by id desc"
            
        ElseIf Me.Request("id") = "" And Me.Request("type") <> "" Then
            
            Me.AccessDataSource1.SelectCommand = "SELECT * FROM [news] where  [type] =" & Me.Request("type") & " order by id desc"
        End If
        
    
    End Sub


    
 
    





</script>

<div class="row table-video">





    <asp:FormView ID="FormView1" runat="server" DataSourceID="AccessDataSource1" DataKeyNames="id">
        <ItemTemplate>

            <div class="col-sm-8">


                <div data-type="vimeo" data-video-id="<%# Eval("short_text")%>" class="js-player"></div>

            </div>
            <div class="col-sm-4 video-content-scroll">

                <asp:Label ID="Label1" runat="server" Text='<%# Eval("title")%>' CssClass="video-title-detail"></asp:Label>
                <span class="text-muted vmk-news-description"><i class="fa fa-heart fa-lg"></i><b style="font-size: 14px"> Quan tâm (<%# Eval("gia")%>)</b> &nbsp;&nbsp;(<%# Eval("date") %>)</span><br />
                <br />
                <asp:Label ID="Label2" runat="server" Visible="false" Text='<%# eval("content") %>'></asp:Label>

                <asp:HiddenField runat="server" ID="videoId" Value='<%# Eval("id")%>' />
                <a href="video.aspx" class="btn btn-default ">Xem chi tiết <i class="fa fa-chevron-right "></i></a>
            </div>

        </ItemTemplate>
        <RowStyle VerticalAlign="Top" />
    </asp:FormView>


    <asp:AccessDataSource ID="AccessDataSource1" runat="server"
        DataFile="~/App_Data/data.mdb"></asp:AccessDataSource>

</div>
