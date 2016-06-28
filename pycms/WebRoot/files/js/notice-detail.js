$(function(){
    var feed_id = $('#page-wrapper').attr('data-id');
    var type = $('#page-wrapper').attr('data-type');
    var category = type == 'class' ? 0 : 1;
    $('.survey-result-table').DataTable({
        'pageLength': 20,
        'info': false,
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
    $("#reply-textarea, #quote-reply-textarea").on('keyup change', function(){
        var content = $(this).val();
        var num = 500;
        if(content.length > num) {
            $('.text-left-num').text(0);
            $(this).val(content.substr(0, 500));
        } else {
            $('.text-left-num').text(500 - content.length);
        }
    });
    $('#btn-reply, #btn-quote-reply').on('click', function(){
        var data = {
            category: category,
            feed_id: $('#page-wrapper').attr('data-id')
        };
        if(this.id === 'btn-quote-reply') {
            data.reply_id = $('#quote-reply-modal').attr('data-reply-id');
            data.chain_id = $('#quote-reply-modal').attr('data-chain-id');
            data.content = $('#quote-reply-textarea').val();
        } else {
            data.content = $('#reply-textarea').val();
        }
        $("#btn-reply").attr("disabled", true);
        $("#btn-quote-reply").attr("disabled", true);
        $.post(host + '/notice/reply', {'data': JSON.stringify(data)}, function(res){
            if(res.success) {
               window.location.reload();
            } else {
            commModal.alert({content:res.msg});
               window.location.reload();
            }
        }, 'json');
    });
    
    $('.quote-reply-main').on('click', function(){
        var target_name = $(this).parents('.post-row').find('.user-name').text();
        $('#quote-reply-target span').text(target_name);
        $('#quote-reply-textarea').val('');
        $('#quote-reply-textarea .text-left-num').text(500);
        $('#quote-reply-modal')
            //.attr('data-reply-id', $(this).parents('.post-row').attr('data-id'))
            //.attr('data-chain-id', $(this).parents('.post-row').attr('data-chain-id'))
            .modal('show');
    });
    
    $('#page-wrapper').on('click','.quote-reply', function(){
        var target_name = $(this).parents('.post-row').find('.user-name').text();
        $('#quote-reply-target span').text(target_name);
        $('#quote-reply-textarea').val('');
        $('#quote-reply-textarea .text-left-num').text(500);
        $('#quote-reply-modal')
            .attr('data-reply-id', $(this).parents('.post-row').attr('data-id'))
            .attr('data-chain-id', $(this).parents('.post-row').attr('data-chain-id'))
            .modal('show');
    });

    $('#page-wrapper').on('click', '.btn-reply-fav', function(){
        var $this = $(this);
        var chain_id = $this.parents('.post-row').attr('data-chain-id');
        var reply_id = $this.parents('.post-row').attr('data-id');
        var data = {
            category: category,
            feed_id: feed_id,
            chain_id: chain_id,
            reply_id: reply_id
        };
        $.post(host + '/notice/add_fav', {data: JSON.stringify(data)}, function(res){
            if(res.success) {
                $this.replaceWith('<li class="btn-reply-unfav like_fav" data-fav-id="'+res.fav_id+'"><i class="fa fa-star stared"></i> 取消收藏</li>');
            } else {
              commModal.alert({content:res.msg});
            }
        }, 'json');
    });

    $('#page-wrapper').on('click', '.btn-fav', function(){
        var $this = $(this);
        var data = {
            category: category,
            feed_id: feed_id
        };
        $.post(host + '/notice/add_fav', {data: JSON.stringify(data)}, function(res){
            if(res.success) {
                $this.replaceWith('<li class="btn-unfav" data-fav-id="'+res.fav_id+'"><i class="fa fa-star stared"></i> 取消收藏</li>');
            } else {
             commModal.alert({content:res.msg});
            }
        }, 'json');
    });

    $('#page-wrapper').on('click', '.btn-unfav, .btn-reply-unfav', function(){
        var $this = $(this);
        $.post(host + '/notice/cancel_fav', {fav_id: $this.attr('data-fav-id')}, function(res){
            if(res.success) {
                if($this.hasClass('btn-unfav')) {
                    $this.replaceWith('<li class="btn-fav"><i class="fa fa-star-o star"></i> 收藏</li>');
                } else {
                    $this.replaceWith('<li class="btn-reply-fav like_fav"><i class="fa fa-star-o star"></i> 收藏</li>');
                }
            } else {
                commModal.alert({content:res.msg});
            }
        }, 'json');
    });

    $('#btn-vote-submit').on('click', function(){
        var vote_type = $('vote-area').attr('data-vote-type');
        var data = {
            category: category,
            feed_id: feed_id
        };
        if(vote_type == 1) {
            data.options = $('#vote-area input:checked').val();
        } else {
            var tmp_option = [];
            $('#vote-area input:checked').each(function(){
                tmp_option.push($(this).val());
            });
            data.options = tmp_option.join(',');
        }
        if(data.options.length === 0) {
          commModal.alert({content:'请选择答案'});
        } else {
            $.post(host + '/notice/submit_vote', {data: JSON.stringify(data)}, function(res){
                if(res.success) {
                    window.location.reload();
                } else {
                   commModal.alert({content:res.msg});
                }
            }, 'json');
        }
    });

    $('#btn-survey-submit').on('click', function(){
        var data = {
            category: category,
            feed_id: feed_id
        };
        var answer = [];
        try {
            $('#survey-area dd').each(function(){
                var $this = $(this);
                var subject_type = $this.attr('data-subject-type');
                var subject_id = $this.attr('data-subject-id');
                var tmp_data = {
                    subject_id: subject_id
                };
                if(subject_type == 3) {
                    tmp_data.content = $.trim($this.find('textarea').val());
                    if(tmp_data.content.length === 0) {
                        $this.find('textarea').focus();
                        throw '请输入答案';
                    }
                } else {
                    tmp_data.option_ids = [];
                    $this.find('input:checked').each(function(){
                        tmp_data.option_ids.push($(this).val());
                    });
                    if(tmp_data.option_ids.length === 0) {
                        throw '请选择答案';
                    }
                }
                answer.push(tmp_data);
            });
        } catch(e) {
          commModal.alert({content:e});
            return;
        }
        data.answer = JSON.stringify(answer);
        $.post(host + '/notice/submit_survey', {data: JSON.stringify(data)}, function(res){
            if(res.success) {
                window.location.reload();
            } else {
              commModal.alert({content:res.msg});
            }
        }, 'json');
    });

    $('.btn-play-audio').on('click', function(){
        var audio = $(this).children('audio')[0];
        audio.currentTime = 0;
        audio.play();
    });
    $('#page-wrapper').confirmation({
        selector: '.btn-reply-del',
        placement: 'top',
        title: '确认删除么？',
        btnOkLabel: '删除',
        btnCancelLabel: '取消',
        onConfirm: function(e, element){
            var data = {
                category: category,
                feed_id: feed_id
            };
            data.reply_id = $(element).parents('.post-row').attr('data-id');
            $.post(host + '/notice/delete_reply', {data: JSON.stringify(data)}, function(res){
                if(res.success) {
                    window.location.reload();
                } else {
                     commModal.alert({content:res.msg});
                }
            }, 'json');
        }
    });

    $('.post-row').on('click', '.users-slidedown', function(){
        var $target = $(this).parents('.users-area');
        $target.find('.users-hide, .users-slidedown').hide();
        $target.find('.users-slideup, .more-users').show();
    });
    $('.post-row').on('click', '.users-slideup', function(){
        var $target = $(this).parents('.users-area');
        $target.find('.users-slideup, .more-users').hide();
        $target.find('.users-hide, .users-slidedown').show();
    });
    var $survey_result = $('#survey-result');
    if($survey_result.length > 0) {
        var actor_sum = $survey_result.attr('data-actor-sum');
        if(actor_sum > 0) {
            $('.survey-subject-charts').each(function(){
                var $this = $(this);
                var data = JSON.parse($this.text());
                var highcharts_config;
                if(data.type == 1) {
                    highcharts_config = {
                            colors: [ "#ff0900", "#fe7600", "#feba00", "#77ce00", "#1eb4ff", "#2465ff", "#2800ff",
                                      "#ff00d4", "#c900ff", "#a30300", "#a46100",
                                      "#a0a900","#77ce00","#3cc934","#0e72a2","#2465ff","#1443a6","#a20087","#7d00a0"],
                        title: null,
                        chart: {
                            type: 'pie'
                        },
                        tooltip: {
                            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                        },
                        series: [{
                            type: 'pie',
                            name: '选择',
                            data: []
                        }],
                        legend: {
                            labelFormatter: function() {
                                var tmp_array = this.name.split('.');
                                return tmp_array[0];
                            }
                        },
                        plotOptions: {
                            pie: {
                                allowPointSelect: true,
                                cursor: 'pointer',
                                dataLabels: {
                                    formatter: function() {
                                        return this.percentage.toFixed(1) + '%';
                                    },
                                    style: {
                                        color:Highcharts.theme
                                    }
                                    //distance: -40,
                                    //color: 'white'
                                },
                                showInLegend: true
                            }
                        },
                        credits: {
                            enabled: false
                        }
                    };
                    $.each(data.options, function(index, option){
                        highcharts_config.series[0].data.push(['选项' + (index+1) + '. ' + ((option.content)?option.content:''), option['hitNum']]);
                    });
                }
                if(data.type == 2) {
                    highcharts_config = {
                        colors: [ "#ff0900", "#fe7600", "#feba00", "#77ce00", "#1eb4ff", "#2465ff", "#2800ff",
                                        "#ff00d4", "#c900ff", "#a30300", "#a46100",
                                        "#a0a900","#77ce00","#3cc934","#0e72a2","#2465ff","#1443a6","#a20087","#7d00a0"],
                        title: null,
                        chart: {
                            type: 'bar'
                        },
                       
                        xAxis: {
                            categories: [],
                            labels: {
                                formatter: function() {
                                    var tmp_array = this.value.split('.');
                                    return tmp_array[0];
                                }
                            }
                        },
                        yAxis: {
                            allowDecimals: false,
                            min: 0,
                            max: actor_sum,
                            title: {
                                text: null
                            },
                            labels: {
                                overflow: 'justify'
                            }
                        },
                        tooltip: {
                            valueSuffix: '人'
                        },
                        series: [{
                            name: '选择人数',
                            data: []
                        }],
                        credits: {
                            enabled: false
                        }
                    };
                    $.each(data.options, function(index, option){
                        highcharts_config.xAxis.categories.push('选项' + (index+1) + '. ' + ((option.content)?option.content:''));
                        highcharts_config.series[0].data.push(option['hitNum']);
                    });
                }
                $this.text('').show().highcharts(highcharts_config);
            });
        }
    }
});

function select_view(sub_id){
    var $modal = $('.survey-preview-modal');
    //$modal.find('.modal-body').css('max-height:400 px;');
    var id = sub_id;
    var $survey_area = $('#select-area-view');
    $('.survey-select-view-charts').empty();
    $('#user_list').empty();
    $('#survey_title').empty();
    $modal.find('.modal-title').text('查看选择情况明细');
    $modal.attr('data-id', id);
    $modal.modal('show');
    $.getJSON(host + '/notice/get_select_view_json/' + id, function(res){
        $("#survey_title").append(res.series_title);
        $('.survey-select-view-charts').highcharts({
            colors: [ "#ff0900", "#fe7600", "#feba00", "#77ce00", "#1eb4ff", "#2465ff", "#2800ff",
                      "#ff00d4", "#c900ff", "#a30300", "#a46100",
                      "#a0a900","#77ce00","#3cc934","#0e72a2","#2465ff","#1443a6","#a20087","#7d00a0"],
            chart: {
                   plotBackgroundColor: null,
                   plotBorderWidth: null,
                   plotShadow: false
               },
            title: {
                   text: ''
               },
            tooltip: {
                enabled:res.is_tooltip,
                headerFormat: '',
                style:{
                    width: '100px',
                    color: '#333333',
                    cursor: 'default',
                    fontSize: '12px',
                    padding: '8px',
                    whiteSpace: 'nowrap'
                },
                formatter: function () {
                    var po=this.point.x;
                    return res.tip_data[po]['tipinfo'];
                }
            },
            credits:{
                enabled: false
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                        style: {
                           color:Highcharts.theme
                        }
                    },
                    showInLegend: true
                }
            },
            series: [{
               type: 'pie',
               name: '',
               data: res.series_data
            }]
        });

            var str="";
                $.each(res.user_data,function(index,item){
                    if(arr_count(item)>1){
                        $.each(item,function(i,result){
                            str+="<span>"+result.title+"</span>"+"<div class='users-area'>"+result.userlist+"</div>";
                        });
                    }else{
                        str+="<span>"+item[0].title+"</span>"+"<div class='users-area'>"+item[0].userlist+"</div>";
                    }
                });
                $('#user_list').append(str);
          });
}

function arr_count(o){
    var t = typeof o;
    if(t == 'string'){
        return o.length;
    }else if(t == 'object'){
        var n = 0;
        for(var i in o){n++;}
        return n;
    }
    return false;
}