$(function(){
    var $btn = $('#btn-submit').on('click', function(){
        var data = {};
        var $name = $('#name');
        data.name = $.trim($name.val());
        var $scope_checked = $('[name=scope]:checked');
        try {
            if(data.name.length === 0) {
                $name.focus();
                throw '请输入部门名称';
            }
            if($scope_checked.length === 0) {
                throw '请选择可见范围';
            }
            data.visible = $scope_checked.val();
        } catch (e) {
       		commModal.alert({content:e});
            return;
        }
        $btn.button('loading');
        $.post(host + '/department/create_submit', {data: JSON.stringify(data)}, function(res){
            if(res.success) {
                window.location.href = host + '/department/edit/' + res.data.id;
            } else {
                commModal.alert({content:res.msg});
                $btn.button('reset');
            }
        }, 'json');
    });
});