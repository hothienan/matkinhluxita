<%@ Control Language="VB" ClassName="famous_picture" %>

<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        If Me.Request("id") <> "" Then
            Me.AccessDataSource1.SelectCommand = "SELECT * FROM [product] WHERE [id] = " & Me.Request("id") & " ORDER BY [id] DESC"
        End If

    End Sub
     
     
    Public Function removeNonPicture(ByVal picture As Object) As String
    
        If IsDBNull(picture) Then
            Return "style='display:none'"
        Else
            Return ""
        End If
    End Function
    
    
    





</script><asp:FormView id="FormView1" runat="server" DataSourceID="AccessDataSource1" DataKeyNames="id"  >
<ItemTemplate>
    
     
     <div id="myCarouse2" class="carousel slide">
                <div class="carousel-inner">        
                
                    <div class="item active">
                    <img src="images/slides/famous-artist.jpg" alt="" >
                     <img src='<%= ResolveUrl("/images/slides/famous-artist.jpg")%>' alt="" >     
                  </div>
                    <div class="item active"  <%# removeNonPicture(Eval("image4"))%>>
                     <img src='<%= ResolveUrl("/images/slides/")%><%# Eval("image4")%>' alt="" >     
                    
                  </div>
                    <div class="item active"  <%# removeNonPicture(Eval("image5"))%>>
                     <img src='<%= ResolveUrl("/images/slides/")%><%# Eval("image5")%>' alt="" >     
                    
                  </div>
                                
                 
                </div>
                <a class="left carousel-control" href="#myCarouse2" data-slide="prev">‹</a>
                <a class="right carousel-control" href="#myCarouse2" data-slide="next">›</a>
              </div>
      
      

</ItemTemplate>

    <RowStyle VerticalAlign="Top" />
</asp:FormView> 


<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
    DataFile="~/App_Data/data.mdb"  >
</asp:AccessDataSource>
   
 
