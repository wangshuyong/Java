package com.web.action;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.dao.PagerDAO;
import com.dao.TSiteInformationDAO;
import com.model.TSiteInformation;

public class HttpViewInformationAction extends Action{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		TSiteInformationDAO infoDAO = new TSiteInformationDAO();
		PagerDAO pagerDAO = new PagerDAO();
		
		String id = request.getParameter("article");
		TSiteInformation info = infoDAO.getInfo(id);
		if(info.getNote_keyword()==null||info.getNote_keyword().equals("")){
			info.setNote_keyword("网页设计，网页设计教程");
		}
		if(info.getNote_description()==null||info.getNote_description().equals("")){
			info.setNote_keyword("提供网页设计相关教程资料");
		}
		java.util.Date dt = info.getDate_created();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String thisDay = sdf.format(dt);
		
		/**
		 * 显示网页右侧新闻以及导读信息
		 */
		List info1000 = null;
		List infoshow = null;
		List aboutNews = null;
		List infoReply = null;
		List info1011 = new ArrayList();
		try{
			info1000 = pagerDAO.findWithPage(11,0," from TSiteInformation a where a.type='1000'  order by a.date_created desc");
			infoshow = pagerDAO.findWithPage(11,0," from TSiteInformation a where a.is_show=1  order by a.date_created desc");
			aboutNews= pagerDAO.findWithPage(3,0," from TSiteInformation a where a.type='1000' and a.date_created >'"+thisDay+"'");
			infoReply= pagerDAO.findWithPage(20,0," from TInforReply a where a.infor_id='"+id+"' order by a.reply_date");
			info1011 = pagerDAO.findWithPage( 7,0," from TSiteInformation a where a.remark='1' and a.type='1011'  order by a.date_created desc");
		}catch(Exception e){
			e.printStackTrace();
			return mapping.findForward("fail");
		}
		request.setAttribute("article", info);
		infoDAO.doUpdateClickNum(id);
		request.setAttribute("info_id", info.getId());
		request.setAttribute("info_type", info.getFiletype());
		request.setAttribute("info1000", info1000);
		request.setAttribute("info1011", info1011);
		request.setAttribute("infoshow", infoshow);
		request.setAttribute("aboutnew", aboutNews);
		request.setAttribute("inforeply", infoReply);
		return mapping.findForward("sucess");
	}
}
