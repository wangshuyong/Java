package com.web.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.dao.PagerDAO;
import com.model.Pager;
import com.model.PagerHelp;



public class ListSiteInformationAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String infoType = request.getParameter("type");
		List clInfos = null;  //���������ҳ��ļ�¼����
		int totalRows;//��¼������
		PagerDAO pagerDAO = new PagerDAO();
		
		//��ȡ��ǰ���������
		try{
			totalRows = pagerDAO.getRows("select count(*) from TSiteInformation a where a.type='"+infoType+"'");
		}catch(Exception e){
			e.printStackTrace();
			return mapping.findForward("fail");
		}
		//ͨ��PagerHelper������ȡ���������ҳ���pager����
		Pager pager = PagerHelp.getPager(request, totalRows);
		//ʹ��HashMap���ݶ���������б�ҳ����
		Map parameterMap = new HashMap();
		
		parameterMap.put("type", infoType);
		parameterMap.put("currentPage", pager.getCurrentPage());
		//ȡ����startRow��ʼ��pageSize�м�¼
		try{
			pager.setPageSize(14);
			clInfos = pagerDAO.findWithPage(pager.getPageSize(),pager.getStartRow()," from TSiteInformation a where a.type='"+infoType+"' order by a.date_created desc");
		}catch(Exception e){
			e.printStackTrace();
			return mapping.findForward("fail");
		}
		request.setAttribute("pager", pager);
		request.setAttribute("type", infoType);
		request.setAttribute("map", parameterMap);
		request.setAttribute("clInfos", clInfos);
		return mapping.findForward("sucess");
	}
}
