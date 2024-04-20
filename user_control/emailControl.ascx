<%@ Control Language="VB" ClassName="emailControl" %>
<%@ Import Namespace="Email" %>
<script runat="server">

    Private Function RandomStringGenerator(ByVal intLen As Integer) As String

        Dim r As New Random

        Dim i As Integer

        Dim strTemp As String = ""

        For i = 0 To intLen

            strTemp = strTemp & Chr(Int((26 * r.NextDouble()) + 65))

        Next

        Return strTemp

    End Function

    Protected Sub Button1_Click1(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim place As String = ""
        Dim subject1 As String = ""
        Dim gmail As Email = New Email()
        If Me.txt_name.Text <> "" And txt_email.Text <> "" And Me.txt_phone.Text <> "" Then
            Me.lbl_report.Visible = True

            If Me.txt_verify.Text = Me.txt_word.Text Then

                Dim bodyMail As String = ""

                Dim lbl_product As Label = CType(FormView1.FindControl("lbl_product"), Label)


                bodyMail = "Mắt kính: " & lbl_product.Text & "<br>" _
                         & "Khách hàng: " & txt_name.Text & "<br>" _
                         & "Giới tính: " & txt_sex.Text & "<br>" _
                         & "Địa chỉ: " & txt_address.Text & "<br>" _
                         & "Điện thoại: " & txt_phone.Text & "<br>" _
                         & "Email: " & txt_email.Text & "<br>"



                If gmail.SendMail("luxita.vn@gmail.com", bodyMail, "Đơn hàng") = True Then
                    Me.lbl_report.Text = "Cám ơn, Bạn đã đặt hàng thành công. Chúng tôi sã kiểm tra và trả lời sớm nhất trong 24h."
                    Me.lbl_report.Visible = True
                    Me.txt_verify.Text = RandomStringGenerator(5)
                    Me.txt_word.Text = ""

                Else
                    Me.lbl_report.Text = "Gởi không thành công!"
                    Me.lbl_report.Visible = True
                End If
            Else
                Me.lbl_report.Text = "Vui lòng nhập đúng các mã trên! (chữ hoa)"
                Me.lbl_report.Visible = True
            End If
        Else
            Me.lbl_report.Text = "Quý khách nên ghi đầy đủ thông tin bên dưới, chúng tôi sã kiểm tra và trả lời sớm nhất trong 24h"
            Me.lbl_report.Visible = True
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        If Not Page.IsPostBack Then
            Me.txt_word.Text = RandomStringGenerator(5)
            If Me.Request("id") <> "" Then
                Me.AccessDataSource1.SelectCommand = "SELECT * FROM [product] WHERE [id] = " & Me.Request("id") & " ORDER BY [id] DESC"
            End If
        End If

    End Sub








</script>




        <asp:FormView ID="FormView1" runat="server" DataSourceID="AccessDataSource1" DataKeyNames="id">
            <ItemTemplate>
                <asp:Label ID="lbl_product" runat="server" Text='<%#Eval("brand") & " " & Eval("productname") & " " & Eval("color") %> '></asp:Label>


            </ItemTemplate>
            <RowStyle VerticalAlign="Top" />
        </asp:FormView>

        <div id="checkoutModal" class="animated-modal popupCustom fancybox-is-hidden">
            <h2>Thông tin đơn hàng</h2>
            <div class="checkout_main">
                <div class="checkout_popup">
                    <fieldset>
                        <legend>


                            <asp:Label ID="lbl_report" runat="server" Text="Quý khách nên ghi đầy đủ thông tin bên dưới, chúng tôi sã kiểm tra và trả lời sớm nhất trong 24h"></asp:Label>

                        </legend>
                        <br />
                        <figure>
                            <p>
                                <asp:TextBox ID="txt_name" runat="server" class="form-control" placeholder="Họ tên"></asp:TextBox>
                            </p>
                            <p>
                                <asp:TextBox ID="txt_sex" runat="server" class="form-control" placeholder="Giới tính"></asp:TextBox>
                            </p>
                            <p>
                                <asp:TextBox ID="txt_address" runat="server" class="form-control" placeholder="Địa chỉ"></asp:TextBox>
                            </p>
                            <p>
                                <asp:TextBox ID="txt_phone" runat="server" class="form-control" placeholder="Số điện thoại"></asp:TextBox>
                            </p>
                            <p>
                                <asp:TextBox ID="txt_email" runat="server" class="form-control" placeholder="Email"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                    ControlToValidate="txt_email" ErrorMessage="invalid email" ForeColor="Red"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </p>
                            <p>
                                <asp:TextBox ID="txt_verify" runat="server" class="form-control"></asp:TextBox>
                                <asp:Label ID="txt_word" runat="server" Font-Bold="True" Text="Label" ForeColor="Green"></asp:Label>
                            </p>
                                                       

                            <asp:Button ID="Button1" runat="server" Text="Gởi đơn hàng" class="btn btn-primary" OnClick="Button1_Click1" />
                            <button type="button" data-fancybox-close>Huỷ</button>
                        </figure>
                    </fieldset>
                </div>
            </div>
        </div>




        <asp:AccessDataSource ID="AccessDataSource1" runat="server"
            DataFile="~/App_Data/data.mdb"></asp:AccessDataSource>





