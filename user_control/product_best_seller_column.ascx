<%@ Control Language="VB" ClassName="product_best_seller_column" %>


<script runat="server">


    Dim _page As Integer = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)

        Me.AccessDataSource1.SelectCommand = "SELECT TOP 4 * FROM [product] WHERE bestselling = true ORDER BY [id] DESC"


    End Sub



    Public Function formatPrice(ByVal price As String) As String
        If price = "00" Or price = "0.0" Or price = "0" Then
            Return "Call để có giá tốt"
        Else
            Return price & " <small>VND</small>"
        End If
    End Function


    Public Function formatPriceVIP(ByVal price As Object) As String
        If IsDBNull(price) or price.ToString = "" or price.ToString = " " or price.ToString = "0" or price.ToString = "00" or price.ToString = "0.0" Then
            Return ""
        Else
            Return price & " <small>VND</small> <img src='/images/graphics/vipcard.png' class='vipcard' />"
        End If
    End Function


    Public Function hiddenPrice(ByVal price As Object) As String
        If IsDBNull(price) Or price.ToString = "" Or price.ToString = " " Or price.ToString = "0" Or price.ToString = "00" Or price.ToString = "0.0" Then
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



    Public Function removeNonPicture1(ByVal picture As Object) As String

        If picture = False Then

            Return ""

        Else
            Return "<div class='flag-new'></div>"
        End If


    End Function

    Public Function removeNonPicture2(ByVal picture As Object) As String

        If picture = False Then

            Return ""

        Else
            Return "<div class='flag-polar'></div>"
        End If


    End Function






</script>

<asp:AccessDataSource ID="AccessDataSource1" runat="server"
    DataFile="~/App_Data/data.mdb"></asp:AccessDataSource>

<asp:ListView ID="ListView3" runat="server" DataKeyNames="id"
    DataSourceID="AccessDataSource1">


    <EmptyDataTemplate>
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




