$(function(){
    if(window.location.hash !== '') {
        $('#target-tab option[data-id="' + window.location.hash.substring(1) + '"]').prop('selected', true);
        $('#target-tab').trigger('change');
    }

    var role = $('#page-wrapper').attr('data-role');
    var fixHelper = function(e, ui) {
        ui.children().each(function() {
            $(this).width($(this).width());
        });
        return ui;
    };
    var refreshOrder = function() {
        $('#banner-table .order').each(function(index){
            $(this).text(index + 1);
        });
    };
    var table = $('#banner-table').DataTable({
        'pageLength': 20,
        'info': true,
        'lengthChange': false,
        'bSort': false,
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
    if(role !== 'edu' && role !== 'admin') {
        table.column(3).search($('#target-tab').val()).draw();
        $('#target-tab').on('keyup change', function() {
            window.location.href = '#' + $(this).children(':selected').attr('data-id');
            table.column(3).search(this.value).draw();
            refreshOrder();
        });
    }
    refreshOrder();
    $('#banner-table').on('click', '.title', function(){
        var id = $(this).parent().attr('data-feed-id');
        var type = $(this).parent().attr('data-type');
        window.location.href = host + '/notice/detail/banner/' + type + '/' + id;
    });

    $("#banner-table tbody").sortable({
        axis: 'y',
        helper: fixHelper,
        items: '.items',
        update: refreshOrder
    });
    $('#btn-banner-release').on('click', function(){
        var data = [];
        $('#banner-table .items').each(function(){
            var row_data = {};
            var $tr = $(this);
            row_data.id = $tr.attr('data-id');
            row_data.order = $tr.children('.order').text();
            data.push(row_data);
        });
        $.post(host + '/notice/banner_order_submit', {'data': JSON.stringify(data)}, function(res){
            window.location.reload();
        }, 'json')
    });


    $('#banner-table').confirmation({
        selector: '.btn-del',
        placement: 'left',
        title: '确认删除么？',
        btnOkLabel: '删除',
        btnCancelLabel: '取消',
        onConfirm: function(e, element){
            var data = {};
            data.id = $(element).parents('tr').attr('data-feed-id');
            data.category = 1;
            $.post(host + '/notice/delete', {data: JSON.stringify(data)}, function(){
                window.location.reload();
            }, 'json');
        }
    });

    $('.panel-body').confirmation({
        selector: '.btn-off',
        placement: 'left',
        title: '确认下线么？',
        btnOkLabel: '下线',
        btnCancelLabel: '取消',
        onConfirm: function(e, element){
            $.post(host + '/notice/banner_off', {id: $(element).parents('tr').attr('data-id')}, function(){
                window.location.reload();
            }, 'json');
        }
    });
    
    $('#banner-table').on('click','.link-compile',function(){
        var feed_id = $(this).parent().parent().attr('data-feed-id');
        window.location.href = host + '/notice/create/banner/'+feed_id;
    });

});
