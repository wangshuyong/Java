function adv_left(){
	location.href="http://sealee.ucbox.com";	
}

function doad(){
	location.href="http://www.92os.com.cn/zhucegongsi/wangluo/";	
}
function ajax_user(){
	var XMLSender = new ActiveXObject("Microsoft.XMLHTTP" );
        XMLSender.Open("POST","ajaxuserstate.shtml",false);
        XMLSender.send();
	var tempMember =  XMLSender.responseText;
	var member = tempMember.split("|");
	if(member.length==2){
		var memberName = member[1];
		var memberid = member[0];
		if(memberName!=''&&memberName!='undefined'){
			document.getElementById('state_view').style.visibility = "hidden";
			document.getElementById('state_view').style.display = "none";
			document.getElementById('state_hidden').style.visibility = "visible";
			document.getElementById('state_hidden').style.display = "";
			document.getElementById('membername').innerHTML = memberName;
		}
	}
}