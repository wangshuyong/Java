$(function(){
    $('#start_date').datetimepicker({
        'todayHighlight' : true,
        'format' : 'yyyy-mm-dd',
        'minView' : 'month',
        'language' : 'zh-CN',
        'autoclose' : true
    });

    $('#end_date').datetimepicker({
        'todayHighlight' : true,
        'format' : 'yyyy-mm-dd',
        'minView' : 'month',
        'language' : 'zh-CN',
        'autoclose' : true
    });
    $("#query").on('click', function() {
        $("#form_search").submit();
    });

    var start_date_c = $('#start_date').val();
    var end_date = $('#end_date').val();
    
    var parent_type=$('#parent-type').val();
    var parent_type_name=$('#parent-type').find("option:selected").text();
    var class_type=$('#class-type_a').val();
    var class_type_name=$('#class-type_a').find("option:selected").text();
    var data = {}                  //搜索内容
    var get_data = function (){    //获取页面标点数据
        data.school_id    = $('#page-wrapper').attr('data-school-id');//学校名字查询
        data.school_name  = $('#school-name').val();   //学校名字查询
        data.teacher_name  = $('#teacher-name').val(); //教师名字查询
        data.start_date   = $('#start_date').val();    //发布时间
        data.end_date     = $('#end_date').val();      //结束时间
        data.teacher_id   = $('#page-wrapper').attr('data-teacher-id');//教师id;
        return data;
    }
    var school_id = $('#page-wrapper').attr('data-school-id');
    var table = $("#statistical-school-table").DataTable({
        "ordering" : false,
        'pageLength': 20,
        "processing" : true,
        "bServerSide" : true,
        "searching" : false,
        "ajax" : {
            url : host+'/statistical/basic_list',
            'type':'post',
            data:function(d){
                get_data();
                d.school_id = data.school_id;     //学校id
                d.school_name = data.school_name; //搜索时学校名称
                d.start_date = data.start_date;   //开始时间 小时间
                d.end_date = data.end_date;       //结束时间 大时间
                d.is_sms = 1;                     //是否搜索短信，教师激活数
            }
        },
        "columns" : [ {
            "data" : "date"
        }, {
            "data" : "login_in_teacher"
        }, {
            "data" : "login_in_parent"
        }, {
            "data" : "sms_sum"
        }, {
            "data" : "teacher_sum"
        }, {
            "data" : "student_sum"
        }, {
            "data" : "not_tied_p_s"
        }, {
            "data" : "parents_sum"
        }, {
            "data" : "teacher_valid_sum"
        }, {
            "data" : "class_post_sum"
        }, {
            "data" : "class_vote_sum"
        }, {
            "data" : "class_survey_sum"
        }, {
            "data" : "school_post_sum"
        }, {
            "data" : "school_vote_sum"
        },{
            "data" : "school_survey_sum"
        },{
            "data" : "homework_sum"
        },{
            "data" : "exam_result_sum"
        },{
            "data" : "t_p_chat_sum"
        },{
            "data" : "p_t_chat_sum"
        },{
            "data" : "p_p_chat_sum"
        },{
            "data" : "t_t_chat_sum"
        }],
        "iDisplayLength" : 10,
        'order' : [ [ 0, 'desc' ] ],
        'language' : {
            "info" : "_START_到_END_条，共_TOTAL_条",
            "search" : "搜索：",
            "zeroRecords" : '没有找到',
            "infoFiltered" : "从_MAX_条中筛选",
            "infoEmpty" : "没有记录",
            "paginate" : {
                "previous" : "上一页",
                "next" : "下一页"
            },
            'processing':'正在处理'
        }

    });
    
    $('#parent-type').on('change',function(){
        var parent_id=$(this).val();
        var class_data=JSON.parse($('#get_class_type').text());
        $('#class-type_a').empty();
        var class_html="<option value=''>全部</option>";
        $.each(class_data[parent_id],function(index,data){
           class_html+='<option value='+data.class_id+'>'+data.class_name+'</option>';
        });
        $('#class-type_a').append(class_html);
    });
});


$.fn.dataTable.pipeline = function(opts) {
    // Configuration options
    var conf = $.extend({
        pages : 1, // number of pages to cache
        url : '', // script url
        data : null, // function or object with parameters to send to the server
        // matching how `ajax.data` works in DataTables
        method : 'GET' // Ajax HTTP method
    }, opts);

    // Private variables for storing the cache
    var cacheLower = -1;
    var cacheUpper = null;
    var cacheLastRequest = null;
    var cacheLastJson = null;

    return function(request, drawCallback, settings) {
        var ajax = false;
        var requestStart = request.start;
        var drawStart = request.start;
        var requestLength = request.length;
        var requestEnd = requestStart + requestLength;

        if (settings.clearCache) {
            // API requested that the cache be cleared
            ajax = true;
            settings.clearCache = false;
        } else if (cacheLower < 0 || requestStart < cacheLower
                || requestEnd > cacheUpper) {
            // outside cached data - need to make a request
            ajax = true;
        } else if (JSON.stringify(request.order) !== JSON
                .stringify(cacheLastRequest.order)
                || JSON.stringify(request.columns) !== JSON
                        .stringify(cacheLastRequest.columns)
                || JSON.stringify(request.search) !== JSON
                        .stringify(cacheLastRequest.search)) {
            // properties changed (ordering, columns, searching)
            ajax = true;
        }

        // Store the request for checking next time around
        cacheLastRequest = $.extend(true, {}, request);

        if (ajax) {
            // Need data from the server
            if (requestStart < cacheLower) {
                requestStart = requestStart
                        - (requestLength * (conf.pages - 1));

                if (requestStart < 0) {
                    requestStart = 0;
                }
            }

            cacheLower = requestStart;
            cacheUpper = requestStart + (requestLength * conf.pages);

            request.start = requestStart;
            request.length = requestLength * conf.pages;

            // Provide the same `data` options as DataTables.
            if ($.isFunction(conf.data)) {
                // As a function it is executed with the data object as an arg
                // for manipulation. If an object is returned, it is used as the
                // data object to submit
                var d = conf.data(request);
                if (d) {
                    $.extend(request, d);
                }
            } else if ($.isPlainObject(conf.data)) {
                // As an object, the data given extends the default
                $.extend(request, conf.data);
            }

            settings.jqXHR = $.ajax({
                "type" : conf.method,
                "url" : conf.url,
                "data" : request,
                "dataType" : "json",
                "cache" : false,
                "success" : function(json) {
                    cacheLastJson = $.extend(true, {}, json);

                    if (cacheLower != drawStart) {
                        json.data.splice(0, drawStart - cacheLower);
                    }
                    json.data.splice(requestLength, json.data.length);

                    drawCallback(json);
                }
            });
        } else {
            json = $.extend(true, {}, cacheLastJson);
            json.draw = request.draw; // Update the echo for each response
            json.data.splice(0, requestStart - cacheLower);
            json.data.splice(requestLength, json.data.length);
            drawCallback(json);
        }
    }
};

// Register an API method that will empty the pipelined data, forcing an Ajax
// fetch on the next draw (i.e. `table.clearPipeline().draw()`)
$.fn.dataTable.Api.register('clearPipeline()', function() {
    return this.iterator('table', function(settings) {
        settings.clearCache = true;
    });
});