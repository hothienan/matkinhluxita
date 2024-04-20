<%@ Control Language="VB" ClassName="product_similar" %>



<script runat="server">

    Dim _page As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)

        If Me.Request("id") <> "" Then

            If Me.Request("st") <> "" Then
                Me.AccessDataSource1.SelectCommand = "SELECT * FROM [product] where [style] = " & Me.Request("st") & "  and [id] <> " & Me.Request("id") & "  and [type] <> " & Me.Request("type") & "  and pricerange = " & Me.Request("pr") & " ORDER BY id "
                Me.ListView3.DataBind()
            Else
                Me.AccessDataSource1.SelectCommand = "SELECT * FROM [product] where  [id] <> " & Me.Request("id") & "  and [type] <> " & Me.Request("type") & "  and pricerange = " & Me.Request("pr") & " ORDER BY id "
                Me.ListView3.DataBind()
            End If


        End If

    End Sub

    Public Function formatPrice(ByVal price As String) As String
        If price = "00" Or price = "0.0" Or price = "0" Then
            Return "Call để có giá tốt"
        Else
            Return price & " <small>VND</small>"
        End If
    End Function


    Public Function formatPriceVIP(ByVal price As Object) As String
        If IsDBNull(price) Or price.ToString = "" Or price.ToString = " " Or price.ToString = "0" Or price.ToString = "00" Or price.ToString = "0.0" Then
            Return ""
        ElseIf price.ToString = "-01" Then
            Return "Call để có giá tốt"
        Else
            Return price & " <small>VND</small> <img src='/images/graphics/vipcard.png' class='vipcard' />"
        End If
    End Function


    Public Function hiddenPrice(ByVal price As Object) As String
        If IsDBNull(price) Or price.ToString = "" Or price.ToString = " " Or price.ToString = "0" Or price.ToString = "00" Or price.ToString = "0.0" Then
            Return ""
        ElseIf price.ToString = "-01" Then
            Return ""
        Else
            Return "style='display:none'"
        End If
    End Function

    Public Function hiddenDiscount(ByVal price As Object) As String
        If price.ToString > 38 And price.ToString < 100 Then
            Return ""
        Else
            Return "style='display:none'"
        End If
    End Function


    Public Function formatURL(ByVal url As Object) As String
        If IsDBNull(url) Then
            Return 0
        Else
            Return url
        End If
    End Function








</script>


<asp:AccessDataSource ID="AccessDataSource1" runat="server"
    DataFile="~/App_Data/data.mdb"></asp:AccessDataSource>

<asp:ListView ID="ListView3" runat="server" DataKeyNames="id"
    DataSourceID="AccessDataSource1">

    <EmptyDataTemplate>
        <span>Không có</span>
    </EmptyDataTemplate>


    <ItemTemplate>


        <div class="item">
            <div class="product-inner">
                <div class="product-imgage">
                    <a href="<%# ResolveUrl("../product_detail/" & formatURL(Eval("id")) & "/" & formatURL(Eval("type")) & "/" & formatURL(Server.UrlEncode(Eval("price"))) & "/" & formatURL(Eval("pricerange")) & "/" & formatURL(Eval("productname")) & "/" & formatURL(Eval("color").ToString.Replace("/", "-")) & "/" & formatURL(Eval("style")) & "/" & formatURL(Server.UrlEncode(Eval("brand")).ToString.Replace("+", "-")) & "/" & formatURL(_page) & "/luxita/luxita.aspx")%>">
                        <img src="<%# "/images/products/" & Eval("image")%>" alt="rayban-rx5154-eyeglasses-5649-51-angle"></a>
                </div>
                <div class="product-content">
                    <div class="product-title">
                        <a href="<%# ResolveUrl("../product_detail/" & formatURL(Eval("id")) & "/" & formatURL(Eval("type")) & "/" & formatURL(Server.UrlEncode(Eval("price"))) & "/" & formatURL(Eval("pricerange")) & "/" & formatURL(Eval("productname")) & "/" & formatURL(Eval("color").ToString.Replace("/", "-")) & "/" & formatURL(Eval("style")) & "/" & formatURL(Server.UrlEncode(Eval("brand")).ToString.Replace("+", "-")) & "/" & formatURL(_page) & "/luxita/luxita.aspx")%>"><%# Eval("productname") %> <%# eval("color") %></a>
                        <div class="sku"><%# Eval("brand") %></div>
                    </div>
                    <div class="product-price"><span class="del"><%# formatPrice(Eval("pricemall"))  %></span> <strong class="price"><%# formatPrice(Eval("price"))  %></strong></div>
                    <div class="product-color" <%# hiddenDiscount(Eval("discount"))%>>-<%# Eval("discount")%>%</div>
                </div>

            </div>
        </div>






    </ItemTemplate>




</asp:ListView>



