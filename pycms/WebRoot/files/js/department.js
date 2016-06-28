$(function(){
    var $table_department = $('.table')
    $table_department.confirmation({
        selector: '[data-toggle="confirmation"]',
        placement: 'left',
        btnCancelLabel: '取消',
        onConfirm: function(e, element){
            var data = {};
            var $element = $(element);
            data.dep_id = $element.parents('tr').attr('data-id');
            $.post(host + $element.attr('data-action'), {data: JSON.stringify(data)}, function(res){
                if(res.success) {
                    window.location.reload();
                } else {
                    commModal.alert({content: res.msg});
                }
            }, 'json');
        }
    });
});