<%@ Control Language="C#" ClassName="NumPaging13" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data" %>


<script runat="server">
   
    string strsql;
 protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindData();
        }
        else 
        {
            //since the pagination controls are dynamically creating its shld be re created in each page load
            BuildPagination();
        }
    }

    private void bindData()
    {
        DataSet ds = SampleData();
        bindDataWithPaging(dlPaginationSample, ds);
    }

    //generate dummy data forthe example
    private DataSet SampleData()
    {
       

        string dsn = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        
        SqlConnection ocon = new SqlConnection(dsn);
        
       
        ocon.Open();
      

       
        {
            if (this.Request["type"] == null) //trangchu
            {
                strsql = "SELECT * FROM product where promocheck = 1 ORDER BY id desc  ";
                this.pnlPager.Visible = false;
            }
           
             
             

                    else
                        if (this.Request["type"] != "") //loai san pham
                        {
                            string s = this.Request["type"];
                            if (kiemtra_so(s) == 1)
                                strsql = "select * from product where type ='" + this.Request["type"] + "' order by id desc ";
                            else
                                this.Response.Redirect("default.aspx");
                        }
                        else

                            this.Response.Redirect("default.aspx");
        }
       
        
        SqlDataAdapter oda = new SqlDataAdapter(strsql, ocon);
        DataSet ods = new DataSet();
        oda.Fill(ods);
        ocon.Close();
        
        return ods;
    }

    public int kiemtra_so(String s)
    {
        int k = 1;
        for (int g = 0; g < s.Length; g++)
        {
            if (!char.IsDigit(s, g))
                k = 0; return k;
        }
        return k;
    }

    protected void lnkPager_Click(object sender, EventArgs e) //Page index changed function
    {
        LinkButton lnk = (LinkButton)sender;
        CurrentPageIndex = int.Parse(lnk.CommandArgument);

        bindData();
    }

    private int PageSize //total rows per page
    {
        get { return 9; }
    }

    private int ButtonsCount //how many total linkbuttons shld be shown
    {
        get { return 10; }
    }

    private string FirstPageText
    {
        get { return "&lt;&lt;"; }
    }
    private string LastPageText
    {
        get { return "&gt;&gt;"; }
    }


    private void bindDataWithPaging(Control bindControl, DataSet data) //you can pass either DatList or Repeater to this function
    {
        if (data.Tables.Count > 0) // if the datset contains data
        {
            DataView dv = data.Tables[0].DefaultView;

            PagedDataSource dsP = new PagedDataSource();
            dsP.AllowPaging = true;
            dsP.DataSource = dv;
            dsP.CurrentPageIndex = CurrentPageIndex;
            dsP.PageSize = PageSize;

            //Binding data to the controls
            if (bindControl is DataList)
            {
                ((DataList)bindControl).DataSource= dsP;
                ((DataList)bindControl).DataBind();
            }
            else if (bindControl is Repeater)
            {
                ((Repeater)bindControl).DataSource = dsP;
                ((Repeater)bindControl).DataBind();
            }

            //saving the total page count in Viewstate for later use
            PageCount = dsP.PageCount;

            //create the linkbuttons for pagination
            BuildPagination();
        }
    }

    private int CurrentPageIndex //to store the current page index
    {
        get { return ViewState["CurrentPageIndex"] == null ? 0 : int.Parse(ViewState["CurrentPageIndex"].ToString()); }
        set { ViewState["CurrentPageIndex"] = value; }
    }
    private int PageCount  //total number of pages needed to display the data
    {
        get { return ViewState["PageCount"] == null ? 0 : int.Parse(ViewState["PageCount"].ToString()); }
        set { ViewState["PageCount"] = value; }
    }

    private LinkButton createButton(string title, int index)
    {
        LinkButton lnk = new LinkButton();
        lnk.ID = index.ToString();
        lnk.Text = title;
        lnk.CommandArgument = index.ToString();
        lnk.Click += new EventHandler(lnkPager_Click);
        return lnk;
    }

    //create the linkbuttons for pagination
    protected void BuildPagination()
    {
        pnlPager.Controls.Clear(); //

        if (PageCount <= 1) return; // at least two pages should be there to show the pagination

        //finding the first linkbutton to be shown in the current display
        int start = CurrentPageIndex - (CurrentPageIndex % ButtonsCount);

        //finding the last linkbutton to be shown in the current display
        int end = CurrentPageIndex + (ButtonsCount - (CurrentPageIndex % ButtonsCount));

        //if the start button is more than the number of buttons. If the start button is 11 we have to show the <<First link
        if (start > ButtonsCount - 1)
        {
            pnlPager.Controls.Add(createButton(FirstPageText, 0));
            pnlPager.Controls.Add(createButton("..", start - 1));
        }
        
        int i = 0, j = 0;

        for (i = start; i < end; i++)
        {
            
            if (i < PageCount)
            {
                if (i == CurrentPageIndex) //if its the current page
                {
                    Label lbl = new Label();
                    lbl.Text = (i + 1).ToString();
                    pnlPager.Controls.Add(lbl);
                }
                else
                {
                    pnlPager.Controls.Add(createButton((i + 1).ToString(), i));
                }
            }
            j++;
        }

        //If the total number of pages are greaer than the end page we have to show Last>> link
        if (PageCount > end)
        {
            pnlPager.Controls.Add(createButton("..", i));
            pnlPager.Controls.Add(createButton("&gt;&gt;", PageCount + 1));
        }
        

    }





</script>
        

<asp:DataList ID="dlPaginationSample" runat="server" RepeatColumns="3" RepeatDirection="Horizontal"
    Visible="True">
    <ItemTemplate>
        <table style="width: 220px">
            <tbody>
                <tr>
                    <td align="center" height="220" rowspan="4" style="width: 300px" valign="top">
                        <asp:Image ID="Image1" runat="server" 
                            ImageUrl='<%# "../images/small_product/" + Eval("image") %>'  Width="150px" Height="150px" /><br />
                        <asp:HyperLink ID="HyperLink13" runat="server" Font-Bold="True" Font-Underline="True"
                            ForeColor="OrangeRed" NavigateUrl='<%# "../detail.aspx?id=" + Eval("id") %>' Text='<%# Eval("productname") %>'></asp:HyperLink><br />
                            Mã số: SEC<asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label><br />
                        Hàng nhập từ Thái Lan&nbsp;<br />
                        Giá:
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("price") %>'></asp:Label>
                        <strong>VNĐ</strong></td>
                </tr>
            </tbody>
        </table>
    </ItemTemplate>
    <HeaderTemplate>
    </HeaderTemplate>
    <FooterTemplate>
    </FooterTemplate>
</asp:DataList><br />
        <asp:Panel runat="server" id="pnlPager" CssClass="page">
            
        </asp:Panel>

