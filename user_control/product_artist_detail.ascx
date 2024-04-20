<%@ Control Language="VB" ClassName="product_artist_detail" %>

<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        If Me.Request("id") <> "" Then
            Me.AccessDataSource1.SelectCommand = "SELECT * FROM [product] WHERE [id] = " & Me.Request("id") & " ORDER BY [id] DESC"
            
            Page.Title = CType(Me.FormView1.FindControl("lbl_brand"), Label).Text & " " & CType(Me.FormView1.FindControl("lbl_title"), Label).Text
        
            
        End If
        
    End Sub

    
    
    Public Function removeNonPicture(ByVal picture As Object) As String
    
        If IsDBNull(picture) Then
            Return "hide"
        Else
            Return "item"
        End If
    End Function
    
    Public Function photos360(ByVal picture As Object) As String
    
        If picture = True Then
            Return "<a href='#myModal360' role='button' class='photos360' data-toggle='modal'></a>"
        Else
            Return ""
        End If
    End Function
       
    Public Function hiddenMadein(ByVal madein As Object) As String
    
        If IsDBNull(madein) Then
            Return "style='display:none'"
        Else
            Return ""
        End If
    End Function
    
    Public Function backButton(ByVal str As Object) As String
    
        If str = "mika" Then
            Return "javascript:history.back();"
        Else
            Return ""
        End If
    End Function
    
    





</script><style>

</style>

