package com.web.action;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.dao.PagerDAO;
import com.dao.TSiteInformationDAO;
import com.model.TSiteType;
import com.web.form.SiteInformationForm;



public class NewSiteInformationAction extends Action{
	

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		SiteInformationForm infoForm = (SiteInformationForm) form;
		TSiteInformationDAO infoDAO  = new TSiteInformationDAO();
		java.util.Date dt = new java.util.Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddhhmmss");
		String tempDd = sdf.format(dt);
		String idType ="";
		if(infoForm.getType().equals("1000")){
			idType = "news";
		}else if(infoForm.getType().equals("1001")){
			idType = "seo";
		}else if(infoForm.getType().equals("1002")){
			idType = "php";
		}else if(infoForm.getType().equals("1003")){
			idType = "jsp";
		}else if(infoForm.getType().equals("1004")){
			idType = "asp";
		}else if(infoForm.getType().equals("1005")){
			idType = "sql";
		}else if(infoForm.getType().equals("1006")){
			idType = "web-design";
		}else if(infoForm.getType().equals("1007")){
			idType = "photoshop";
		}else if(infoForm.getType().equals("1008")){
			idType = "document";
		}else if(infoForm.getType().equals("1009")){
			idType = "javascript";
		}else if(infoForm.getType().equals("1010")){
			idType = "funny";
		}else if(infoForm.getType().equals("1011")){
			idType = "code-down";
		}
		String id = idType + "-" + tempDd;
		infoForm.setId(id);
		if(infoForm.getContent()!=null&&!infoForm.getContent().equals("")&&infoForm.getTitle()!=null&&!infoForm.getTitle().equals("")){
			infoDAO.doNew(infoForm);
		}
		request.setAttribute("type", infoForm.getType());
		return mapping.findForward("sucess");
	}
}