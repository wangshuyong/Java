package com.web.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.dao.TMemberDAO;
import com.model.TMember;




public class GetMemberInfoAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		TMemberDAO memberDAO = new TMemberDAO();
		String id = request.getParameter("id");
		TMember member = memberDAO.getUserInfo(id);
		request.setAttribute("member", member);
		return mapping.findForward("sucess");
	}
}
