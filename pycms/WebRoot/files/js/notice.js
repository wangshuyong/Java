

/*$(function(){
    var query_basic = 0;
    var $btn_query_basic;
    var type = $('#page-wrapper').attr('data-type');
    var column_base = type === 'class' ? 0 : 1;
    $('#notice-table').on('click', '.title', function(){
        var notice_id = $(this).parent().attr('data-notice-id');
        var notice_type = $(this).parent().attr('data-notice-type');
        var url = host + '/notice/detail/' + type + '/' + notice_type + '/' + notice_id;
        if($('#page-wrapper').attr('data-is-all')) {
            url += '?isAll=1';
        }
        alert("url="+url);
        if(notice_type==4){
            url = host + '/homework/detail/'+notice_id;
        }
        
        window.location.href = url;
    });
    $('#notice-table').on('click', '.link-again-edit', function(){
        var notice_id = $(this).parent().parent().parent().attr('data-notice-id');
        var notice_type = $(this).parent().parent().parent().attr('data-notice-type');
        var a_href='/';
        if(notice_type==1){
            a_href='#/';
        }else if(notice_type==2){
            a_href='#vote';
        }else if(notice_type==3){
            a_href='#survey';
        }else if(notice_type==4){
            a_href='#homework';
        }
        var url = host+'/notice/create_edit'+a_href;
        var body = $(document.body);
        var form = $("<form method='post'></form>");
        form.attr({"action":url});
        var input1 = $("<input type='hidden'>");
        var input2 = $("<input type='hidden'>");
        var input3 = $("<input type='hidden'>");
        
        input1.attr({"name":'type'});
        input1.val(type);
        input2.attr({"name":'notice_type'});
        input2.val(notice_type);
        input3.attr({"name":'notice_id'});
        input3.val(notice_id);

        form.append(input1);
        form.append(input2);
        form.append(input3);
        form.appendTo(document.body);
        
        form.submit();
        document.body.removeChild(form[0]);
        return false;
    });
    $('#notice-table').on('click', '.fa-arrow-up', function(){
        var $this = $(this);
        var notice_id = $this.parents('.items').attr('data-notice-id');
        var data = {
            id: notice_id
        };
        if($this.parent('.btn-top-disabled').length > 0) {
            data.top = 1
        } else {
            data.top = 0
        }
        if(type == 'class') {
            data.category = 0
        } else {
            data.category = 1
        }
        $.post(host + '/notice/set_top', data, function(res){
            table22.ajax.reload();
        }, 'json');
    });
    $('#notice-table').confirmation({
        selector: '.btn-del',
        placement: 'left',
        title: '确认删除么？',
        btnOkLabel: '删除',
        btnCancelLabel: '取消',
        onConfirm: function(e, element){
            var data = {};
            data.id = $(element).parents('tr').attr('data-notice-id');
            if(type == 'class') {
                data.category = 0
            } else {
                data.category = 1
            }
            $.post(host + '/notice/delete', {data: JSON.stringify(data)}, function(res){
                if(res.success) {
                    table22.ajax.reload();
                } else {
                  commModal.alert({content:res.msg});
                }
            }, 'json');
        }
    });
    $('#start-date, #end-date').datetimepicker({
        'todayHighlight': true,
        'format': 'yyyy-mm-dd',
        'minView': 'month',
        'language': 'zh-CN',
        'autoclose': true
    });
    $.fn.dataTable.ext.search.push(
        function( settings, data, dataIndex ) {
            var start_date = $('#start-date').val();
            var end_date = $('#end-date').val();
            var start = data[6].substring(0, 10);
            if((start_date && start < start_date) || (end_date && start > end_date)) {
                return false;
            }
            return true;
        }
    );
    
    $('#share-survey-category').on('change', function(){
        var category_id = $(this).val();
        $('#share-survey-sub-category').val('').children().each(function(){
            var $this = $(this);
            if($this.val() === '' || category_id == $this.attr('data-category-id')) {
                $this.removeClass('hidden');
            } else {
                $this.addClass('hidden');
            }
        });
    });
    var $survey_release_modal = $('.survey-release-modal');
    $('#notice-table').on('click', '.link-share-survey', function(){
        $('#share-survey-category').val('').trigger('change');
        $survey_release_modal.attr('data-feed-id', $(this).parents('.items').attr('data-notice-id'));
        $('.share-sure').show();
        $('.share-complete').hide();
        $survey_release_modal.modal('show');
    });
    $('#btn-share-survey-tpl-cancel').on('click', function(){
        $survey_release_modal.modal('hide');
    });
    $('#btn-share-survey-tpl-submit').on('click', function(){
        var data = {};
        try {
            var category_id = $('#share-survey-category').val();
            if(category_id === '') {
                $('#share-survey-category').focus();
                throw '请选择一级分类';
            }
            data.category_id = $('#share-survey-sub-category').val();
            if(data.category_id === '') {
                $('#share-survey-sub-category').focus();
                throw '请选择二级分类';
            }
        } catch(err) {
       commModal.alert({content:err});
       
       
       
       
            return false;
        }
        if(type == 'class') {
            data.category = 0
        } else {
            data.category = 1
        }
        data.feed_id = $survey_release_modal.attr('data-feed-id');
        var post_data = {data: JSON.stringify(data)};
        var $btn = $(this).button('loading');
        $.post(host + '/notice/share_survey_tpl', post_data, function(res){
            if(res.success) {
                $survey_release_modal.modal('hide');
              commModal.alert({content:'共享成功'});
                $btn.button('reset');
            } else {
             commModal.alert({content:res.msg});
                $btn.button('reset');
            }
        }, 'json');
    });
    
    var is_all_all = $('#is_all_all').html();    //是否是全校动态 有值就是
    var hostImg = $("#image_url").html();
    var sessionUid = $("#sessionUid").html();
    var role = $('#page-wrapper').attr('data-role');
    var data_type = $('#page-wrapper').attr('data-type');
    var dataSort = '';
    //学校管理员中，全校动态监控中，all
    //普通教师动态列表中 index
    var is_index = $("#page-wrapper").attr('is-index');
    
    var data = {};        //搜索内容
    var get_data = function (){    //获取页面标点数据
        data.notice_type    = $('#notice-type').val();  //选择类型
        data.start_date     = $('#start-date').val();   //发布时间
        data.end_date       = $('#end-date').val();     //结束时间
        data.notice_author  = $('#notice-author').val();//发起人
        data.notice_title   = $('#notice-title').val(); //标题内容之类
        data.page           = $("#notice_page").val();
        return data;
    };
    var is_show = true;
    if(role === 'school_admin' &&　data_type !== 'school'){    //全校动态监控的‘接受状态’列删除、没有用了
        is_show = false;
    }
    var district_admin = true;
    if(role == 'district_admin' && data_type === 'school'){
        district_admin = false;
    }*/
    
    //动态列表      /index.php/notice/index
  /* var $table22 = $('#notice-table');
   var table22 = $table22.DataTable({
       'ordering' : false,
       "searching" : true,
       'processing': true,
       'serverSide': true,
       "autoWidth": false,
       "ajax" : {
           url : host+'/notice/index_list',
           'type':'post',
           data:function(d){
               get_data();
               d.notice_type    = data.notice_type;     //1咨询、2投票、3问卷、4作业
               d.notice_author  = data.notice_author;   //发布人id
               d.start_date     = data.start_date;      //开始时间
               d.end_date       = data.end_date;        //结束时间
               d.notice_title   = data.notice_title;    //标题内容
               d.is_all_all     = is_all_all;           //有值就是全校动态
               d.is_page        = data.page             //分页跳转按钮用。
               d.sort           = dataSort              //排序
               d.data_type      = data_type             //用于判断是否是学区管理员登陆，并且是动态列表页面=class
           }
       },
       'pageLength': 20,
       'info': true,
       'lengthChange': false,
       "aoColumnDefs": [{      //ming 错误 加这个是为了防止页面报错
           sDefaultContent: '',
           aTargets: [ '_all' ]
       }],
       'columns': [
                   {
//类型
                       'data': 'type',
                       "visible": true,
                       'render': function(data,type,full){
                           return '<img style="display:block;margin:0 auto" src="'+hostImg+'/icon-notice-'+data+'.png">';
                       }
                   },
                   {
//标题
                       'data': 'title',
                       'render' : function (data){
                           return htmlEncode(data);
                       }
                   },
                   {
//所属table   ---     全校动态监控中的 科目   ---   学区管理员不让看所属tab 和 回复参与数
                       'data': 'subjectName',
                       'visible': district_admin,
                       'render' : function(data,type,full){
                           if(role === 'admin' || role === 'school_admin' || role === 'edu'){
                               if(is_all_all){
                                   if(full.subjectName){
                                       return full.subjectName
                                   }else{
                                       return '';
                                   }
                               }else{
                                   if(role==='district_admin'){
                                       return 'N/A';
                                   }else{
                                       return full.tabName;
                                   }
                               }
                           }else{
                               if(data){
                                   return data;
                               }else{
                                   return '';
                               }
                           }
                       }
                   },
                   {
//学校动态列表总 的 阅读数   ---   全校动态监控中的 接受状态删除  动态列表中保留
                       'data': 'user',
                       "visible": is_show,
                       'render': function(data,type,full){
                           if(role === 'admin' || role === 'school_admin' || role === 'edu'){
                               return full.browseCount;
                           }else{
                               //区域管理员登陆，并且在动态管理列表中
                               if(role === 'district_admin' && data_type!=='class'){
                                   return full.browseCount;
                               }
                               var httpa = host+'/notice/report/'+full.type+'/'+full.id;
                               if(full.receivedSum == full.targetSum && full.user.uid == sessionUid){
                                   return '<a class="received-info" href="'+httpa+'">全部接收</a>';
                               }else if(full.user.uid == sessionUid){
                                   return '<a class="received-info" href="'+httpa+'"><i>'+full.receivedSum+'</i>/'+full.targetSum+'</a>';
                               }else{
                                   return '';
                               }
                           }
                       }
                   },
                   {
//回复/参与数   ---  学区管理员不让看所属tab 和 回复参与数
                       'data': 'id',
                       'visible': district_admin,
                       'render':function(data,type,full){
                           return full.replySum+'/'+full.submitSum;
                       }
                   },
                   {'data': 'user.name'},
//发布人
                   {
//发送时间
                       'data': 'id',
                       'render':function(data,type,full){
                           if(full.releaseTime){
                               return full.releaseTime;
                           }else{
                               return full.createTime;
                           }
                       }
                   },
                   {
//结束时间
                       'data': 'id',
                       'render':function (data,type,full){
                           if(full.endTime)
                               return full.endTime;
                               return '';
                       }
                   },
                   {
//管理
                       'data': 'id',
                       'render':function (data,type,full){
                           var html='';
                           if(role === 'school_admin' || role === 'admin' || role === 'edu') {
                               if(full.showType==2){
                                   html += '<a class="btn-top-disabled"><span title="取消置顶" class="fa fa-arrow-up"></span></a>';
                               }else{
                                   html += '<a class="btn-top"><span class="fa fa-arrow-up" title="置顶"></span></a>';
                               }
                           }
                           if(full.canDelete == 1) {
                               html += '<a class="btn-del"><span class="fa fa-remove" title="删除"></span></a>';
                           }
                           if(role === 'teacher'){
                               html += '<span><a class="link-again-edit">转发</a></span>';
                           }
                           if( full.type === 3 && full.user.uid === sessionUid ){
                               html += '<a class="link-share-survey">共享</a>';
                           }
                           if(full.type === 1 && data_type === 'school'){ //状态等于1 发资学校讯才有编辑功能
                               html += '<a class="link-compile" href="'+host+'/notice/create/'+data_type+'/'+full.id+'">编辑</a>';
                           }
                           return html;
                       }
                   }
                  ],
       'createdRow': function(row, data, index) {      //回调，给tr赋值
           if(data.school_id){
               var res_school_id = data.school_id;
           }else{
               var res_school_id = 'all';
           }
           $(row).attr('data-notice-id', data.id);
           $(row).attr('data-notice-type', data.type);
           $(row).attr('entityid', data.entityId);
           $(row).addClass('items');
           
           $(row).attr('data-school-id', res_school_id);
           if(data.read){
               $('td', row).eq(1).addClass('title read');
           }else{
               $('td', row).eq(1).addClass('title');
           }
       },
       "infoCallback":function(data){                  //表格状态信息改变的回调函数
           if(query_basic){
               query_basic=0;
               $btn_query_basic.button('reset');
           }
       },
       "initComplete":function(data){     //初始化结束后回调函数
            $('#notice-table #time_sort').addClass('sorting');    //添加搜索样式css
        },
        'language': {
           "info": "_START_到_END_条，共_TOTAL_条",
           "search": "搜索：",
           "zeroRecords": '没有找到',
           "infoFiltered": "从_MAX_条中筛选",
           "infoEmpty": "没有记录",
           "paginate": {
               "first":    "首页",
               "previous": "上一页",
               "next": "下一页",
               "last":     "末页"
           },
           'processing': '正在查询'
       }
   });*/
   
