$(function(){
    $('#wrapper').on('click', '.btn-edit', function(){
        var $tr = $(this).parents('tr');
        var title = $tr.children('.title').text();
        var type = $tr.attr('data-type');
        var status = $tr.attr('data-status');
        var order = $tr.children('.order').text();
        $('.tab-edit-modal').attr('data-order', order).modal('show');
        $('#tab-title').val(title);
        if(type == 1) {
            $('#tab-status').addClass('hide');
        } else {
            $('#tab-status').removeClass('hide');
            $('#tab-status').children('option:selected').prop('selected', false);
            $('#tab-status>[value='+status+']').prop('selected', true);
        }
    });
    $('#wrapper').on('click', '.btn-del', function(){
        $(this).parents('tr').remove();
    });
    $('#btn-tab-add').on('click', function(){
        $('.tab-edit-modal').removeAttr('data-order').modal('show');
        $('#tab-title').val('');
        $('#tab-status').removeClass('hide').children('option:selected').prop('selected', false);
    });

    $('#wrapper').on('click', '#btn-submit', function(){
        var $modal = $(this).parents('.modal');
        var order = $modal.attr('data-order');
        var title = $.trim($('#tab-title').val());
        var status = $('#tab-status').hasClass('hide') ? '0' : $('#tab-status').val();
        if(order) {
            $('#tab-table .order:eq('+(order-1)+')').parent('tr').attr('data-status', status)
                .find('.status').text(status == 0 ? '上线' : '下线')
                .siblings('.title').text(title);
        } else {
            var html = '<tr class="items sortable" data-type="3" data-status="'+status+'">';
            html += '<td class="order">' + ($('#tab-table .sortable').length + 3) + '</td>';
            html += '<td class="title">'+title+'</td>';
            html += '<td class="status">' + (status == 0 ? '上线' : '下线') + '</td>';
            html += '<td></td>';
            html += '<td></td>';
            html += '<td class="table-edit"><a class="btn-edit"><span class="fa fa-pencil"></span></a> <a class="btn-del"><span class="fa fa-remove"></span></a></td></tr>';
            $('#last_td').before(html);
            $('#last_td .order').text($('#tab-table .sortable').length+3);
        }
        $modal.modal('hide');
    });
    var fixHelper = function(e, ui) {
        ui.children().each(function() {
            $(this).width($(this).width());
        });
        return ui;
    };
    var refreshOrder = function() {
        $('#tab-table .sortable .order').each(function(index){
            $(this).text(index + 3);
        });
    };
    $("#tab-table tbody").sortable({
        axis: 'y',
        helper: fixHelper,
        items: '.sortable',
        update: refreshOrder
    });
    $('#btn-tab-release').on('click', function(){
        var data = [];
        $('#tab-table tbody tr[data-type!=2]').each(function(){
            var row_data = {};
            var $tr = $(this);
            var id = $tr.attr('data-id');
            row_data.title = $.trim($tr.children('.title').text());
            row_data.status = $tr.attr('data-status');
            row_data.no = $tr.children('.order').text() - 2;
            if(id) {
                row_data.id = id;
            }
            data.push(row_data);
        });
        var $btn = $('#btn-tab-release').button('loading');
        $.post(host + '/tab/submit', {'data': JSON.stringify(data)}, function(res){
         commModal.alert({content:'发布成功'});
            window.location.reload();
        }, 'json')
    });
});
