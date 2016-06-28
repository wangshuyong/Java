package com.web.action;


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

public class HttpViewReplyAction extends Action{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		TSiteInformationDAO infoDAO = new TSiteInformationDAO();
		PagerDAO pagerDAO = new PagerDAO();
		
		String id = request.getParameter("article");
		TSiteInformation info = infoDAO.getInfo(id);
		List infoReply = null;
		try{
			infoReply= pagerDAO.findWithPage(20,0," from TInforReply a where a.infor_id='"+id+"' order by a.reply_date");
		}catch(Exception e){
			e.printStackTrace();
			return mapping.findForward("fail");
		}
		request.setAttribute("article", info);
		request.setAttribute("info_id", info.getId());
		request.setAttribute("inforeply", infoReply);
		return mapping.findForward("sucess");
	}
}
