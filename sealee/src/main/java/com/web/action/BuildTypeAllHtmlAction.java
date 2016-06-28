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


public class BuildTypeAllHtmlAction extends Action{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding( "UTF-8" ); 
		TSiteInformationDAO infoDAO = new TSiteInformationDAO();
		PagerDAO pagerDAO = new PagerDAO();
		TSiteTypeDAO typeDAO = new TSiteTypeDAO();
		
		//��ȡ������ʾ��Ϣ
		//String id = request.getParameter("id");
		String type = request.getParameter("type");
		TSiteInformation info = new TSiteInformation();
			//info = infoDAO.getInfo(id);
		TSiteType sitetype = new TSiteType();
		sitetype = typeDAO.getTypeName(type);
		
		//��ȡ����ҳ�Ҳ������Լ�������Ϣ
		List info1000 = new ArrayList();
		List info1011 = new ArrayList();
		List infoshow = new ArrayList();
		List infonew = new ArrayList();
		List aboutNews = new ArrayList();
		List infoReply = new ArrayList();
		List allPage = new ArrayList();
		try{
			info1000 = pagerDAO.findWithPage(11,0," from TSiteInformation a where a.remark='1' and a.filetype='1000'  order by a.date_created desc");
			info1011 = pagerDAO.findWithPage(7,0," from TSiteInformation a where a.remark='1' and a.filetype='1011'  order by a.date_created desc");
			infoshow = pagerDAO.findWithPage(11,0," from TSiteInformation a where a.remark='1' and a.is_show=1 and a.filetype='"+type+"' order by a.date_created desc");
			infonew = pagerDAO.findWithPage(11,0," from TSiteInformation a where a.remark='1' and a.filetype='"+type+"'  order by a.date_created desc");
			allPage = pagerDAO.findAllPage(" from TSiteInformation a where a.filetype='"+type+"'");
			
		}catch(Exception e){
			e.printStackTrace();
			return mapping.findForward("fail");
		}
		
		//��ȡ��ϵͳģ��·��
		/*String templatePath = request.getRealPath("templates");
		String htmlPath = request.getRealPath("html"+"\\"+info.getType());
		String htmlFileName = id +".html";
		FreeMarkerTest test = new FreeMarkerTest();
		Map root = new HashMap();
		//root.put("article", info);
		root.put("sitetype", sitetype);
		root.put("info1000", info1000);
		root.put("info1011", info1011);
		root.put("infoshow", infoshow);
		root.put("infonew", infonew);
		root.put("inforeply", infoReply);*/
		int allNumber = allPage.size();
		boolean bOK = false;
		for(int i=0;i<allNumber;i++){
			info = (TSiteInformation) allPage.get(i);
			int tempId = info.getid();
			if(info.getNote_keyword()==null||info.getNote_keyword().equals("")){
				info.setNote_keyword("��ҳ��ƣ���ҳ��ƽ̳�");
			}
			if(info.getNote_description()==null||info.getNote_description().equals("")){
				info.setNote_description("�ṩ��ҳ�����ؽ̳�����");
			}
			Map root = new HashMap();
			root.put("article", info);
			//��ȡ��ϵͳģ��·��
			String templatePath = request.getSession().getServletContext().getRealPath("templates");
//			String templatePath = request.getRealPath("templates");
			String htmlPath = request.getSession().getServletContext().getRealPath("html"+"\\"+info.getFiletype());
			String htmlFileName = tempId +".html";
			FreeMarkerTest test = new FreeMarkerTest();
			root.put("sitetype", sitetype);
			root.put("info1000", info1000);
			root.put("info1011", info1011);
			root.put("infoshow", infoshow);
			root.put("infonew", infonew);
			try{
				java.util.Date dt = info.getDate_created();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String thisDay = sdf.format(dt);
				aboutNews= pagerDAO.findWithPage(3,0," from TSiteInformation a where a.filetype='"+type+"' and a.id!='"+tempId+"' and a.date_created<'"+dt+"'  order by a.date_created desc");
				//infoReply= pagerDAO.findWithPage(20,0," from TInforReply a where a.infor_id='"+tempId+"' order by a.reply_date");
				root.put("inforeply", infoReply);
				root.put("aboutnew", aboutNews);
			}catch(Exception e){
				e.printStackTrace();
			}
			try {
				bOK=test.geneHtmlFile("view.ftl",htmlFileName,root,"templates",htmlPath,request);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (TemplateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		request.setAttribute("type", type);
		
		if(bOK){
			return mapping.findForward("sucess");
		}else{
			return mapping.findForward("false");
		}
	}
}
