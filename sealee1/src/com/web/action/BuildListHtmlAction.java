package com.web.action;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


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


public class BuildListHtmlAction extends Action{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding( "UTF-8" ); 
		
		String infoType = request.getParameter("type");
		List clInfos = null;  //���������ҳ��ļ�¼����
		int totalRows;//��¼������
		PagerDAO pagerDAO = new PagerDAO();
		TSiteType sitetype = new TSiteType();
		//��ȡ��ǰ���������
		try{
			totalRows = pagerDAO.getRows("select count(*) from TSiteInformation a where a.remark='1' and a.type='"+infoType+"'");
			System.out.println(totalRows);
		}catch(Exception e){
			e.printStackTrace();
			return mapping.findForward("fail");
		}
		//ͨ��PagerHelper������ȡ���������ҳ���pager����
		Pager pager = PagerHelp.getPager(request, totalRows);
		//ʹ��HashMap���ݶ���������б�ҳ����
		Map parameterMap = new HashMap();
		parameterMap.put("index", infoType);
		parameterMap.put("currentPage", pager.getCurrentPage());
		//ȡ����startRow��ʼ��pageSize�м�¼
		int nullNum = 0;
		
		/**
		 * ��ȡ��ҳ��ʾ�������Լ���������
		 */
		List info1000 = null;
		List info1011 = null;
		List infoshow = null;
		
		try{
			pager.setPageSize(12);
			
			clInfos = pagerDAO.findWithPage(pager.getPageSize(),pager.getStartRow()," from TSiteInformation a where a.remark='1' and a.type='"+infoType+"' order by a.date_created desc");
			int clInfosNum = clInfos.size();
			nullNum = pager.getPageSize() - clInfosNum;
			List typeList = pagerDAO.findWithPage(1,0," from TSiteType a where a.name_value='"+infoType+"'");
			if(typeList.size()!=0){
				sitetype = (TSiteType)typeList.get(0);
			}
			info1000 = pagerDAO.findWithPage(11,0," from TSiteInformation a where a.remark='1' and a.type='1000'  order by a.date_created desc");
			info1011 = pagerDAO.findWithPage(7,0," from TSiteInformation a where a.remark='1' and a.type='1011'  order by a.date_created desc");
			infoshow = pagerDAO.findWithPage(11,0," from TSiteInformation a where a.remark='1' and a.type='"+infoType+"' and a.is_show=1  order by a.date_created desc");
		}catch(Exception e){
			e.printStackTrace();
			return mapping.findForward("fail");
		}
		//��ȡ��ϵͳģ��·��
		String templatePath = request.getRealPath("templates");
		String htmlPath = request.getRealPath("html"+"\\"+infoType);
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
		 * ����ҳ�������ɵ�һ��String�У����ݵ�list.ftlҳ��
		 */
		String tempPageURL = "<a href='index.html' class='STYLE10'>��ҳ</a>    ";
		if(pager.getCurrentPage()==1||pager.getCurrentPage()==2){
			tempPageURL += "  <a href='index.html' class='STYLE10'>��һҳ</a>";
		}else{
			tempPageURL += "  <a href='index-"+(pager.getCurrentPage()-1)+".html' class='STYLE10'>��һҳ</a>";
		}
		tempPageURL += "  &nbsp;&nbsp;���� <font color='red'>"+totalRows+"</font> ƪ����  ";
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
		 * �����б�ҳ����ҳ
		 */
		boolean bOK=test.geneHtmlFile(templatePath,"list.ftl",root,htmlPath,htmlFileName);
		/**
		 * ����Ϊѭ�������б�ҳ��ҳ
		 */
		//�ܹ������б�ҳ��
		int tempPageNum = pager.getTotalPages();
		//��ȡÿҳ��ʾ��¼��  ��ѭ������index-2.html�Ժ��ҳ��
		int tempPageSize= pager.getPageSize();
		for(int i=2;i<(tempPageNum+1);i++){
			htmlFileName =  "index-"+i+".html";
			root = new HashMap();
			pager.setCurrentPage(i);
			pager.setStartRow((i-1)*(pager.getPageSize()));
			try{
				pager.setPageSize(12);
				clInfos = pagerDAO.findWithPage(pager.getPageSize(),pager.getStartRow()," from TSiteInformation a where a.remark='1' and a.type='"+infoType+"' order by a.date_created desc");
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
				 * ����ҳ�������ɵ�һ��String�У����ݵ�list.ftlҳ��
				 */
				tempPageURL = "<a href='index.html' class='STYLE10'>��ҳ</a>    ";
				if(pager.getTotalPages()<=10){
					if(pager.getCurrentPage()==1||pager.getCurrentPage()==2){
						tempPageURL += "  <a href='index.html' class='STYLE10'>��һҳ</a>";
					}else{
						tempPageURL += "  <a href='index-"+(pager.getCurrentPage()-1)+".html' class='STYLE10'>��һҳ</a>";
					}
					tempPageURL += "  &nbsp;&nbsp;���� <font color='red'>"+totalRows+"</font> ƪ����  ";
					tempPageURL += "  &nbsp;&nbsp;<a href='index.html' class='STYLE10'>[1]</a>  ";
					for(int q=2;q<(pager.getTotalPages()+1);q++){
						if(q==pager.getCurrentPage()){
							tempPageURL += "  &nbsp;&nbsp;<a href='index-"+q+".html' class='STYLE10'><font color='red'>["+q+"]</font></a>";
						}else{
							tempPageURL += "  &nbsp;&nbsp;<a href='index-"+q+".html' class='STYLE10'>["+q+"]</a>";
						}
					}
				}else{
					tempPageURL += "  &nbsp;&nbsp;���� <font color='red'>"+totalRows+"</font> ƪ����  ";
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
				//��һҳ
				if(pager.getCurrentPage()==pager.getTotalPages()){
					tempPageURL += "  &nbsp;&nbsp;<a href='index-"+pager.getTotalPages()+".html' class='STYLE10'>��һҳ</a>  ";
				}else{
					tempPageURL += "  &nbsp;&nbsp;<a href='index-"+(pager.getCurrentPage()+1)+".html' class='STYLE10'>��һҳ</a>  ";
				}
				//ĩҳ
				tempPageURL += "  <a href='index-"+pager.getTotalPages()+".html' class='STYLE10'>ĩҳ</a>  ";
				//���뵽MAP��
				
				
				
				
				root.put("pageurl", tempPageURL);
				
				bOK=test.geneHtmlFile(templatePath,"list.ftl",root,htmlPath,htmlFileName);
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
