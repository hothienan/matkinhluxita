<%@ Control Language="VB" ClassName="video_type" %>

<script runat="server">


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        
       
        If Me.Request("type") = "" Then
            Me.AccessDataSource1.SelectCommand = "SELECT * FROM [news] where type between 41 and 43 order by id desc"
            Me.ListView3.DataBind()
        Else
                
            Me.AccessDataSource1.SelectCommand = "SELECT * FROM [news] where type =" & Me.Request("type") & "  order by id desc"
            Me.ListView3.DataBind()
            
        End If
       
    End Sub






</script>


<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
    DataFile="~/App_Data/data.mdb"  >
</asp:AccessDataSource>

<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>

              
 <asp:ListView ID="ListView3" runat="server" DataKeyNames="id" 
            DataSourceID="AccessDataSource1" >
           
           
                                       
            <EmptyDataTemplate>
                <span>Không có</span>
            </EmptyDataTemplate>
                     
              
            
            <ItemTemplate>

                
                             
              <div class="col-sm-3 vmk-video-item">
              	<a href="<%# "video.aspx?id=" & Eval("id") & "&type=" & Eval("type")%>"   > 
                      
                                  
                <img src='<%# Eval("image")%>'  class="img-responsive center-block "  alt="">
               
                  <h4 class="vmk-video-title">'<%# Eval("title") %>'</h4>
                   <span class="text-muted vmk-video-description"><i class="fa fa-heart "></i><b style="font-size:14px"> Quan tâm (<%# Eval("gia")%>)</b> &nbsp;&nbsp;(<%# Eval("date") %>)</span><br/>
            

                  </a>
              </div>


            </ItemTemplate>
            <LayoutTemplate>
                <div ID="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div class="clearfix"></div>
                <div class="paging">Trang 
                   <asp:DataPager ID="DataPager1" runat="server" PageSize="12" >
                        <Fields>

                            <asp:NumericPagerField />
                            
                        </Fields>
                    </asp:DataPager>
                </div>

                
      
            </LayoutTemplate>            
                      
            
        </asp:ListView>


   

    </ContentTemplate>
</asp:UpdatePanel>
<asp:UpdateProgress ID="UpdateProgress2" runat="server">
    <ProgressTemplate>
        loading...
    </ProgressTemplate>
</asp:UpdateProgress>

