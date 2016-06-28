package com.web.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.dao.TSiteTypeDAO;
import com.web.form.SiteTypeForm;



public class NewSiteTypeAction extends Action{
	

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		SiteTypeForm typeForm = (SiteTypeForm) form;
		TSiteTypeDAO typeDAO  = new TSiteTypeDAO();
		typeDAO.doNew(typeForm);
		return mapping.findForward("sucess");
	}
}
