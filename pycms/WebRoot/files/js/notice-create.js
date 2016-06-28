$(function () {
    var edit = $('#is_edit').html();
    var notice_type = $('#page-wrapper').attr('data-type');
    var is_banner = $('#page-wrapper').attr('data-is-banner');
    var role = $('#page-wrapper').attr('data-role');
    var tabChange = function (name) {
        $('.list>li.' + name).addClass('on').siblings().removeClass('on');
        if(name === 'notice') {
            $('.notice-live-hide').show();
            $('.notice-live-show').hide();
        } else if(name === 'notice-live') {
            name = 'notice';
            $('.notice-live-hide').hide();
            $('.notice-live-show').show();
        }
        $('.forms>div.' + name).show().siblings().hide();
    };
    var file_list;
    var checkHash = function () {
        if (window.location.hash === '#vote') {
            tabChange('vote');
        } else if (window.location.hash === '#survey') {
            tabChange('survey');
        } else if (window.location.hash === '#survey-tpl') {
            tabChange('survey-tpl');
        } else if (window.location.hash === '#homework') {
            tabChange('homework');
        } else if (window.location.hash === '#notice-live') {
            tabChange('notice-live');
        } else {
            tabChange('notice');
        }
    };

    //添加选项option
    $('#page-wrapper').on('click', '.add-option', function () {
        newOption($(this).parents('.survey-question, #vote-option'));
    });
    $('#page-wrapper').on('focus', '.in-group input', function () {
        $(this).addClass('focus');
    });
    $('#page-wrapper').on('blur', '.in-group input', function () {
        $(this).removeClass('focus');
    });
    $('#page-wrapper').on('focus', '.survey-options input, .vote-options input', function () {
        if ($(this).parent().siblings().length > 1) {
            $(this).siblings('.btn-option-del').show();
        }
    }).on('blur', '.survey-options input, .vote-options input', function () {
        var $this = $(this);
        setTimeout(function () {
            $this.siblings('.btn-option-del').hide();
        }, 500);
    });
    $('#page-wrapper').on('click', '.question-edit .btn-del', function () {
        var $this = $(this);
        if ($this.parent().next().find('input').val()) {    //如果有数据的话，就提示删除
            /* if (!confirm("删除后将清空问题以及所有选项内容，确定删除？")) {
             return false;
             }*/

            commModal.confirm({
                content: "删除后将清空问题以及所有选项内容，确定删除？",
                btnClick: function () {
                    $this.parents('.survey-question').remove();
                    refreshQuestionNumber();
                }
            });
        } else {
            $this.parents('.survey-question').remove();
            refreshQuestionNumber();
        }
    });
    $('#page-wrapper').on('click', '.question-edit .btn-copy', function () {
        var $item = $(this).parents('.survey-question');
        $item.clone().insertAfter($item);
        refreshQuestionNumber();
        optionUploadInit();
    });
    $('#page-wrapper').on('click', '.btn-option-del', function () {
        var $this = $(this);
        if ($(this).next().next().val()) {//如果有数据的话，就提示删除
            /*if (!confirm("删除后将清空选项内容，确定删除？")) {
             return false;
             }*/
            commModal.confirm({
                content: "删除后将清空选项内容，确定删除？",
                btnClick: function () {
                    $this.parent().remove();
                    refreshOptionNumber();
                }
            });

        } else {
            $this.parent().remove();
            refreshOptionNumber();

        }


    });
    $('#page-wrapper').on('click', '.btn-file-del', function () {
		var $this=$(this);
        commModal.confirm({
            content: "确认要删除？",
            btnClick: function () {
                if(file_list){//上传文件过程中点击取消上传时，停止上传。
             		file_list.abort();
			    }
			    listLiAShow(0);
			    //判断是发送附件等待loading图片的时候，隐藏loading图片。
			    if ($this.parent().attr('class') && $this.parent().attr('class') !== 'option-image') {
					$this.parent().css('display', 'none');
			    } else {
					$this.parent().remove();
			    }
            }
        });
		
       
    });

    $(window).on('hashchange', function () {
        checkHash();
    });

    if (edit == 0) {
        var single_html = $('#data-survey-single').val();
        var multi_html = $('#data-survey-multi').val();
        var text_html = $('#data-survey-text').val();
    } else {
        var single_html = '';
        var multi_html = '';
        var text_html = '';
    }

    $("#survey-questions").sortable({
        axis: 'y',
        handle: '.survey-drop-area',
        start: function (event, ui) {
            $(ui.item).css('background', '#f8f8f8');
        },
        stop: function (event, ui) {
            $(ui.item).css('background', 'none');
        },
        update: function () {
            refreshQuestionNumber();
        }
    });
    var newQuestion = function (question_type, nums) {
        if (typeof question_type === 'undefined') {
            //获取单选框按钮的value的值
            question_type = $('[name=question-type]:checked').val();
        }
        if (edit != 0) {
            single_html = $('#data-survey-single' + nums).val();
            multi_html = $('#data-survey-single' + nums).val();
            text_html = $('#data-survey-single' + nums).val();
            if (eval(question_type + '_html')) {
                $('#survey-questions').append(eval(question_type + '_html'));
            } else {
                single_html = $('#data-survey-single').val();
                multi_html = $('#data-survey-multi').val();
                text_html = $('#data-survey-text').val();
                $('#survey-questions').append(eval(question_type + '_html'));
                $('#survey-questions>li:last .add-option').click().click();
            }
            //single_html   单选
            //multi_html    多选
            //text_html     填空题
            //alert('上边是添加单选标题的框框');
        } else {
            $('#survey-questions').append(eval(question_type + '_html'));
        }
        $('#survey-questions>li:last .survey-options').sortable({
            axis: 'y',
            handle: '.option-title',
            update: function (event, ui) {
                var question_order = $('.survey-question').index($(ui.item).parents('.survey-question'));
                refreshOptionNumber();
            }
        });
        if (edit == 0) {
            $('#survey-questions>li:last .add-option').click().click();
        }
        refreshQuestionNumber();
        optionUploadInit();
    };
    var newOption = function ($target) {
        var $options = $target.find('.survey-options, .vote-options');
        var number = $options.children().length + 1;
        if (number <= 30) {
            $options.append('<div class="in-group"><span class="fa fa-photo btn-option-upload fileinput-button"><input class="option-image-upload" type="file" name="file"></span><span class="btn-option-del fa fa-remove"></span><span class="option-title">选项' + number + '</span><input class="option" type="text" placeholder="60个汉字内" maxlength="60"></div>');
            optionUploadInit();
        } else {
            commModal.alert({content: '选项不能超过30个'});
        }
    };

    $('#survey-question-add').on('click', function () {
        newQuestion();
    });
    $('.vote-options').sortable({
        axis: 'y',
        handle: '.option-title',
        update: function (event, ui) {
            refreshOptionNumber();
        }
    });
    var refreshQuestionNumber = function () {
        var order = 0;
        $('.survey-question .left .question-order').each(function () {
            order++;
            $(this).text('Q' + order);
        });
    };
    var refreshOptionNumber = function () {
        var order;
        $('.survey-question, .vote-options').each(function () {
            order = 0;
            $(this).find('.option-title').each(function () {
                order++;
                $(this).text('选项' + order);
            });
        });
    };
    debugger; 
    $('#survey-submit').on('click', function () {
        submitSurveyData();
    });
    $('#vote-submit').on('click', function () {
        submitVoteData();
    });
    $('#notice-submit').on('click', function () {
        submitNoticeData();
    });
    $('#notice-live-submit').on('click', function () {
        submitNoticeData(true);
    });
    $('#notice-submit-compile').on('click', function () {
        var feed_id = $('#page-wrapper').attr('feed-id');
        var data = {};
        try {
            data.title = $.trim($('#notice-title').val());
            data.content = $('#notice-content').val().replace(/\s+$/, "");
            if (data.title == '') {
                $('#notice-title').focus();
                throw '请出入标题';
            }
            if (data.content == '') {
                $('#notice-content').focus();
                throw '请输入内容';
            }
        } catch (err) {
            commModal.alert({content: err});
            return false;
        }
        if ($('#files>li').length > 0) {
            data.files = [];
            $('#files>li').each(function () {
                var file_id = $(this).attr('data-file-id');
                data.files.push({
                    type: 1,
                    fid: file_id,
                    attri: 0
                });
            });
        }
        debugger; 
        var $btn = $('#notice-submit-compile').button('loading');
        $.post(host + '/all_addInfm', {'feed_id': feed_id, 'data': JSON.stringify(data)}, function (res) {
            if (res.success) {
                if (notice_type === 'banner') {
                    window.location.href = host + '/files/school.jsp';
                } else {
                    window.location.href = host + '/files/school.jsp';
                }
            } else {
                commModal.alert({content: res.msg});
                $btn.button('reset');
            }
        }, 'json');

    });
    $('#notice-submit-compile-cancel').on('click', function () {
        if (notice_type == 'banner') {
            window.location.href = host + '/notice/banner';
        } else {
            window.location.href = host + '/notice/school';
        }
    });

    if (edit == 0) {
        $('#notice-submit2').on('click', function () {
            if ($('#notice-submit2').attr('state') == 1) {        //咨询
                submitNoticeData();
            } else if ($('#notice-submit2').attr('state') == 2) {  //发投票
                submitVoteData();
            } else if ($('#notice-submit2').attr('state') == 3) {  //问卷
                submitSurveyData();
            } else if ($('#notice-submit2').attr('state') == 4) {  //作业
//          submitHomeworkData();//还没有呢
            }
        });
    }
    var share_survey_tpl_data;
    var survey_redirect;
    var can_share_survey;
    var submitSurveyData = function () {
        var data = {};
        share_survey_tpl_data = {};
        can_share_survey = true;
        try {
            data.title = $.trim($('#survey-title').val());
            if (data.title == '') {
                $('#survey-title').focus();
                throw '请输入问卷标题';
            }

            data.intro = $.trim($('#survey-intro').val());
            num = $("#survey-intro").val().length;
            if (num > 200) {
                $('#survey-intro').focus();
                throw('限制输入200字，请修改后重试');
            }

            data.start_time = $.trim($('#survey-start-date').val());
            if (data.start_time == '') {
                $('#survey-start-date').focus();
                throw '请选择生效时间';
            }
            data.end_time = $.trim($('#survey-end-date').val());
            if (data.end_time == '') {
                $('#survey-end-date').focus();
                throw '请选择生效时间';
            }
            if (data.end_time < data.start_time) {
                $('#survey-end-date').focus();
                throw '生效结束时间不能早于生效开始时间';
            }
            data.items = [];
            $('.survey-question').each(function () {
                var row_data = {};
                var $this = $(this);
                row_data.title = $.trim($this.find('.survey-question-title').val());
                if (row_data.title == '') {
                    $this.find('.survey-question-title').focus();
                    throw '请输入问题标题'
                }
                row_data.type = $this.find('.survey-question-type').attr('data-question-type');
                if (row_data.type != '3') {
                    row_data.options = [];
                    $this.find('.option').each(function () {
                        $that = $(this);
                        var content = $.trim($that.val());
                        var file_id = $that.siblings('.option-image').attr('data-file-id');
                        if (!content && !file_id) {
                            $that.focus();
                            throw '请输入选项内容';
                        } else {
                            var tmp = {content: '', files: []};
                            if (content) {
                                tmp.content = content;
                            }
                            if (file_id) {
                                can_share_survey = false;
                                tmp.files.push({
                                    type: 1,
                                    fid: file_id,
                                    attri: 0
                                });
                            }
                            row_data.options.push(tmp)
                        }
                    });
                }
                data.items.push(row_data);
            });

            if (data.items.length === 0) {
                throw '请至少输入一道问题。';
            }
            data.result_public = 0;
            if (notice_type === 'class') {
                data.target_cids = [];
                $.each(target_result, function (cid, name) {
                    data.target_cids.push(cid.substring(2));
                });
                if (data.target_cids.length === 0) {
                    throw '请选择发送对象';
                }
                data.target_group_ids = [];
                $('.selector-subtab input:checked').parent('li[data-type]').each(function () {
                    data.target_group_ids.push(Number($(this).attr('data-group-id')));
                });
                survey_redirect = '/';
            } else if (notice_type === 'school' || notice_type === 'banner') {
                data.push = $('#school-survey-push:checked').length;
                data.school_feed_target = {};
                data.school_feed_target.scope = $('#target-scope').val();
                data.school_feed_target.grade_id = $('#target-grade').val();
                if (role === 'school_admin') {
                    data.sub_tab_id = $('#target-tab').val();
                    if (data.sub_tab_id == '') {
                        $('#target-tab').focus();
                        throw '请选择所属Tab';
                    }
                } else if (role === 'edu' || role === 'admin') {
                    data.school_feed_target.school_type = $('#target-school-type').val();
                    data.school_feed_target.school_id = $('#target-school').val();
                } else if (role === 'district_admin') {
                    var schools = $('#target-school').val();
                    if (!schools) {
                        throw '请选择学校';
                    }
                    data.school_feed_target.school_id = schools.join(',');
                }
                survey_redirect = '/notice/school';
            }
            if (is_banner == '1') {
                data.banner = {};
                data.banner.image_id = $('#banner-file li').attr('data-file-id');
                if (!data.banner.image_id) {
                    throw '请上传Banner图片';
                }
                data.banner.end_time = $.trim($('#banner-end-time').val());
                if (data.banner.end_time == '') {
                    $('#banner-end-time').focus();
                    throw '请选择Banner有效期';
                }
                survey_redirect = '/notice/banner';
            }
        } catch (err) {
            commModal.alert({content: err});
            return false;
        }
        if (can_share_survey) {
            share_survey_tpl_data.title = data.title;
            share_survey_tpl_data.items = data.items;
        }

        data.disable_reply = $('#notice-is-reply:checked').length;
        var $btn = $('#survey-submit').button('loading');
        $.post(host + '/notice/submit', {'role': role, 'is_banner': is_banner, 'notice_type': notice_type, 'type': 'survey', 'data': JSON.stringify(data)}, function (res) {
            if (res.success) {
                if (can_share_survey) {
                    $survey_release_modal.modal('show');
                } else {
                    window.location.href = host + survey_redirect;
                }
            } else {
                commModal.alert({content: res.msg});
                $btn.button('reset');
            }
        }, 'json');
    };
    var submitVoteData = function () {
        var data = {};
        var redirect;
        try {
            data.title = $.trim($('#vote-title').val());
            if (data.title == '') {
                $('#vote-title').focus();
                throw '请输入投票标题';
            }
            data.type = $.trim($('#vote-type').val());
            if (data.type == '') {
                $('#vote-type').focus();
                throw '请选择投票类型';
            }
            data.start_time = $.trim($('#vote-start-date').val());
            if (data.start_time == '') {
                $('#vote-start-date').focus();
                throw '请选择生效时间';
            }
            data.end_time = $.trim($('#vote-end-date').val());
            if (data.end_time == '') {
                $('#vote-end-date').focus();
                throw '请选择生效时间';
            }
            if (data.end_time < data.start_time) {
                $('#vote-end-date').focus();
                throw '生效结束时间不能早于生效开始时间';
            }
            data.options = [];
            $('#vote-option .option').each(function () {
                if (data.options.length >= 30) {
                    throw '选项不能超过30个';
                }
                debugger;
                var $this = $(this);
                var content = $.trim($this.val());
                var file_id = $this.siblings('.option-image').attr('data-file-id');
                if (!content && !file_id) {
                    $this.focus();
                    throw '请输入选项内容';
                } else {
                    var tmp = {content: '', files: []};
                    if (content) {
                        tmp.content = content;
                    }
                    if (file_id) {
                        tmp.files.push({
                            type: 1,
                            fid: file_id,
                            attri: 0
                        });
                    }
                    data.options.push(tmp);
                }
            });
            data.result_public = $('.vote-result-public:checked').val();
            if (notice_type === 'class') {
                data.target_cids = [];
                $.each(target_result, function (cid, name) {
                    data.target_cids.push(cid.substring(2));
                });
                if (data.target_cids.length === 0) {
                    throw '请选择发送对象';
                }
                data.target_group_ids = [];
                $('.selector-subtab input:checked').parent('li[data-type]').each(function () {
                    data.target_group_ids.push(Number($(this).attr('data-group-id')));
                });
                redirect = '/';
            } else if (notice_type === 'school' || notice_type === 'banner') {
                data.push = $('#school-vote-push:checked').length;
                data.school_feed_target = {};
                data.school_feed_target.scope = $('#target-scope').val();
                data.school_feed_target.grade_id = $('#target-grade').val();
                if (role === 'school_admin') {
                    data.sub_tab_id = $('#target-tab').val();
                    if (data.sub_tab_id == '') {
                        $('#target-tab').focus();
                        throw '请选择所属Tab';
                    }
                } else if (role === 'edu' || role === 'admin') {
                    data.school_feed_target.school_type = $('#target-school-type').val();
                    data.school_feed_target.school_id = $('#target-school').val();
                } else if (role === 'district_admin') {
                    var schools = $('#target-school').val();
                    if (!schools) {
                        throw '请选择学校';
                    }
                    data.school_feed_target.school_id = schools.join(',');
                }
                redirect = '/notice/school';
            }
            if (is_banner == '1') {
                data.banner = {};
                data.banner.image_id = $('#banner-file li').attr('data-file-id');
                if (!data.banner.image_id) {
                    throw '请上传Banner图片';
                }
                data.banner.end_time = $.trim($('#banner-end-time').val());
                if (data.banner.end_time == '') {
                    $('#banner-end-time').focus();
                    throw '请选择Banner有效期';
                }
                redirect = '/notice/banner';
            }
        } catch (err) {
            commModal.alert({content: err});
            return false;
        }
        data.disable_reply = $('#notice-is-reply-vote:checked').length;
        var $btn = $('#vote-submit').button('loading');
        $.post(host + '/notice/submit', {'role': role, 'is_banner': is_banner, 'notice_type': notice_type, 'type': 'vote', 'data': JSON.stringify(data)}, function (res) {
            if (res.success) {
                window.location.href = host + redirect;
            } else {
                commModal.alert({content: res.msg});
                $btn.button('reset');
            }
        }, 'json');
    };

    var stripscript = function (s) {
        //var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？%]")
        var rs = "";
        for (var i = 0; i < s.length; i++) {
            rs = $.trim(rs + s.substr(i, 1).replace(/[~'!,<>@#$%^&?{}【】‘；：”“'。，、*()-+_=:]/g, ''));
        }
        return $.trim(rs);
    };

    var isIE = function () {
        var notIE = -[1, ];
        if (-[1, ]) {
            return false;
        } else {
            return true;
        }
    };
    debugger; 
    var submitNoticeData = function (is_live) {
    	 debugger; 
        var data = {};
        var redirect;
        try {
            data.title = $.trim($('#notice-title').val());
            data.content = $('#notice-content').val().replace(/\s+$/, "");
            if (data.title == 'no_val') {
                data.title = '';
            } else if (data.title == '') {
                $('#notice-title').focus();
                throw '请输入标题';
            }
            if (data.content == '') {
                $('#notice-content').focus();
                throw '请输入内容';
            }
            if ($('#notice-need-reply:checked').length > 0) {
                data.need_reply = 1;
            } else {
                data.need_reply = 0;
            }

            var start_time = $.trim($('#notice-intended-time').val());
            if (start_time) {
                data.start_time = start_time;
            }
            if(is_live) {
                data.live = 1;
                var end_time = $.trim($('#notice-live-end-time').val());
                if (end_time) {
                    data.end_time = end_time;
                }
                data.uni_code = $.trim($('#notice-uni-code').val());
            }

            if ($('#files>li').length > 0) {
                data.files = [];
                $('#files>li').each(function () {
                	 debugger; 
                    var file_id = $(this).attr('data-file-id');
                    var file_name =  $('#files>li').val();
                    alert("file_name"+file_name);
                    data.files.push({
                        type: 1,
                        fid: file_id,
                        attri: 0
                    });
                });
            }
            if (edit != 0) {
                if ($('#notice-images>li').length > 0) {
                    data.files = [];
                    $('#notice-images>li').each(function () {
                        var file_id = $(this).attr('data-file-id');
                        var file_size = Number($(this).attr('data-file-size'));
                        data.files.push({
                            type: 1,
                            fid: file_id,
                            attri: 0,
                            size: file_size
                        });
                    });
                }

                if ($('#notice-audio>li').length > 0) {
                    if (typeof data.files === 'undefined') {
                        data.files = [];
                    }
                    $('#notice-audio>li').each(function () {
                        var file_id = $(this).attr('data-file-id');
                        var file_size = $(this).attr('data-file-size');
                        var file_time = $(this).attr('data-file-time');
                        data.files.push({
                            type: 2,
                            fid: file_id,
                            attri: 0,
                            size: file_size,
                            time: file_time
                        });
                    });
                }
            }
            if(!is_live) {
                if ($('#attach-file>li').length > 0) {
                    var file_id = $('#attach-file>li').attr('data-file-id');
                    var file_size = $('#attach-file>li').attr('data-file-size');
                    data.attach_file = {
                        type: 0,
                        fid: file_id,
                        attri: 1,
                        size: file_size
                    }
                }
            }
            if (notice_type === 'class') {
                if ($('#school-notice-push').length > 0) {
                    data.sms = $('#school-notice-push:checked').length;
                }
                data.target_cids = [];
                $.each(target_result, function (cid, name) {
                    data.target_cids.push(cid.substring(2));
                });
                if (data.target_cids.length === 0) {
                    throw '请选择发送对象';
                }

                data.target_group_ids = [];
                $('.selector-subtab input:checked').parent('li[data-type]').each(function () {
                    data.target_group_ids.push(Number($(this).attr('data-group-id')));
                });
                redirect = '/';
            } else if (notice_type === 'school' || notice_type === 'banner') {
                data.push = $('#school-notice-push:checked').length;
                data.school_feed_target = {};
                data.school_feed_target.scope = $('#target-scope').val();
                data.school_feed_target.grade_id = $('#target-grade').val();
                if (role === 'school_admin') {
                    data.sub_tab_id = $('#target-tab').val();
                    if (data.sub_tab_id == '') {
                        $('#target-tab').focus();
                        throw '请选择所属Tab';
                    }
                } else if (role === 'edu' || role === 'admin') {
                    data.school_feed_target.school_type = $('#target-school-type').val();
                    data.school_feed_target.school_id = $('#target-school').val();
                } else if (role === 'district_admin') {
                    var schools = $('#target-school').val();
                    if (!schools) {
                        throw '请选择学校';
                    }
                    data.school_feed_target.school_id = schools.join(',');
                }
                redirect = '/notice/school';
            }
            if (is_banner == '1') {
                data.banner = {};
                data.banner.image_id = $('#banner-file li').attr('data-file-id');
                if (!data.banner.image_id) {
                    throw '请上传Banner图片';
                }
                data.banner.end_time = $.trim($('#banner-end-time').val());
                if (data.banner.end_time == '') {
                    $('#banner-end-time').focus();
                    throw '请选择Banner有效期';
                }
                redirect = '/notice/banner';
            }
        } catch (err) {
            commModal.alert({content: err});
            return false;
        }

        data.disable_reply = $('#notice-is-reply:checked').length;

        var $btn;
        if(is_live) {
            $btn = $('#notice-live-submit').button('loading');
        } else {
            $btn = $('#notice-submit').button('loading');
        }
        debugger; 
        $.post(
        		 'http://localhost:8080/pycms/all_addInfm', 
        		{
        			'role': role, 
        			'is_banner': is_banner, 
        			'notice_type': notice_type, 
        			'type': 'notice', 
        			'data': JSON.stringify(data)}, 
        		function (res) {
        				alert("res="+res.success)
        				
           if (res.success) {
        	   window.location.href = host + '/files/school.jsp';
            } else {
                commModal.alert({content: res.msg});
                $btn.button('reset');
            }
        }, 'json');
    };
    $('#notice-intended-time, #notice-live-end-time, #vote-start-date, #vote-end-date, #survey-start-date, #survey-end-date, #banner-end-time').datetimepicker({
        'todayHighlight': true,
        'format': 'yyyy-mm-dd hh:00',
        'minView': 'day',
        'minuteStep': 60,
        'language': 'zh-CN',
        'autoclose': true
    });

    var is_y = true;
    $('#notice-image-upload').bind('change', function () {
        is_y = true;
    });
    var is_i = 0;
    var loading_html = '';
   
    $('#notice-image-upload').fileupload({
        url: 'http://localhost:8080/pycms/upload/image?state=notice_img',
        dropZone: null,
        add: function (e, data) {
        	 debugger; 
            var uploadErrors = [];
            var acceptFileTypes = /(\.|\/)(gif|jpe?g|png)$/i;
            var zhuanju = $('.zhuan_juhua2');
            var ori_file = data.originalFiles.length;
            if (ori_file > 9 && is_y) {
                is_y = false;
                commModal.alert({content: '最多只能上传9张图片'});
                return false;
            }
            if ($('#files > li').length > 8) {
                commModal.alert({content: '最多只能上传9张图片'});
                is_y = false;
                return false;
            }
            $.each(data.files, function (i, ob) {
            	 debugger; 
                var name = ob.name;
                var namearr = name.split('.');
                var size = ob.size;

                if (name.length && !acceptFileTypes.test(name)) {
                    uploadErrors.push('只支持JPG、JPEG、PNG、GIF格式');
                    commModal.alert({content: '只支持JPG、JPEG、PNG、GIF格式'});
                    is_y = false;
                }
                if (size && size > 10485760) {
                    uploadErrors.push('图片不能大于10MB');
                    return false;
                }

                var is =  $('#img_f_' + stripscript(namearr[0])).attr('data-file-id');
                zhuanju.show();
                if (is_i > 0) {
                    loading_html = zhuanju.html();
                } else {
                    loading_html = zhuanju.parent().html();
                }
                is_i++;
                if (is_y) {
                    if (isIE()) {
                        $('#files').append('<li id="img_f_' + stripscript(namearr[0]) + '"><i class="icon-clip fa fa-paperclip"></i><span id="file_name">' + name + '</span>' + loading_html + '<i class="btn-file-del fa fa-remove"></i></li>');
                    } else {
//                        $('#files').append('<li id="img_f_' + stripscript(namearr[0]) + '"><i class="icon-clip fa fa-paperclip"></i><span>' + name + '&nbsp;(' + Math.floor(size / 1024) + 'KB)</span>' + loading_html + '<i class="btn-file-del fa fa-remove"></i></li>');
                    	 $('#files').append('<li id="img_f_' + stripscript(namearr[0]) + '"><i class="icon-clip fa fa-paperclip"></i><span id="file_name">' + name + '</span><span>&nbsp;(' + Math.floor(size / 1024) + 'KB)</span>' + loading_html + '<i class="btn-file-del fa fa-remove"></i></li>');
                         
                    }
                }
            });
            if (is_y) {
                if (uploadErrors.length > 0) {
                    commModal.alert({content: uploadErrors.join("\n")});
                } else {
                    $.each(data.files, function (i, ob) {
                    	 debugger; 
                        var name = ob.name;
                        var namearr = name.split('.');
                        var id = ob.file_id;
                        var is = $('#img_f_' + stripscript(namearr[0])).attr('data-file-id');
                        data.submit();
                    });
                }
            }
        },
        dataType: 'json',
        progressall: function (e, data) {
            //var progress = parseInt(data.loaded / data.total * 100, 10);
            //$('#notice-file-progress .progress-bar').css('width', progress + '%');

        },
        done: function (e, data) {
        	 debugger; 
        	 if (data.result.success) {
                 var name_r = data.result.file.name;
                 var namearr = name_r.split('.');
                 alert("data.result.file.id="+data.result.file.id);
                 $('#img_f_' + stripscript(namearr[0])).attr('data-file-id', data.result.file.id);
                 $('#img_f_' + stripscript(namearr[0])).append("<span >" +data.result.file.id+ "</span>");
                 $('#img_f_' + stripscript(namearr[0]) + ' .zhuan_juhua2').remove();
                 $('#img_f_' + stripscript(namearr[0])).removeAttr('id');
                 alert( $('#img_f_' + stripscript(namearr[0])).attr('data-file-id'));
                 alert( "112qq="+$('#img_f_' + stripscript(namearr[0])).next("span"));
                 var  qq112 = $('#img_f_' + stripscript(namearr[0])).next("span");
             } else {
                 commModal.alert({content: data.result.msg});
                 var name_r = data.result.name;
                 var namearr = name_r.split('.');
                 $('#img_f_' + stripscript(namearr[0])).remove();
             }
         }
    });

    //上传通知中的文件
    $('#notice-attach-upload').fileupload({
        url: host + '/upload/attachment?state=notice_accessory',
        dropZone: null,
        add: function (e, data) {
            var zhuanju = $('.zhuan_juhua');
            var uploadErrors = [];
            var acceptFileTypes = /(\.|\/)(docx?|xlsx?|pptx?|rar|zip)$/i;
            if (data.originalFiles[0]['name'].length && !acceptFileTypes.test(data.originalFiles[0]['name'])) {
                uploadErrors.push('只接受doc、docx、xls、xlsx、ppt、pptx、rar、zip文件');
            }
            if (data.originalFiles[0]['size'] && data.originalFiles[0]['size'] > 102400000) {
                uploadErrors.push('附件不可超过100M，请重新压缩上传！');
            }
            if (uploadErrors.length > 0) {
                commModal.alert({content: uploadErrors.join("\n")});
            } else {
                file_list = data;
                $(".zhuan_juhua1").css('display', 'inline');
                listLiAShow(1);
                var jqXHR = data.submit().error(function (jqXHR, textStatus, errorThrown) {
                    if (textStatus == 'abort') {
                        return false;
                    } else {
                        commModal.alert({content: '文件上传失败，可能由于文件过大、上传超时等问题引起，请重试。'});
                    }
                    $(".zhuan_juhua1").css('display', 'none');
                    listLiAShow(0);
                })
            }
        },
        dataType: 'json',
        /*fail:function(e, data){
         listLiAShow(0);
         $(".zhuan_juhua1").css('display','none');
         commModal.alert({content:'上传文件错误'});
         return false;
         },*/
        done: function (e, data) {
        	 debugger; 
            if (!data.result) {
                commModal.alert({content: '文件上传失败，可能由于文件过大、上传超时等问题引起，请重试。'});
            } else if (data.result.success) {
                $('#attach-file').html('<li data-file-size="' + data.result.file.size + '" data-file-id="' + data.result.file.id + '"><i class="icon-clip fa fa-paperclip"></i><span>' + data.result.file.name + '&nbsp;(' + Math.floor(data.result.file.size / 1024) + 'KB)</span><i class="btn-file-del fa fa-remove"></i></li>');
            } else {
                commModal.alert({content: data.result.msg});
            }
            listLiAShow(0);
            $(".zhuan_juhua1").css('display', 'none');
        }
    });

    var listLiAShow = function (show) {
        if (show == 1) {    //不可点击
            $("#notice-attach-upload").attr('disabled', 'true');
            $("#homework-file-upload").attr('disabled', 'true');
            $(".list li a").on('click.lock', function () {
                return false;
            });
        } else {          //可正常点击
            $("#notice-attach-upload").removeAttr('disabled');
            $("#homework-file-upload").removeAttr('disabled');
            $(".list li a").off('click.lock');
        }
    };

    $('#banner-image-upload').fileupload({
        url: host + '/upload/image',
        dropZone: null,
        add: function (e, data) {
            var uploadErrors = [];
            var acceptFileTypes = /(\.|\/)(gif|jpe?g|png)$/i;
            if (data.originalFiles[0]['name'].length && !acceptFileTypes.test(data.originalFiles[0]['name'])) {
                uploadErrors.push('只支持JPG、JPEG、PNG、GIF格式');
            }
            if (data.originalFiles[0]['size'] && data.originalFiles[0]['size'] > 10485760) {
                uploadErrors.push('图片不能大于10MB');
            }
            if (uploadErrors.length > 0) {
                commModal.alert({content: uploadErrors.join("\n")});
            } else {
                data.submit();
            }
        },
        dataType: 'json',
        done: function (e, data) {
            if (data.result.success) {
                $('#banner-file').html('<li data-file-id="' + data.result.file.id + '"><i class="icon-clip fa fa-paperclip"></i><span>' + data.result.file.name + '&nbsp;(' + Math.floor(data.result.file.size / 1024) + 'KB)</span><i class="btn-file-del fa fa-remove"></i></li>');
            } else {
                commModal.alert({content: data.result.msg});
            }
        }
    });

    var optionUploadInit = function () {
        $('.option-image-upload').fileupload({
            url: host + '/upload/image',
            dropZone: null,
            add: function (e, data) {
                var uploadErrors = [];
                var acceptFileTypes = /(\.|\/)(gif|jpe?g|png)$/i;
                if (data.originalFiles[0]['name'].length && !acceptFileTypes.test(data.originalFiles[0]['name'])) {
                    uploadErrors.push('只支持JPG、JPEG、PNG、GIF格式');
                }
                if (data.originalFiles[0]['size'] && data.originalFiles[0]['size'] > 10485760) {
                    uploadErrors.push('图片不能大于10MB');
                }
                if (uploadErrors.length > 0) {
                    commModal.alert({content: uploadErrors.join("\n")});
                } else {
                    data.submit();
                }
            },
            dataType: 'json',
            done: function (e, data) {
                if (data.result.success) {
                    $container = $(e.target).parents('.in-group');
                    $container.children('.option-image').remove();
                    $container.append('<div class="option-image" data-file-id="' + data.result.file.id + '"><i class="icon-clip fa fa-paperclip"></i><span>' + data.result.file.name + '&nbsp;(' + Math.floor(data.result.file.size / 1024) + 'KB)</span><i class="btn-file-del fa fa-remove"></i></div>');

                } else {
                    commModal.alert({content: data.result.msg});
                }
            }
        });
    };
    
    
    
    if (edit == 0) {
        newQuestion();
    }
    checkHash();
    optionUploadInit();
    if (edit == 0) {
        $('#vote-option .add-option').trigger('click').trigger('click');
    }

    if (role === 'edu' || role === 'admin') {
        $('#target-school-type').on('change', function () {
            var school_type = $(this).val();
            if (school_type === '0') {
                $('#target-school option').show();
                $('#target-grade option').show();
            } else {
                $('#target-school option').hide();
                $('#target-grade option').hide();
                if (school_type === '1') {
                    $('#target-school option[data-school-type~=2], #target-school option[data-school-type~=3]').show();
                    $('#target-grade option[data-grade-type!=1]').show();
                } else if (school_type === '2') {
                    $('#target-school option[data-school-type~=1]').show();
                    $('#target-grade option[data-grade-type=1]').show();
                }
            }
            $('#target-school option:eq(0)').show().prop('selected', true);
            $('#target-grade option:eq(0)').show().prop('selected', true);
        });
        $('#target-school').on('change', function () {
            var school_type = $(this).find(':selected').attr('data-school-type');
            $('#target-grade option').hide().each(function () {
                if (school_type.indexOf($(this).attr('data-grade-type')) !== -1) {
                    $(this).show();
                }
            });
            $('#target-grade option:eq(0)').show().prop('selected', true);
        });
    }

    //survey tpl start
    var tpl_table = $('#survey-table').DataTable({
        'pageLength': 20,
        'info': true,
        'lengthChange': false,
        'ordering': false,
        'language': {
            "info": "_START_到_END_条，共_TOTAL_条",
            "search": "搜索：",
            "zeroRecords": '没有找到',
            "infoFiltered": "从_MAX_条中筛选",
            "infoEmpty": "没有记录",
            "paginate": {
                "previous": "上一页",
                "next": "下一页"
            }
        }
    });
    $('#survey-category').on('keyup change', function () {
        if (this.value !== '') {
            tpl_table.column(0).search('^' + $(this).children(':selected').text() + '$', true, false).draw();
        } else {
            tpl_table.column(0).search('').draw();
        }
    });
    $('#survey-sub-category').on('keyup change', function () {
        if (this.value !== '') {
            tpl_table.column(1).search('^' + $(this).children(':selected').text() + '$', true, false).draw();
        } else {
            tpl_table.column(1).search('').draw();
        }
    });
    $('#survey-tpl-title').on('keyup', function () {
        tpl_table.column(2).search(this.value).draw();
    });
    $('#survey-category').on('change', function () {
        var category_id = $(this).val();
        $('#survey-sub-category').val('').trigger('change').children().each(function () {
            var $this = $(this);
            if ($this.val() === '' || category_id == $this.attr('data-category-id')) {
                $this.removeClass('hidden');
            } else {
                $this.addClass('hidden');
            }
        });
    });
    $('#share-survey-category').on('change', function () {
        var category_id = $(this).val();
        $('#share-survey-sub-category').val('').children().each(function () {
            var $this = $(this);
            if ($this.val() === '' || category_id == $this.attr('data-category-id')) {
                $this.removeClass('hidden');
            } else {
                $this.addClass('hidden');
            }
        });
    });
    
    
    var $modal = $('.survey-preview-modal');

    if (edit != 0) {
        $('#survey-table').on('click', '.title', function () {
            /*  $('#banner-tbody').on('click', '.banner_yl', function(){*/
            $modal.find('.modal-body').css('max-height', $(window).height() - 190 + 'px');
            var $this = $(this);
            var id = $this.parents('tr').attr('data-id');
            var $survey_area = $('#survey-area');
            $survey_area.html('');
            $modal.find('.modal-title').text($this.text());
            $modal.attr('data-id', id);
            $modal.modal('show');
            $.getJSON(host + '/survey/get_tpl_json/' + id, function (res) {
                $.each(res.items, function (item_index, item) {
                    $survey_area.append('<dt>' + (item_index + 1) + ' ' + htmlEncode(item.title) + '</dt><dd></dd>');
                    if (item.type == 3) {
                        $survey_area.append('<dd><textarea class="form-control" maxlength="500" rows="4"></textarea></dd>');
                    } else {
                        $survey_area.append('<dd><ul></ul></dd>');
                        var $options_area = $survey_area.find('ul:last');
                        var input_type = item.type == 1 ? 'radio' : 'checkbox';
                        $.each(item.options, function (option_index, option) {
                            var option_id = String(item_index + 1) + String(option_index + 1);
                            $options_area.append('<li><input id="option-' + option_id + '" name="option-' + item_index + '" type="' + input_type + '"><label for="option-' + option_id + '"><i class="input-sprite"></i>' + (option_index + 1) + '. ' + htmlEncode(option.content) + '</label></li>');
                        });
                    }
                });
            });
        });
    }
    var fillSurveyTpl = function (data) {
        $('#survey-title').val(data.title);
        $('#survey-intro').val(data.intro);//问卷导语增加，还没有字段，等等
        $('#survey-questions').html('');
        $.each(data.items, function (item_index, item) {
            item.type = Number(item.type);
            var type;
            switch (item.type) {
                case 1:
                    type = 'single';
                    break;
                case 2:
                    type = 'multi';
                    break;
                case 3:
                    type = 'text';
                    break
            }
            if (item_index === $('.survey-question').length) {
                newQuestion(type);
            }
            var $target = $('.survey-question:last');
            $target.find('.survey-question-title').val(item.title);
            if (type !== 'text') {
                $.each(item.options, function (option_index, option) {
                    if (option_index === $target.find('.option').length) {
                        if (edit == 0) {
                            newOption($target);
                        }
                    }
                    $target.find('.option:eq(' + option_index + ')').val(option.content);
                });
            }
        });
        window.location.href = '#survey';
    };
    var chooseSurveyTpl = function (tpl_id) {
        var fill = false;
        var data;
        $.getJSON(host + '/survey/get_tpl_json/' + tpl_id, function (res) {
            if (fill === true) {
                fillSurveyTpl(res);
            } else {
                data = res;
            }
        });
        /*  if($('#survey-title').val() === '' || confirm('当前编辑的问卷内容将会丢失，确认么？')) {
         if(typeof data !== 'undefined') {
         fillSurveyTpl(data);
         } else {
         fill = true;
         }
         }
         */

        if ($('#survey-title').val() !== '') {
            commModal.confirm({content: '当前编辑的问卷内容将会丢失，确认么？', btnClick: function () {
                if (typeof data !== 'undefined') {
                    fillSurveyTpl(data);
                } else {
                    fill = true;
                }
            }})

        } else {

            if (typeof data !== 'undefined') {
                fillSurveyTpl(data);
            } else {
                fill = true;
            }
        }
    };
    $('#btn-choose').on('click', function () {
        var tpl_id = $modal.attr('data-id');
        chooseSurveyTpl(tpl_id);
        $modal.modal('hide');
    });
    $('#survey-table').on('click', '.choose-survey', function () {
        var tpl_id = $(this).parents('tr').attr('data-id');
        chooseSurveyTpl(tpl_id);
    });
    //survey tpl end
    var $survey_release_modal = $('.survey-release-modal');
    $('#btn-share-survey-tpl-cancel').on('click', function () {
        window.location.href = host + survey_redirect;
    });
    $('#btn-share-survey-tpl-sure').on('click', function () {
        $('.share-sure').show();
        $('.modal-footer').css({'border': '0', 'padding-top': '0', 'margin-top': '-5px'});
        $('.share-confirm').hide();
    });
    $('#btn-share-survey-tpl-submit').on('click', function () {
        try {
            var category_id = $('#share-survey-category').val();
            if (category_id === '') {
                $('#share-survey-category').focus();
                throw '请选择一级分类';
            }
            share_survey_tpl_data.category_id = $('#share-survey-sub-category').val();
            share_survey_tpl_data.intro = $('#survey-intro').val();
            if (share_survey_tpl_data.category_id === '') {
                $('#share-survey-sub-category').focus();
                throw '请选择二级分类';
            }
        } catch (err) {
            commModal.alert({content: err});
            return false;
        }
        var post_data = {data: JSON.stringify(share_survey_tpl_data)};
        var $btn = $(this).button('loading');
        $.post(host + '/survey/edit_submit', post_data, function (res) {
            if (res.success) {
                window.location.href = host + survey_redirect;
            } else {
                commModal.alert({content: res.msg});
                $btn.button('reset');
            }
        }, 'json');
    });

    /***********作业开始***********/
    $('#homework-deadline, #homework-send-time').datetimepicker({
        'todayHighlight': true,
        'format': 'yyyy-mm-dd hh:00',
        'minView': 'day',
        'minuteStep': 60,
        'language': 'zh-CN',
        'autoclose': true
    });

    var stripscript = function (s) {
        // var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？%()]");
        var rs = "";
        for (var i = 0; i < s.length; i++) {
            rs = $.trim(rs + s.substr(i, 1).replace(/[~'!,<>@#$%^&?{}【】‘；：”“'。，、*()-+_=:]/g, ''));
        }
        return $.trim(rs);
    };

    var isIE = function () {
        var notIE = -[1, ];
        if (-[1, ]) {
            return false;
        } else {
            return true;
        }
    };


    $('#homework-image-upload').fileupload({
        url: host + '/upload/image?state=homework_img',
        dropZone: null,
        start: function () {

        },
        add: function (e, data) {

            if ($('#homework-images>li').length >= 9) {
                commModal.alert({content: '最多只能上传9张图片'});
                return false;
            }
            var uploadErrors = [];
            var acceptFileTypes = /(\.|\/)(gif|jpe?g|png)$/i;
            var zhuanju = $('.zhuan_juhua2');

            var is_y = true;
            $.each(data.files, function (i, ob) {
                var name = ob.name;
                var namearr = name.split('.');
                var size = ob.size;

                if (name.length && !acceptFileTypes.test(name)) {
                    uploadErrors.push('只支持JPG、JPEG、PNG、GIF格式');

                    is_y = false;
                }
                if (size && size > 5242880) {
                    uploadErrors.push('图片不能大于5MB');
                    return false;
                }
                var is = $('#img_f_' + stripscript(namearr[0])).attr('data-file-id');
                zhuanju.show();
                if (is_y) {
                    if (isIE()) {
                        $('#homework-images').append('<li id="img_f_' + stripscript(namearr[0]) + '"><i class="icon-clip fa fa-paperclip"></i><span>' + name + '</span>' + zhuanju.parent().html() + '<i class="btn-file-del fa fa-remove"></i></li>');
                    } else {
                        $('#homework-images').append('<li id="img_f_' + stripscript(namearr[0]) + '"><i class="icon-clip fa fa-paperclip"></i><span>' + name + '&nbsp;(' + Math.floor(size / 1024) + 'KB)</span>' + zhuanju.parent().html() + '<i class="btn-file-del fa fa-remove"></i></li>');
                    }
                }
            });

            if (uploadErrors.length > 0) {
                commModal.alert({content: uploadErrors.join("\n")});
            } else {
                $.each(data.files, function (i, ob) {
                    var name = ob.name;
                    var namearr = name.split('.');
                    var size = ob.size;
                    var id = ob.file_id;
                    var is = $('#img_f_' + stripscript(namearr[0])).attr('data-file-id');
                    zhuanju.show();
                    data.submit();
                });
            }
        },
        dataType: 'json',
//        progressall: function (e, data) {
//            var progress = parseInt(data.loaded / data.total * 100, 10);
//            $('#notice-file-progress .progress-bar').css('width', progress + '%');
//        },
        done: function (e, data) {
            if (data.result.success) {
                var name_r = data.file.name;
                var namearr = name_r.split('.');
                $('#img_f_' + stripscript(namearr[0])).attr('data-file-id', data.file.id);
                $('#img_f_' + stripscript(namearr[0]) + ' .zhuan_juhua2').remove();
                $('#img_f_' + stripscript(namearr[0])).removeAttr('id');
            } else {
                var name_r = data.result.name;
                var namearr = name_r.split('.');
                $('#img_f_' + stripscript(namearr[0])).remove();
                alert(data.result.msg);
                commModal.alert({content: data.result.msg});
            }
        }
    });
    $('#homework-file-upload').fileupload({
        url: host + '/upload/attachment?state=homework_file',
        dropZone: null,
        add: function (e, data) {
            var uploadErrors = [];
            var acceptFileTypes = /(\.|\/)(docx?|xlsx?|pptx?|rar|zip)$/i;
            if (data.originalFiles[0]['name'].length && !acceptFileTypes.test(data.originalFiles[0]['name'])) {
                uploadErrors.push('只接受doc、docx、xls、xlsx、ppt、pptx、rar、zip文件');
            }
            if (data.originalFiles[0]['size'] && data.originalFiles[0]['size'] > 73400320) {
                uploadErrors.push('附件不可超过70M，请重新压缩上传！');
            }
            if (uploadErrors.length > 0) {
                commModal.alert({content: uploadErrors.join("\n")});
            } else {
                listLiAShow(1);
                $(".loading_homework").css('display', 'inline');
                file_list = data;
                var jqXHR = data.submit().error(function (jqXHR, textStatus, errorThrown) {
                    if (textStatus == 'abort') {
                        return false;
                    } else {
                        commModal.alert({content: '文件上传失败，可能由于文件过大、上传超时等问题引起，请重试。'});
                        $(".loading_homework").css('display', 'none');
                        listLiAShow(0);
                    }
                })
            }
        },
        dataType: 'json',
//        progressall: function (e, data) {
//            var progress = parseInt(data.loaded / data.total * 100, 10);
//            $('#notice-file-progress .progress-bar').css('width', progress + '%');
//        },
        done: function (e, data) {
            if (!data.result) {
                commModal.alert({content: '文件上传失败，可能由于文件过大、上传超时等问题引起，请重试。'});
            } else if (data.result.success) {
                $('#homework-files').html('<li data-file-size="' + data.result.file.size + '" data-file-id="' + data.result.file.id + '"><i class="icon-clip fa fa-paperclip"></i><span>' + data.result.file.name + '&nbsp;(' + Math.floor(data.result.file.size / 1024) + 'KB)</span><i class="btn-file-del fa fa-remove"></i></li>');
            } else {
                commModal.alert({content: data.result.msg});
            }
            $(".loading_homework").css('display', 'none');
            listLiAShow(0);
        }
    });

    var submitHomework = function () {
        var data = {};
        try {
            data.subject_id = $.trim($('#homework-subject').val());
            if (data.subject_id == '') {
                $('#homework-subject').focus();
                throw '请选择作业科目';
            }

            send_time = $.trim($('#homework-send-time').val());
            if (send_time) {
                data.send_time = send_time;
            }
            var dis = $("#homework-wcsj").css('display');
            data.required_complete_time = $.trim($('#homework-deadline').val());
            if (dis == 'block') {//是显示的话，需要添加时间，
                data.display = 1;
                if (data.required_complete_time == '') {
                    $('#homework-deadline').focus();
                    throw '请选择发送时间';
                }
            } else {//否则是隐藏，需要置null //小学123年级的要屏蔽掉此字段
                data.display = 0;
            }

            if ($('#homework-files>li').length > 0) {
                var $file = $('#homework-files>li');
                var file_id = $file.attr('data-file-id');
                var file_size = Number($file.attr('data-file-size'));
                data.attach_file = {
                    type: 0,
                    fid: file_id,
                    attri: 1,
                    size: file_size
                };
            }
            if ($('#homework-images>li').length > 0) {
                data.files = [];
                $('#homework-images>li').each(function () {
                    var file_id = $(this).attr('data-file-id');
                    var file_size = Number($(this).attr('data-file-size'));
                    data.files.push({
                        type: 1,
                        fid: file_id,
                        attri: 0,
                        size: file_size
                    });
                });
            }

            if ($('#homework-audio>li').length > 0) {
                if (typeof data.files === 'undefined') {
                    data.files = [];
                }
                $('#homework-audio>li').each(function () {
                    var file_id = $(this).attr('data-file-id');
                    var file_size = $(this).attr('data-file-size');
                    var file_time = $(this).attr('data-file-time');
                    data.files.push({
                        type: 2,
                        fid: file_id,
                        attri: 0,
                        size: file_size,
                        time: file_time
                    });
                });
            }

            var content = $.trim($('#homework-content').val());
            if (content === '') {
                if (typeof data.files === 'undefined') {
                    $('#homework-content').focus();
                    throw '请输入作业内容或上传图片';
                }
            } else {
                data.content = content;
            }
            data.target_cids = [];
            $.each(target_result, function (cid, name) {
                data.target_cids.push(cid.substring(2));
            });
            if (data.target_cids.length === 0) {
                throw '请选择接收人';
            }
            data.target_group_ids = [];
            $('.selector-subtab input:checked').parent('li[data-type]').each(function () {
                data.target_group_ids.push(Number($(this).attr('data-group-id')));
            });
        } catch (err) {
            commModal.alert({content: err});
            return false;
        }

        /*
         alert(dis);
         alert(data.required_complete_time);
         */

        var $btn = $('#btn-submit').button('loading');
        $.post(host + '/homework/submit', {'data': JSON.stringify(data)}, function (res) {
            if (res.success) {
                window.location.href = host;
            } else {
                commModal.alert({content: res.msg});
                $btn.button('reset');
            }
        }, 'json');
    };
    $('#btn-submit').on('click', function () {
        submitHomework();
    });

});
