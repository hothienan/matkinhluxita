<%@ Control Language="VB" ClassName="best_brands" %>

<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)

        Me.AccessDataSource1.SelectCommand = "SELECT Top 8 * FROM [sub_product_type] WHERE [logo_brand] <> '' ORDER BY [id] DESC"


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


<asp:ListView ID="ListView3" runat="server" DataKeyNames="id"
    DataSourceID="AccessDataSource1">


    <EmptyDataTemplate>
    </EmptyDataTemplate>


    <ItemTemplate>



        <div class="item">
            <a href="<%# ResolveUrl("../product/" & niceBranding(Eval("typename")) & "/sunglasses/other/luxita/luxita/luxita.aspx")%>" class="brand-img">
                <img src="images/slides/<%# Eval("image_sheet") %>" alt="" /></a>
            <a href="<%# ResolveUrl("../product/" & niceBranding(Eval("typename")) & "/sunglasses/other/luxita/luxita/luxita.aspx")%>" class="brand-logo">
                <img src="images/slides/<%# Eval("logo_brand") %>" alt="" /></a>
        </div>



    </ItemTemplate>



</asp:ListView>



<asp:AccessDataSource ID="AccessDataSource1" runat="server"
    DataFile="~/App_Data/data.mdb"></asp:AccessDataSource>



