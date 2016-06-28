package com.web.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.dao.TAdminUserDAO;
import com.web.form.AdminUserForm;



public class EditUserAction extends Action{
	
	/**
	 * ±‡º≠”√ªß
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		AdminUserForm userForm = (AdminUserForm) form;
		TAdminUserDAO userDAO  = new TAdminUserDAO();
		userDAO.doEdit(userForm);
		return mapping.findForward("sucess");
	}
}
