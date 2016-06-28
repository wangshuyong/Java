package com.web.action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.dao.TSiteTypeDAO;
import com.model.TSiteType;




public class GetSiteTypeInfoAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		TSiteTypeDAO typeDAO = new TSiteTypeDAO();
		String id = request.getParameter("id");
		TSiteType type = typeDAO.getInfo(id);
		request.setAttribute("sitetype", type);
		return mapping.findForward("sucess");
	}
}
