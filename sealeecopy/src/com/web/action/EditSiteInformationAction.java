package com.web.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.dao.TSiteInformationDAO;
import com.web.form.SiteInformationForm;

public class EditSiteInformationAction extends Action{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		SiteInformationForm infoForm = (SiteInformationForm) form;
		TSiteInformationDAO infoDAO  = new TSiteInformationDAO();
		infoDAO.doEdit(infoForm);
		request.setAttribute("type", infoForm.getType());
		return mapping.findForward("sucess");
	}
}
