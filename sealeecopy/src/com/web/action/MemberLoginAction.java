package com.web.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.dao.TMemberDAO;
import com.model.TMember;
import com.web.form.MemberForm;



public class MemberLoginAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		MemberForm memberForm = (MemberForm) form;// TODO Auto-generated method stub
		TMemberDAO userDAO = new TMemberDAO();
		HttpSession session = request.getSession();
		String sessioncheck = "";
		String tempError= "";
		if(session.getAttribute("rand")!=null&&!session.getAttribute("rand").equals("")){
			sessioncheck = (String)session.getAttribute("rand");
		}
		if(!sessioncheck.equals(memberForm.getChecknum())){
			tempError = "验证码错误！";
			request.setAttribute("error", tempError);
			return mapping.findForward("fail");
		}
		
		TMember member = new TMember();
		member = userDAO.login(memberForm);
		if(member.getId()!=null){
			session.setAttribute("member", member.getUsername());
			session.setAttribute("memberid", member.getId());
			return mapping.findForward("sucess");
		}else{
			tempError = "用户名或者密码有误，请重新输入！";
			request.setAttribute("error", tempError);
			return mapping.findForward("fail");
		}
	}
}
