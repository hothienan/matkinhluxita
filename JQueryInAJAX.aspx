<%@ Page Language="C#" AutoEventWireup="true"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>









     <script src="_scripts/jquery-1.2.6.js" type="text/javascript"></script>        <script language="javascript">
            $(document).ready(function() {


                    $("#txtNoOfTicketsByGet").change(function() {
                                    $("#Error1").html("");
                                    var ticketsReq = $("#txtNoOfTicketsByGet").val();
                                    $.get("GetAvailableTickets.aspx", function(result) {
                                        var ticketsavailable = parseInt(result);
                                        if (ticketsReq > ticketsavailable) {
                                            $("#Error1").html("Only " + ticketsavailable + " tickets are available!");
                                        }
                                    });
                                });



                    $("#txtNoOfTicketsByPOST").change(function() {
                    $("#Error2").html("");
                    var ticketsReq = $("#txtNoOfTicketsByPOST").val();
                    $.post("GetAvailableTicketsByPOST.aspx", { TicReq: ticketsReq }, function(result) {
                        if (result != "") {
                            $("#Error2").html(result);                            
                        }

                    });
                });
            });
        </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <b>By GET:</b>
    <div id="TicketsByGET">
    No of Tickets:<asp:TextBox ID="txtNoOfTicketsByGet" runat="server"></asp:TextBox>
    <div id="Error1" style="color:Red;"></div>  
    </div>
   <b> By POST:</b>
     <div id="TicketsByPOST">
    No of Tickets:<asp:TextBox ID="txtNoOfTicketsByPOST" runat="server"></asp:TextBox>
    <div id="Error2" style="color:Red;"></div>  
    </div>
    </div>
    </form>
</body>
</html>