//   $("#query_basic").on('click', function() {//搜索学校名称、时间段
//       $btn_query_basic = $(this).button('loading');
//       query_basic = 1;
//       table22.ajax.reload();
//   });
//   $("#time_sort").on('click',function (){
//       var scls = $(this).attr('class');
//       if(scls=='sorting_asc'){                //升序查找
//           $(this).removeClass(scls);
//           $(this).addClass('sorting_desc');
//           dataSort = 'staTA';
//       }else{                                    //降序查找
//           $(this).removeClass(scls);
//           $(this).addClass('sorting_asc');
//           dataSort = 'staTD';
//       }
//       table22.ajax.reload();
//   });
//   //输入页码数跳转页面，功能没有开发好
//   $("#page-wrapper").on('click', '#query_page', function(){
//       var num_but = $("#notice_page").val();
//       var is_num = shuzi(num_but);
//       var all = $("#notice-table1_next").prev().text();
//       if(is_num){
//           num_but = parseInt(num_but);
//           if(!num_but){
//             commModal.alert({content:'请输入数字'});
//               return false;
//           }
//       }else{
//           commModal.alert({content:'请输入数字'});
//           return false;
//       }
//       if(all < num_but){
//         commModal.alert({content:'选择页数过大'});
//           return false;
//       }
//       table22.ajax.reload();
//   });
//   function shuzi(str){
//       var s = /^[0-9]*$/;
//       return s.test(str);
//   }
//});
