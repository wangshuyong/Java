$(function() {
    
    var table = $('#teachers-table').DataTable({
        'pageLength': 20,
        'info': true,
        'lengthChange': false,
        'order': [],
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
    $('#teacher-name').on('keyup change', function() {
        table.column(0).search(this.value).draw();
    });
    $('#wrapper').on('click', '.btn-del', function(){
        var $tr = $(this).parents('tr');
        var name = $tr.find('.name').text();
        var uid = $tr.attr('data-uid');
        $('.teacher-del-modal .modal-body').removeClass('has-error');
        $('.teacher-del-modal').attr('data-uid', uid).modal('show');
        $('.teacher-del-modal .modal-title>span').text(name);
    });
    $('#btn-del-sure').on('click', function(){
        var reason = $.trim($('#reason').val());
        var uid = $('.teacher-del-modal').attr('data-uid');
        if(reason.length === 0) {
            $('.teacher-del-modal .modal-body').addClass('has-error');
            $('#reason').focus();
            return;
        }
        $.post(host + '/data/school/del_teacher', {
            uid: uid,
            reason: reason
        }, function(res){
            if(res.success) {
                window.location.reload();
            } else {
                 commModal.alert({content:res.msg});
            }
        }, 'json');
    });
    
    $('#teachers-table').on('click','.change-school',function(){
        var uid = $(this).parents('tr').attr('data-uid');
        $('.migrate-teacher-modal').attr('data-uid', uid).modal('show');
    });
    //老师转移学校
    $('#btn-migrate-teacher-sure').on('click',function(){
        var data = {};
        data.teacher_uid = $(this).parents().parents().parents().parents().attr('data-uid');
        data.new_school_id = $('#school_id').val();
        data.comment = $('#migrate-comment').val();
        data.sub_name = $('#duplication-discern').val();
        try {
            if(data.new_school_id===''){
                throw '请选择学校';
            }
            if(data.sub_name){
                var myReg = /^[\u4e00-\u9fa5]+$/;
                if (myReg.test(data.sub_name[0]) || myReg.test(data.sub_name[1])) {
                    throw '请输入非中文字符！';
                }
            }
        }catch(err){
            commModal.alert({content:err});
            return false;
        }
        var $btn = $(this).button('loading');
        $.post(host + '/data/school/migrate_teacher', {data: JSON.stringify(data)}, function(res){
            if(res.success) {
                window.location.reload();
            } else if(res.msg == 'duplication_of_name'){
                commModal.alert({content:'用户名已存在，请输入重名标识'});
                $('.duplication-of-name').removeClass('hidden');
                $btn.button('reset');
            } else {
                commModal.alert({content:res.msg});
                $btn.button('reset');
            }
        }, 'json');
    });
    
    
});
$.ajaxSetup({
    async: false
});
function form_student_add(){
    $.ajaxSetup({
        async: false
    });
    var data={};
    data.identity='student';
    data.name = $("#add_one_student input[name='name']").val();              //姓名
    data.gender = $("#add_one_student select[name=gender] option").val();    //性别
    data.grade = $("#add_one_student input[name='grade']").val();            //年级
    data.class_name = $("#add_one_student input[name='class_name']").val();  //班级
    data.year = $("#add_one_student input[name='year']").val();              //入学年份
    data.roll_number = $("#add_one_student input[name='roll_number']").val();//学籍号
    data.id_card_number = $("#add_one_student input[name='id_card_number']").val();      //身份证 
    data.class_roll_number = $("#add_one_student input[name='class_roll_number']").val();//学号
    data.classId = $("#add_one_student input[name='classId']").val();
    try {
        if(!data.name){
            throw '名字不能为空';
        }else if(!data.gender){
            throw '性别不能为空';
        }else if(!data.grade){
            throw '年级不能为空';
        }else if(!data.class_name){
            throw '班级不能为空';
        }else if(!data.year){
            throw '入学年份不能为空';
        }
    }catch(err){
         commModal.alert({content:err});
        return false;
    }
    //return true;
    /*****添加ajax.post 提交******/
    var $btn = $('#add_student').button('loading');
    $.post(host + '/data/school/add', {'identity': data.identity,'name':data.name,'gender':data.gender,'grade':data.grade,'class_name':data.class_name,'year':data.year,'roll_number':data.roll_number,'id_card_number':data.id_card_number,'class_roll_number':data.class_roll_number}, function(res){
        if(res.success){
             commModal.alert({content:res.msg});
            window.location.href = host + '/data/school/class_students/'+data.classId;
        }else{
             commModal.alert({content:res.msg});
        }
        $btn.button('reset');
    },'json');
    return false;
}
function form_teacher_add(){
    $.ajaxSetup({
        async: false
    });
    var data={};
    data.identity='teacher';
    data.name = $("#add_one_teacher input[name='name']").val();                  //姓名
    data.gender = $("#add_one_teacher select[name=gender] option").val();        //性别
    data.mobile = $("#add_one_teacher input[name='mobile']").val();              //手机号
    data.is_admin = $("#add_one_teacher select[name=is_admin] option").val();    //是否信息主任
    data.post = $("#add_one_teacher input[name='post']").val();                  //职务
    data.sub_name = $("#add_one_teacher input[name='sub_name']").val();          //同名老师
    data.other_post = $("#add_one_teacher input[name='other_post']").val();      //其他职务
    try {
        var myreg = /^[1][0-9]{10}$/;
        if(!data.name){
            throw '名字不能为空';
        }else if(data.name.length>10){
            throw '名字不能大于10位';
        }else if(data.sub_name.length>2){
            throw '同名标识过长';
        }else if(!data.gender){
            throw '性别不能为空';
        }else if(data.mobile.length > 0 && !myreg.test(data.mobile)){
            throw '请输入有效的手机号码';
        }else if(!data.post){
            throw '职务不能为空';
        }else if(data.post.length>10){
            throw '职务不能大于10位';
        }else if(data.other_post.length>10){
            throw '其他职务不能大于10位';
        }
        
        
    }catch(err){
         commModal.alert({content:err});
        return false;
    }
    var $btn = $('#add_teacher').button('loading');
    $.post(host + '/data/school/add', {'identity': data.identity,'name':data.name,'gender':data.gender,'mobile':data.mobile,'is_admin':data.is_admin,'post':data.post,'sub_name':data.sub_name,'other_post':data.other_post}, function(res){
        if(res.success){
             commModal.alert({content:res.msg});
            window.location.href = host + '/data/school/teachers';
        }else{
             commModal.alert({content:res.msg});
        }
        $btn.button('reset');
    },'json');
    return false;
}