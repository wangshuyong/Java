package com.web.action;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




import com.dao.PagerDAO;
import com.util.FreeMarkerTest;

import freemarker.template.TemplateException;


public class BuildIndexHtmlAction extends Action{
	@SuppressWarnings("deprecation")
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding( "UTF-8" ); 
		PagerDAO pagerDAO = new PagerDAO();
		
		
		List info1000 = new ArrayList();  //用于输出到页面的记录集合
		List info1010 = new ArrayList(); 
		List info1011 = new ArrayList();
		List infotop = new ArrayList();
		List infomiddle = new ArrayList();
		List infocenter = new ArrayList();
		List infoshow = new ArrayList();
		List infoalltop = new ArrayList();
		List membertop = new ArrayList();
		List advtop = new ArrayList();
		List links = new ArrayList();
		try{
			info1000 = pagerDAO.findWithPage(11,0," from TSiteInformation a where a.remark='1' and a.filetype='1000'  order by a.date_created desc");
			info1010 = pagerDAO.findWithPage( 6,0," from TSiteInformation a where a.remark='1' and a.filetype='1010'  order by a.date_created desc");
			info1011 = pagerDAO.findWithPage( 7,0," from TSiteInformation a where a.remark='1' and a.filetype='1011'  order by a.date_created desc");
			
			infotop = pagerDAO.findWithPage(12,0," from TSiteInformation a where a.remark='1' and a.filetype in('1002','1003','1004','1006')  order by a.date_created desc");
			infomiddle = pagerDAO.findWithPage(12,0," from TSiteInformation a where a.remark='1' and a.filetype in('1001','1005','1007')  order by a.date_created desc");
			infocenter = pagerDAO.findWithPage(12,0," from TSiteInformation a where a.remark='1' and a.filetype in('1008','1009')  order by a.date_created desc");
			infoshow = pagerDAO.findWithPage(11,0," from TSiteInformation a where a.remark='1' and a.is_show=1  order by a.date_created desc");
			infoalltop = pagerDAO.findWithPage(11,0," from TSiteInformation a where a.remark='1' and a.is_show=1  order by a.date_created desc");
			advtop = pagerDAO.findWithPage(5,0," from TAdvertise a where a.adv_type=5  order by a.add_date desc");
			links = pagerDAO.findWithPage(100,0," from TAdvertise a where a.adv_type=3  order by a.image_height,a.add_date");
			//获取本周TOP
			Calendar cal = Calendar.getInstance();
			if(new Date().getDay()==0){
				cal.add(Calendar.DATE, -(7-1));
			}else{
				cal.add(Calendar.DATE, -(new Date().getDay()-1));
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String topStart = sdf.format(cal.getTime());
			//获取本月TOP
			Date dt = new Date();
			Calendar lastDate = Calendar.getInstance();   
		    lastDate.set(Calendar.DATE,1);//设为当前月的1号 
		    String monthStart =sdf.format(lastDate.getTime()); 
		    
		    lastDate.add(Calendar.MONTH,1);//减一个月
		    lastDate.set(Calendar.DATE, 1);//把日期设置为当月第一天  
		    String monthEnd=sdf.format(lastDate.getTime());   
		    
			infoalltop = pagerDAO.findWithPage(30,0," from TSiteInformation a where a.remark='1' and date_created>='"+monthStart+"' and date_created<'"+monthEnd+"' order by a.click_num desc");
			membertop = pagerDAO.findWithPage(8,0," from TMember a  order by a.integral desc");
		}catch(Exception e){
			e.printStackTrace();
			return mapping.findForward("fail");
		}
		
		//获取到系统模板路径
		String templatePath = this.getServlet().getServletContext().getRealPath("templates");
		String htmlPath = this.getServlet().getServletContext().getRealPath("/html");
		
		String htmlFileName = "index.html";
		FreeMarkerTest test = new FreeMarkerTest();
		Map root = new HashMap();
		root.put("info1000", info1000);
		root.put("info1010", info1010);
		root.put("info1011", info1011);
		root.put("infotop", infotop);
		root.put("infomiddle", infomiddle);
		root.put("infocenter", infocenter);
		root.put("infoshow", infoshow);
		root.put("infoalltop", infoalltop);
		root.put("advtop", advtop);
		root.put("links", links);
		root.put("membertop", membertop);
		boolean bOK=false;
		try {
			bOK = test.geneHtmlFile("index.ftl",htmlFileName,root,"templates",htmlPath,request);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TemplateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(bOK){
			return mapping.findForward("sucess");
		}else{
			return mapping.findForward("false");
		}
	}
}
