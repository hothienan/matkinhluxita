<%@ Control Language="VB" ClassName="video_content" %>
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

    Protected Sub FormView1_DataBound(sender As Object, e As EventArgs)
        
        If Me.FormView1.DataItemCount > 0 Then
            Me.Session("video_id") = CType(Me.FormView1.FindControl("videoId"), HiddenField).Value
            AccessDataSource2.SelectCommand = "SELECT * FROM [comment] where [type] =" & Me.Session("video_id") & " order by id desc"
        
        End If
              
        
    End Sub
    
    Protected Sub btn_comment_Click1(ByVal sender As Object, ByVal e As System.EventArgs)
       
        Dim url As String = HttpContext.Current.Request.RawUrl
        
        
        AccessDataSource2.InsertCommand = "INSERT INTO [comment]([user],[type], [image],[date],[short_text],[link]) VALUES ('" & Me.username_facebook.Text & "'," & Me.Session("video_id") & ",'" & Me.avatar_facebook.Text & "','" & Now & "','" & Me.content_comment.Text & "','" & url & "') "
        AccessDataSource2.Insert()
                        
        AccessDataSource2.SelectCommand = "SELECT * FROM [comment] where  [type]= " & Me.Session("video_id") & " order by id desc"
            
  
        Me.list_comment.DataBind()
        
        
        Dim gmail As Email = New Email()
 
        Dim bodyMail As String = ""
             
                
        bodyMail = "Khách hàng: " & Me.username_facebook.Text & "<br>" _
                 & "Bình luận: " & Me.content_comment.Text & " (" & Now & ")<br>" _
                 & "Link tin tức: <a href='http://vietmatkinh.com" & url & "' target='_blank' >link</a><br>"
                
        If gmail.SendMail("matkinhviet.vn@gmail.com", bodyMail, "Bình luận gởi tới Mắt kính Việt") = True Then
            Me.content_comment.Text = ""
        End If
            
       
    End Sub
    





</script><asp:FormView id="FormView1" runat="server" DataSourceID="AccessDataSource1" DataKeyNames="id" OnDataBound="FormView1_DataBound" >
<ItemTemplate>
<div data-type="vimeo" data-video-id="<%# Eval("short_text")%>" class="js-player" ></div>  
<br/>
<asp:Label ID="Label1" runat="server"  Text='<%# Eval("title")%>' CssClass="video-title-detail"></asp:Label>
<span class="text-muted vmk-news-description"><i class="fa fa-heart fa-lg"></i><b style="font-size:14px"> Quan tâm (<%# Eval("gia")%>)</b> &nbsp;&nbsp;(<%# Eval("date") %>)</span><br/><br/>
<asp:Label ID="Label2" runat="server"  Text='<%# eval("content") %>'></asp:Label>
  
<asp:HiddenField runat="server" ID="videoId" Value='<%# Eval("id")%>' />

</ItemTemplate>
    <RowStyle VerticalAlign="Top" />
</asp:FormView> 


<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
    DataFile="~/App_Data/data.mdb"  >
</asp:AccessDataSource>
   
 
<div class="clearfix"></div>

<div class="vmk-comment-list">

    <h3><i class="fa fa-comments fa-lg" ></i>&nbsp;&nbsp; Bình Luận</h3>

      <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                                        

                        <asp:ListView ID="list_comment" DataSourceID="AccessDataSource2" runat="server" DataKeyNames="id"   >
           
                                       
            <EmptyDataTemplate>
                
            </EmptyDataTemplate>
              
            
            <ItemTemplate>
                      
    

                 <li class="media">
                    <div class="media-left">
                      <a href="#">
                        <img src='<%# "//graph.facebook.com/" & Eval("image") & "/picture"%>'  alt="avatar" class="media-object">
                      </a>
                    &nbsp;&nbsp;&nbsp;</div>
                    <div class="media-body">
                      <h4 class="media-heading"><%# Eval("user")%> <span>(<%# Eval("date")%>)</span></h4>
                      <%# Eval("short_text")%>
                    </div>
                </li>

                    
                        
          </ItemTemplate>
            <LayoutTemplate>

          <ul class="media-list">

                <div ID="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                 <div class="clearfix"></div>
                <div class="paging">Trang
                   <asp:DataPager ID="DataPager1" runat="server" PageSize="10">
                        <Fields>

                            <asp:NumericPagerField />
                            
                        </Fields>
                    </asp:DataPager>


                </div>

                 </ul>
      
            </LayoutTemplate>            
                      
            
        </asp:ListView>

                           <asp:Panel ID="Panel_comment" runat="server">

                     
                          
               
 <div class="form-inline " id="vmk-comment-form">
  <div class="form-group">
                            
       <asp:TextBox ID="content_comment" runat="server" class="form-control" placeholder="Nhập nội dung..." ></asp:TextBox>
  </div>

  <asp:Button ID="btn_comment" runat="server"  class="btn btn-info "   onclick="btn_comment_Click1" CausesValidation="true"  Text="Submit" Visible="true"    />

 
     <asp:TextBox ID="username_facebook"  runat="server"  CssClass="username_facebook hidden" ></asp:TextBox>
      <asp:TextBox  ID="avatar_facebook"  runat="server" CssClass="avatar_facebook hidden" ></asp:TextBox>

</div>



                        </asp:Panel>
                          
                                    
                     <asp:AccessDataSource DataFile="~/App_Data/data.mdb" ID="AccessDataSource2" 
                        runat="server" >   
                    </asp:AccessDataSource>
                    
                        
                </ContentTemplate>
            </asp:UpdatePanel>
             <asp:UpdateProgress ID="UpdateProgress2" runat="server">
                <ProgressTemplate>
                    loading...</ProgressTemplate></asp:UpdateProgress>
        
  </div>  
   


 