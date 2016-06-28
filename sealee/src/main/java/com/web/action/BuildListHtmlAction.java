package com.web.action;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




import com.dao.PagerDAO;
import com.model.Pager;
import com.model.PagerHelp;
import com.model.TSiteType;
import com.util.FreeMarkerTest;

import freemarker.template.TemplateException;


public class BuildListHtmlAction extends Action{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding( "UTF-8" ); 
		
		String infoType = request.getParameter("type");
		List clInfos = null;  //用于输出到页面的记录集合
		int totalRows;//记录总行数
		PagerDAO pagerDAO = new PagerDAO();
		TSiteType sitetype = new TSiteType();
		//获取当前表的总行数
		try{
			totalRows = pagerDAO.getRows("select count(*) from TSiteInformation a where a.filetype='"+infoType+"'");
			
		}catch(Exception e){
			e.printStackTrace();
			return mapping.findForward("fail");
		}
		//ͨ通过PagerHelper类来获取用于输出到页面的pager对象
		Pager pager = PagerHelp.getPager(request, totalRows);
		//使用HashMap传递多个参数到列表页面中
//		Map parameterMap = new HashMap();
		Map<Object, Object> parameterMap =new HashMap<Object,Object>();
		parameterMap.put("index", infoType);
		parameterMap.put("currentPage", pager.getCurrentPage());
		//取出从startRow开始的pageSize行记录
		int nullNum = 0;
		
		/**
		 * 获取主页显示的新闻以及精华导读
		 */
		List info1000 = null;
		List info1011 = null;
		List infoshow = null;
		
		try{
			pager.setPageSize(12);
			
			clInfos = pagerDAO.findWithPage(pager.getPageSize(),pager.getStartRow()," from TSiteInformation a where a.filetype='"+infoType+"' order by a.date_created desc");
			int clInfosNum = clInfos.size();
			nullNum = pager.getPageSize() - clInfosNum;
			List typeList = pagerDAO.findWithPage(1,0," from TSiteType a where a.name_value='"+infoType+"'");
			if(typeList.size()!=0){
				sitetype = (TSiteType)typeList.get(0);
			}
			info1000 = pagerDAO.findWithPage(11,0," from TSiteInformation a where a.filetype='1000'  order by a.date_created desc");
			info1011 = pagerDAO.findWithPage(7,0," from TSiteInformation a where a.filetype='1011'  order by a.date_created desc");
			infoshow = pagerDAO.findWithPage(11,0," from TSiteInformation a where a.filetype='"+infoType+"' and a.is_show=1  order by a.date_created desc");
		}catch(Exception e){
			e.printStackTrace();
			return mapping.findForward("fail");
		}
		//获取到系统模板路径
//		String templatePath = request.getRealPath("templates");
//		String htmlPath = request.getRealPath("html"+"\\"+infoType);
		String templatePath = request.getSession().getServletContext().getRealPath("templates");
//		String templatePath = request.getRealPath("templates");
		String htmlPath = request.getSession().getServletContext().getRealPath("html"+"\\"+infoType);
		String htmlFileName =  "index.html";
		FreeMarkerTest test = new FreeMarkerTest();
		Map root = new HashMap();
		root.put("clInfos", clInfos);
		root.put("sitetype", sitetype);
		root.put("info1000", info1000);
		root.put("info1011", info1011);
		root.put("infoshow", infoshow);
		root.put("index", infoType);
		root.put("currentPage", pager.getCurrentPage());
		root.put("pager", pager);
		
