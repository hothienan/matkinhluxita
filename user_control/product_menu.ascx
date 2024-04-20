<%@ Control Language="VB" ClassName="product_menu" %>

<script runat="server">







</script>


<div class="submenu">
    <div class="column-menu">
        <div class="col-3">
            <h3>Giới tính</h3>
            <ul>
                <li><a href='<%= ResolveUrl("../product/luxita/eyeglasses/men/luxita/luxita/luxita.aspx")%>' title="">Nam</a></li>
                <li><a href='<%= ResolveUrl("../product/luxita/eyeglasses/women/luxita/luxita/luxita.aspx")%>' title="">Nữ</a></li>
                <li><a href='<%= ResolveUrl("../product/luxita/eyeglasses/other/luxita/luxita/luxita.aspx")%>' title="">Cả hai</a></li>
            </ul>
            <h3>Giá</h3>
            <ul>
                <li><a href='<%= ResolveUrl("../product/luxita/eyeglasses/other/41/luxita/luxita.aspx")%>' title="">Trên 5 triệu</a></li>
                <li><a href='<%= ResolveUrl("../product/luxita/eyeglasses/other/42/luxita/luxita.aspx")%>' title="">Từ 5 triệu - 2 triệu</a></li>
                <li><a href='<%= ResolveUrl("../product/luxita/eyeglasses/other/43/luxita/luxita.aspx")%>' title="">Từ 2 triệu - 1 triệu</a></li>
                <li><a href='<%= ResolveUrl("../product/luxita/eyeglasses/other/44/luxita/luxita.aspx")%>' title="">Dưới 1 triệu</a></li>
            </ul>
        </div>
        <div class="col-3 share_block">
            <h3>Kiểu dáng</h3>
            <ul>
                <li><a href='<%= ResolveUrl("../product/luxita/eyeglasses/other/luxita/luxita/20.aspx")%>'>
                    <img src='<%= ResolveUrl("../images/style_20.png")%>' alt="" /><span>Gọng cước</span></a></li>
                <li><a href='<%= ResolveUrl("../product/luxita/eyeglasses/other/luxita/luxita/21.aspx")%>'>
                    <img src='<%= ResolveUrl("../images/style_21.png")%>' alt="" /><span>Gọng khoan</span></a></li>
                <li><a href='<%= ResolveUrl("../product/luxita/eyeglasses/other/luxita/luxita/22.aspx")%>'>
                    <img src='<%= ResolveUrl("../images/style_22.png")%>' alt="" /><span>Gọng khung</span></a></li>
                <li><a href='<%= ResolveUrl("../product/luxita/eyeglasses/other/luxita/luxita/23.aspx")%>'>
                    <img src='<%= ResolveUrl("../images/style_23.png")%>' alt="" /><span>Gọng nhựa</span></a></li>
            </ul>
        </div>
        <div class="col-3 most_block">
            <h3>Gương mặt</h3>
            <ul>
                <li><a href='<%= ResolveUrl("../product/luxita/eyeglasses/other/luxita/oval/luxita.aspx")%>'>
                    <img src='<%= ResolveUrl("../images/oval.png")%>' alt="" /><span>Mặt trái xoan</span></a></li>
                <li><a href='<%= ResolveUrl("../product/luxita/eyeglasses/other/luxita/square/luxita.aspx")%>'>
                    <img src='<%= ResolveUrl("../images/square.png")%>' alt="" /><span>Mặt chữ điền</span></a></li>
                <li><a href='<%= ResolveUrl("../product/luxita/eyeglasses/other/luxita/round/luxita.aspx")%>'>
                    <img src='<%= ResolveUrl("../images/round.png")%>' alt="" /><span>Mặt tròn</span></a></li>
                <li><a href='<%= ResolveUrl("../product/luxita/eyeglasses/other/luxita/heart/luxita.aspx")%>'>
                    <img src='<%= ResolveUrl("../images/heart.png")%>' alt="" /><span>Mặt trái tim</span></a></li>
            </ul>
        </div>
    </div>
    <div class="promo-menu">
        <div class="btn-promo-menu">
            <a href='<%= ResolveUrl("../product/luxita/eyeglasses/other/luxita/luxita/luxita.aspx")%>' class="button">XEM TẤT CẢ GỌNG KÍNH</a>
        </div>
    </div>
</div>



