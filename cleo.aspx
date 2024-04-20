<%@ Page Language="VB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub
 









</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    	<script type='text/javascript' src='js/jquery.js'></script>
	
    <style>

#wrapper {
    margin: 0 auto;
    width: 90%;
    position: relative;
}

#wrapper ul {
    list-style: none;
    padding: 0;
    margin: 0;
}
#wrapper ul li {
    box-shadow: 0px 0px 6px #e9bed2;
    padding: 10px 10px 0px;
    border: 1px solid #e9bed2;
    width: 210px;
    position: absolute;
	background-color:#FFF;
	text-align:center;
	line-height: 16px;
	font-size: 12px;
	height:350px
	
	
}
</style>
</head>
<body>

    <form id="form1" runat="server">
   <asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>


        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/data.mdb" SelectCommand="SELECT top 100 * FROM [product]">
        </asp:AccessDataSource>

          <div id="wrapper"> 
    <ul> 

        <asp:ListView ID="ListView1" runat="server" DataKeyNames="id"  
            DataSourceID="AccessDataSource1">
     
          
            <EmptyDataTemplate>
                <span>No data was returned.</span>
            </EmptyDataTemplate>
  
            <ItemTemplate>
            <li>
                <span style="">id:
                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                <br />
                type:
                <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
                <br />
                image:
                <asp:Label ID="imageLabel" runat="server" Text='<%# Eval("image") %>' />
                <br />
                date:
                <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                <br />
                short_text:
                <asp:Label ID="short_textLabel" runat="server" 
                    Text='<%# Eval("short_text") %>' />
                <br />
                user:
                <asp:Label ID="userLabel" runat="server" Text='<%# Eval("detail") %>' />
                <br />
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "cleo.aspx?id=" & Eval("id") %>'>HyperLink</asp:HyperLink>
                <br />
                </span>
                </li>
            </ItemTemplate>
            <LayoutTemplate>
                <div ID="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                
            </LayoutTemplate>
  
        </asp:ListView>

   </ul> 

</div>

 </ContentTemplate>
</asp:UpdatePanel>
<asp:UpdateProgress ID="UpdateProgress2" runat="server">
    <ProgressTemplate>
        loading...
    </ProgressTemplate>
</asp:UpdateProgress>
    </form>
       
      
<script>


    $(document).ready(function () {
        brick();
        indexLI = 17;
        $("li:gt(" + indexLI + ")").hide();

    });

    $(window).resize(function () {
        brick();

    });


    function brick() {
        var dw = $(window).width() * .9;
        var colsNum = Math.floor(dw / 252);
        $('#wrapper').width(colsNum * 252);

        var arr = new Array(colsNum);
        for (var i = 0; i < colsNum; i++) {
            arr[i] = 0;
        }
        $('#wrapper ul li').each(function () {

            var m = minIndex(arr);

            $(this).css({
                'top': arr[m] + 'px',
                'left': 252 * m + 'px'
            });

            //$(this).html(m + ',' + arr[m] + ', ' + $(this).height());

            arr[m] += $(this).height() + 30;
        });
    }

    function minIndex(arr) {
        mIndex = 0;
        for (var i = 0; i < arr.length; i++) {
            if (arr[mIndex] > arr[i]) {
                mIndex = i;
            }
        }
        return mIndex;
    }


    function lastPostFunc() {

        indexLI += 7;
        $("li:lt(" + indexLI + ")").show();

    };

    $(window).scroll(function () {
        if ($(window).scrollTop() == $(document).height() - $(window).height()) {
            lastPostFunc();
        }
    });
      </script>

</body>
</html>
