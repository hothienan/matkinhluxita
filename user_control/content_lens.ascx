<%@ Control Language="VB" ClassName="content_lens" %>

<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        If Me.Request("id") <> "" Then
            Me.AccessDataSource1.SelectCommand = "SELECT * FROM [news] WHERE [id] = " & Me.Request("id") & " ORDER BY [id] DESC"
        End If
            
        Page.Title = CType(Me.FormView1.FindControl("lbl_title"), Label).Text
        

    End Sub

    
    Public Function hiddenMadein(ByVal madein As Object) As String
    
        If IsDBNull(madein) Then
            Return "style='display:none'"
        Else
            Return ""
        End If
    End Function
    





</script><asp:FormView id="FormView1" runat="server" DataSourceID="AccessDataSource1" DataKeyNames="id"  >
<ItemTemplate>
        

  
                        <h5 class="hide"><asp:Label ID="lbl_title" runat="server"  CssClass="news-title"
                                         Text='<%# Eval("title") %>'></asp:Label>
                        <span style="font-weight:normal"><asp:Label ID="Label7" runat="server" Text='<%# "(" & Eval("date") &")" %>'  ></asp:Label></span>                 
                        </h5>
                  
  
       <div class="row">

          <div class="col-sm-4">
               <table class="table " >
                   
                 <tr <%# hiddenMadein(Eval("xuatxu"))%>>          
                  <td><span class="title-left">Xuất xứ: </span><span class="title-right"><asp:Label ID="Label4" runat="server"   Text='<%# Eval("xuatxu")%>'></asp:Label></span></td>
                   </tr>

                     <tr <%# hiddenMadein(Eval("gia"))%>>       
                  <td><span class="title-left">Giá: </span><span class="title-right"><asp:Label ID="Label10" runat="server"   Text='<%# eval("gia") %>'></asp:Label></span></td>
                   </tr>

                </tr>              
                <tr <%# hiddenMadein(Eval("lopphu"))%>>
                  <td><span class="title-left">Lớp phủ: </span><span class="title-right"><asp:Label ID="Label6" runat="server"   Text='<%# Eval("lopphu")%>'></asp:Label></span></td>
                   </tr>

  
               
             
            </table>
             </div>

         <div class="col-sm-4">
        <table class="table " >
              
                         <tr <%# hiddenMadein(Eval("docau"))%>>
                  <td><span class="title-left">Độ cầu: </span><span class="title-right"><asp:Label ID="Label9" runat="server"    Text='<%# Eval("docau")%>'></asp:Label></span></td>
                   </tr>

                 <tr <%# hiddenMadein(Eval("doloan"))%>>
                  <td><span class="title-left">Độ loạn: </span><span class="title-right"><asp:Label ID="lbl_brand" runat="server"   Text='<%# Eval("doloan")%>'></asp:Label></span></td>
                  </tr>
                <tr <%# hiddenMadein(Eval("chietsuat"))%>>
                  <td><span class="title-left">Chiết suất: </span><span class="title-right"><asp:Label ID="Label2" runat="server" Text='<%# Eval("chietsuat")%>'  ></asp:Label></span></td>
                  </tr>
               
               
             
            </table>
            </div>


            <div class="col-sm-4">
               <table class="table " >
                   
                   
    
                    <tr <%# hiddenMadein(Eval("loai"))%>>
                  <td><span class="title-left">Loại: </span><span class="title-right"><asp:Label ID="Label3" runat="server"   Text='<%# Eval("loai")%>'></asp:Label></span></td>
                   </tr>
             
            </table>
             </div>
             
       </div>   <!-- / row -->  
    

        

                      <asp:Label ID="Label1" runat="server" class="news-content-detail"  Text='<%# eval("content") %>'></asp:Label>
        <br/>
        <div style="">
       <iframe src='<%# "//www.facebook.com/plugins/like.php?href=http://vietmatkinh.com/content_news.aspx?id=" & Eval("id") & "&type=" & Eval("type") & "&amp;send=true&amp;layout=button_count&amp;width=150&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font&amp;height=21"%>' scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:150px; height:21px;" allowTransparency="true"></iframe>
       </div>


</ItemTemplate>
    <RowStyle VerticalAlign="Top" />
</asp:FormView> 


<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
    DataFile="~/App_Data/data.mdb"  SelectCommand="SELECT * FROM [counter]">
</asp:AccessDataSource>
   
 


 