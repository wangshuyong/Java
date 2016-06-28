package com.web.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.dao.TSiteInformationDAO;
import com.web.form.SiteInformationForm;



public class EditMemberInformationAction extends Action{
	

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		SiteInformationForm infoForm = (SiteInformationForm) form;
		String id = request.getParameter("id");
		System.out.println(id);
		infoForm.setId(id);
		TSiteInformationDAO infoDAO  = new TSiteInformationDAO();
		infoDAO.doEdit(infoForm);
		return mapping.findForward("sucess");
	}
}