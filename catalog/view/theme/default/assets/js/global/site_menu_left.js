!function (window, document, $) {
    "use strict";
    $('.button-menu-mobile').on('click', function (e) {
        e.preventDefault();
        var newURL = window.location.protocol + "//" + window.location.host + "/" + window.location.pathname;
        var pathArray = window.location.pathname.split("/");
        var secondLevelLocation = pathArray[5];
        $("body").toggleClass("left-menu-icon").toggleClass("fixed-sidebar");
//	$('.left-side-menu').animate({
//	   'width': 90 
//	});
        if ($(window).width() > 767) {
            if ($("body").hasClass("left-menu-icon") != "") {
                if ($("body").hasClass("site-menu-top") == "") {
                    if (secondLevelLocation == "index.html" || secondLevelLocation == "index.html" || secondLevelLocation == "dashboard_v3.html" || secondLevelLocation == "" || secondLevelLocation == "dashboard_left_menu.html" || secondLevelLocation == "dashboard_left_top.html") {
                        $(".navbar-brand img").attr("src", "catalog/view/theme/default/img/logo.png");
                    } else {
                        $(".navbar-brand img").attr("src", "catalog/view/theme/default/img/logo_res.png");
                    }
                }
                $(".sidebar-menu .has-sub").removeClass("active");
                $(".sidebar-menu .has-sub ul").removeClass("show");
            } else {
                if (secondLevelLocation == "index.html" || secondLevelLocation == "index.html" || secondLevelLocation == "dashboard_v3.html" || secondLevelLocation == "" || secondLevelLocation == "dashboard_left_menu.html" || secondLevelLocation == "dashboard_left_top.html") {
                    $(".navbar-brand img").attr("src", "assets/images/logo.png");
                } else {
                    $(".navbar-brand img").attr("src", "catalog/view/theme/default/img/logo.png");
                }
            }
        }
        setTimeout(function () {
            $(window).trigger('resize');
        }, 300);

    });

    $('.sidebar-menu .has-sub a').on('click', function () {
        var $this = $(this).parent('li');
        if ($this.has('ul')) {
            if ($this.hasClass('active')) {
                $this.removeClass('active');
                $this.children('ul').removeClass('show');
                return;
            }
            $this.addClass('active');
            $this.children('ul').addClass('show');

        }
        ;
        var $body = $("body");
    });

    function mobileViewUpdate() {
        var viewportWidth = $(window).width();
        if (viewportWidth < 991) {
            if (!$('body').hasClass('fixed-sidebar')) {
                $("body").addClass("left-menu-icon");
//                setTimeout(function () {
//                    $(window).trigger('resize');
//                }, 300);
            }
        } else {
            if (!$('body').hasClass('fixed-sidebar')) {
                $("body").removeClass("left-menu-icon");
            }
        }
    }

    $(window).load(mobileViewUpdate);
    $(window).resize(mobileViewUpdate);

    $(".has-sub").on("mouseover", function () {
        if ($("body").hasClass("left-menu-icon") == true) {
            $(this).children('ul').removeAttr('style');
            var link = $(this).children('ul.site-menu-sub');
            var offset = link.offset().top;
            var doc_height = $(window).height();
            var menu_height = link.height();
            var scollred_height = $(document).scrollTop();
            var offsetss = doc_height - menu_height - offset - 30 + scollred_height;

            if (offsetss < 0) {
                $(link).css("top", offsetss + "px");
            }
        }
    });
}(window, document, jQuery);