package com.web.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.dao.TSiteTypeDAO;

public class DeleteSiteTypeAction extends Action{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		TSiteTypeDAO typeDAO  = new TSiteTypeDAO();
		typeDAO.doDelete(id);
		return mapping.findForward("sucess");
	}
}
