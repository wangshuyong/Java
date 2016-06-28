package com.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.dao.PagerDAO;



public class HttpListLinksAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		List clInfos = null;  //用于输出到页面的记录集合
		
		PagerDAO pagerDAO = new PagerDAO();
		try{
			
			clInfos = pagerDAO.findWithPage(200,0," from TAdvertise a where a.adv_type=3 or a.adv_type=4 order by a.add_date");
		}catch(Exception e){
			e.printStackTrace();
			return mapping.findForward("fail");
		}

		request.setAttribute("clInfos", clInfos);
		return mapping.findForward("sucess");
	}
}