<asp:FormView id="FormView1" runat="server" DataSourceID="AccessDataSource1" DataKeyNames="id"  >
<ItemTemplate>
    <span id="numID" class="hide"><%# Eval("id")%></span>

              <div id="carousel-example-generic" class="carousel slide vmk-slideshow slideshow-product-detail" data-ride="carousel">
                <!-- Indicators -->
           
                   <ol class="carousel-indicators">
                  <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                  <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                  <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                  <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                </ol>

      <!-- Wrapper for slides -->
                <div class="carousel-inner " role="listbox">


                  <div class="item active">
                    <img src='<%= ResolveUrl("../images/products/")%><%# Eval("image")%>' alt="" >                    
                     

                  </div>
                
                     <div class="<%# removeNonPicture(Eval("image1"))%>"   >
                    <img src='<%= ResolveUrl("../images/products/")%><%# Eval("image1")%>' alt="" >                    
                     

                  </div>

                     <div class="<%# removeNonPicture(Eval("image2"))%>"   >
                    <img src='<%= ResolveUrl("../images/products/")%><%# Eval("image2")%>' alt="" >                    
                     

                  </div>

                     <div class="<%# removeNonPicture(Eval("image3"))%>"   >
                    <img src='<%= ResolveUrl("../images/products/")%><%# Eval("image3")%>' alt="" >                    
                     

                  </div>

           
                 
                </div>

             <a class="left carousel-control hide" href="#carousel-example-generic" role="button" data-slide="prev">
                  <span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control hide" href="#carousel-example-generic" role="button" data-slide="next">
                  <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
                </a>

                          <%# photos360(Eval("360photos"))%>      

              </div>
   
    <div class="clearfix"></div>

     <div class="row">

      <div class="vmk-product-funcs col-sm-12"> 

          <br/>
       
           <a href="<%# backButton(Me.Session("userID"))%>" class="btn btn-default btn-sm btn-back" ><i class="fa fa-chevron-left fa-lg"></i></i> Về trang trước</a>
      
            <a href="#" class="btn btn-default btn-sm "  id="likefb"><i class="fa fa-heart fa-lg"></i> Quan tâm (<%# Eval("child_product")%>)</a>
       
           <input type="hidden" value='<%# Eval("child_product")%>' id="like-number" />
   
         <marquee behavior="scroll" direction="left" class="marquee hide" scrolldelay="100">

                <asp:AccessDataSource ID="AccessDataSource100" runat="server" 
            DataFile="~/App_Data/data.mdb" 
            SelectCommand="SELECT * FROM [link_picture] where [position] = 10">
        </asp:AccessDataSource>
       <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" 
            DataSourceID="AccessDataSource100">
            
            <EmptyDataTemplate>
                <span></span>
            </EmptyDataTemplate>
            
                      
            <ItemTemplate>

                   <div class="item ">
                    <a href="<%# Eval("link") %>"  target=_blank><%# Eval("content")%></a>
                    
                  </div>


            </ItemTemplate>
            <LayoutTemplate>
                <div ID="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
      
            </LayoutTemplate>
            
            
        </asp:ListView>
</marquee>
             
       <div id="btn-like-fb" >
       
       <iframe  src='<%# "//www.facebook.com/plugins/like.php?href=http://vietmatkinh.com/product_detail.aspx?id=" & Eval("id") & "&type=" & Eval("type") & "&price=" & Eval("price") & "&pr=" & Eval("pricerange") & "&pn=" & Eval("productname") & "&amp;send=true&amp;layout=button_count&amp;width=150&amp;show_faces=false&amp;action=like&amp;share=false&amp;colorscheme=light&amp;font&amp;height=21"%>' scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:150px; height:21px;" allowTransparency="true"></iframe>
       
       </div><!-- / btn-like-fb --> 

</div><!-- /vmk-product-funcs -->

         </div> <!-- / row -->  
     <div class="clearfix"></div><br/>
       <div class="row">
         <div class="col-sm-7">
        <table class="table " >
              
                 <tr>
                  <td><span class="title-left">Nhãn hiệu: </span><span class="title-right"><asp:Label ID="lbl_brand" runat="server"   Text='<%# eval("brand") %>'></asp:Label></span></td>
                  </tr>
                <tr>
                  <td><span class="title-left">Model: </span><span class="title-right"><asp:Label ID="lbl_title" runat="server" Text='<%# Eval("productname") & " " &  eval("color") %>'  ></asp:Label></span></td>
                  </tr>
                   <tr>
                  <td><span class="title-left">Màu<!--Chất liệu-->: </span><span class="title-right"><asp:Label ID="Label5" runat="server"   Text='<%# Eval("material")%>'></asp:Label></span></td>
                   </tr>
                    <tr>
                  <td><span class="title-left">Size: </span><span class="title-right"><asp:Label ID="Label8" runat="server"   Text='<%# eval("size") %>'></asp:Label></span></td>
                   </tr>
                  
                </tr>
             
               
             
            </table>
            </div>
            <div class="col-sm-5">
               <table class="table " >
                   
                   <tr <%# hiddenMadein(eval("madein")) %> >          
                  <td><span class="title-left">Hiệu xuất xứ: </span><span class="title-right"><asp:Label ID="Label4" runat="server"   Text='<%# eval("madein") %>'></asp:Label></span></td>
                   </tr>

                    <tr>
                  <td><span class="title-left">Giới tính: </span><span class="title-right"><asp:Label ID="Label1" runat="server"   Text='<%# eval("sex") %>'></asp:Label></span></td>
                   </tr>
                </tr>              
                <tr>
                  <td><span class="title-left">Phụ kiện: </span><span class="title-right"><asp:Label ID="Label2" runat="server"   Text='Fullbox'></asp:Label></span></td>
                   </tr>

                    <tr>
                  <td><span class="title-left">Bảo hành: </span><span class="title-right"><asp:Label ID="Label6" runat="server"   Text='12 tháng'></asp:Label></span></td>
                   </tr>
                </tr>
             
               
             
            </table>
             </div>
             
       </div>   <!-- / row -->  
    

<!-- Modal -->
<div id="myModal360" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Xem sản phẩm 360 độ</h3>
  </div>
  <div class="modal-body">
    

       <section class="container-fluid" id="container">
      <div class="threesixty product1">
        <div class="spinner">
          <span>0%</span>
        </div>
        <ol class="threesixty_images"></ol>
      </div>
    </section>
    <section class="code container-fluid">

       <script type="text/javascript">
           window.onload = init;

           var product;
           function init() {

               product1 = $('.product1').ThreeSixty({
                   totalFrames: 26,
                   endFrame: 26,
                   currentFrame: 1,

                   imgList: '.threesixty_images',
                   progress: '.spinner',
                   imagePath: 'images/threesixty-slider/',
                   filePrefix: '<%# Eval("id") & "_"%>',
                   ext: '.png',
                   height: 447,
                   width: 1000,
                   navigation: true,
                   responsive: true
               });

           }

  </script>

  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
   
  </div>
</div>



</ItemTemplate>
    <RowStyle VerticalAlign="Top" />
</asp:FormView> 


<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
    DataFile="~/App_Data/data.mdb"  >
</asp:AccessDataSource>



<script  type="text/javascript" >

    var liked = 0;






    $(document).ready(function () {
        if (liked == 0) {
            var likeProduct = 1;


            var numID = $("#numID").text();//product Id

            var productlikenum = parseInt($("#like-number").val()) + 1; //product like number 

            $("#likefb").html("<i class='fa fa-heart fa-lg'></i> Quan tâm (" + productlikenum + ")");
            $.post("<%= ResolveUrl("ajaxPOST.aspx")%>", { likeProduct: likeProduct, id: numID }, function (result) {
                if (result != "") {

                }

            });
            liked = 1;
        }

    });


</script>
   
 

   