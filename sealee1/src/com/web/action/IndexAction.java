package com.web.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.dao.PagerDAO;

public class IndexAction extends Action{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		List info1000 = null;  //用于输出到页面的记录集合
		List info1010 = null; 
		List info1011 = new ArrayList();
		List infotop = null;
		List infomiddle = null;
		List infocenter = null;
		List infoshow = null;
		List infoalltop = null;
		List membertop = null;
		List advtop = null;
		PagerDAO pagerDAO = new PagerDAO();
		try{
			info1000 = pagerDAO.findWithPage(11,0," from TSiteInformation a where a.remark='1' and a.type='1000'  order by a.date_created desc");
			info1010 = pagerDAO.findWithPage( 6,0," from TSiteInformation a where a.remark='1' and a.type='1010'  order by a.date_created desc");
			info1011 = pagerDAO.findWithPage( 7,0," from TSiteInformation a where a.remark='1' and a.type='1011'  order by a.date_created desc");
			
			infotop = pagerDAO.findWithPage(12,0," from TSiteInformation a where a.remark='1' and a.type in('1002','1003','1004','1006')  order by a.date_created desc");
			infomiddle = pagerDAO.findWithPage(12,0," from TSiteInformation a where a.remark='1' and a.type in('1001','1005','1007')  order by a.date_created desc");
			infocenter = pagerDAO.findWithPage(12,0," from TSiteInformation a where a.remark='1' and a.type in('1008','1009')  order by a.date_created desc");
			infoshow = pagerDAO.findWithPage(11,0," from TSiteInformation a where a.remark='1' and a.is_show=1  order by a.date_created desc");
			infoalltop = pagerDAO.findWithPage(11,0," from TSiteInformation a where a.remark='1' and a.is_show=1  order by a.date_created desc");
			advtop = pagerDAO.findWithPage(5,0," from TAdvertise a where a.adv_type=5  order by a.add_date desc");
			//获取本周TOP
			Calendar cal = Calendar.getInstance();
			if(new Date().getDay()==0){
				cal.add(Calendar.DATE, -(7-1));
			}else{
				cal.add(Calendar.DATE, -(new Date().getDay()-1));
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String topStart = sdf.format(cal.getTime());
			infoalltop = pagerDAO.findWithPage(26,0," from TSiteInformation a where a.remark='1'  order by a.click_num desc");
			membertop = pagerDAO.findWithPage(8,0," from TMember a  order by a.integral desc");
		}catch(Exception e){
			e.printStackTrace();
			return mapping.findForward("fail");
		}
		request.setAttribute("info1000", info1000);
		request.setAttribute("info1010", info1010);
		request.setAttribute("info1011", info1011);
		
		request.setAttribute("infotop", infotop);
		request.setAttribute("infomiddle", infomiddle);
		request.setAttribute("infocenter", infocenter);
		request.setAttribute("infoshow", infoshow);
		request.setAttribute("infoalltop", infoalltop);
		request.setAttribute("membertop", membertop);
		request.setAttribute("advtop", advtop);
		return mapping.findForward("sucess");
	}
}
