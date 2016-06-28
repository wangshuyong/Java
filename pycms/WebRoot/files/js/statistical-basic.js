$(function(){
    var school_id = $('#page-wrapper').attr('data-school-id');
    if(!school_id){
        $('#statistical-basic-table').on('click', 'tbody tr', function(){
            var school_id = $(this).attr('data-school-id');
            window.location.href = host + '/statistical/basic/' + school_id;
        });
    }
});