package com.web.action;

import java.util.ArrayList;
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
import com.web.form.SiteInformationForm;


public class HttpSearchInformationAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("gb2312");
		SiteInformationForm infoForm = (SiteInformationForm)form;
		String tempCondition = "";
		if(request.getParameter("urlcondition")!=null&&!request.getParameter("urlcondition").equals("")){
			//tempCondition = new String(request.getParameter("urlcondition").getBytes("iso-8859-1"),"gbk");
			if(request.getParameter("pageMethod")!=null&&!request.getParameter("pageMethod").equals("")){
				tempCondition = java.net.URLDecoder.decode(new String(request.getParameter("urlcondition").getBytes("iso-8859-1"),"utf-8"));
			}else{
				tempCondition = java.net.URLDecoder.decode(new String(request.getParameter("urlcondition").getBytes("iso-8859-1"),"gbk"));
			}
		}
		
		List clInfos = null;  //用于输出到页面的记录集合
		int totalRows;//记录总行数
		PagerDAO pagerDAO = new PagerDAO();
		//获取当前表的总行数
		try{
			totalRows = pagerDAO.getRows("select count(*) from TSiteInformation a where a.title like'%"+tempCondition+"%' or a.content like'"+tempCondition+"'");
		}catch(Exception e){
			e.printStackTrace();
			return mapping.findForward("fail");
		}
		//通过PagerHelper类来获取用于输出到页面的pager对象
		Pager pager = PagerHelp.getPager(request, totalRows);
		//使用HashMap传递多个参数到列表页面中
		Map parameterMap = new HashMap();
		parameterMap.put("urlcondition", tempCondition);
		parameterMap.put("currentPage", pager.getCurrentPage());
		//取出从startRow开始的pageSize行记录
		int nullNum = 0;
		
		/**
		 * 获取主页显示的新闻以及精华导读
		 */
		List info1000 = null;
		List infoshow = null;
		List info1011 = new ArrayList();
		try{
			pager.setPageSize(12);
			
			clInfos = pagerDAO.findWithPage(pager.getPageSize(),pager.getStartRow()," from TSiteInformation a where a.title like'%"+tempCondition+"%' or a.content like'"+tempCondition+"' order by a.date_created desc");
			int clInfosNum = clInfos.size();
			nullNum = pager.getPageSize() - clInfosNum;
			info1000 = pagerDAO.findWithPage(11,0," from TSiteInformation a where a.type='1000'  order by a.date_created desc");
			infoshow = pagerDAO.findWithPage(11,0," from TSiteInformation a where a.is_show=1  order by a.date_created desc");
			info1011 = pagerDAO.findWithPage( 7,0," from TSiteInformation a where a.remark='1' and a.type='1011'  order by a.date_created desc");
		}catch(Exception e){
			e.printStackTrace();
			return mapping.findForward("fail");
		}
		
		
		request.setAttribute("pager", pager);
		request.setAttribute("condition",tempCondition);
		request.setAttribute("map", parameterMap);
		request.setAttribute("nullNum", nullNum);
		request.setAttribute("clInfos", clInfos);
		request.setAttribute("info1000", info1000);
		request.setAttribute("info1011", info1011);
		request.setAttribute("infoshow", infoshow);
		return mapping.findForward("sucess");
	}
}
