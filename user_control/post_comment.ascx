<%@ Control Language="VB" ClassName="post_comment"   %>
<%@ Import Namespace="Email" %>

<script runat="server">


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
      
        AccessDataSource2.SelectCommand = "SELECT [user],[type], [image],[date],[short_text], [link],[email], [id] FROM [comment] where [type]=" & Me.Request("id") & " ORDER BY  reply, id"
    End Sub
        

    Protected Sub btn_comment_Click1(ByVal sender As Object, ByVal e As System.EventArgs)
       
        
        Dim url As String = HttpContext.Current.Request.RawUrl
    
        AccessDataSource2.InsertCommand = "INSERT INTO [comment]([user],[type], [image],[date],[short_text], [link],[email]) VALUES ('" & Me.username_facebook.text & "'," & Me.Request("id") & ",'" & Me.avatar_facebook.Text & "','" & Now & "','" & Me.content_comment.Text & "','" & url & "','" & Me.user_email.Text  & "') "
        AccessDataSource2.Insert()
                        
        AccessDataSource2.SelectCommand = "SELECT [user],[type], [image],[date],[short_text], [link],[email], [id] FROM [comment] where [type]=" & Me.Request("id") & " ORDER BY  reply, id"
            
      
            
        Me.list_comment.DataBind()
        
   
        Dim gmail As Email = New Email()
 
        Dim bodyMail As String = ""
             
                
        bodyMail = "Khách hàng: " & Me.username_facebook.Text & "<br>" _
                 & "Bình luận: " & Me.content_comment.Text & " (" & Now & ")<br>" _
                 & "Link sản phẩm: <a href='http://vietmatkinh.com" & url & "' target='_blank' >link</a><br>"
                
        If gmail.SendMail("matkinhviet.vn@gmail.com", bodyMail, "Bình luận gởi tới Mắt kính Việt") = True Then
            Me.content_comment.Text = ""
        End If
      
            
       
    End Sub
    
    
        
    Public Function formatAvatar(ByVal photo As String) As String
        
        If photo = "" Then
            Return "/images/graphics/no-avatar.jpg"
        End If
        
        If IsNumeric(photo) Then
            Return "//graph.facebook.com/" & photo & "/picture"
            
        Else
            
            Return photo
       
        End If
    End Function

    Public Function formatAdmin(ByVal photo As String) As String
        If IsNumeric(photo) Then
            Return ""
            
        Else
            Return "margin-left: 20px;"
       
        End If
    End Function
    
    





</script>
<div class="clearfix"></div>

<div class="vmk-comment-list">

    <h3><i class="fa fa-comments fa-lg" ></i>&nbsp;&nbsp; Bình Luận</h3>

      <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                                        

                        <asp:ListView ID="list_comment" DataSourceID="AccessDataSource2" runat="server" DataKeyNames="id"   >
           
                                       
            <EmptyDataTemplate>
                
            </EmptyDataTemplate>
              
            
            <ItemTemplate>
                      
    

                 <li class="media" style='<%# formatAdmin(Eval("image"))%>'>
                    <div class="media-left">
                      <a href="#">
                        <img src='<%# formatAvatar(Eval("image"))%>'  alt="avatar" class="media-object">
                      </a>
                    </div>
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
                   <asp:DataPager ID="DataPager1" runat="server" PageSize="2">
                        <Fields>

                            <asp:NumericPagerField />
                            
                        </Fields>
                    </asp:DataPager>


                </div>

                 </ul>
      
            </LayoutTemplate>            
                      
            
        </asp:ListView>

                           <asp:Panel ID="Panel_comment" runat="server">

                     
            <div id="fbConnectComment" class="fb-btn "><i class="fa fa-facebook fa-lg" ></i>&nbsp;&nbsp;Đăng nhập</div>              
               
 <div class="form-inline " id="vmk-comment-form">
  <div class="form-group">
                            
       <asp:TextBox ID="content_comment" runat="server" class="form-control" placeholder="Nhập nội dung..." ></asp:TextBox>
  </div>

  <asp:Button ID="btn_comment" runat="server"  class="btn btn-info "   onclick="btn_comment_Click1" CausesValidation="true"  Text="Submit" Visible="true"    />

 
     <asp:TextBox ID="username_facebook"  runat="server"  CssClass="username_facebook hidden" ></asp:TextBox>
     <asp:TextBox  ID="avatar_facebook"  runat="server" CssClass="avatar_facebook hidden" ></asp:TextBox>
     <asp:TextBox  ID="user_email"  runat="server" CssClass="user_email hidden" ></asp:TextBox>
     
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
   