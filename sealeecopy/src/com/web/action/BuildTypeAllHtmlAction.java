package com.web.action;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

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


public class BuildTypeAllHtmlAction extends Action{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding( "UTF-8" ); 
		TSiteInformationDAO infoDAO = new TSiteInformationDAO();
		PagerDAO pagerDAO = new PagerDAO();
		TSiteTypeDAO typeDAO = new TSiteTypeDAO();
		
		//获取到待显示信息
		//String id = request.getParameter("id");
		String type = request.getParameter("type");
		TSiteInformation info = new TSiteInformation();
			//info = infoDAO.getInfo(id);
		TSiteType sitetype = new TSiteType();
		sitetype = typeDAO.getTypeName(type);
		
		//获取到网页右侧新闻以及导读信息
		List info1000 = new ArrayList();
		List info1011 = new ArrayList();
		List infoshow = new ArrayList();
		List infonew = new ArrayList();
		List aboutNews = new ArrayList();
		List infoReply = new ArrayList();
		List allPage = new ArrayList();
		try{
			info1000 = pagerDAO.findWithPage(11,0," from TSiteInformation a where a.remark='1' and a.type='1000'  order by a.date_created desc");
			info1011 = pagerDAO.findWithPage(7,0," from TSiteInformation a where a.remark='1' and a.type='1011'  order by a.date_created desc");
			infoshow = pagerDAO.findWithPage(11,0," from TSiteInformation a where a.remark='1' and a.is_show=1 and a.type='"+type+"' order by a.date_created desc");
			infonew = pagerDAO.findWithPage(11,0," from TSiteInformation a where a.remark='1' and a.type='"+type+"'  order by a.date_created desc");
			allPage = pagerDAO.findAllPage(" from TSiteInformation a where a.type='"+type+"'");
			
		}catch(Exception e){
			e.printStackTrace();
			return mapping.findForward("fail");
		}
		
		//获取到系统模板路径
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
			String tempId = info.getId();
			if(info.getNote_keyword()==null||info.getNote_keyword().equals("")){
				info.setNote_keyword("网页设计，网页设计教程");
			}
			if(info.getNote_description()==null||info.getNote_description().equals("")){
				info.setNote_description("提供网页设计相关教程资料");
			}
			Map root = new HashMap();
			root.put("article", info);
			//获取到系统模板路径
			String templatePath = request.getRealPath("templates");
			String htmlPath = request.getRealPath("html"+"\\"+info.getType());
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
				aboutNews= pagerDAO.findWithPage(3,0," from TSiteInformation a where a.type='"+type+"' and a.id!='"+tempId+"' and a.date_created<'"+dt+"'  order by a.date_created desc");
				//infoReply= pagerDAO.findWithPage(20,0," from TInforReply a where a.infor_id='"+tempId+"' order by a.reply_date");
				root.put("inforeply", infoReply);
				root.put("aboutnew", aboutNews);
			}catch(Exception e){
				e.printStackTrace();
			}
			bOK=test.geneHtmlFile(templatePath,"view.ftl",root,htmlPath,htmlFileName);
		}
		
		request.setAttribute("type", type);
		
		if(bOK){
			return mapping.findForward("sucess");
		}else{
			return mapping.findForward("false");
		}
	}
}
