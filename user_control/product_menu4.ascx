<%@ Control Language="VB" ClassName="product_menu4" %>
<%@ Register src="product_stars2.ascx" tagname="product_stars2" tagprefix="uc130" %>

<script runat="server">


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        If Not Page.IsPostBack Then
            Me.SqlDataSource1.SelectCommand = "SELECT id, typename FROM [stage_type] order by id"
           
            
            Me.DataList1.DataBind()
            
            CType(Me.DataList1.Items(0).FindControl("LinkButton3"), LinkButton).BackColor = Drawing.Color.Red
            CType(Me.DataList1.Items(0).FindControl("LinkButton3"), LinkButton).ForeColor = Drawing.Color.White
            			
            Me.SqlDataSource2.SelectCommand = "SELECT DISTINCT artist  FROM [artist_used] where [nation] Like '%TRONG NƯỚC%' order by artist"
            Me.lbl_brand.Visible = True
            Me.DataList2.DataBind()
            
        End If
        
        
    End Sub

   
    Protected Sub DataList1_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs)

                
        If e.CommandName = "show_sub_menu" Then
            Dim hidden_value As HiddenField
       		
            hidden_value = CType(e.Item.FindControl("HiddenField1"), HiddenField)
            
            
            Dim dlitem As DataListItem
            

            For Each dlitem In Me.DataList1.Items

                CType(dlitem.FindControl("LinkButton3"), LinkButton).BackColor = Drawing.Color.White
                CType(dlitem.FindControl("LinkButton3"), LinkButton).ForeColor = Drawing.Color.Black

            Next
           
            CType(e.Item.FindControl("LinkButton3"), LinkButton).BackColor = Drawing.Color.Red
            CType(e.Item.FindControl("LinkButton3"), LinkButton).ForeColor = Drawing.Color.White
			
						
            Me.SqlDataSource2.SelectCommand = "SELECT DISTINCT artist  FROM [artist_used] where [nation] Like '%" & hidden_value.Value & "%' order by artist"
        
            Me.DataList2.DataBind()
            Me.DataList2.Visible = True
            Me.lbl_brand.Visible = True
        End If

        
        
    End Sub

  





</script>    
  <div class="vmk-menu-hover" id="menu-show4">
 

          
      <div class="row">
                 
                        <h5>MẮT KÍNH VIỆT ĐIỂM ĐẾN UY TÍNH CHO KHÁCH HÀNG</h5>
                
                         <uc130:product_stars2 ID="product_stars1" runat="server" Visible="true" />   
                         <div class="clearfix"></div>
          </div>

    
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>

<div class="row">
                 
                 
    <h5>NGƯỜI NỔI TIẾNG MANG GÌ</h5>
        <div class="col-sm-3  ">
            <h5>CHỌN</h5>


            <ul>
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1"
                    RepeatColumns="1" ShowFooter="False" ShowHeader="False"
                    OnItemCommand="DataList1_ItemCommand" OnInit="Page_Load" >
                    <ItemTemplate>

                        <li>
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="show_sub_menu"><i class="icon-stop"></i> <%# Eval("typename")%> </asp:LinkButton>
                            <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("typename")%>' />
                        </li>

                    </ItemTemplate>
                </asp:DataList>


            </ul>

            <asp:AccessDataSource DataFile="~/App_Data/data.mdb" ID="SqlDataSource1" runat="server"></asp:AccessDataSource>


        </div>
      <div class="col-sm-6  brand">
          <h5><asp:Label ID="lbl_brand" runat="server" Text="NGHỆ SĨ" Visible=false></asp:Label></h5>
        <ul  >
<asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" 
    RepeatColumns="3" ShowFooter="False" ShowHeader="False">
    
    <ItemTemplate>

            <li>
                <a  href='<%# ResolveUrl("../product_artist.aspx?artist=" & Eval("artist").ToString.Replace(" ","-")) %>'><i class="icon-stop"></i> <%# Eval("artist")%></a>
                
            </li>                            
        
    </ItemTemplate>
</asp:DataList>
  </ul>

  
<asp:AccessDataSource DataFile="~/App_Data/data.mdb" ID="SqlDataSource2" runat="server"  >   
</asp:AccessDataSource>
         
       
      </div>
   
    </div>

    

    </ContentTemplate>
</asp:UpdatePanel>
<asp:UpdateProgress ID="UpdateProgress2" runat="server">
    <ProgressTemplate>
        loading...
    </ProgressTemplate>
</asp:UpdateProgress>

       <div class="btn-close-menu"><i class="fa fa-close fa-lg"></i></div>
  </div>