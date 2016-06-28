package com.web.action;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.dao.TSiteInformationDAO;
import com.model.TSiteInformation;

public class AjaxUpdateClickNumAction extends Action{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		TSiteInformationDAO infoDAO = new TSiteInformationDAO();
		String id = request.getParameter("article");
		TSiteInformation info = new  TSiteInformation();
		infoDAO.doUpdateClickNum(id);
		info = infoDAO.getInfo(id);
		if(info.getClick_num()!=0){
			out.println(info.getClick_num());
		}
		return null;
	}
}
