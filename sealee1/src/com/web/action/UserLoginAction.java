package com.web.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.dao.TAdminUserDAO;
import com.web.form.AdminUserForm;



public class UserLoginAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		AdminUserForm userForm = (AdminUserForm) form;// TODO Auto-generated method stub
		TAdminUserDAO userDAO = new TAdminUserDAO();
		boolean blog = false;
		blog = userDAO.login(userForm);
		System.out.print(blog);
		HttpSession ss = request.getSession();
		String tempName = userForm.getUsername();
		if(blog==true){
			ss.setAttribute("adminuser", tempName);
			return mapping.findForward("sucess");
		}else{
			return mapping.findForward("fail");
		}
	}
}
