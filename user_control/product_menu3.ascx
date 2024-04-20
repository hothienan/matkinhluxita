<%@ Control Language="VB" ClassName="product_menu3" %>

<script runat="server">



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)

        If Not Page.IsPostBack Then



        End If

    End Sub



    Public Function removeSpacing(ByVal _value As Object) As String
        If _value <> "" Then
            Return _value
        Else
            Return "luxita"
        End If

    End Function

    Public Function niceBranding(ByVal _value As String) As String

        Return _value.ToString.Replace("Phụ Kiện", "Phu Kien").Replace(" ", "-").Replace("&", "7").Replace("(", "").Replace(")", "")


    End Function






</script>


<div class="submenu">
    <div class="logo-brand-menu">
        <ul>
            <li><a href='<%= ResolveUrl("../product/RayBan/luxita/other/luxita/luxita/luxita.aspx")%>'>
                <img src='<%= ResolveUrl("../images/RB_logo_desk.png")%>' alt=""></a></li>
            <li><a href='<%= ResolveUrl("../product/Oakley/luxita/other/luxita/luxita/luxita.aspx")%>'>
                <img src='<%= ResolveUrl("../images/OO_logo_desk.png")%>' alt=""></a></li>
            <li><a href='<%= ResolveUrl("../product/Michael-Kors/luxita/other/luxita/luxita/luxita.aspx")%>'>
                <img src='<%= ResolveUrl("../images/MK_logo_desk.png")%>' alt=""></a></li>
            <li><a href='<%= ResolveUrl("../product/Prada/luxita/other/luxita/luxita/luxita.aspx")%>'>
                <img src='<%= ResolveUrl("../images/PR_logo_desk.png")%>' alt=""></a></li>
            <li><a href='<%= ResolveUrl("../product/Armani-Exchange/luxita/other/luxita/luxita/luxita.aspx")%>'>
                <img src='<%= ResolveUrl("../images/AE_logo_desk.png")%>' alt=""></a></li>
            <li><a href='<%= ResolveUrl("../product/MONT-BLANC/luxita/other/luxita/luxita/luxita.aspx")%>'>
                <img src='<%= ResolveUrl("../images/MB_logo_desk.png")%>' alt=""></a></li>
            <li><a href='<%= ResolveUrl("../product/Lacoste/luxita/other/luxita/luxita/luxita.aspx")%>'>
                <img src='<%= ResolveUrl("../images/lc_logo_desk.png")%>' alt=""></a></li>
            <li><a href='<%= ResolveUrl("../product/Levis/luxita/other/luxita/luxita/luxita.aspx")%>'>
                <img src='<%= ResolveUrl("../images/lv_logo_desk.png")%>' alt=""></a></li>
            <li><a href='<%= ResolveUrl("../product/Calvin-Klein/luxita/other/luxita/luxita/luxita.aspx")%>'>
                <img src='<%= ResolveUrl("../images/CK_logo_desk.png")%>' alt=""></a></li>
            <li><a href='<%= ResolveUrl("../product/New-Balance/luxita/other/luxita/luxita/luxita.aspx")%>'>
                <img src='<%= ResolveUrl("../images/NB_logo_desk.png")%>' alt=""></a></li>
            <li><a href='<%= ResolveUrl("../product/Christian-Dior/luxita/other/luxita/luxita/luxita.aspx")%>'>
                <img src='<%= ResolveUrl("../images/DO_logo_desk.png")%>' alt=""></a></li>
            <li><a href='<%= ResolveUrl("../product/Tom-Ford/luxita/other/luxita/luxita/luxita.aspx")%>'>
                <img src='<%= ResolveUrl("../images/TF_logo_desk.png")%>' alt=""></a></li>
        </ul>
    </div>
    <div class="brand-menu-sub">
        <h3>TOP BRANDS</h3>
        <div class="column-menu">

            <div class="col-2">
                <ul>
                    <asp:AccessDataSource ID="AccessDataSource3" runat="server"
                        DataFile="~/App_Data/data.mdb"
                        SelectCommand="SELECT * FROM [sub_product_type] order by typename"></asp:AccessDataSource>

                    <asp:ListView ID="ListView3" runat="server" DataKeyNames="id"
                        DataSourceID="AccessDataSource3">

                        <EmptyDataTemplate>
                            <span></span>
                        </EmptyDataTemplate>


                        <ItemTemplate>



                            <li><a href="<%# ResolveUrl("../product/" & niceBranding(Eval("typename")) & "/luxita/other/luxita/luxita/luxita.aspx")%>"><%# Eval("typename") %></a></li>



                        </ItemTemplate>



                    </asp:ListView>

                </ul>
            </div>

        </div>
    </div>
</div>
