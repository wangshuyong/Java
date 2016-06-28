package com.web.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.dao.TSiteInformationDAO;



public class ViewInformationAction extends Action{
	

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		TSiteInformationDAO infoDAO  = new TSiteInformationDAO();
		infoDAO.doView(id);
		request.setAttribute("type", type);
		return mapping.findForward("sucess");
	}
}