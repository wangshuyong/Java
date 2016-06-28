package com.web.action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.dao.TSiteInformationDAO;
import com.model.TSiteInformation;




public class GetMemberInformationAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		TSiteInformationDAO infoDAO = new TSiteInformationDAO();
		String id = request.getParameter("id");
		TSiteInformation info = infoDAO.getInfo(id);
		request.setAttribute("memberinfo", info);
		return mapping.findForward("sucess");
	}
}
