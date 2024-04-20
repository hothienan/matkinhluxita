<%@ Page Language="VB" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.AccessDataSource1.Insert()
    End Sub









</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/data.mdb" 
        InsertCommand="INSERT INTO product(price) VALUES ('15.000VND')" 
        SelectCommand="SELECT * FROM [product]">
        <InsertParameters>
            <asp:QueryStringParameter DefaultValue="42" Name="type" 
                QueryStringField="price" />
        </InsertParameters>
    </asp:AccessDataSource>
    </form>
</body>
</html>
