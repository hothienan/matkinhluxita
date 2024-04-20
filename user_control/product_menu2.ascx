<%@ Control Language="VB" ClassName="product_menu2" %>

<script runat="server">



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)

        If Not Page.IsPostBack Then



        End If

    End Sub








</script>


<div class="submenu">
    <div class="column-menu">
        <div class="col-3">
            <h3>Giới tính</h3>
            <ul>
                <li><a href='<%= ResolveUrl("../product/luxita/sunglasses/men/luxita/luxita/luxita.aspx")%>' title="">Nam</a></li>
                <li><a href='<%= ResolveUrl("../product/luxita/sunglasses/women/luxita/luxita/luxita.aspx")%>' title="">Nữ</a></li>
                <li><a href='<%= ResolveUrl("../product/luxita/sunglasses/other/luxita/luxita/luxita.aspx")%>' title="">Cả hai</a></li>
            </ul>
            <h3>Giá</h3>
            <ul>
                <li><a href='<%= ResolveUrl("../product/luxita/sunglasses/other/41/luxita/luxita.aspx")%>' title="">Trên 5 triệu</a></li>
                <li><a href='<%= ResolveUrl("../product/luxita/sunglasses/other/42/luxita/luxita.aspx")%>' title="">Từ 5 triệu - 2 triệu</a></li>
                <li><a href='<%= ResolveUrl("../product/luxita/sunglasses/other/43/luxita/luxita.aspx")%>' title="">Từ 2 triệu - 1 triệu</a></li>
                <li><a href='<%= ResolveUrl("../product/luxita/sunglasses/other/44/luxita/luxita.aspx")%>' title="">Dưới 1 triệu</a></li>
            </ul>
        </div>
        <div class="col-3 share_block">
            <h3>Kiểu dáng</h3>
            <ul>
                <li><a href='<%= ResolveUrl("../product/luxita/sunglasses/other/luxita/luxita/1.aspx")%>'>
                    <img src='<%= ResolveUrl("../images/style_1.png")%>' alt="" /><span>Aviator</span></a></li>
                <li><a href='<%= ResolveUrl("../product/luxita/sunglasses/other/luxita/luxita/10.aspx")%>'>
                    <img src='<%= ResolveUrl("../images/style_10.png")%>' alt="" /><span>Round</span></a></li>
                <li><a href='<%= ResolveUrl("../product/luxita/sunglasses/other/luxita/luxita/13.aspx")%>'>
                    <img src='<%= ResolveUrl("../images/style_13.png")%>' alt="" /><span>Square</span></a></li>
                <li><a href='<%= ResolveUrl("../product/luxita/sunglasses/other/luxita/luxita/14.aspx")%>'>
                    <img src='<%= ResolveUrl("../images/style_14.png")%>' alt="" /><span>Wayfarer</span></a></li>
                <li><a href='<%= ResolveUrl("../product/luxita/sunglasses/other/luxita/luxita/5.aspx")%>'>
                    <img src='<%= ResolveUrl("../images/style_5.png")%>' alt="" /><span>Oval</span></a></li>
                <li><a href='<%= ResolveUrl("../product/luxita/sunglasses/other/luxita/luxita/9.aspx")%>'>
                    <img src='<%= ResolveUrl("../images/style_9.png")%>' alt="" /><span>Rimless</span></a></li>
              
            </ul>
        </div>
        <div class="col-3 most_block">
            <h3>Gương mặt</h3>
            <ul>
                <li><a href='<%= ResolveUrl("../product/luxita/sunglasses/other/luxita/oval/luxita.aspx")%>'>
                    <img src='<%= ResolveUrl("../images/oval.png")%>' alt="" /><span>Mặt trái xoan</span></a></li>
                <li><a href='<%= ResolveUrl("../product/luxita/sunglasses/other/luxita/square/luxita.aspx")%>'>
                    <img src='<%= ResolveUrl("../images/square.png")%>' alt="" /><span>Mặt chữ điền</span></a></li>
                <li><a href='<%= ResolveUrl("../product/luxita/sunglasses/other/luxita/round/luxita.aspx")%>'>
                    <img src='<%= ResolveUrl("../images/round.png")%>' alt="" /><span>Mặt tròn</span></a></li>
                <li><a href='<%= ResolveUrl("../product/luxita/sunglasses/other/luxita/heart/luxita.aspx")%>'>
                    <img src='<%= ResolveUrl("../images/heart.png")%>' alt="" /><span>Mặt trái tim</span></a></li>
            </ul>
        </div>
    </div>
    <div class="promo-menu">
        <div class="btn-promo-menu">
            <a href='<%= ResolveUrl("../product/luxita/sunglasses/other/luxita/luxita/luxita.aspx")%>' class="button">XEM TẤT CẢ KÍNH MÁT</a>
        </div>
    </div>
</div>



