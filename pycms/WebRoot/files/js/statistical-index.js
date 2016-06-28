$(function(){

    var query_basic = 0;
    var $btn_query_basic;
    
    var school_id = $('#page-wrapper').attr('data-school-id');
    var teacher_id = $('#page-wrapper').attr('data-teacher-id');
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
    
    var is_show = school_id?true:false;    //是否显示字段
    var title = school_id?'date':'name';   //显示时间/学校名称
    
    //基础统计
    var $table = $('#statistical-basic-table');
    var table = $table.DataTable({
        'ordering' : false,
        "searching" : true,
        'processing': true,
        'serverSide': true,
        "autoWidth": false,
        "ajax" : {
            url : host+'/statistical/basic_list',
            'type':'post',
            data:function(d){
                get_data();
                d.school_id = data.school_id;     //学校id
                d.school_name = data.school_name; //搜索时学校名称
                d.start_date = data.start_date;   //开始时间 小时间
                d.end_date = data.end_date;       //结束时间 大时间
            }
        },
        'pageLength': 20,
        'info': true,
        'lengthChange': false,
        "aoColumnDefs": [{      //ming 错误 加这个是为了防止页面报错
            sDefaultContent: '',
            aTargets: [ '_all' ]
        }],
        'columns': [{'data': title},
                    {'data': 'teacher_sum'},
                    {
                        'data': 'teacher_valid_sum',
                        'visible': !is_show,
                        'render': function (data){
                            return data;
                        }
                    },
                    {'data': 'student_sum'},
                    {'data': 'not_tied_p_s'},
                    {'data': 'parents_sum'},
                    {
                        'data': 'parents_valid_sum',
                        'visible': !is_show,
                        'render': function (data){
                            return data;
                        }
                    },
                    {'data': 'class_post_sum'},
                    {'data': 'class_vote_sum'},
                    {'data': 'class_survey_sum'},
                    {'data': 'school_post_sum'},
                    {'data': 'school_vote_sum'},
                    {'data': 'school_survey_sum'},
                    {'data': 'homework_sum'},
                    {'data': 'exam_result_sum'},
                    {'data': 't_p_chat_sum'},
                    {'data': 'p_t_chat_sum'},
                    {'data': 'p_p_chat_sum'},
                    {'data': 't_t_chat_sum'},
                    {
                        'data': 'z_f_teacher',
                        "visible": is_show,
                        'render': function(data,type,full){
                            if(school_id){
                                return full.z_f_teacher;
                            }else{
                                return '';
                            }
                        }
                    },
                    {
                        'data': 'z_f_parent',
                        "visible": is_show,
                        'render': function(data,type,full){
                            if(school_id){
                                return full.z_f_parent;
                            }else{
                                return '';
                            }
                        }
                    },
                    {
                        'data': 'login_in_teacher',
                        "visible": is_show,
                        'render': function(data,type,full){
                            if(school_id){
                                return full.login_in_teacher;
                            }else{
                                return '';
                            }
                        }
                    },
                    {
                        'data': 'login_in_parent',
                        "visible": is_show,
                        'render': function(data,type,full){
                            if(school_id){
                                return full.login_in_parent;
                            }else{
                                return '';
                            }
                        }
                    },
                    {
                        'data': 'new_activate',
                        "visible": is_show,
                        'render': function(data,type,full){
                            if(school_id){
                                return full.new_activate;
                            }else{
                                return '';
                            }
                        }
                    }
                   ],
        'createdRow': function(row, data, index) {      //回调，给tr赋值
            if(data.school_id){
                var res_school_id = data.school_id;
            }else{
                var res_school_id = 'all';
            }
            $(row).attr('data-school-id', res_school_id);
        },
        "infoCallback":function(data){                  //表格状态信息改变的回调函数
            if(query_basic){
                query_basic=0;
                $btn_query_basic.button('reset');
            }
        },
        'language': {
            "info": "_START_到_END_条，共_TOTAL_条",
            "search": "搜索：",
            "zeroRecords": '没有找到',
            "infoFiltered": "从_MAX_条中筛选",
            "infoEmpty": "没有记录",
            "paginate": {
                "previous": "上一页",
                "next": "下一页"
            },
            'processing':'加载中…'
        }
    });
    $("#query_basic").on('click', function() {//搜索学校名称、时间段
        data = get_data();
        if(data.start_date.trim()!=='' && data.end_date.trim()===''){
          commModal.alert({content:'请填写结束时间'});
            $('#end_date').focus()
            return false;
        }else if(data.start_date.trim()=='' && data.end_date.trim()!==''){
         commModal.alert({content:'请填写开始时间'});
            $("#start_date").focus();
            return false;
        }
        query_basic = 1;
        $btn_query_basic = $(this).button('loading');
        table_teacher.ajax.reload();
        table.ajax.reload();
    });
    
    /**
     * 教师统计
     * */
    var is_show_teacher = false;  //判断是否是展示教师姓名、职务
    var is_show_school_name = false;    //判断是否是admin登陆，查看所有学校情况。
    var is_show_date = false;           //判断是否是第具体老师的情况，有时间展示。
    if(school_id && teacher_id){//具体老师的统计    三级，某个学校中、某个老师的每天统计
        is_show_date = true;
    }else if(school_id){        //学校详情中统计    二级，某个学校中的老师
        is_show_teacher = true;
    }else{                      //所有学校展示        一级，所有学校
        is_show_school_name = true;
    }
    
    //教师统计
    var $table_teacher = $('#statistical-teacher-table');
    var table_teacher = $table_teacher.DataTable({
        'ordering' : false,
        "searching" : true,
        'processing': true,
        'serverSide': true,
        "ajax" : {
            url : host+'/statistical/teacher_list',
            'type':'post',
            data:function(d){
                get_data();
                d.school_id = data.school_id;      //学校id
                d.school_name = data.school_name;  //搜索时学校名称
                d.teacher_name = data.teacher_name;//搜索时老师名称
                d.start_date = data.start_date;    //开始时间 小时间
                d.end_date = data.end_date;        //结束时间 大时间
                d.teacher_id = data.teacher_id;    //教师id
            }
        },
        'pageLength': 20,
        'info': true,
        'lengthChange': false,
        "aoColumnDefs": [{      //有错误 加这个是为了防止页面报错
            sDefaultContent: '',
            aTargets: [ '_all' ]
        }],
        'columns': [
                    {
//学校名字
                        'data': 'name',
                        "visible": is_show_school_name,
                        'render': function(data,type,full){
                            return data;
                        }
                    },
                    {
//具体时间
                        'data': 'date',
                        "visible": is_show_date,
                        'render': function(data,type,full){
                            return data;
                        }
                    },
                    {
//教师名字
                        'data': 'teacher_name',
                        "visible": is_show_teacher,
                        'render': function(data,type,full){
                            return data;
                        }
                    },
                    {
//教师职务
                        'data': 'teacher_job',
                        "visible": is_show_teacher,
                        'render': function(data,type,full){
                            return data;
                        }    
                    },
                    {
//教师是否有效
                        'data': 'teacher_valid',
                        'visible': is_show_teacher,
                        'render': function(data,type,full){
                            if(data){
                                return '是';
                            }else{
                                return '否';
                            }
                        }
                    },
                    {
//覆盖学生数量
                        'data': 'cover_student_sum',
                        "visible": is_show_teacher,
                        'render': function(data,type,full){
                            return data;
                        } 
                        
                    },
                    {
//覆盖家长数量
                        'data': 'cover_parent_sum',
                        "visible": is_show_teacher,
                        'render': function(data,type,full){
                            return data;
                        } 
                    },
                    {
//通知数量
                        'data': 'notice_sum'},
                    {
//作业数量    
                        'data': 'homework_sum'},
                    {
//附件消息数量
                        'data': 'accessory_sum'},
                    {
//评论数量
                        'data': 'comment_sum'},
                    {
//回复数量
                        'data': 'reply_sum'},
                    {
//点赞数量
                        'data': 'praise_sum'},
                    {
//tp消息人数
                        'data': 't_p_person',
                        "visible": is_show_school_name,
                        'render': function(data,type,full){
                            return data;
                        }
                    },
                    {
//tp消息条数
                        'data': 't_p_sum'},
                    {
//pt消息人数
                        'data': 'p_t_person'},
                    {
//pt消息条数
                        'data': 'p_t_sum'}
                   ],
        'createdRow': function(row, data, index) {      //回调，给tr赋值
            if(data.school_id){
                var res_school_id = data.school_id;
                $(row).attr('data-school-id', res_school_id);
            }else{
                var res_teacher_id = data.teacher_id;
                $(row).attr('data-teacher-id', res_teacher_id);
            }
        },
        "infoCallback":function(data){                  //表格状态信息改变的回调函数
            if(query_basic){
                query_basic=0;
                $btn_query_basic.button('reset');
            }
        },
        'language': {
            "info": "_START_到_END_条，共_TOTAL_条",
            "search": "搜索：",
            "zeroRecords": '没有找到',
            "infoFiltered": "从_MAX_条中筛选",
            "infoEmpty": "没有记录",
            "paginate": {
                "previous": "上一页",
                "next": "下一页"
            },
            'processing': '加载中…'
        }
    });
    if(school_id && !teacher_id){   //有学校id，没有老师id
        $('#statistical-teacher-table').on('click', 'tbody tr', function(){
            var teacher_id = $(this).attr('data-teacher-id');
            window.location.href = host + '/statistical/teacher_basic/' + school_id + '/' + teacher_id;
        });
    }else if(!school_id){           //没有学校id
        $('#statistical-teacher-table').on('click', 'tbody tr', function(){
            var school_id = $(this).attr('data-school-id');
            window.location.href = host + '/statistical/teacher_basic/' + school_id;
        });
    }
  //发现统计
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
    var $table_discover = $('#statistical-discover-table');
    var table_discover = $table_discover.DataTable({
        'ordering' : false,
        "searching" : true,
        'processing': true,
        'serverSide': true,
        "ajax" : {
            url : host+'/statistical/discover_list',
            'type':'post',
            data:function(d){
                get_data();
                d.school_id = data.school_id;      //学校id
                d.start_date = data.start_date;    //开始时间 小时间
                d.end_date = data.end_date;        //结束时间 大时间
                d.teacher_id = data.teacher_id;    //教师id
            }
        },
        'pageLength': 20,
        'info': true,
        'lengthChange': false,
        "aoColumnDefs": [{      //有错误 加这个是为了防止页面报错
            sDefaultContent: '',
            aTargets: [ '_all' ]
        }],
        'columns': [
                    {'data': 'date'},
                    {'data': 'dimensionality'},
                    {'data': 'user'},
                    {'data': 'active'},
                    {'data': 'uv_sum'},
                    {'data': 'pv_sum'},
                    {'data': 'pv_uv_sum'},
                    {'data': 'order_sum'},
                    {'data': 'order_change_ratio'},
                    {'data': 'income_sum'}
                   ],
        'createdRow': function(row, data, index) {      //回调，给tr赋值
            
        },
        'language': {
            "info": "_START_到_END_条，共_TOTAL_条",
            "search": "搜索：",
            "zeroRecords": '没有找到',
            "infoFiltered": "从_MAX_条中筛选",
            "infoEmpty": "没有记录",
            "paginate": {
                "previous": "上一页",
                "next": "下一页"
            },
            'processing': '加载中…'
        }
    });
});
