$(function(){
    //
    var table = $('#chat-table').DataTable({
        'pageLength': 20,
        'info': true,
        'lengthChange': false,
        'order': [[3, 'desc']],
        'columnDefs': [
            { "orderable": false, "targets": 2 }
        ],//小三角
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


    $('#chat-table').on('click', '.items', function(){
        window.location.href = host + '/chat/detail/' + $(this).attr('data-target-id');
    });

});