<%@ page contentType="text/html; charset=GB2312" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.regex.*"%>
<%@ page import="com.ecenter.tools.*"%>
<%@ page import="net.fiyu.edit.RemotePic"%>
<jsp:useBean id="date" scope="page" class="net.fiyu.edit.TimeStamp"/>
<%@ page import="net.fiyu.edit.UploadWebHelper,net.fiyu.edit.UploadBean"%>

<%!
// ��������
String sType, sStyleName;
//' ���ñ���
String sAllowExt, sUploadDir,sBaseUrl,sContentPath;
int  nAllowSize;
//' �ӿڱ���
String sFileExt,sSaveFileName,sOriginalFileName,sPathFileName,FileName, nFileNum;
String sAction;
Connection connect = null;
%>
<%!
/*' ============================================
' ȥ��Html��ʽ�����ڴ����ݿ���ȡ��ֵ���������ʱ
' ע�⣺value="?"���һ��Ҫ��˫����
' ============================================*/
public String inHTML(String str)
{
	String sTemp;
	sTemp = str;
	if(sTemp.equals(""))
	{
		System.exit(0);
	}
	sTemp = sTemp.replaceAll("&", "&amp;");
	sTemp = sTemp.replaceAll("<", "&lt;");
	sTemp = sTemp.replaceAll(">", "&gt;");
	sTemp = sTemp.replaceAll("\"", "&quot;");
	return sTemp;
}
//��ʼ���ϴ���������
public void InitUpload(String realpath){
	UploadWebHelper uw = new UploadWebHelper();
	uw.filename = realpath+"WEB-INF/style.xml";
	uw.getInstance();
	UploadBean bean = uw.InitPara();
	try{

		sUploadDir = bean.getSuploaddir();
        //System.out.println(sUploadDir);
		if(sType.equalsIgnoreCase("remote"))
		{
			sAllowExt =  bean.getSremoteext();
                        sAllowExt = sAllowExt + "|" + sAllowExt.toUpperCase();
			nAllowSize =  Integer.parseInt(bean.getSremotesize()) ;
                        //System.out.println(sAllowExt+nAllowSize);
		}
                else if(sType.equalsIgnoreCase("file"))
               {
			sAllowExt = bean.getSfileext();
                        sAllowExt = sAllowExt + "|" + sAllowExt.toUpperCase();
			nAllowSize = Integer.parseInt(bean.getSfilesize());
                        //System.out.println(sAllowExt+nAllowSize);
               }
               else if(sType.equalsIgnoreCase("media"))
		{
			sAllowExt =  bean.getSmediaext();
                        sAllowExt = sAllowExt + "|" + sAllowExt.toUpperCase();
			nAllowSize = Integer.parseInt(bean.getSmediasize());
                        //System.out.println(sAllowExt+nAllowSize);
		}
                else if(sType.equalsIgnoreCase("flash"))
                {
			sAllowExt =  bean.getSflashext();
                        sAllowExt = sAllowExt + "|" + sAllowExt.toUpperCase();
			nAllowSize = Integer.parseInt(bean.getSflashsize());
                        //System.out.println(sAllowExt+nAllowSize);
                }
		else
                {
			sAllowExt =  bean.getSimageext();
                        sAllowExt = sAllowExt + "|" + sAllowExt.toUpperCase();
			nAllowSize = Integer.parseInt(bean.getSimagesize());
                        //System.out.println(sAllowExt+nAllowSize);
                }
	}
	catch(Exception e){
        }
}
%>
<%
//��������
sType=request.getParameter("type");
if(sType==null)
{
sType="image";
}
else
sType=request.getParameter("type").trim();
//������ʽ
sStyleName=request.getParameter("style");
if (sStyleName==null)
{
  sStyleName="standard";
}
else
sStyleName=request.getParameter("style").trim();
//���ö���
sAction=request.getParameter("action");
if(sAction==null)
{
  sAction="sun";
}
else
sAction=request.getParameter("action").trim();
%>
<%
//��ʼ���ϴ�����
InitUpload(config.getServletContext().getRealPath("/"));
//�Ͽ����ݿ�����
//sAction = UCase(Trim(Request.QueryString("action"))
if(sAction.equalsIgnoreCase("remote"))
{    //Զ���Զ���ȡ
	String sContent;
		String RemoteFileurl=null;
	String Protocol,sUrl;
	int Port;
	String LocalFileurl=null;
	String SrcFileurl=null;
	String SaveFileName=null;
	sContent=request.getParameter("eWebEditor_UploadText");
    if(sContent==null || "".equals(sContent))
	{
		sContent="û������";
	}
	else
		sContent=new String(request.getParameter("eWebEditor_UploadText").getBytes("iso8859-1"));
	//System.out.println();
	//System.out.println();
	//System.out.println();
	//System.out.println();
    //System.out.println("�滻ǰ��html���Ϊ:"+"\n"+sContent);
    



	sContent=inHTML(sContent);
	
	out.println("<HTML><HEAD><TITLE>Զ���ϴ�</TITLE><meta http-equiv='Content-Type' content='text/html; charset=gb2312'></head><body>");
	out.print("<input type=hidden id=UploadText value=\"");
	out.print(sContent);
	out.println("\">");
	out.println("</body></html>");
	out.println("<script language=javascript>");
	out.print("parent.setHTML(UploadText.value);try{parent.addUploadFile('");//Ϊʲôֻȡһ���ֵ����ֻȡ������ҳ����λ��֮ǰ��ֵ��
	out.print(sOriginalFileName);
	out.print("', '");
	out.print(sSaveFileName);
	out.print("', '");
	out.print(SaveFileName);
	out.println("');} catch(e){} parent.remoteUploadOK();");
	out.println("</script>");
}
else if(sAction.equalsIgnoreCase("save"))
{
try {
  //��ʾ�ϴ��˵�
 out.println("<HTML>");
        out.println("<HEAD>");
        out.println("<TITLE>�ļ��ϴ�</TITLE>");
        out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\">");
        out.println("<style type=\"text/css\">");
        out.println("body, a, table, div, span, td, th, input, select{font:9pt;font-family: \"����\", Verdana, Arial, Helvetica, sans-serif;}");
        out.println("body {padding:0px;margin:0px}");
        out.println("</style>");
        out.println("<script language=\"JavaScript\" src=\"dialog/dialog.js\">");
        out.println("</script>");
        out.println("</head>");
        out.println("<body bgcolor=menu>");
        out.print("<form action=\"?action=save&type=");//ע��˴�Ϊʲô����println()
        out.print(sType);
        out.print("&style=");
        out.print(sStyleName);
        out.println("\" method=post name=myform enctype=\"multipart/form-data\">");
        out.println("<input type=file name=uploadfile size=1 style=\"width:100%\" onchange=\"originalfile.value=this.value\">");
        out.println("<input type=hidden name=originalfile value=\"\">");
        out.println("</form>");
        out.println("<script language=javascript>");
        out.print("var sAllowExt = \"");
        out.print(sAllowExt);
        out.println("\";");
        out.println("// ����ϴ���");
        out.println("function CheckUploadForm() {");
        out.println("if (!IsExt(document.myform.uploadfile.value,sAllowExt)){");
        out.println("parent.UploadError(\"��ʾ��\\n\\n��ѡ��һ����Ч���ļ���\\n֧�ֵĸ�ʽ�У�\"+sAllowExt+\"����\");");
        out.println("return false;");
        out.println("}");
        out.println("return true");
        out.println("}");
        out.println("// �ύ�¼��������");
        out.println("var oForm = document.myform;");
        out.println("oForm.attachEvent(\"onsubmit\", CheckUploadForm) ;");
        out.println("if (! oForm.submitUpload) oForm.submitUpload = new Array() ;");
        out.println("oForm.submitUpload[oForm.submitUpload.length] = CheckUploadForm ;");
        out.println("if (! oForm.originalSubmit) {");
        out.println("oForm.originalSubmit = oForm.submit ;");
        out.println("oForm.submit = function() {");
        out.println("if (this.submitUpload) {");
        out.println("for (var i = 0 ; i < this.submitUpload.length ; i++) {");
        out.println("this.submitUpload[i]() ;");
        out.println("			}");
        out.println("		}");
        out.println("		this.originalSubmit() ;");
        out.println("	}");
        out.println("}");
        out.println("// �ϴ�����װ�����");
        out.println("try {");
        out.println("	parent.UploadLoaded();");
        out.println("}");
        out.println("catch(e){");
        out.println("}");
        out.println("</script>");
        out.println("</body>");
        out.println("</html>");
        
        //�����ϴ����ļ�
        EcenterUpload eUpload = new EcenterUpload(pageContext, "temp\\");
        String todayStr = DateTool.getToday();
		if(todayStr.length() == 10) todayStr = todayStr.substring(0, 7);
		eUpload.upload("uploadFiles\\" + todayStr + "\\");
		String uploadfile = (String)eUpload.ht.get("uploadfile");
		
		sSaveFileName = uploadfile.substring(uploadfile.indexOf("/", 2) + 1);
		sOriginalFileName = "";
		String context = "";
		sPathFileName = uploadfile;
   out.println("<script language=javascript>");
	out.print("parent.UploadSaved('");
	out.print(sSaveFileName);
	out.print("','");
	out.print(context);
	out.print("');var obj=parent.dialogArguments.dialogArguments;if (!obj) obj=parent.dialogArguments;try{obj.addUploadFile('");
	out.print(sOriginalFileName);
	out.print("', '");
	out.print(sSaveFileName);
	out.print("', '");
	out.print(sPathFileName);
	out.print("');} catch(e){}");
	out.println(";history.back()</script>");
	} catch(Exception e) {
		out.println(e.getMessage());
	}
}
else
{
  //��ʾ�ϴ���
         out.println("<HTML>");
        out.println("<HEAD>");
        out.println("<TITLE>�ļ��ϴ�</TITLE>");
        out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\">");
        out.println("<style type=\"text/css\">");
        out.println("body, a, table, div, span, td, th, input, select{font:9pt;font-family: \"����\", Verdana, Arial, Helvetica, sans-serif;}");
        out.println("body {padding:0px;margin:0px}");
        out.println("</style>");
        out.println("<script language=\"JavaScript\" src=\"dialog/dialog.js\">");
        out.println("</script>");
        out.println("</head>");
        out.println("<body bgcolor=menu>");
        out.print("<form action=\"?action=save&type=");
        out.print(sType);
        out.print("&style=");
        out.print(sStyleName);
        out.println("\" method=post name=myform enctype=\"multipart/form-data\">");
        out.println("<input type=file name=uploadfile size=1 style=\"width:100%\" onchange=\"originalfile.value=this.value\">");
        out.println("<input type=hidden name=originalfile value=\"\">");
        out.println("</form>");
        out.println("<script language=javascript>");
        out.print("var sAllowExt = \"");
        out.print(sAllowExt);
        out.println("\";");
        out.println("// ����ϴ���");
        out.println("function CheckUploadForm() {");
        out.println("	if (!IsExt(document.myform.uploadfile.value,sAllowExt)){");
        out.println("		parent.UploadError(\"��ʾ��\\n\\n��ѡ��һ����Ч���ļ���\\n֧�ֵĸ�ʽ�У�\"+sAllowExt+\"����\");");
        out.println("		return false;");
        out.println("	}");
        out.println("	return true");
        out.println("}");
        out.println("// �ύ�¼��������");
        out.println("var oForm = document.myform ;");
        out.println("oForm.attachEvent(\"onsubmit\", CheckUploadForm) ;");
        out.println("if (! oForm.submitUpload) oForm.submitUpload = new Array() ;");
        out.println("oForm.submitUpload[oForm.submitUpload.length] = CheckUploadForm ;");
        out.println("if (! oForm.originalSubmit) {");
        out.println("	oForm.originalSubmit = oForm.submit ;");
        out.println("	oForm.submit = function() {");
        out.println("		if (this.submitUpload) {");
        out.println("			for (var i = 0 ; i < this.submitUpload.length ; i++) {");
        out.println("				this.submitUpload[i]() ;");
        out.println("			}");
        out.println("		}");
        out.println("		this.originalSubmit() ;");
        out.println("	}");
        out.println("}");
        out.println("// �ϴ�����װ�����");
        out.println("try {");
        out.println("	parent.UploadLoaded();");
        out.println("}");
        out.println("catch(e){");
        out.println("}");
        out.println("</script>");
        out.println("</body>");
        out.println("</html>");
}
%>