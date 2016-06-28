$(function()
{
	$(window).bind("load resize",function(){
	 	 $(".friend-list").height($(".main").height()-53)
	 	 $(".chat_area").height($(".main").height()-51)
	 	 $(".dialogue").height($(".chat_area").height()-138)
	});
});