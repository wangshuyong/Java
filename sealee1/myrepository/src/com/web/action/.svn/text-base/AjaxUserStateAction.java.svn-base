package com.web.action;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


public class AjaxUserStateAction extends Action{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		if(session.getAttribute("memberid")!=null&&!session.getAttribute("memberid").equals("")&&session.getAttribute("member")!=null){
			String tempId = (String)session.getAttribute("memberid");
			String tempmember = (String)session.getAttribute("member");
			out.println(tempId+"|"+tempmember);
		}
		return null;
	}
}
