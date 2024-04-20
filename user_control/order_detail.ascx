<%@ Control Language="VB" ClassName="order_detail" %>
<%@ Register src="emailControl.ascx" tagname="emailControl" tagprefix="uc1" %>

<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        If Me.Request("id") <> "" Then
            Me.AccessDataSource1.SelectCommand = "SELECT * FROM [product] WHERE [id] = " & Me.Request("id") & " ORDER BY [id] DESC"
        End If

    End Sub

    Public Function formatPrice(ByVal price As String) As String
        If price = "00" Or price = "0.0" Or price = "0" Then
            Return "<div class='price-call'>Call để có giá tốt</div>"
        Else
            Return price & " <small>VND</small>"
        End If
    End Function
    
    
    Public Function formatPriceMall(ByVal pricemall As String) As String
        If pricemall = "00" Or pricemall = "0.0" Or pricemall = "0" Then
            Return "<div class='price-call'>Call để có giá tốt</div>"
        Else
            Return pricemall & " <small>VND</small>"
        End If
    End Function
    
    
    Public Function formatPriceVIP(ByVal price As Object) As String
        If IsDBNull(price) Or price.ToString = "" Or price.ToString = " " Or price.ToString = "0" Or price.ToString = "00" Or price.ToString = "0.0" Then
            Return ""
        Else
            Return price & " <small>VND</small> <img src='/images/graphics/vipcard.png' class='vipcard hide' />"
        End If
    End Function
    
    Public Function hiddenPrice(ByVal price As Object) As String
        If IsDBNull(price) Or price.ToString = "" Or price.ToString = " " Or price.ToString = "0" Or price.ToString = "00" Or price.ToString = "0.0" Or price.ToString = "-01" Then
            Return "style='display:none'"
        Else
            Return ""
        End If
    End Function
    
    





</script>
<div class="order-functions">
<asp:FormView id="FormView1" runat="server" DataSourceID="AccessDataSource1" DataKeyNames="id"  >
<ItemTemplate>
    
     
            
                        <div class="vmk-order-price">
                    	  <h4>Mã Số: <%# Eval("productname") %> <%# eval("color") %></h4>  
                          <span class="text-muted market-price"><span>Giá thị trường:</span> <%# formatPriceMall(Eval("pricemall"))%></span><br/>
                          <span class="text-muted our-price"><span>Giá bán lẻ:</span> <%# formatPrice(Eval("price"))%></span><br/>
                          <span class="text-muted vip-price " <%# hiddenPrice(Eval("pricevip"))%>><span>Giá mắt kính Việt VIP:</span> <%# formatPriceVIP(Eval("pricevip"))  %></span>
                            <hr> 
                   		<div type="button" class="vmk-btn-order" data-toggle="modal" data-target="#myModal" >THANH TOÁN <i class="fa fa-lg fa-plus"></i></div>
						
                    	</div>

      
</ItemTemplate>

    <RowStyle VerticalAlign="Top" />
</asp:FormView> 

    </div>

<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
    DataFile="~/App_Data/data.mdb"  >
</asp:AccessDataSource>
   
 

     
 

	 
<uc1:emailControl ID="emailControl1" runat="server" />
   
    
	
	

