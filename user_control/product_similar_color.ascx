<%@ Control Language="VB" ClassName="product_similar_color" %>



<script runat="server">

    Dim _page As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)

        If Me.Request("id") <> "" Then

            Me.AccessDataSource1.SelectCommand = "SELECT  * FROM [product] where productname = '" & Me.Request("pn") & "' AND color <> '" & Me.Request("cl").Replace("-", "/") & "' ORDER BY id desc"
            Me.ListView3.DataBind()

            'Me.lbl_count.text = Me.ListView3.Items.Count.ToString()

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
            Return niceBranding(url)
        End If
    End Function

    Public Function niceBranding(ByVal _value As String) As String

        Return _value.ToString.Replace("Phụ Kiện", "Phu Kien").Replace(" ", "-").Replace("&", "7").Replace("(", "").Replace(")", "")


    End Function






</script>


<asp:AccessDataSource ID="AccessDataSource1" runat="server"
    DataFile="~/App_Data/data.mdb"></asp:AccessDataSource>


<div class="title">
    <h4>SẢN PHẨM KHÁC MÀU:</h4>
</div>

<ul class="image-color">
    <asp:ListView ID="ListView3" runat="server" DataKeyNames="id"
        DataSourceID="AccessDataSource1">

        <EmptyDataTemplate>
            <span>Không có</span>
        </EmptyDataTemplate>


        <ItemTemplate>


            <li>

                <a href="<%# ResolveUrl("../product_detail/" & formatURL(Eval("id")) & "/" & formatURL(Eval("type")) & "/" & formatURL(Server.UrlEncode(Eval("price"))) & "/" & formatURL(Eval("pricerange")) & "/" & formatURL(Eval("productname")) & "/" & formatURL(Eval("color").ToString.Replace("/", "-")) & "/" & formatURL(Eval("style")) & "/" & formatURL(Eval("brand").Replace("+", "-")) & "/" & formatURL(_page) & "/luxita/luxita.aspx")%>">
                    <img src="<%# "/images/products/" & Eval("image")%>" alt=""></a>

            </li>

        </ItemTemplate>




    </asp:ListView>

</ul>





