<%@ Control Language="VB" ClassName="branding" %>

<script runat="server">

    Dim _page As Integer = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)

        
               
        If Me.Request("type") = "" Then
            Me.AccessDataSource1.SelectCommand = "SELECT * FROM [sub_product_type] where id <> 226 and link_brand <> '' order by id desc"
            Me.ListView3.DataBind()
            Me.AccessDataSource2.SelectCommand = "SELECT top 1 * FROM [sub_product_type]  where id <> 226  and link_brand <> '' order by id desc"
            Me.FormView1.DataBind()
      
        Else
                
            Me.AccessDataSource1.SelectCommand = "SELECT * FROM [sub_product_type] where  id <> 226  and link_brand <> '' and target_user = '" & Me.Request("type") & "'  order by id desc"
            Me.ListView3.DataBind()
            Me.AccessDataSource2.SelectCommand = "SELECT top 1 * FROM [sub_product_type]  where  id <> 226  and link_brand <> '' and target_user = '" & Me.Request("type") & "'  order by id desc"
            Me.FormView1.DataBind()
            
          
        End If
        
        If Me.Request("brand") <> "" Then
            '    Me.AccessDataSource2.SelectCommand = "SELECT top 1 * FROM [sub_product_type] order by id desc"
            '    Me.FormView1.DataBind()
            'Else
            
            Me.AccessDataSource2.SelectCommand = "SELECT * FROM [sub_product_type] where id = " & Me.Request("brand")
            Me.FormView1.DataBind()
            
        End If
        
        
                            
        If Me.Request("pg") <> 0 And Me.Request("pg") <> "" Then
                
            Dim index As Integer = Me.Request("pg")
            
            index = (index - 1) * CType(Me.ListView3.FindControl("DataPager1"), DataPager).PageSize
        
            CType(Me.ListView3.FindControl("DataPager1"), DataPager).SetPageProperties(index, CType(Me.ListView3.FindControl("DataPager1"), DataPager).MaximumRows, True)
            
        End If
       
            
        
    End Sub

    
    Protected Sub ListView3_PagePropertiesChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.PagePropertiesChangingEventArgs)
       
    
        
        Dim CurrentPage As Integer = (e.StartRowIndex / e.MaximumRows) + 1
               
        _page = CurrentPage
           
       
        
    End Sub
    
    Public Function hiddenButton(ByVal _link As Object) As String
    
        If IsDBNull(_link) Then
            Return "style='display:none'"
        Else
            Return ""
        End If
    End Function
   





</script>     
   <div class="row">
          <div class="col-sm-6">
               

 <ul class="vmk-logo-brands">
               
 <asp:ListView ID="ListView3" runat="server" DataKeyNames="id" 
            DataSourceID="AccessDataSource1"  onpagepropertieschanging="ListView3_PagePropertiesChanging">
           
           
                                       
            <EmptyDataTemplate>
                <span>Không có</span>
            </EmptyDataTemplate>
                     
              
            
            <ItemTemplate>

                <li >
                    
                   <a href="branding.aspx?type=<%# Me.Request("type")%>&brand=<%# Eval("id")%>&pg=<%= Me._page%>" >

                    
                        <img src="images/slides/<%# Eval("logo_brand") %>" alt="">


                     </a>
                &nbsp;</li>

            </ItemTemplate>

                 <LayoutTemplate>

           

                <div ID="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                 <div class="clearfix"></div><br/>
                <div class="paging">Trang 
                   <asp:DataPager ID="DataPager1" runat="server" PageSize="16">
                        <Fields>

                            <asp:NumericPagerField />
                            
                        </Fields>
                    </asp:DataPager>


                </div>

                
      
            </LayoutTemplate>            
                      
            
        </asp:ListView>


  </ul>

              </div>

       <div class="col-sm-6">


           
<asp:FormView id="FormView1" runat="server" DataSourceID="AccessDataSource2" DataKeyNames="id"  >
<ItemTemplate>

    <h4><%# Eval("typename")%></h4>

             <div id="carousel-example-generic" class="carousel slide slide-brand" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src='<%= ResolveUrl("../images/slides/")%><%# Eval("image_sheet")%>' alt="" >  
      <div class="carousel-caption">
        
      </div>
    </div>
    <div class="item">
      <img src='<%= ResolveUrl("../images/slides/")%><%# Eval("sub_banner1")%>' alt="" >  
      <div class="carousel-caption">
         
      </div>
    </div>
      <div class="item">
      <img src='<%= ResolveUrl("../images/slides/")%><%# Eval("sub_banner2")%>' alt="" >  
      <div class="carousel-caption">
         
      </div>
    </div>
   
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

          <hr>

          <div><%# Eval("content")%></div>
    <hr>
            <a href="<%# Eval("link_brand")%>" type="button" class="btn btn-default" target="_blank" <%# hiddenButton(Eval("link_brand"))%> >Mắt Kính</a>
            <a href="<%# Eval("link_brand2")%>" type="button" class="btn btn-default" target="_blank" <%# hiddenButton(Eval("link_brand2"))%>>Gọng Kính</a>
  
    </ItemTemplate>
    <RowStyle VerticalAlign="Top" />
</asp:FormView> 

      
       </div>

</div>

<asp:AccessDataSource DataFile="~/App_Data/data.mdb" ID="AccessDataSource1" runat="server"  >   
</asp:AccessDataSource>

<asp:AccessDataSource DataFile="~/App_Data/data.mdb" ID="AccessDataSource2" runat="server"  >   
</asp:AccessDataSource>
         

