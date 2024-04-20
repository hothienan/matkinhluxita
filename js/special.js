
$(document).ready(function () {

    setInterval(function(){

        $('.menu').toggleClass('open');

    }, 3000);



    $('.owl-carousel').owlCarousel({
        items: 4,
        autoplay: true,
        loop: true,
        nav: true
    });



    $(".owl-carousel").hover(
     function () {
         $(".owl-prev").html("<i class='fa fa-chevron-left fa-fw fa-lg'></i>");
         $(".owl-next").html("<i class='fa fa-chevron-right fa-fw fa-lg'></i>");
         $(".owl-controls").show();
     }, function () {
         $(".owl-prev").html("<i class='fa fa-chevron-left fa-fw fa-lg'></i>");
         $(".owl-next").html("<i class='fa fa-chevron-right fa-fw fa-lg'></i>");
         $(".owl-controls").hide();
     }
);



    stickSideBar();

    $(".slide-show").hover(
     function () {
         $(".slideshow-control").show();
     }, function () {
         $(".slideshow-control").hide();
     }
);


    $(".vmk-btn-order").hover(
         function () {
             $(".vmk-btn-order i").addClass("fa-spin");
         }, function () {
             $(".vmk-btn-order i").removeClass("fa-spin");
         }
   );



    $(".slideshow-famous").hover(
         function () {
             $(".slideshow-famous .carousel-control").removeClass("hide");
         }, function () {
             $(".slideshow-famous .carousel-control").addClass("hide");
         }
   );



    var _item = $('.slideshow-product-detail .item').length;

    $('.slideshow-product-detail .carousel-indicators li').eq(_item).addClass("hide");


    $('.carousel-inner .item').first().addClass('active');


    $('#myCarouse5 .carousel-inner .item').first().addClass('active');

    $('#myCarouse4 .carousel-inner .item').first().addClass('active');



    $(".btn-close-menu").click(function () {
        $("#menu-show1, #menu-show2, #menu-show3, #menu-show4, #menu-show5").fadeOut(300);
        closeBlackBgFading();
    });



    function openBlackBgFading() {

        var _h = $(document).height() - _height;

        $(".bg-fading").css({

            "width": "100%",
            "height": _h
        });
    }

    function closeBlackBgFading() {

        $(".bg-fading").css({

            "width": "0",
            "height": "0"
        });
    }

    function hideAllMenus() {
        $("#menu-show1").hide();
        $("#menu-show2").hide();
        $("#menu-show3").hide();
        $("#menu-show4").hide();
        $("#menu-show5").hide();
        openBlackBgFading();
    }

    $("#menu1").click(function () {
    hideAllMenus();
    $("#menu-show1").fadeIn(300);
    });

    $("#menu2").click(function () {
    hideAllMenus();
    $("#menu-show2").fadeIn(300);
    });

    $("#menu3").click(function () {
     hideAllMenus();
     $("#menu-show3").fadeIn(300);
 });

    $("#menu4").click(function () {
    hideAllMenus();
    $("#menu-show4").fadeIn(300);
});

    $("#menu5").click(function () {
        hideAllMenus();
        $("#menu-show5").fadeIn(300);
    });


    $(".btn-go-top").click(function () {
        _scrollTop();
    });


    $(".vmk-btn-main-menu").click(function () {
        $('.vmk-nav-sidebar').toggleClass("slide-right");
    });



    var isMobile = {
        Android: function () {
            return navigator.userAgent.match(/Android/i);
        },
        BlackBerry: function () {
            return navigator.userAgent.match(/BlackBerry/i);
        },
        iOS: function () {
            return navigator.userAgent.match(/iPhone|iPad|iPod/i);
        },
        Opera: function () {
            return navigator.userAgent.match(/Opera Mini/i);
        },
        Windows: function () {
            return navigator.userAgent.match(/IEMobile/i) || navigator.userAgent.match(/WPDesktop/i);
        },
        any: function () {
            return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
        }
    };

    /*
    function hideBrands() {
        var _brandlen = $(".icon-stop").length;

        for(var i = 0; i < _brandlen ; i++) {

            var _brand = $(".icon-stop").eq(i).parent().text();
            if (_brand == " SVD" || _brand == " Rita" || _brand == " AO STAR") {

                $(".icon-stop").eq(i).parent().hide();
             }
        }

    }

    //hide 3 brands
    setTimeout(function () {
        hideBrands();

    }, 1000);
    */

    var _scroll;
    var _height = $('#footer').height();

    if (isMobile.any()) {
        $('body').addClass("wrapper");

        setTimeout(function () {
            detectFooter();

        }, 1000);

    }
    else {

        stickSideBar();

        $(window).scroll(function () {

            _scroll = $(this).scrollTop() + $(window).innerHeight();
            stickSideBar();
           

        });

    }

    var _stickSideBar = 1;

    var url = document.location.href;
    var mainurl = url.split("/");


    if (mainurl[3] == "product_detail_vmk") { init360(mainurl[4]); }

    function init360(id360) {

        $('.product360').ThreeSixty({
            totalFrames: 26,
            endFrame: 26,
            currentFrame: 1,

            imgList: '.threesixty_images',
            progress: '.spinner',
            imagePath: '/images/threesixty-slider/',
            filePrefix: id360 + "_",
            ext: '.png',
            height: 447,
            width: 1000,
            navigation: true,
            responsive: true
        });

    }



    if (mainurl[3] == "default.aspx" || mainurl[3] == "contact.aspx" || mainurl[3] == "product_detail_vmk" || mainurl[3] == "discount.aspx" || mainurl[3] == "product_artist.aspx" || mainurl[3] == "search_product.aspx")
    { _stickSideBar = 0; }


    function stickSideBar() {

        if (_stickSideBar == 0) {

            if (_scroll > _length) {

                $('.vmk-nav-sidebar, .vmk-filter-sidebar').removeClass("slide-right");

            } else {

                $('.vmk-nav-sidebar, .vmk-filter-sidebar').addClass("slide-right");
            }
        }
        else {


            if (_scroll > _length) {

                $('.vmk-nav-sidebar, .vmk-filter-sidebar').removeClass("slide-right");

            } else {

                $('.vmk-filter-sidebar').addClass("slide-right");
            }

        }

    }

    function detectFooter() {


        $('.vmk-nav-sidebar').css({
            "position": "absolute",
            "background-color": "#fff",
            "height": "auto"
        });

        $('.vmk-filter-sidebar').css({
            "position": "absolute",
            "left": "-350px",
            "top": "-50px",
            "background-color": "#fff",
            "height": "auto"
        });

        $('.vmk-menu-hover').css({
            "height": "auto"
        });
    }


    var _length;
    _length = $('#footer').offset().top;



//$('body').imagesLoaded().done(function (instance) {
   // detectSquarePhotos();
  //  detectNewsPhotos();
//});


    $('body').imagesLoaded().always(function (instance) {
      detectSquarePhotos();
      detectNewsPhotos();
  }).done(function (instance) {
      detectSquarePhotos();
      detectNewsPhotos();
  }).fail(function () {
      detectSquarePhotos();
      detectNewsPhotos();
  });

 

function isMacintosh() {
    return navigator.platform.indexOf('Mac') > -1;
}

function detectNewsPhotos() {


    var lenProduct = $(".vmk-news-item").length;

    for (var i = 0; i < lenProduct ; i++) {

        if ($(".vmk-news-item").eq(i).find(".lazy-photo").height() == 95)
            if ($(".vmk-news-item").eq(i).hasClass("img-square") == false) {
                $(".vmk-news-item").eq(i).addClass("img-square");

            }
    }

}



$("#search-result").show();


    //slideshow

$('.slide-show').show();

var _k = 0;
var _lens = $('.slide-show .vmk-star').length;
var slideActived = 0;

_initSlideShow();


function _initSlideShow() {

    $('.slide-show .vmk-star').hide();

    for (var i = 0; i < 4; i++)
        $('.slide-show .vmk-star').eq(i).fadeIn(300);

}


setInterval(function () {

    if (slideActived == 0) _goSlideShow();


}, 6000);


$('.slide-show .prev').click(function () {

    _prevSlideShow();

});


$('.slide-show .next').click(function () {

    _nextSlideShow();

});


function _prevSlideShow() {

    $('.slide-show .vmk-star').hide();

    slideActived = 1;

    _k = _k - 4;
    if (_k < 0)
        _k = 0;

    for (var i = _k; i < _k + 4; i++)
        $('.slide-show .vmk-star').eq(i).fadeIn(300);


}


function _nextSlideShow() {

    $('.slide-show .vmk-star').hide();

    slideActived = 1;

    _k = _k + 4;
    if (_k > _lens - 4)
        _k = _lens - 4;

    for (var i = _k; i < _k + 4; i++)
        $('.slide-show .vmk-star').eq(i).fadeIn(300);



}

function _goSlideShow() {

    $('.slide-show .vmk-star').hide();

    _k = _k + 4;
    if (_k > _lens - 4)
        _k = 0;

    for (var i = _k; i < _k + 4; i++)
        $('.slide-show .vmk-star').eq(i).fadeIn(300);



}


$("input:text").keypress(function (event) {
    if (event.keyCode == 13) {
        event.preventDefault();
        return false;
    }
});

});



function detectSquarePhotos() {

    var lenProduct = $(".vmk-product").length;
    for (var i = 0; i < lenProduct ; i++) {

        var _square = $(".vmk-product").eq(i).find(".lazy-photo").width() - $(".vmk-product").eq(i).find(".lazy-photo").height();

        if (_square == 0 || _square == 1 || _square == -1)

            if ($(".vmk-product").eq(i).hasClass("img-square") == false) {
                $(".vmk-product").eq(i).addClass("img-square");
                $(".vmk-product").eq(i).find(".lazy-photo").css({ "top": "-20%" });
            }

    }

}



function _scrollTop() {


    $('html,body').animate({
        scrollTop: 0
    }, 1000);

}

