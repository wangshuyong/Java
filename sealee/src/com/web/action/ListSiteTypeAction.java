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



public class ListSiteTypeAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		List clInfos = null;  //用于输出到页面的记录集合
		int totalRows;//记录总行数
		PagerDAO pagerDAO = new PagerDAO();
		
		//获取当前表的总行数
		try{
			totalRows = pagerDAO.getRows("select count(*) from TSiteType");
		}catch(Exception e){
			e.printStackTrace();
			return mapping.findForward("fail");
		}
		//通过PagerHelper类来获取用于输出到页面的pager对象
		Pager pager = PagerHelp.getPager(request, totalRows);
		//取出从startRow开始的pageSize行记录
		try{
			clInfos = pagerDAO.findWithPage(pager.getPageSize(),pager.getStartRow()," from TSiteType a order by a.name_value");
		}catch(Exception e){
			e.printStackTrace();
			return mapping.findForward("fail");
		}
		request.setAttribute("pager", pager);
		request.setAttribute("clInfos", clInfos);
		return mapping.findForward("sucess");
	}
}
