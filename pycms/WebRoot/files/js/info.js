$(function(){
    var tabChange = function(name) {
        $('.list>li.' + name).addClass('on').siblings().removeClass('on');
        $('.' + name + '-form').show().siblings().hide();
    };
    var checkHash = function() {
        if(window.location.hash === '#avatar') {
            tabChange('avatar');
        } else if(window.location.hash === '#password') {
            tabChange('password');
        } else {
            tabChange('base');
        }
    };
    $(window).on('hashchange', function(){
        checkHash();
    });
    checkHash();

    $('#info-birth, #homework-send-time').datetimepicker({
        'todayHighlight': true,
        'format': 'yyyy-mm-dd',
        'minView': 'month',
        'language': 'zh-CN',
        'autoclose': true
    });

    var jcrop_api;
    $('#avatar-upload').fileupload({
        url: host + '/info/change_avatar',
        dropZone: null,
        add: function(e, data) {
            var uploadErrors = [];
            var acceptFileTypes = /(\.|\/)(gif|jpe?g|png)$/i;
            if(data.originalFiles[0]['name'].length && !acceptFileTypes.test(data.originalFiles[0]['name'])) {
                uploadErrors.push('只支持JPG、JPEG、PNG、GIF格式');
            }
            if(data.originalFiles[0]['size'] && data.originalFiles[0]['size'] > 512000) {
                uploadErrors.push('文件必须小于500KB');
            }
            if(uploadErrors.length > 0) {
               commModal.alert({content:uploadErrors.join("\n")});
            } else {
//                var reader = new FileReader();
//                reader.onload = function(e) {
//                    $('#avatar-image').attr('src', e.target.result);
//                };
//                reader.readAsDataURL(data.files[0]);
//                data.submit();


                var reader = new FileReader();
                reader.onload = function(e) {
                    var image = new Image();
                    image.src = e.target.result;
                    image.onload = function () {
                        $('#btn-avatar-submit').removeClass('hide');

                        if(typeof jcrop_api !== 'undefined') {
                            jcrop_api.destroy();
                        }
                        var boundx,
                            boundy,

                            // Grab some information about the preview pane
                            $preview = $('#preview-pane').show(),
                            $pcnt = $('#preview-pane .preview-container'),
                            $pimg = $('#preview-pane .preview-container img'),

                            xsize = $pcnt.width(),
                            ysize = $pcnt.height();

                        $pimg.attr('src', e.target.result);
                        var updatePreview = function(c) {
                            if (parseInt(c.w) > 0) {
                                var rx = xsize / c.w;
                                var ry = ysize / c.h;

                                $pimg.css({
                                    width: Math.round(rx * boundx) + 'px',
                                    height: Math.round(ry * boundy) + 'px',
                                    marginLeft: '-' + Math.round(rx * c.x) + 'px',
                                    marginTop: '-' + Math.round(ry * c.y) + 'px'
                                });
                            }
                        };
                        $('#avatar-image').attr('style', '').attr('src', e.target.result).Jcrop({
                            aspectRatio: 1,
                            onSelect: function(c){
                                data.formData = {
                                    x: c.x,
                                    y: c.y,
                                    w: c.w,
                                    h: c.h
                                };
                                updatePreview(c);
                            }
                        }, function(){
                            // Use the API to get the real image size
                            var bounds = this.getBounds();
                            boundx = bounds[0];
                            boundy = bounds[1];
                            // Store the API in the jcrop_api variable
                            jcrop_api = this;

                            // Move the preview into the jcrop container for css positioning
//                            $preview.appendTo(jcrop_api.ui.holder);
                            jcrop_api.setSelect([ 0, 0, 200, 200 ]);
                        });
                        $('#btn-avatar-submit').on('click', function(){
                            $(this).prop('disabled', true);
                            data.submit();
                        });
                    };
                };
                reader.readAsDataURL(data.files[0]);
            }
        },
        dataType: 'json',
        done: function (e, data) {
            $('#btn-avatar-submit').prop('disabled', false).addClass('hide');
            if(data.result.success) {
               commModal.alert({content:'修改成功'});
                window.location.reload();
            } else {
                commModal.alert({content:data.result.msg});
            }
        }
    });


    /*$('#btn-get-code').on('click', function(){
    	alert("进入");
        var $this = $(this);
        $this.prop('disabled', true);
        try {
            var mobile = $.trim($('#info-mobile').val());
            if(mobile.length > 0) {
                var mobile_regex = /^1\d{10}$/;
                if(!mobile_regex.test(mobile)) {
                    throw '请输入正确的手机号';
                }
            } else {
                throw '请输入手机号';
            }
        } catch(err) {
           commModal.alert({content:err});
            return false;
        }
        alert("1="+host);
        $.getJSON(host + '/info/send_mobile_code/' + mobile, function(res){
            if(res.success) {
                var time = 61;
                var limit_timer = function() {
                    time--;
                    if(time > 0) {
                        $this.text(time + '秒后重试');
                        setTimeout(limit_timer, 1000);
                    } else {
                        $this.text('获取短信验证码');
                        $this.prop('disabled', false);
                    }
                };
                limit_timer();
            } else {
                $this.prop('disabled', true);
              commModal.alert({content:res.msg});
            }
        });
    });*/
    
    function   codeClick(){
    	alert("进入");
        var $this = $(this);
        $this.prop('disabled', true);
        try {
            var mobile = $.trim($('#info-mobile').val());
            if(mobile.length > 0) {
                var mobile_regex = /^1\d{10}$/;
                if(!mobile_regex.test(mobile)) {
                    throw '请输入正确的手机号';
                }
            } else {
                throw '请输入手机号';
            }
        } catch(err) {
           commModal.alert({content:err});
            return false;
        }
        alert("1="+host);
        $.getJSON(host + '/info/send_mobile_code/' + mobile, function(res){
            if(res.success) {
                var time = 61;
                var limit_timer = function() {
                    time--;
                    if(time > 0) {
                        $this.text(time + '秒后重试');
                        setTimeout(limit_timer, 1000);
                    } else {
                        $this.text('获取短信验证码');
                        $this.prop('disabled', false);
                    }
                };
                limit_timer();
            } else {
                $this.prop('disabled', true);
              commModal.alert({content:res.msg});
            }
        });
    }
    
    $('#btn-base-submit').on('click', function(){
        var data = {};
        try {
            data.name = $.trim($('#info-name').val());
            data.nickname = $.trim($('#info-nickname').val());
            data.gender = $('#info-gender').val();
            data.birth = $('#info-birth').val();
            var mobile = $.trim($('#info-mobile').val());
            if(data.name.length === 0) {
                throw '请输入姓名';
            }
            if(mobile.length > 0) {
                var mobile_regex = /^1\d{10}$/;
                if(!mobile_regex.test(mobile)) {
                    throw '请输入正确的手机号';
                } else {
                    var mobile_code = $.trim($('#info-mobile-code').val());
                    if(mobile_code.length === 0 ) {
                        throw '请输入手机验证码';
                    }
                    data.mobile = mobile;
                    data.vcode = mobile_code;
                }
            }
        } catch(err) {
        	commModal.alert({content:err});
            return false;
        }
        var $btn = $('#btn-base-submit').button('loading');
        $.post(host + '/info/change_base_info', {'data': JSON.stringify(data)}, function(res){
            if(res.success) {
              commModal.alert({content:'修改成功'});
                window.location.reload();
            } else {
                commModal.alert({content:res.msg});
                $btn.button('reset');
            }
        }, 'json');
    });
    $('#btn-password-submit').on('click', function(){
        var data = {};
        try {
            data.ori_password = $('#info-old-password').val();
            data.new_password = $('#info-new-password').val();
            var new_password_sure = $('#info-new-password-sure').val();
            if(data.ori_password.length < 0) {
                throw '旧密码填写错误，请重新输入！';
            }
            if(data.new_password.length < 0) {
                throw '请输入新密码';
            }
            if(data.new_password.length < 6) {
                throw '密码规定6-16字符，您输入的不符合规则，请重试';
            }
            if(data.new_password !== new_password_sure) {
                throw '您的新密码两次输入不一致，请重新输入！';
            }
        } catch(err) {
           commModal.alert({content:err});
            return false;
        }
        var $btn = $('#btn-password-submit').button('loading');
        $.post(host + '/info/change_password', {'data': JSON.stringify(data)}, function(res){
            if(res.success) {
              commModal.alert({content:'密码修改成功！'});
                window.location.reload();
            } else {
             commModal.alert({content:res.msg});
                $btn.button('reset');
            }
        }, 'json');
    });
});