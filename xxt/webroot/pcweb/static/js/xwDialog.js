/*
 var dialog= $("#_Dialog").xwDialog();//调用插件，将返回值赋给变量dialog
 dialog.hide()  //关闭dialog
 dialog.insertTitle(title);//设置对话框标题 title:字符串
 dialog.insertContent(content)//设置对话框内容 content: html字符串 或  模板
 dialog.insertBtn(btnText,fn)//设置对话框按钮，btnText ：按钮文本，fn ：绑定到该按钮的CLICK事件上的处理函数
*/
!(function($){
	$.fn.xwDialog=function(){
	      var me=$(this);
		  $("#_Mask").height($(document).height()).show();
		  me.css({ 
			  top:function(){ return ($(window).height() - me.height())/2},
			  left:function(){ return ($(window).width() - me.width())/2}
			  }).show();
		  $(".close",me).click(hide);
	      function hide(){
		      $("#_Mask").hide()
			  me.hide();
			  me.find(".content").empty()
			  me.find(".btns").empty()
			  $(".close",me).unbind("click")
		  }
		  function insertTitle(tit){
			me.find("h2").text(tit)
		  }
		  function insertContent(con){
			 if(typeof con =="string"){
				 me.find(".content").html(con);
			 }else{
			     me.find(".content").html(con.val());
			 }
		     var y= ($(window).height() - me.height())/2
			 var x=($(window).width() - me.width())/2
			 me.animate({top:y,left:x},"fast")
		  }
		  function insertBtn(btnText,cname,fn){
				$("<span></span>")
				 .text(btnText)
				 .addClass(cname)
				 .appendTo( me.find(".btns"))
				 .bind("click",fn);
		  }
		  return {
			  "hide":hide,
			  "insertTitle":insertTitle,
			  "insertContent":insertContent,
			  "insertBtn":insertBtn
		  }
	}
$.fn.showTips=function(){
	var me=$(this)
	if(   $("#toolTips").length==0){
		$(
		'<div id="toolTips">'+
		'<div class="content">'+
		'<span class="a">\u25c6</span>'+
		'<span class="b">\u25c6</span>'+
		'<p>#content</p>'+
		'</div>'+
		'</div>'
		).appendTo("body");
	}
   me.bind("mouseenter",function(){
	   var td=$(this)
	   var tags=td.data("keys")
	   var x=td.offset().left
	   var y=td.offset().top
       $("#toolTips").find(".content p").text(tags)
	   x+=(td.width()-$("#toolTips").width())/2
	   $("#toolTips").show().css({ top:y+34,   left:x })
   }).bind("mouseleave",function(){
	   $("#toolTips").hide()
	   })
}
})(jQuery)
