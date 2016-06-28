<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<HTML><HEAD><TITLE>用户登录</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
</HEAD>
<script language="javascript">
	function loginCheck(){
		if(document.UserLogin.username.value==''){
			alert('用户名不能为空！');
			document.UserLogin.username.focus();
			return false;
		}else if(document.UserLogin.password.value==''){
			alert('密码不能为空！');
			document.UserLogin.password.focus();
			return false;
		}else{
			UserLogin.submit();
		}
	}
</script>
<BODY bottomMargin=0 bgColor=#f2f2f2 leftMargin=0 topMargin=0 rightMargin=0 
marginheight="0" marginwidth="0" MS_POSITIONING="GridLayout">
<FORM id=UserLogin name=UserLogin action=userlogin.shtml method=post>
<TABLE height="100%" cellPadding=0 width="100%" align=center bgColor=#f2f2f2 
border=0>
  <TBODY>
  <TR align=middle>
    <TD vAlign=center>
      <TABLE cellSpacing=0 cellPadding=0 width=627 border=0>
        <TBODY>
        <TR>
          <TD colSpan=7><IMG height=117 alt="" src="image/login101.jpg" 
            width=627></TD>
        </TR>
        <TR>
          <TD colSpan=2 rowSpan=4><IMG height=76 alt="" 
            src="image/login_02.gif" width=252></TD>
          <TD colSpan=4><INPUT id=username 
            style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; WIDTH: 146px; BORDER-BOTTOM: 0px; HEIGHT: 14px; BACKGROUND-COLOR: #e8f4fc" 
            name=username></TD>
          <TD rowSpan=6><IMG height=222 alt="" src="image/login_04.gif" 
            width=229></TD></TR>
        <TR>
          <TD colSpan=4><IMG height=21 alt="" src="image/login_05.gif" 
            width=146></TD></TR>
        <TR>
          <TD colSpan=4><INPUT id=password 
            style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; WIDTH: 146px; BORDER-BOTTOM: 0px; HEIGHT: 14px; BACKGROUND-COLOR: #e8f4fc" 
            type=password name=password></TD></TR>
        <TR>
          <TD colSpan=4><IMG height=23 alt="" src="image/login_07.gif" 
            width=146></TD></TR>
        <TR>
          <TD rowSpan=2><IMG height=146 alt="" src="image/login_08.gif" 
            width=204></TD>
          <TD colSpan=2><FONT face=宋体><INPUT  id=ibtLogin type=image 
            src="image/login_09.gif" border=0 name=ibtLogin></FONT></TD>
          <TD rowSpan=2><IMG height=146 alt="" src="image/login_10.gif" 
            width=43></TD>
          <TD><IMG style="CURSOR: hand" onclick=window.close(); height=20 
            alt="" src="image/login_11.gif" width=75></TD>
          <TD rowSpan=2><IMG height=146 alt="" src="image/login_12.gif" 
            width=1></TD></TR>
        <TR>
          <TD colSpan=2><IMG height=126 alt="" src="image/login_13.gif" 
            width=75></TD>
          <TD><IMG height=126 alt="" src="image/login_14.gif" 
        width=75></TD></TR>
        <TR>
          <TD><IMG height=1 alt="" src="image/spacer.gif" width=204></TD>
          <TD><IMG height=1 alt="" src="image/spacer.gif" width=48></TD>
          <TD><IMG height=1 alt="" src="image/spacer.gif" width=27></TD>
          <TD><IMG height=1 alt="" src="image/spacer.gif" width=43></TD>
          <TD><IMG height=1 alt="" src="image/spacer.gif" width=75></TD>
          <TD><IMG height=1 alt="" src="image/spacer.gif" width=1></TD>
          <TD><IMG height=1 alt="" src="image/spacer.gif" 
width=229></TD></TR>
        <TR>
          <TD align=middle colSpan=7></TD></TR></TBODY></TABLE></TD></TR>
  <TR style="DISPLAY: none">
        <TD colSpan=4>&nbsp;</TD>
      </TR></TBODY></TABLE>
</FORM></BODY></HTML>
