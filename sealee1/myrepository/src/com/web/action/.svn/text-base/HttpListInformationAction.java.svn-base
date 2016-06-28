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
import com.model.TSiteInformation;
import com.model.TSiteType;



public class HttpListInformationAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String infoType = request.getParameter("index");
		List clInfos = null;  //用于输出到页面的记录集合
		int totalRows;//记录总行数
		PagerDAO pagerDAO = new PagerDAO();
		TSiteType sitetype = new TSiteType();
		//获取当前表的总行数
		try{
			totalRows = pagerDAO.getRows("select count(*) from TSiteInformation a where a.remark='1' and a.type='"+infoType+"'");
			System.out.println(totalRows);
		}catch(Exception e){
			e.printStackTrace();
			return mapping.findForward("fail");
		}
		//通过PagerHelper类来获取用于输出到页面的pager对象
		Pager pager = PagerHelp.getPager(request, totalRows);
		//使用HashMap传递多个参数到列表页面中
		Map parameterMap = new HashMap();
		parameterMap.put("index", infoType);
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
			pager.setPageSize(11);
			
			clInfos = pagerDAO.findWithPage(pager.getPageSize(),pager.getStartRow()," from TSiteInformation a where a.remark='1' and a.type='"+infoType+"' order by a.date_created desc");
			int clInfosNum = clInfos.size();
			nullNum = pager.getPageSize() - clInfosNum;
			List typeList = pagerDAO.findWithPage(1,0," from TSiteType a where a.name_value='"+infoType+"'");
			if(typeList.size()!=0){
				sitetype = (TSiteType)typeList.get(0);
			}
			info1000 = pagerDAO.findWithPage(11,0," from TSiteInformation a where a.remark='1' and a.type='1000'  order by a.date_created desc");
			infoshow = pagerDAO.findWithPage(11,0," from TSiteInformation a where a.remark='1' and a.is_show=1  order by a.date_created desc");
			info1011 = pagerDAO.findWithPage( 7,0," from TSiteInformation a where a.remark='1' and a.type='1011'  order by a.date_created desc");
		}catch(Exception e){
			e.printStackTrace();
			return mapping.findForward("fail");
		}
		
		
		request.setAttribute("pager", pager);
		request.setAttribute("map", parameterMap);
		request.setAttribute("listtype", sitetype);
		request.setAttribute("nullNum", nullNum);
		request.setAttribute("clInfos", clInfos);
		request.setAttribute("info1000", info1000);
		request.setAttribute("info1011", info1011);
		request.setAttribute("infoshow", infoshow);
		request.setAttribute("infotype", infoType);
		return mapping.findForward("sucess");
	}
}
