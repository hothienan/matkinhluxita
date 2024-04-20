<%@ Control Language="VB" ClassName="famous_picture_new" %>

<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        If Me.Request("id") <> "" Then
            Me.AccessDataSource1.SelectCommand = "SELECT * FROM [product] WHERE [id] = " & Me.Request("id") & " ORDER BY [id] DESC"
        End If

    End Sub
     
     
    Public Function removeNonPicture(ByVal picture As Object) As String
    
        If IsDBNull(picture) Then
            Return "hide"
        Else
            Return "item"
        End If
    End Function
    
    
    





</script><asp:FormView id="FormView1" runat="server" DataSourceID="AccessDataSource1" DataKeyNames="id"  >
<ItemTemplate>


     
       <div id="carousel-example-generic1" class="carousel slide vmk-slideshow slideshow-famous" data-ride="carousel">
                <!-- Indicators -->
           

      <!-- Wrapper for slides -->
                <div class="carousel-inner " role="listbox">      
                
                 <div class="item active">
                     <img src='<%= ResolveUrl("/images/slides/famous-artist.jpg")%>' alt="" >     
                  </div>
                    <div class="<%# removeNonPicture(Eval("image4"))%>">
                     <img src='<%= ResolveUrl("/images/slides/")%><%# Eval("image4")%>' alt="" >     
                    
                  </div>
                    <div class="<%# removeNonPicture(Eval("image5"))%>">
                     <img src='<%= ResolveUrl("/images/slides/")%><%# Eval("image5")%>' alt="" >     
                    
                  </div>                
                 
                </div>
                         <a class="left carousel-control hide" href="#carousel-example-generic1" role="button" data-slide="prev">
                  <span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control hide" href="#carousel-example-generic1" role="button" data-slide="next">
                  <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
                </a>
              </div>
      
      

</ItemTemplate>

    <RowStyle VerticalAlign="Top" />
</asp:FormView> 


<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
    DataFile="~/App_Data/data.mdb"  >
</asp:AccessDataSource>
   
 

