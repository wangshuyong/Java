$(function() {
    var table = $('#classes-table').DataTable({
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
    $('#wrapper').on('click', '.btn-del', function(){
        var school_id = $("#page-wrapper").attr('school-id');
        var uid  = $(this).parents('tr').attr('data-id');
        var grade_id       = $(this).parents('tr').attr('grade-id');
        $.post(host + '/data/school/grade_teacher_delete', {
            school_id: school_id,
            grade_id: grade_id,
            uid:uid
        }, function(res){
            if(res.success) {
                window.location.reload();
            } else {
                commModal.alert({content:res.msg});
            }
        }, 'json');
    });
    $('#wrapper').on('click', '.btn-edit', function(){
        var $tr = $(this).parents('tr');
        var name = $tr.find('.name').text();
        var grades = $tr.find('.grades').text();
        var class_id = $tr.attr('data-id');
        $('#class-name').val(name);
        var option_length = $('#grades-name option').length;
        var i = 0;
        $('#grades-name option').each(function (){
            if($(this).text()==grades){
                $('#grades-name')[0].selectedIndex = i;
             }
            i++;
        });
        
        $('.class-edit-modal .modal-body').removeClass('has-error');
        $('.class-edit-modal').attr('data-id', class_id).modal('show');
    });
    $('#btn-submit').on('click', function(){
        var name = $.trim($('#class-name').val());
        var class_id = $('.class-edit-modal').attr('data-id');
        var grade_id = $("#grades-name").find("option:selected").val();
        if(name.length === 0) {
            $('.class-edit-modal .modal-body').addClass('has-error');
            $('#name').focus();
            return;
        }
        $.post(host + '/data/school/class_edit_submit', {
            name: name,
            grade_id:grade_id,
            class_id: class_id
        }, function(res){
            if(res.success) {
                window.location.reload();
            } else {
                commModal.alert({content:res.msg});
            }
        }, 'json');
    });
});