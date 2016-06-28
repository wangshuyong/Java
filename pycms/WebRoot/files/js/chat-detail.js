$(function(){
	var stripscript =function(s){
        //var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？%]")
        var rs = "";
        for (var i = 0; i < s.length; i++) {
            rs = $.trim(rs+s.substr(i, 1).replace(/[~'!,<>@#$%^&?{}【】‘；：”“'。，、*()-+_=:]/g, ''));
       }
        return $.trim(rs);
    };
    var isIE = function () {
        var notIE = -[1,];
        if(-[1,]){
            return false;
        }else{
            return true;
        }
    };
    
	var is_y=true;
    $('#chat-image-upload').bind('change',function(){
    	is_y=true;
    	is_img=false;
    	var filepath=$("#chat-image-upload").val();
        var extStart=filepath.lastIndexOf(".");
        var ext=filepath.substring(extStart,filepath.length).toUpperCase();
        if(ext!=".BMP"&&ext!=".PNG"&&ext!=".GIF"&&ext!=".JPG"&&ext!=".JPEG"){
        	commModal.alert({content: '图片限于png,gif,jpeg,jpg格式'});
        	is_img = true;
        	return false;
        }
    });
	 $('#chat-image-upload').fileupload({
	        url: host + '/upload/image?state=homework_img',//限制图片不能大于5M，和homework上传图片一样
	        dataType: 'json',
	        autoUpload: true,
	        acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
	        maxFileSize: 5242880, // 5 MB
	        previewMaxWidth: 400,
	        previewMaxHeight: 400,
	        previewCrop: false
	    }).on('fileuploadadd', function (e, data) {
	    	var ori_file=data.originalFiles.length; 
            if(ori_file>9 &&is_y){
            	is_y=false;
            	commModal.alert({content: '最多只能上传9张图片'});
            	return false;
            }
	        $.each(data.files, function (index, file) {
	            var size=file.size;
	            if(size && size > 5242880) {
                 	commModal.alert({content: '图片不能大于5MB'});
                    is_img=true;
                    return false;
                }
	            var name_r=file.name;
                var namearr=name_r.split('.');
	            data.context = $('<div id="row-node-'+stripscript(namearr[0])+'" class="chat-self isselect" />').prependTo('.details-body .row');
	            var node=$('#row-example-0').html();
	            data.context.append(node);
	        });
	    }).on('fileuploadprocessalways', function (e, data) {
	    	if(is_img){
	    		return false;
	    	}
	    	$.each(data.files,function(index,file){
	    		var name_r=file.name;
	            var namearr=name_r.split('.');
	            node = $('#row-node-'+stripscript(namearr[0]));
		        if (file.preview) {
		            node.find('.content').append(file.preview);
		            //<i class="btn-file-del fa fa-remove"/>
		            node.find('.content').append('<div class="gSys-msg"><i class="fileupload-processing" /></div>');
		        }
		        if (file.error) {
		            node.append('<br>').append($('<span class="text-danger" />').text(file.error));
		        }		
	    	});
	    	
	    	 if(is_y){
//		         data.submit();
		         var jqXHR = data.submit().error(function (jqXHR, textStatus, errorThrown) {
		             if(textStatus == 'abort'){
		                 return false;
		             }else{
		               commModal.alert({content: '图片上传失败，可能由于文件过大、上传超时等问题引起，请重试。'});
		             }
		         })
		     }else{
		         return false;
		     }
	    }).on('fileuploadprogressall', function (e, data) {
	    	var progress = parseInt(data.loaded / data.total * 100, 10);
	    }).on('fileuploaddone', function (e, data) {
	            if (data.result.success) {
	                var name_r=data.result.file.name;
	                var namearr=name_r.split('.');
	                var tmp_data = {};
                	var image = {};
                    image.type = 1;
                    image.fid = data.result.file.id;
                    image.attr = 0;
                    tmp_data.content = JSON.stringify(image);
                    tmp_data.target_id = $('.chat-input-area').attr('data-target-id');
                    tmp_data.type = 1;
                    $.post(host + '/chat/send', {data: JSON.stringify(tmp_data)}, function(res){
                        $('#row-node-'+stripscript(namearr[0])).find('.gSys-msg').remove();
                        $('#row-node-'+stripscript(namearr[0])).attr('data-cursor-id',res.cursor);
                        if(isIE()){
                            window.location.reload();
                        }
                     }, 'json');
	            } else if (file.error) {
	                var error = $('<span class="text-danger" />').text(file.error);
	                $('#row-node-'+stripscript(namearr[0]))
	                    .append('<br>')
	                    .append(error);
	            }else{     //返回错误的情况
	                var name_r=data.result.name;
	                var namearr=name_r.split('.');
	                $('#row-node-'+stripscript(namearr[0])).remove();
	             	commModal.alert({content: data.result.msg});
	            }
	    }).on('fileuploadfail', function (e, data) {
	        $.each(data.files, function (index) {
	            var error = $('<span class="text-danger"/>').text('File upload failed.');
	            $('#row-node-'+index)
	                .append('<br>')
	                .append(error);
	        });
	    }).on('fileuploadsubmit',function(e,data){
	    	 
	    });

    $('#page-wrapper').on('click', '.btn-file-del', function(){
        $(this).parent().remove();
    });
    
    $('#chat-content').on('keyup change', function(){
        var $this = $(this);
        var content = $.trim($this.val());
        if(content.length > 0) {
            $('#btn-chat-image').hide();
            $('#btn-chat-send').show();
        } else {
            $('#btn-chat-image').show();
            $('#btn-chat-send').hide();
        }
    });

    var sendTextMessage = function(){
        var $input = $('#chat-content');
        var content = $.trim($input.val());
        if(content.length > 0) {
            $input.val('');
            var data = {};
            data.content = content;
            data.target_id = $('.chat-input-area').attr('data-target-id');
            data.type = 0;
            var $btn = $('#btn-chat-send').button('loading');
            $.post(host + '/chat/send', {data: JSON.stringify(data)}, function(res){
                window.location.reload();
            }, 'json')
        }
    };

    $('#btn-chat-send').on('click', function(){
        sendTextMessage();
    });

    $('#chat-content').on('keyup', function(e){
        var code = e.keyCode || e.which;
        if(code == 13) { //Enter keycode
            sendTextMessage();
        }
    });

    $('.btn-play-audio').on('click', function(){
        var audio = $(this).siblings('audio')[0];
        if(audio.readyState == 4){
            audio.currentTime = 0;
            audio.play();
        }
     
    });
});

function arr_count(o){
    var t = typeof o;
    if(t == 'string'){
        return o.length;
    }else if(t == 'object'){
        var n = 0;
        for(var i in o){n++;}
        return n;
    }
    return false;
}
