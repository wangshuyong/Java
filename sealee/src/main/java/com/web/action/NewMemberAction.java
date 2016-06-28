package com.web.action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.dao.TMemberDAO;
import com.web.form.MemberForm;



public class NewMemberAction extends Action{
	
	/**
	 * �����û�
	 * @throws Exception 
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("gbk");
		
		MemberForm memberForm = (MemberForm) form;
		TMemberDAO memberDAO  = new TMemberDAO();
		HttpSession session = request.getSession();
		String sessioncheck = "";
		if(session.getAttribute("rand")!=null&&!session.getAttribute("rand").equals("")){
			sessioncheck = (String)session.getAttribute("rand");
		}
//		System.out.println("Action�л�ȡ��rand"+sessioncheck);
		if(!sessioncheck.equals(memberForm.getChecknum())){
			request.setAttribute("errorrand", "1");
			return mapping.findForward("fail");
		}
		memberDAO.doNew(memberForm);
//		String id = memberDAO.doNew(memberForm);
//		System.out.print(memberForm.getUsername());
		if(memberForm.getUsername()!=null&&!memberForm.getUsername().equals("")){
			session.setAttribute("member", memberForm.getUsername());
//			session.setAttribute("memberid", id);
		}
		return mapping.findForward("sucess");
	}
}