		System.out.println(pager.getTotalPages());
		/**
		 * 将分页代码生成到一个String中，传递到list.ftl页面
		 */
		String tempPageURL = "<a href='index.html' class='STYLE10'>首页</a>    ";
		if(pager.getCurrentPage()==1||pager.getCurrentPage()==2){
			tempPageURL += "  <a href='index.html' class='STYLE10'>上一页</a>";
		}else{
			tempPageURL += "  <a href='index-"+(pager.getCurrentPage()-1)+".html' class='STYLE10'>上一页</a>";
		}
		tempPageURL += "  &nbsp;&nbsp;共有<font color='red'>"+totalRows+"</font> 篇文章";
		tempPageURL += "  &nbsp;&nbsp;<a href='index.html' class='STYLE10'><font color='red'>[1]</font></a>  ";
		if(pager.getTotalPages()<10){
			for(int q=2;q<(pager.getTotalPages()+1);q++){
				if(q==pager.getCurrentPage()){
					tempPageURL += "  &nbsp;&nbsp;<a href='index-"+q+".html' class='STYLE10'><font color='red'>["+q+"]</font></a>";
				}else{
					tempPageURL += "  &nbsp;&nbsp;<a href='index-"+q+".html' class='STYLE10'>["+q+"]</a>";
				}
			}
		}else{
			for(int q=2;q<11;q++){
				if(q==pager.getCurrentPage()){
					tempPageURL += "  &nbsp;&nbsp;<a href='index-"+q+".html' class='STYLE10'><font color='red'>["+q+"]</font></a>";
				}else{
					tempPageURL += "  &nbsp;&nbsp;<a href='index-"+q+".html' class='STYLE10'>["+q+"]</a>";
				}
			}
		}
		if(pager.getCurrentPage()==pager.getTotalPages()){
			tempPageURL += "  &nbsp;&nbsp;<a href='index-"+pager.getTotalPages()+".html' class='STYLE10'>��һҳ</a>  ";
		}else{
			tempPageURL += "  &nbsp;&nbsp;<a href='index-"+(pager.getCurrentPage()+1)+".html' class='STYLE10'>��һҳ</a>  ";
		}
		tempPageURL += "  <a href='index-"+pager.getTotalPages()+".html' class='STYLE10'>ĩҳ</a>  ";
		root.put("pageurl", tempPageURL);
		/**
		 * 生成列表页面主页
		 */
		boolean bOK=false;
		try {
			bOK = test.geneHtmlFile("list.ftl",htmlFileName,root,"templates",htmlPath,request);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (TemplateException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		/**
		 * 以下为循环生成列表页分页
		 */
		//总共存在列表页数
		int tempPageNum = pager.getTotalPages();
		//总共存在列表页数
		int tempPageSize= pager.getPageSize();
		for(int i=2;i<(tempPageNum+1);i++){
			htmlFileName =  "index-"+i+".html";
			root = new HashMap();
			pager.setCurrentPage(i);
			pager.setStartRow((i-1)*(pager.getPageSize()));
			try{
				pager.setPageSize(12);
				clInfos = pagerDAO.findWithPage(pager.getPageSize(),pager.getStartRow()," from TSiteInformation a where a.filetype='"+infoType+"' order by a.date_created desc");
				root = new HashMap();
				root.put("clInfos", clInfos);
				root.put("sitetype", sitetype);
				root.put("info1000", info1000);
				root.put("info1011", info1011);
				root.put("infoshow", infoshow);
				root.put("index", infoType);
				root.put("currentPage", pager.getCurrentPage());
				root.put("pager", pager);
				
				
				
				/**
				 * 将分页代码生成到一个String中，传递到list.ftl页面
				 */
				tempPageURL = "<a href='index.html' class='STYLE10'>首页</a>    ";
				if(pager.getTotalPages()<=10){
					if(pager.getCurrentPage()==1||pager.getCurrentPage()==2){
						tempPageURL += "  <a href='index.html' class='STYLE10'>上一页</a>";
					}else{
						tempPageURL += "  <a href='index-"+(pager.getCurrentPage()-1)+".html' class='STYLE10'>上一页</a>";
					}
					tempPageURL += "  &nbsp;&nbsp;共有 <font color='red'>"+totalRows+"</font> 篇文章";
					tempPageURL += "  &nbsp;&nbsp;<a href='index.html' class='STYLE10'>[1]</a>  ";
					for(int q=2;q<(pager.getTotalPages()+1);q++){
						if(q==pager.getCurrentPage()){
							tempPageURL += "  &nbsp;&nbsp;<a href='index-"+q+".html' class='STYLE10'><font color='red'>["+q+"]</font></a>";
						}else{
							tempPageURL += "  &nbsp;&nbsp;<a href='index-"+q+".html' class='STYLE10'>["+q+"]</a>";
						}
					}
				}else{
					tempPageURL += "  &nbsp;&nbsp;共有<font color='red'>"+totalRows+"</font> 篇文章 ";
					tempPageURL += "  <a href='index-"+(pager.getCurrentPage()-1)+".html' class='STYLE10'>��һҳ</a>";
					//tempPageURL += "  &nbsp;&nbsp;��ǰ�� <font color='red'>"+pager.getCurrentPage()+"</font> ҳ  ";
					int start = (pager.getCurrentPage()-1);
					int end = 0;
					if(pager.getTotalPages()>pager.getCurrentPage()+5){
						end = (pager.getCurrentPage()+5);
						if(pager.getCurrentPage()>5){
							start = (pager.getCurrentPage()-4);
						}else{
							start = 2;
						}
					}else{
						end = pager.getTotalPages();
						if(pager.getCurrentPage()>5){
							start = (pager.getCurrentPage()-4);
						}else{
							start = 2;
						}
					}
					if(pager.getCurrentPage()<=5){
						tempPageURL += "  &nbsp;&nbsp;<a href='index.html' class='STYLE10'>[1]</font></a>";
					}
					if(start<pager.getTotalPages() && pager.getTotalPages()<=end){
						for(int q=start ;q<pager.getTotalPages()+1;q++){
							if(q==pager.getCurrentPage()){
								tempPageURL += "  &nbsp;&nbsp;<a href='index-"+q+".html' class='STYLE10'><font color='red'>["+q+"]</font></a>";
							}else{
								tempPageURL += "  &nbsp;&nbsp;<a href='index-"+q+".html' class='STYLE10'>["+q+"]</a>";
							}
						}
					}else{
						for(int q=start ;q<end+1;q++){
							if(q==pager.getCurrentPage()){
								tempPageURL += "  &nbsp;&nbsp;<a href='index-"+q+".html' class='STYLE10'><font color='red'>["+q+"]</font></a>";
							}else{
								tempPageURL += "  &nbsp;&nbsp;<a href='index-"+q+".html' class='STYLE10'>["+q+"]</a>";
							}
						}
					}
				}
				//下一页
				if(pager.getCurrentPage()==pager.getTotalPages()){
					tempPageURL += "  &nbsp;&nbsp;<a href='index-"+pager.getTotalPages()+".html' class='STYLE10'>下一页</a>  ";
				}else{
					tempPageURL += "  &nbsp;&nbsp;<a href='index-"+(pager.getCurrentPage()+1)+".html' class='STYLE10'>下一页</a>  ";
				}
				//ĩҳ
				tempPageURL += "  <a href='index-"+pager.getTotalPages()+".html' class='STYLE10'>ĩҳ</a>  ";
				//���뵽MAP��

				root.put("pageurl", tempPageURL);
				
				bOK=test.geneHtmlFile("list.ftl",htmlFileName,root,"templates",htmlPath,request);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		request.setAttribute("type", infoType);
		if(bOK){
			return mapping.findForward("sucess");
		}else{
			return mapping.findForward("false");
		}
	}
}
