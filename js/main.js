(function($) {
    //"use strict";

    var luxita = luxita || {};

    luxita = {
        
        init: function(){
            
            this.resize();
            this.activeMenu();
            this.MenuMobile();
            this.SliderRecomment();
            this.SliderNews();
            this.SliderProductmedia();
            //this.SliderBrand();
            this.Tabs();
            this.Hamburgers();
            this.removeMenuMobile();
            this.FilterMobile();
            this.SliderBannerLogo();
            this.SliderSwatches();
            this.SliderStores();
            this.FilterExpand();
            this.ScrollTest();
            this.PopupCheckout();
            this.PromoTop();
        },
        resize: function(){
            this.handleOnResize();
            //this.SliderBannerLogo();
            //this.SliderBrand();
            
            this.hideMenuMobile();
        },

        activeMenu: function(){
          // var pgurl = window.location.href.substr(window.location.href.lastIndexOf("/")+1);
          //  $("nav li").each(function(){
          //       if($('a',this).attr("href") == pgurl || $('a', this).attr("href") == '' )
          //       $(this).addClass("active");
          //  })
        },

        Hamburgers: function(){
          var forEach=function(t,o,r){if("[object Object]"===Object.prototype.toString.call(t))for(var c in t)Object.prototype.hasOwnProperty.call(t,c)&&o.call(r,t[c],c,t);else for(var e=0,l=t.length;l>e;e++)o.call(r,t[e],e,t)};

          var hamburgers = document.querySelectorAll(".hamburger");
          if (hamburgers.length > 0) {
            forEach(hamburgers, function(hamburger) {
              hamburger.addEventListener("click", function() {
                this.classList.toggle("is-active");
              }, false);
            });
          }
        },

        MenuMobile: function(){
          $('body .gridContainer').prepend('<div class="hamburger hamburger--slider"><div class="hamburger-box"><div class="hamburger-inner"></div></div></div>');
          //$('body .main-menu').prepend('<a class="mobile_nav_close" href="#"><span class="icon-arrows_remove"></span>Close</a>');
          $('body').on('click', '.hamburger', function(e) {
            e.preventDefault();
            $('html,body').toggleClass('mobile');
            $('body .main-menu').toggleClass('mobile');
            if(!$('.hamburger').hasClass('is-active')){
              $('nav').removeClass('submenu-open');
              //$('nav ul div.submenu').children('.submenu').removeClass('active');
              $('nav ul div.submenu').removeClass('active');
            }
          });
          // $('body .main-menu').on('click', '.mobile_nav_close', function(e) {
          //   e.preventDefault();
          //   $('body').toggleClass('mobile');
          //   $('body .main-menu').toggleClass('mobile');
          // });
          $('nav ul li').find('li').on('click', '.sub-icon', function(e) {
            e.preventDefault();
            //e.stopPropagation();
            //$(this).parents('li').toggleClass('selector');
          });

          $('nav ul div.submenu').each(function(){
              var label = $(this).parent().children('a').text();
              var destination = $(this).parent().children('a').attr('href');
              //console.log(label);
              $(this).prepend(
                  $('<div/>')
                      .addClass('view-all')
                      .append(
                          $('<a>')
                              .attr('href', destination)
                              .text('View All ' + label)
                      )
              ).prepend(
                  $('<div/>')
                      .addClass('control')
                      .append(
                          $('<a>')
                              .attr('href', '#')
                              .addClass('back')
                              .text(label)
                      )
              );
          });

          $('nav ul > li.parent').on('click', function(e) {
            //e.preventDefault();
            //$('#mobile-menu').scrollTop(0);
            $('nav').addClass('submenu-open');
            // $(this).toggleClass('selector');
            $(this).children('.submenu').addClass('active');
          });

          $('nav a.back').click(function(e){
              e.preventDefault();
              e.stopPropagation();

              if ( $(this).closest('.submenu').parent().closest('.submenu').hasClass('submenu-open') ) {
                  $(this).closest('.submenu').parent().closest('.submenu').removeClass('submenu-open');
              }

              if ( $(this).closest('.submenu').hasClass('level0') || ($(this).closest('nav').length > 0) ) {
                  $('nav').removeClass('submenu-open');
              }

              $(this).closest('.submenu').removeClass('active');
          });
        },

        hideMenuMobile: function(){
          if ( $(window).width() > 768 ){
            $('html,body').removeClass('mobile');
            $('body .main-menu').removeClass('mobile');
            $('.hamburger').removeClass('is-active');
            $('nav').removeClass('submenu-open');
            // $('nav ul > li.parent').removeClass('selector');
            $('nav ul div.submenu').removeClass('active');
            return false;
          }       
        },

        removeMenuMobile: function(){
          $(document).on('click touchstart', function(e) {
              if(!$(e.target).closest('.main-menu, .hamburger').length && !$(e.target).is('.main-menu, .hamburger')) {
                $('html,body').removeClass('mobile');
                $('body .main-menu').removeClass('mobile');
                $('.hamburger').removeClass('is-active');
                $('nav').removeClass('submenu-open');
                // $('nav ul > li.parent').removeClass('selector');
                $('nav ul div.submenu').removeClass('active');
              }
          });
        },

        FilterExpand: function(){
          $(document).on('click', '.filter-options h3', function(event) {
            event.preventDefault();
            /* Act on the event */
            $(this).parent('.item').find('ul').slideToggle(function(){
                //$('this').getNiceScroll().resize();
            });
            $(this).toggleClass('hide');
          });
        },

        ScrollBlock: function(){
          if($('.filter-options ul > li').length>10){
            $('.filter-options ul').niceScroll();
          }
        },

        ScrollTest: function(){
          //$(".BoxScroll").niceScroll(".wrap");
        },

        FilterMobile: function(){
          $('.sidebar').on('click', '.title', function(event) {
            event.preventDefault();
            $(this).toggleClass('active');
            $('.filter-main').toggleClass('open');
          });
        },

        Tabs: function(){
            $( "#tabs" ).tabs({
              collapsible: true,
              active: 0
            });
        },

        PromoTop: function(){
            $('.promo-block').marquee({
                duration: 20000,
                gap: 0,
                delayBeforeStart: 0,
                direction: 'left',
                duplicated: true
            });

            // if(!$('.promo-block ul').hasClass('slick-initialized')){
            //     $('.promo-block ul').slick({
            //       infinite: true,
            //       slidesToShow: 1,
            //       slidesToScroll: 1,
            //       speed: 600,
            //       arrows: false,
            //       dots: false,
            //       autoplay: true,
            //       autoplaySpeed: 4500,
            //       fade: true
            //     });
            // }
        },

        SliderBanner: function(){
            if(!$('.home-banner').hasClass('slick-initialized')){
                $('.home-banner').slick({
                  infinite: true,
                  speed: 500,
                  arrows: false,
                  dots: false,
                  autoplay: true,
                  autoplaySpeed: 4500,
                  customPaging: function(slider, i) {
                    return $('<span class="dot"></span>').text(i + 1);
                  }
                });
            }
        },

        SliderBannerLogo: function(){
            if(!$('.logo-dot-banner').hasClass('slick-initialized')){
                $('.logo-dot-banner > ul').slick({
                  infinite: false,
                  slidesToShow: 4,
                  slidesToScroll: 4,
                  arrows: false,
                  dots: false,
                  lazyLoad: 'onDemand',
            
                  responsive: [
                    {
                      breakpoint: 5000,
                      settings: 'unslick'
                    },
                    {
                      breakpoint: 768,
                      settings: {
                        arrows: false,
                        dots: false,
                        slidesToShow: 3,
                        slidesToScroll: 3
                      }
                    }
                  ]
                });
            }
        },

        SliderRecomment: function(){
            if(!$('.slider-cdp .items').hasClass('slick-initialized')){
                $('.slider-cdp .items').slick({
                  infinite: false,
                  slidesToShow: 4,
                  slidesToScroll: 4,
                  arrows: true,
                  dots: false,
                  //fade: true,
                  prevArrow: '<div data-role="none" class="slick-prev" aria-label="previous">Previous</div>',
                  nextArrow: '<div data-role="none" class="slick-next" aria-label="next">Next</div>',
                  customPaging: function(slider, i) {
                    return $('<span class="dot"></span>').text(i + 1);
                  },
                  responsive: [
                    {
                      breakpoint: 1024,
                      settings: {
                        slidesToShow: 3,
                        slidesToScroll: 3
                      }
                    },
                    {
                      breakpoint: 600,
                      settings: {
                        slidesToShow: 2,
                        slidesToScroll: 2
                      }
                    },
                    {
                      breakpoint: 480,
                      settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1
                      }
                    }
                  ]
                });
            }
        },

        SliderNews: function(){
            if(!$('.slider-news .items').hasClass('slick-initialized')){
                $('.slider-news .items').slick({
                  infinite: false,
                  slidesToShow: 4,
                  slidesToScroll: 4,
                  arrows: true,
                  dots: false,
                  //fade: true,
                  prevArrow: '<div data-role="none" class="slick-prev" aria-label="previous">Previous</div>',
                  nextArrow: '<div data-role="none" class="slick-next" aria-label="next">Next</div>',
                  customPaging: function(slider, i) {
                    return $('<span class="dot"></span>').text(i + 1);
                  },
                  responsive: [
                    {
                      breakpoint: 1024,
                      settings: {
                        slidesToShow: 3,
                        slidesToScroll: 3
                      }
                    },
                    {
                      breakpoint: 600,
                      settings: {
                        slidesToShow: 2,
                        slidesToScroll: 2
                      }
                    },
                    {
                      breakpoint: 480,
                      settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1
                      }
                    }
                  ]
                });
            }
        },

        SliderBrand: function(){
            if(!$('.brand-block').hasClass('slick-initialized')){
                $('.brand-block').slick({
                  infinite: false,
                  slidesToShow: 4,
                  slidesToScroll: 4,
                  arrows: true,
                  lazyLoad: 'onDemand',
                  //fade: true,
                  prevArrow: '<div data-role="none" class="slick-prev" aria-label="previous">Previous</div>',
                  nextArrow: '<div data-role="none" class="slick-next" aria-label="next">Next</div>',
                  customPaging: function(slider, i) {
                    return $('<span class="dot"></span>').text(i + 1);
                  },
                  responsive: [
                    {
                      breakpoint: 5000,
                      settings: 'unslick'
                    },
                    {
                      breakpoint: 1200,
                      settings: {
                        arrows: false,
                        dots: true,
                        slidesToShow: 4,
                        slidesToScroll: 4
                      }
                    },
                    {
                      breakpoint: 1050,
                      settings: {
                        arrows: false,
                        dots: true,
                        slidesToShow: 3,
                        slidesToScroll: 3
                      }
                    },
                    {
                      breakpoint: 768,
                      settings: {
                        arrows: false,
                        dots: true,
                        slidesToShow: 2,
                        slidesToScroll: 2
                      }
                    },
                    {
                      breakpoint: 480,
                      settings: {
                        arrows: false,
                        dots: true,
                        slidesToShow: 1,
                        slidesToScroll: 1
                      }
                    }
                  ]
                });
            }
        },

        SliderBrandMenu: function(){

        },

        SliderProductmedia: function(){
            if(!$('.slider-pdp .items').hasClass('slick-initialized')){
                $('.slider-pdp .items').slick({
                  infinite: false,
                  slidesToShow: 1,
                  slidesToScroll: 1,
                  arrows: true,
                  //fade: true,
                  prevArrow: '<div data-role="none" class="slick-prev" aria-label="previous">Previous</div>',
                  nextArrow: '<div data-role="none" class="slick-next" aria-label="next">Next</div>',
                  asNavFor: '.items-thumbnails',
                  responsive: [
                    {
                      breakpoint: 768,
                      settings: {
                        arrows: false,
                        dots: false,
                        customPaging: function(slider, i) {
                          return $('<span class="dot"></span>').text(i + 1);
                        }
                      }
                    }
                  ]
                });
                $('.items-thumbnails').slick({
                  infinite: false,
                  slidesToShow: 3,
                  slidesToScroll: 3,
                  arrows: false,
                  //fade: true,
                  prevArrow: '<div data-role="none" class="slick-prev" aria-label="previous">Previous</div>',
                  nextArrow: '<div data-role="none" class="slick-next" aria-label="next">Next</div>',
                  asNavFor: '.slider-pdp .items',
                  //centerMode: true,
                  focusOnSelect: true
                });
            }
        },

        SliderSwatches: function(){
            if(!$('ul.image-color').hasClass('slick-initialized')){
                
                $('.swatch-option .title h4').append('<small></small>');
                var status = $('.swatch-option small');
                $('ul.image-color').on('init', function (event, slick) {
                  status.text(slick.slideCount + ' color');
                });
                $('ul.image-color').slick({
                  infinite: false,
                  slidesToShow: 5,
                  slidesToScroll: 5,
                  arrows: true,
                  dots: false,
                  //fade: true,
                  prevArrow: '<div data-role="none" class="slick-prev" aria-label="previous">Previous</div>',
                  nextArrow: '<div data-role="none" class="slick-next" aria-label="next">Next</div>',
                  customPaging: function(slider, i) {
                    return $('<span class="dot"></span>').text(i + 1);
                  },
                  responsive: [
                    {
                      breakpoint: 1024,
                      settings: {
                        slidesToShow: 4,
                        slidesToScroll: 4
                      }
                    },
                    {
                      breakpoint: 768,
                      settings: {
                        slidesToShow: 3,
                        slidesToScroll: 3
                      }
                    }
                  ]
                });



            }
        },

        SliderStores: function(){
            if(!$('.contact_slider').hasClass('slick-initialized')){
                $('.sliderStore').slick({
                  infinite: false,
                  slidesToShow: 1,
                  slidesToScroll: 1,
                  arrows: true,
                  dots: false,
                  //fade: true,
                  prevArrow: '<div data-role="none" class="slick-prev" aria-label="previous">Previous</div>',
                  nextArrow: '<div data-role="none" class="slick-next" aria-label="next">Next</div>',
                  customPaging: function(slider, i) {
                    return $('<span class="dot"></span>').text(i + 1);
                  }
                });



            }
        },

        

        // MagicZoomProduct: function(){
        //   if($('.product-media').length>0){
        //     MagicZoom.options = {
        //         'opacity': 30,
        //         'drag-mode': true,
        //         'show-title': 'bottom'
        //     };
        //   }
        // },

        MagicZoomProduct: function(){
          if($('.product-media').length>0){
            var mzOptions = {
              lazyZoom: true,
              smoothing : true,
              zoomPosition: 'inner', 
              hint: 'always'
            };
            mzOptions = {
                onZoomReady: function() {
                    console.log('onReady', arguments[0]);
                },
                onUpdate: function() {
                    console.log('onUpdated', arguments[0], arguments[1], arguments[2]);
                },
                onZoomIn: function() {
                    console.log('onZoomIn', arguments[0]);
                },
                onZoomOut: function() {
                    console.log('onZoomOut', arguments[0]);
                },
                onExpandOpen: function() {
                    console.log('onExpandOpen', arguments[0]);
                },
                onExpandClose: function() {
                    console.log('onExpandClosed', arguments[0]);
                }
            };

            var MagicScrollOptions = {
              items : 'fit',
              mode : 'scroll',
              width: 400,
              height: 60,
              speed: 2000,
              arrows: 'inside',
              loop: 'rewind',
              lazyLoad : true,
            };
            var MagicScrollMobileOptions = {
              //orientation:'horizontal'
            };
            MagicScrollOptions = {
                onReady: function () {
                    console.log('onReady', arguments[0]);
                },
                onStop: function () {
                    console.log('onStop', arguments[0]);
                },
                onItemHover: function () {
                    console.log('onItemHover', arguments[0]);
                },
                onItemOut: function () {
                    console.log('onItemOut', arguments[0]);
                },
                onMoveStart: function () {
                    console.log('onMoveStart', arguments[0]);
                },
                onMoveEnd: function () {
                    console.log('onMoveEnd', arguments[0]);
                }
            };
          }
        },

        handleOnResize: function(){
  	      var resize;
  	      var self = this;

  	      $(window).on('resize', function(){

  	        self.wWidth = $(window).width();
  	        self.wHeight = $(window).height();

  	        if (resize) {
  	          clearTimeout(resize);
  	        }

  	        resize = setTimeout(function() {
  	          self.resize();
  	        }, 200);

  	      });
  	    },

  	    Sticky: function(){
          var didScroll;
          var lastScrollTop = 0;
          var delta = 5;
          var navbarHeight = $('header').outerHeight();

          $(window).scroll(function(event){
              didScroll = true;
          });

          setInterval(function() {
              if (didScroll) {
                  hasScrolled();
                  didScroll = false;
              }
          }, 250);

          function hasScrolled() {
              var st = $(this).scrollTop();
              
              if(Math.abs(lastScrollTop - st) <= delta)
                  return;
              
              if (st > lastScrollTop && st > navbarHeight){
                  $('header').removeClass('nav-down').addClass('nav-up');
              } else {
                  if(st + $(window).height() < $(document).height()) {
                      $('header').removeClass('nav-up').addClass('nav-down');
                  }
              }
              
              lastScrollTop = st;
          }
  	    },

        PopupCheckout: function(){
          $('.add-to-cart button').on('click', function() {
            $.fancybox.open( $('#checkoutModal'), {
              touch: true
            });
          });
        }
    }
    
    $(document).ready(function(){
        luxita.init();
        $(window).trigger('resize').trigger('scroll');
          
    });

    $(window).on("load", function (e) {
      //var nice = $('body').niceScroll();
      setTimeout(function(){
         
      }, 3000);

      $("img").each(function(){
          $(this).attr("onerror","this.src='images/default_img.jpg';");
      });

    });
  

})(jQuery);
