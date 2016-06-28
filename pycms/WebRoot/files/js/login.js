$(function(){
    if(/msie/.test(navigator.userAgent.toLowerCase())) {
        $.growl('<strong>提示：</strong>请使用搜狗（高速模式）、360（极速模式）、猎豹、Chrome、Safari或Opera等现代浏览器访问该系统', {
            type: 'warning',
            delay: 0,
            allow_dismiss: false
        });
    }
//    $.growl('陪育100出新招啦！发消息即可获得海量积分，<br>多发多得，手机客户端与网站后台同享积分奖励！', {
//        type: 'success',
//        delay: 0,
//        allow_dismiss: false,
//        placement: {
//            from: "bottom",
//            align: "center"
//        }
//    });
    var $form = $('.form-signin');
    $form.submit(function(){
        $form.find('button').button('loading');
    });
    if($('[name=auto-load]').length > 0) {
        $form.submit();
    }
});