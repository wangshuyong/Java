<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
body,td,th {
	font-family: ����;
	font-size: 12px;
}
a:link {
	color: #000099;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #000099;
}
a:hover {
	text-decoration: underline;
	color: #993300;
}
a:active {
	text-decoration: none;
	color: #993300;
}
-->
</style><body>
<table style="margin-left:0px; margin-top:0px; border-right:2px solid #799ae1;border-left:2px solid #799ae1;" width="180" border="0" cellspacing="0" cellpadding="0" height="490">
  <tr>
    <td width="180" height="25" align="left" valign="top" bgcolor="#799ae1" >&nbsp;</td>
  </tr>
  <tr>
    <th height="24" align="left" valign="middle" scope="row"  >&nbsp;&nbsp;&nbsp; <img src="manage/image/cbfxt_10.gif" height="20" align="absbottom" /> ϵͳ����</th>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="25" >&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/tree_closefolder.gif" height="20" align="absbottom"/> <a href="userlist.shtml" target="main"><strong>�û�����</strong></a></td>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="25" >&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/tree_closefolder.gif" height="20" align="absbottom"/> <a href="listsitetype.shtml" target="main"><strong>������</strong></a></td>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="25" >&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/tree_closefolder.gif" height="20" align="absbottom"/><a href="manage/info/new.jsp" target="main"><strong> ��Ϣ����</strong></a></td>
  </tr>

  <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listsiteinfo.shtml?type=1000" target="main">��ҵ��̬</a></td>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listsiteinfo.shtml?type=1001" target="main">��վ�ƹ�</a></td>
  </tr>
   <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listsiteinfo.shtml?type=1002" target="main">PHP����</a></td>
  </tr>
     <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listsiteinfo.shtml?type=1003" target="main">JAVA����</a></td>
  </tr>
       <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listsiteinfo.shtml?type=1004" target="main">ASP����</a></td>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listsiteinfo.shtml?type=1005" target="main">���ݿ�Ӧ��</a></td>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listsiteinfo.shtml?type=1006" target="main">��ҳ����</a></td>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listsiteinfo.shtml?type=1007" target="main">ͼ�δ���</a></td>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listsiteinfo.shtml?type=1008" target="main">�ĵ��̳�</a></td>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listsiteinfo.shtml?type=1009" target="main">javascript</a></td>
  </tr>
    <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listsiteinfo.shtml?type=1010" target="main">��������</a></td>
  </tr>
    <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listsiteinfo.shtml?type=1011" target="main">����������</a></td>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="25" >&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/tree_closefolder.gif" height="22" align="absbottom" /> <a href="manage/info/buildhtml.jsp" target="main"><strong>����HTML</strong></a></td>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="25" >&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/tree_closefolder.gif" height="22" align="absbottom" /> <a href="manage/advertise/new.jsp" target="main"><strong>������</strong></a></td>
  </tr>

  <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listadvertise.shtml?type=1" target="main">���ֹ��</a></td>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listadvertise.shtml?type=2" target="main">ͼƬ���</a></td>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listadvertise.shtml?type=3" target="main">��������</a></td>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listadvertise.shtml?type=4" target="main">ͼƬ����</a></td>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="20" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="manage/image/cbfxt_ico_new.gif" height="20" align="absbottom"/> <a href="listadvertise.shtml?type=5" target="main">��ҳ�л�ͼƬ</a></td>
  </tr>
  <tr>
    <td scope="row" align="left" valign="middle" height="25" >&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<img src="manage/image/tree_zandian.gif" height="20" align="absbottom" /> <a href="exituser.shtml" target="_blank"><strong>�˳���½</strong></a></td>
  </tr>
</table>
</body>
