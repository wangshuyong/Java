package com.web.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.dao.TAdvertiseDAO;
import com.model.TAdvertise;

public class GetAdvertiseAction extends Action{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		TAdvertiseDAO infoDAO = new TAdvertiseDAO();
		String id = request.getParameter("id");
		TAdvertise info = infoDAO.getInfo(id);
		request.setAttribute("advertise", info);
		return mapping.findForward("sucess");
	}
}
