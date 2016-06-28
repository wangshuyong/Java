package com.web.action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.dao.TAdminUserDAO;
import com.model.TAdminUser;




public class GetUserInfoAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		//AdminUserForm userForm = (AdminUserForm)form;
		TAdminUserDAO userDAO = new TAdminUserDAO();
		String id = request.getParameter("id");
		TAdminUser adminuser = userDAO.getUserInfo(id);
		request.setAttribute("adminuser", adminuser);
		return mapping.findForward("sucess");
	}
}
