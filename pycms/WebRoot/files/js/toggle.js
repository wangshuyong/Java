$(function(){
    $("[type='checkbox']").bootstrapSwitch({
        onText: '开',
        offText: '关'
    });
    $('#sms-toggle').on('switchChange.bootstrapSwitch', function(event, state) {
        var off = state ? 0 : 1;
        $.post(host + '/toggle/set_sms_toggle', {off: off}, function(res){
            if(!res.success) {
              commModal.alert({content:'设置失败'});
                window.location.reload();
            }
        }, 'json');
    });
    $('#reply-toggle').on('switchChange.bootstrapSwitch', function(event, state) {
        var off = state ? 0 : 1;
        $.post(host + '/toggle/set_reply_toggle', {off: off}, function(res){
            if(!res.success) {
                commModal.alert({content:'设置失败'});
                window.location.reload();
            }
        }, 'json');
    });
});