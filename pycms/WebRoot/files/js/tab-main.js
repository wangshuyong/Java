$(function(){
    var table = $('#tab-main-table').DataTable({
        'pageLength': 20,
        'info': true,
        'lengthChange': false,
        'order': [[4, 'desc']],
        'columnDefs': [
            { "orderable": false, "targets": [1,2,3,5] }
        ],
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
    $('#tab-main-id').on('keyup change', function() {
        table.column(0).search(this.value).draw();
    });
    $('#tab-main-title').on('keyup change', function() {
        table.column(1).search(this.value).draw();
    });
    $('#tab-main-type').on('keyup change', function() {
        table.column(2).search(this.value).draw();
    });


    $('#wrapper').on('click', '.btn-edit', function(){
        var $tr = $(this).parents('tr');
        var title = $tr.children('.title').text();
        var id = $tr.attr('data-id');
        $('.tab-main-edit-modal').attr('data-id', id).modal('show');
        $('#tab-title').val(title);
    });
    $('#wrapper').on('click', '#btn-submit', function(){
        var $modal = $(this).parents('.modal');
        var id = $modal.attr('data-id');
        var title = $.trim($('#tab-title').val());
        $('tr[data-id='+id+']').children('.title').text(title);
        $modal.modal('hide');
        $.post(host + '/tab/main_submit', {'config_id': id, 'title': title}, function(res){}, 'json')
    });
});