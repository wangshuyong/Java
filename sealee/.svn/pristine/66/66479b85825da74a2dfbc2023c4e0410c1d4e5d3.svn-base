package com.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.dao.PagerDAO;
import com.model.Pager;
import com.model.PagerHelp;



public class ListUserAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		List clInfos = null;  //���������ҳ��ļ�¼����
		int totalRows;//��¼������
		PagerDAO pagerDAO = new PagerDAO();
		
		//��ȡ��ǰ���������
		try{
			totalRows = pagerDAO.getRows("select count(*) from TAdminUser");
			
		}catch(Exception e){
			e.printStackTrace();
			return mapping.findForward("fail");
		}
		//ͨ��PagerHelper������ȡ���������ҳ���pager����
		Pager pager = PagerHelp.getPager(request, totalRows);
		//ȡ����startRow��ʼ��pageSize�м�¼
		try{
			clInfos = pagerDAO.findWithPage(pager.getPageSize(),pager.getStartRow()," from TAdminUser");
		}catch(Exception e){
			e.printStackTrace();
			return mapping.findForward("fail");
		}
		request.setAttribute("pager", pager);
		request.getSession().setAttribute("clInfos", clInfos);
		return mapping.findForward("sucess");
	}
}
