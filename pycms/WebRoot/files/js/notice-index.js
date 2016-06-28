$(function(){
    
    /**
     *  // 测试后，可以删除。。删除没用的
     
    var hostImg = $("#image_url").html();
    if(hostImg!=undefined){
        var sessionUid = $("#sessionUid").html();
    }

    $("#notice-table1");        //类表页面
    
    */
    
    $(".pagination");            //分页
    var all = $("#comeFore").html();    //所有分页
    var all1 = $("#comeFore").html();
    var page_all = $("#comeThree").html();
    var is_all_all = $('#is_all_all').html();    //是否是全校动态
    var role = $('#page-wrapper').attr('data-role');
    var data_type = $('#page-wrapper').attr('data-type');
    var data = {};        //搜索内容
    var get_data = function (){    //获取页面标点数据
        data.notice_type    = $('#notice-type').val();    //选择类型
        data.start_date        = $('#start-date').val();    //发布时间
        data.end_date        = $('#end-date').val();        //结束时间
        data.notice_author    = $('#notice-author').val();//发起人
        data.notice_title    = $('#notice-title').val();    //标题内容之类
        data.page             = 1;
        return data;
    };
    $.ajaxSetup({
        async: false
    });
    /**
     * 0.首次执行加载数据页面
     * */
    paging(1,true);
    
    /**
     * 1.写分页 直接点击分页页码。。
     */
    $('#notice-table_paginate .pagination .paginate_button').on('click' , function(){
        
        data = get_data();
        data.page = $(this).find("a").html();
        var one_page = $(".pagination .active").find('a').html();
        if(one_page == data.page){
            return false;
        }
        if(data.page=='…'){
            return false;
        }
        paging(data.page);
    });
    /***
     * 点击上一页、下一页
     */ 
    $("#notice-table_next").on('click',function(){
        
        var now_page = parseInt($(this).parent().find('.active').find('a').html());
        if(now_page==all){
          commModal.alert({content:'已经到最后一页'});
            return false;
        }
        var a = $(this).parent().find('.active');
        a.removeClass('active');
        
        data = get_data();
        data.page=now_page+1;
        paging(data.page);
        
    });
    $("#notice-table_previous").on('click',function(){
        var now_page = parseInt($(this).parent().find('.active').find('a').html());
        if(now_page==1){
          commModal.alert({content:'已经到第一页'});
            return false;
        }
        var a = $(this).parent().find('.active')
        a.removeClass('active');
        data={};
        data.page=now_page-1;
        all = $("#comeFore").html();
        paging(data.page);
    });
    
    //手动填写分页select_page
    $("#select_page_but").on('click',function(){
        var num_but = $("#select_page").val();
        var is_num = shuzi(num_but);
        if(is_num){
            num_but = parseInt(num_but);
            if(!num_but){
              commModal.alert({content:'请输入数字'});
                return false;
            }
        }else{
            commModal.alert({content:'请输入数字'});
            return false;
        }
        if(all < num_but){
         commModal.alert({content:'选择页数过大'});
            return false;
        }
        data = get_data();
        data.page=num_but;
        paging(num_but);
    });
    function shuzi(str){
        var s = /^[0-9]*$/;
        return s.test(str);
    }
    //分配html到页面中
    /**
     * 
    function display_html(res){
        var result;
        if(typeof(res)=='string'){
            result = eval("(" + res + ")");
        }else{
            result = res;
        }
        $("#notice-table-tbody").children().remove();
        $.each(result,function(key,val){
            
            var html = '';
            var sumNum;
            if(val.receivedSum == val.targetSum && val.user.uid == sessionUid){
                sumNum = '全部接收';
            }else if(val.user.uid == sessionUid){
                sumNum = '<i>'+val.receivedSum+'</i>'+'/'+val.targetSum;
            }else{
                sumNum = '';
            }
            var replySum = val.replySum+'/'+val.submitSum;
            var img = 'icon-notice-'+val.type+'.png';
            var subjectName = val.subjectName?val.subjectName:'';
            var startTime = val.releaseTime?val.releaseTime:val.createTime;
            var read = val.read==1?'read':'';
            var httpa = host+'/notice/report/'+val.type+'/'+val.id;
            
            html += '<tr data-notice-id="'+val.id+'" data-notice-type="'+val.type+'" entityid="'+val.entityId+'" class="items">';
            html += '<td valign="middle" align="center"><img src="'+hostImg+img+'"></td>';
            html += '<td class="title '+read+'">'+val.title+'</td>';
            html += '<td>'+subjectName+'</td>';
            html += '<td style="text-align:center;">';
            html += '<a class="received-info" href="'+httpa+'">';
            html += ''+sumNum+'</a></td>';
            html += '<td style="text-align:center">'+replySum+'</td>';
            html += '<td>'+val.user.name+'</td>';
            html += '<td>'+startTime+'</td>';
            if(val.endTime==0){
                html += '<td></td>';
            }else{
                html += '<td>'+val.endTime+'</td>';
            }
            html += '<td class="table-edit">';
            if(is_all_all == '1') {
                if(val.showType==2){
                    html += '<a class="btn-top-disabled"><span title="取消置顶" class="fa fa-arrow-up"></span></a>';
                }else{
                    html += '<a class="btn-top"><span class="fa fa-arrow-up" title="置顶"></span></a>';
                }
            }
            if(val.canDelete == 1) {
                html += '<a class="btn-del"><span class="fa fa-remove" title="删除"></span></a>';
            }
            if(role === 'teacher'){
                html += '<span><a class="link-again-edit">转发</a></span></td>';
            }
            html += '</tr>';
            $("#notice-table-tbody").append(html);
        });
    }*/
    
    function paging(page,is_first){        //获取数据后  分页
        $("#shop_loading").css('display','block');
       /**
        * 不用的删除。。以前是用在动态分页中。
        if(hostImg!=undefined){
//动态类表分页
            alert(1);
            1234567890
            $.post(host + '/notice/index_list', {'data': data,is_all_all:is_all_all}, function(res){
                if(res.err) {
                    if(!is_first) {
                        alert(res.err);
                    }
                    return false;
                }
                display_html(res.data);
                
                all = Math.ceil(res.total/20);
                page_all = res.total;
            }, 'json');
//        }else{ */
//        }
        var feed_id = $("#page-wrapper").attr('data-id');
        var type = $("#page-wrapper").attr('data-type');
        data.feed_id = feed_id;
        data.type = type;
        $.get(host + '/notice/detail_replies', {'data': data}, function(res){
            if(res.err) {
                if(!is_first) {
              commModal.alert({content:res.err});
                }
                return false;
            }
            if(res.total != 0){
                display_html_reply(res.data);
            }
            all = Math.ceil(res.total/20);
            page_all = res.total;
        }, 'json');
        $("#shop_loading").css('display','none');
        for(i=1;i<=all1;i++){
            if(i>all){
                $("#page"+i).css('display','none');
            }else if(i==page){                                //和自己相等要显示出来
                $("#page"+i).addClass('active');
                $("#page"+i).css('display','inline');
            }else if(page-2<=i && page>i || all==6){                //显示前边两个
                $("#page"+i).css('display','inline');
            }else if(i-2<=page && page<i || all==6){                //显示后边两个
                $("#page"+i).css('display','inline');
            }else if(page==4 && i==1){                    //到第4个的时候，第一页要显示
                $("#page"+i).css('display','inline');
            }else if(all-3==page && i==all){            //到倒数第4个的时候，显示最后一页
                $("#page"+i).css('display','inline');
            }else if(i<=5 && page<4){                    //小于3时，要显示前5条数据
                $("#page"+i).css('display','inline');
            }else if(page>all-2 && i+4>=all){            //到最后几个显示5条
                $("#page"+i).css('display','inline');
            }else{                                        //其余隐藏
                $("#page"+i).css('display','none');
            }
            if(i!=page){
                $("#page"+i).removeClass('active');
            }
        }
        if(page>4 && all>6){
            $(".notice-table_ellipsis").css('display','inline');
        }else{
            $(".notice-table_ellipsis").css('display','none');
        }
        if(all-3>page && all>6){
            $("#page_wei").find('a').html(all);
            $(".notice-table_ellipsis1").css('display','inline');
        }else{
            $(".notice-table_ellipsis1").css('display','none');
        }
        if(all == page){
            $("#notice-table_next").addClass('disabled');
        }else{
            $("#notice-table_next").removeClass('disabled');
        }
        if(page==1){
            $("#notice-table_previous").addClass('disabled');
        }else{
            $("#notice-table_previous").removeClass('disabled');
        }
        
        /**
         * 分页数量改变
         * */
        var beg = (page-1)*20+1;
        var ove = (page-1)*20+20;
        if(ove>=page_all){
            ove = page_all;
        }
        if(page_all){
            $("#comeOne").html(beg);
        }else{
            $("#comeOne").html('没有查到相关数据');
        }
        $("#comeTwo").html(ove);
        $("#comeThree").html(page_all);
        
    }
    
    function display_html_reply(res){
        var res_url = $("#res_url").attr('res_url');
        if(res_url == 'undefined'){
            res_url = '';
        }
        var result = res;
        var data_uid = $("#page-wrapper").attr('data_uid');
        var role = $("#page-wrapper").attr('data-role');
        var sess_uid = $("#page-wrapper").attr('data_uid');
        var disable_reply_feed = $("#res_url").attr('disable_reply_feed');
        var disable_reply_feed_data = $("#res_url").attr('disable_reply_feed_data');
        var html = '';
        $(".remove_post_row").remove();
        $.each(result,function(key,val){
            var res_def_img = $("#res_url").attr('res_def_img');
            var has_quote = val.replies.length>1;
            var last_reply_index = val.replies.length - 1;
            var sixin = host+'/chat/detail/'+val.replies[last_reply_index].user.uid+'?href=' + res_url;
            if(val.replies[last_reply_index].user.avatar){
                res_def_img = val.replies[last_reply_index].user.avatar;
            }
            html += '<div class="post-row remove_post_row dis_replies_'+key+'" id="reply-'+val.replies[last_reply_index].id+'" data-id="'+val.replies[last_reply_index].id+'" data-chain-id="'+val.replies[last_reply_index].chainId+'">';
            html += '<div class="dl-left">';
            html += '<p><img width="80" src="'+res_def_img+'"></p>';
            html += '<p class="user-name">'+htmlEncode(val.replies[last_reply_index].user.name)+'</p>';
            if(data_uid != val.replies[last_reply_index].user.uid){
                html += '<p class="user-sixin"><i class="fa fa-envelope-o"></i><a href="'+sixin+'">发私信</a></p>';
            }else{
                html += '<p class="user-sixin" class="hidden"><i class="fa fa-envelope-o"></i><a href="">发私信</a></p>';
            }
            html += '</div>';
            html += '<div class="dl-right">';
            if(has_quote){
                html += '<p class="reply-quote">'+nl2br(htmlEncode(val.replies[0].content))+'<br><span class="reply-quote-info">'+val.replies[0].user.name+'&nbsp;发表于&nbsp;'+val.replies[0].time+'</span></p>';
            }
            html += '<p>'+nl2br(htmlEncode(val.replies[last_reply_index].content))+'</p>';
            html += '<ul class="item-actions">';
            if(disable_reply_feed==='0' && disable_reply_feed_data==='0'){
                html += '<li class="quote-reply"><i class="fa fa-reply"></i> 回复</li>';
            }
            var hide='';
            console.log(typeof(sess_uid) ,typeof(val.replies[last_reply_index].user.uid));
            if(role !== 'school_admin' && sess_uid != val.replies[last_reply_index].user.uid){
                hide = 'hide';
            }
            html += '<li class="btn-reply-del '+hide+'"><i class="fa fa-trash-o"></i> 删除</li>';
            if(role === 'teacher'){
                if(val.replies[last_reply_index].liked === 1){
                    html += '<li class="btn-reply-unfav like_fav" data-fav-id="'+val.replies[last_reply_index].favId+'"><i class="fa fa-star stared"></i> 取消收藏</li>';
                }else{
                    html += '<li class="btn-reply-fav like_fav"><i class="fa fa-star-o star"></i> 收藏</li>';
                }
            }
            html += '</ul>';
            html += '<span class="item-time">发表于：'+val.replies[last_reply_index].time+'</span>';
            html += '</div></div>';
        });        
        $(".details-body").append(html);
    }
    function nl2br (str, is_xhtml) {
        var breakTag = (is_xhtml || typeof is_xhtml === 'undefined') ? '<br />' : '<br>';    
        return (str + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1'+ breakTag +'$2');
    }
    
});
