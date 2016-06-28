//Loads the correct sidebar on window load,
//collapses the sidebar on window resize.
// Sets the min-height of #page-wrapper to window size

$(function () {
    $('#side-menu').metisMenu();
    var topOffset = 50;
    var width = (window.innerWidth > 0) ? window.innerWidth : screen.width;
    $('.nav-second-level').removeClass('hide');
    var height = (window.innerHeight > 0) ? window.innerHeight : screen.height;
    var height = height - topOffset;
    var navi_height = $('#side-menu').height() + 160;
    if (height < 1) height = 1;
    if (height > topOffset && height > navi_height) {
        $("#page-wrapper").css("min-height", (height) + "px");
    } else {
        $("#page-wrapper").css("min-height", (navi_height) + "px");
    }

    //IE也能用textarea
    $("textarea[maxlength]").keyup(function () {
        var area = $(this);
        var max = parseInt(area.attr("maxlength"), 10); //获取maxlength的值

        if (max > 0) {
            if (area.val().length > max) { //textarea的文本长度大于maxlength
                area.val(area.val().substr(0, max)); //截断textarea的文本重新赋值
            }
        }

    });
    //复制的字符处理问题
    $("textarea[maxlength]").blur(function () {
        var area = $(this);
        var max = parseInt(area.attr("maxlength"), 10); //获取maxlength的值

        if (max > 0) {
            if (area.val().length > max) { //textarea的文本长度大于maxlength
                area.val(area.val().substr(0, max)); //截断textarea的文本重新赋值
            }
        }
    });

    window.host = $('#wrapper').attr('data-host');
    window.static = $('#wrapper').attr('data-static');
    window.role = $('#wrapper').attr('data-role');


    window.htmlEncode = function(str){
        return $('<div/>').text(str).html();
    };

    var $body = $("body");
    $body.on('click', 'input[type=radio]', function () {
        var $this = $(this);
        $this.addClass("checked").siblings().removeClass("checked");
    });

    $("input[type=checkbox]").click(function () {
        if ($(this).prop("checked")) {
            $(this).addClass("checked");
        } else {
            $(this).removeClass("checked");
        }
    });
    $("input[type='radio']").on('click', function () {
        $(this).addClass("checked");
        $(this).parent().siblings().children('input[type="radio"]').removeClass('checked');
    });

    $('.toggle-class .dropdown-menu').on('click', '[data-class-id]', function () {
        $('.toggle-class .dropdown-toggle>span').text($(this).find('span').text());
        $.post(host + '/user/change_class', {'class_id': $(this).attr('data-class-id')}, function () {
            window.location.reload();
        }, 'json');
    });

    window.showDownloadClientDialog = function () {
        $('#download-client-modal').modal('show');
    };

    if ($('html').is('.lt-ie9')) {
        $('[data-download-client=1]').click(function () {
            showDownloadClientDialog();
            return false;
        });
    }

    window.commModal = {
        'alert': function (options) {
            var $body = $('body');
            $body.append('\<div class="overlay"></div><div class="common-modal"><div class="common-modal-body"></div><div class="common-modal-action"></div></div>');
            var $modal = $('.common-modal');
            var $overlay = $('.overlay');
            $modal.children('.common-modal-body').html(options.content ? options.content : '');
            $modal.children('.common-modal-action')
                .html(options.btnHtml ? options.btnHtml : '确&nbsp;&nbsp;定')
                .off('click').on('click', function () {
                    $body.removeClass('overflow-hidden');
                    $modal.remove();
                    $overlay.remove();
                    if (options.btnClick) {
                        options.btnClick();
                    }
                });
            $body.addClass('overflow-hidden');
            $modal.show();
            $overlay.show();
        },
        'confirm': function (options) {
            var $body = $('body');
            $body.append('\<div class="overlay"></div><div class="common-modal"><div class="common-modal-body"></div><div class="common-modal-cancel"></div><div class="common-modal-sure"></div></div>');
            var $modal = $('.common-modal');
            var $overlay = $('.overlay');
            $modal.children('.common-modal-body').html(options.content ? options.content : '');
            $modal.children('.common-modal-sure')
                .html(options.btnHtml ? options.btnHtml : '确&nbsp;&nbsp;定')
                .off('click').on('click', function () {
                    $body.removeClass('overflow-hidden');
                    $modal.remove();
                    $overlay.remove();
                    if (options.btnClick) {
                        options.btnClick();
                    }
                });
            $modal.children('.common-modal-cancel')
                .html(options.cancelHtml ? options.cancelHtml : '取&nbsp;&nbsp;消')
                .off('click').on('click', function () {
                    $body.removeClass('overflow-hidden');
                    $modal.remove();
                    $overlay.remove();
                    if (options.cancelClick) {
                        options.cancelClick();
                    }
                });
            $body.addClass('overflow-hidden');
            $modal.show();
            $overlay.show();
        }
    };

    var can_notification = false;
    if ('Notification' in window && 'localStorage' in window) {
        if (Notification.permission === 'granted') {
            can_notification = true;
        }
        Notification.requestPermission(function (permission) {
            if (permission === "granted") {
                can_notification = true;
            }
        });
    }
    var $newmessage = $('#newmessage');
    var notification_img = static + 'img/icon-logo-128.png';
    var heartbeat_notification;
    var toggle_class_blink;
    var checkRedPoint = function () {
        $.get(host + '/api/heartbeat', function (res) {
            window.setTimeout(checkRedPoint, 15000);
            if (res) {
                if (res.message.sum >= 1) {
                    $newmessage.show();
                } else {
                    $newmessage.hide();
                }
                if (res.class_feed.classes.length > 0) {
                    if (!toggle_class_blink) {
                        toggle_class_blink = setInterval(function () {
                            $('.toggle-class .dropdown-toggle').toggleClass('blink-color');
                        }, 500);
                    }
                    $('.toggle-class [data-class-id]').each(function () {
                        var $this = $(this);
                        var class_id = $this.attr('data-class-id');
                        var $red_dot = $this.find('.class-red-dot');
                        if ($.inArray(class_id, res.class_feed.classes) === -1) {
                            $red_dot.addClass('hide');
                        } else {
                            $red_dot.removeClass('hide');
                        }
                    });
                } else {
                    clearInterval(toggle_class_blink);
                    $('.toggle-class .dropdown-toggle').removeClass('blink-color');
                }
                if (can_notification && res.title) {
                    var last_id = localStorage.getItem('heartbeat_last_id');
                    if (!last_id || res.last_id > last_id) {
                        window.localStorage.setItem('heartbeat_last_id', res.last_id);
                        heartbeat_notification = new Notification(res.title, {
                            icon: notification_img,
                            tag: 'heartbeat'
                        });
                        heartbeat_notification.onclick = function () {
                            window.location.href = res.url;
                        };
                    }
                }
            }
        }, 'json');
    };
    if (role !== 'cs') {
        checkRedPoint();
    }
});


$('#start-date, #end-date').datetimepicker({
    'todayHighlight': true,
    'format': 'yyyy-mm-dd',
    'minView': 'month',
    'language': 'zh-CN',
    'autoclose': true
});


