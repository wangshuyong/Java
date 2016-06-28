package com.web.action;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.dao.TInfoReplyDAO;
import com.dao.TSiteInformationDAO;
import com.web.form.InfoReplyForm;



public class NewInforReplyAction extends Action{
	

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		InfoReplyForm replyForm = (InfoReplyForm) form;
		TInfoReplyDAO replyDAO  = new TInfoReplyDAO();
		TSiteInformationDAO infoDAO = new TSiteInformationDAO();
		
		if(replyForm.getInfor_id()!=null&&!replyForm.getInfor_id().equals("")){
			replyDAO.doNew(replyForm);
			infoDAO.doUpdateReplyNum(replyForm.getInfor_id());
		}
		request.setAttribute("infoid", replyForm.getInfor_id());
		return mapping.findForward("sucess");
	}
}