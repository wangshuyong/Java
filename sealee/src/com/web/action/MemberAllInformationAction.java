package com.web.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.dao.PagerDAO;
import com.model.Pager;
import com.model.PagerHelp;



public class MemberAllInformationAction extends Action{
	

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("member");
		if(username!=null&&!username.equals("")){
			List clInfos = null;  //用于输出到页面的记录集合
			int totalRows;//记录总行数
			PagerDAO pagerDAO = new PagerDAO();
			
			//获取当前表的总行数
			try{
				totalRows = pagerDAO.getRows("select count(*) from TSiteInformation a where a.author='"+username+"'");
			}catch(Exception e){
				e.printStackTrace();
				return mapping.findForward("fail");
			}
			//通过PagerHelper类来获取用于输出到页面的pager对象
			Pager pager = PagerHelp.getPager(request, totalRows);
			//使用HashMap传递多个参数到列表页面中
			Map parameterMap = new HashMap();
			parameterMap.put("currentPage", pager.getCurrentPage());
			//取出从startRow开始的pageSize行记录
			try{
				clInfos = pagerDAO.findWithPage(pager.getPageSize(),pager.getStartRow()," from TSiteInformation a where a.author='"+username+"' order by a.date_created desc");
			}catch(Exception e){
				e.printStackTrace();
				return mapping.findForward("fail");
			}
			request.setAttribute("pager", pager);
			request.setAttribute("map", parameterMap);
			request.setAttribute("clInfos", clInfos);
			return mapping.findForward("sucess");
		}else{
			return mapping.findForward("fail");
		}
		
	}
}