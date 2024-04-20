<%@ Control Language="C#" ClassName="counter_uc" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        int _count;
        Label lbl_temp;

        if (this.Session["viewer"] == null)
        {
            lbl_temp =  this.fv_visitor.FindControl("lbl_visitor") as Label;
            _count = int.Parse(lbl_temp.Text) + 1;
            this.lbl_total.Text = _count+"";
            Random r = new Random();
            this.Session["viewer"] = r.Next(1024, 9000).ToString();
            this.AccessDataSource1.UpdateCommand = "UPDATE [counter] SET visitor = " + _count;
            this.AccessDataSource1.Update();
        }
       
    }





</script>
<asp:FormView ID="fv_visitor" runat="server" DataSourceID="AccessDataSource1" Width="259px">
        <EditItemTemplate>
            Lượt truy cập:
            <asp:TextBox ID="visitorTextBox" runat="server" Text='<%# Bind("visitor") %>'>
            </asp:TextBox><br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Update">
            </asp:LinkButton>
            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancel">
            </asp:LinkButton>
        </EditItemTemplate>
        <InsertItemTemplate>
            Lượt truy cập:
            <asp:TextBox ID="visitorTextBox" runat="server" Text='<%# Bind("visitor") %>'>
            </asp:TextBox><br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Insert">
            </asp:LinkButton>
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancel">
            </asp:LinkButton>
        </InsertItemTemplate>
        <ItemTemplate>
            <span>
                Viewed by: <asp:Label ID="lbl_visitor" runat="server"  Text='<%# Bind("visitor") %>'
                Width="170px" ></asp:Label>
        </ItemTemplate>
    </asp:FormView>

    <asp:Label ID="lbl_total" runat="server" Text="Label" Visible="False" ForeColor="White"></asp:Label>

<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
    DataFile="~/App_Data/data.mdb"  SelectCommand="SELECT * FROM [counter]">
</asp:AccessDataSource>
   