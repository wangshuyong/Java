package com.web.action;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.dao.PagerDAO;
import com.dao.TSiteInformationDAO;
import com.dao.TSiteTypeDAO;
import com.model.TSiteInformation;
import com.model.TSiteType;
import com.util.FreeMarkerTest;

import freemarker.template.TemplateException;


public class BuildHtmlAction extends Action{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding( "UTF-8" ); 
		TSiteInformationDAO infoDAO = new TSiteInformationDAO();
		PagerDAO pagerDAO = new PagerDAO();
		TSiteTypeDAO typeDAO = new TSiteTypeDAO();
		
		//��ȡ������ʾ��Ϣ
		String id = request.getParameter("id");
//		filetype
		String filetype = request.getParameter("filetype");
		
		TSiteInformation info = infoDAO.getInfo(id);
		if(info.getNote_keyword()==null||info.getNote_keyword().equals("")){
			info.setNote_keyword("ces");
		}
		if(info.getNote_description()==null||info.getNote_description().equals("")){
			info.setNote_description("ces");
		}
//		TSiteType sitetype = new TSiteType();
//		sitetype = typeDAO.getTypeName(filetype);
		//��ȡ����ҳ�Ҳ������Լ�������Ϣ
		java.util.Date dt = info.getDate_created();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String thisDay = sdf.format(dt);
		
		List info1000 = new ArrayList();
		List info1011 = new ArrayList();
		List infoshow = new ArrayList();
		List infonew = new ArrayList();
		List aboutNews = new ArrayList();
		List infoReply = new ArrayList();
		try{
			info1000 = pagerDAO.findWithPage(11,0," from TSiteInformation a where  a.filetype='"+filetype+"'  order by a.date_created desc");
			info1011 = pagerDAO.findWithPage(7,0," from TSiteInformation a where   a.filetype='"+filetype+"'   order by a.date_created desc");
			infoshow = pagerDAO.findWithPage(11,0," from TSiteInformation a where  a.is_show=1 and a.filetype='"+filetype+"'  order by a.date_created desc");
			infonew = pagerDAO.findWithPage(11,0," from TSiteInformation a where  a.filetype='"+filetype+"'  order by a.date_created desc");
			aboutNews= pagerDAO.findWithPage(3,0," from TSiteInformation a where  a.filetype='"+filetype+"'  and a.id!='"+id+"'  order by a.date_created desc");
			//aboutNews= pagerDAO.findWithPage(3,0," from TSiteInformation a where a.type='1000' and a.date_created >'"+thisDay+"'");
			//infoReply= pagerDAO.findWithPage(20,0," from TInforReply a where a.infor_id='"+id+"' order by a.reply_date");
		}catch(Exception e){
			e.printStackTrace();
			return mapping.findForward("fail");
		}
		
		//��ȡ��ϵͳģ��·��
//		String templatePath = request.getSession().getServletContext().getRealPath("templates");
//		freemarkerCfg.setServletContextForTemplateLoading(request.getSession().getServletContext(), fileName);
//				"E:/workspace/work/sealee/WebRoot/templates";
//				this.getServlet().getServletContext().getRealPath("templates");
//		String templatePath = request.getRealPath("templates");
//		 String path= request.getSession().getServletContext().getRealPath("/");
		String htmlPath = request.getSession().getServletContext().getRealPath("html")+"\\"+filetype +"\\";
		String htmlFileName =info.getTitle()+".html";
		
		Map<Object, Object> root =new HashMap<Object,Object>();
		root.put("article", info);
		root.put("sitetype", filetype);
		root.put("info1000", info1000);
		root.put("info1011", info1011);
		root.put("infoshow", infoshow);
		root.put("infonew", infonew);
		root.put("aboutnew", aboutNews);
		root.put("inforeply", infoReply);
		FreeMarkerTest test = new FreeMarkerTest();
		boolean bOK=false;
		try {
			bOK = test.geneHtmlFile("view.ftl",htmlFileName,root,"templates",htmlPath,request);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TemplateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("type", filetype);
		
		if(bOK){
			return mapping.findForward("success");
		}else{
			return mapping.findForward("false");
		}
	}
}
