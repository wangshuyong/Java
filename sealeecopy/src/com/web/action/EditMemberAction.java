package com.web.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.dao.TMemberDAO;
import com.web.form.MemberForm;

public class EditMemberAction extends Action{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		MemberForm infoForm = (MemberForm) form;
		TMemberDAO infoDAO  = new TMemberDAO();
		infoDAO.doEdit(infoForm);
		return mapping.findForward("sucess");
	}
}
