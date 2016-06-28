package com.web.action;


import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.dao.PagerDAO;
import com.dao.TSiteInformationDAO;
import com.model.TInforReply;
import com.model.TSiteInformation;
import com.util.ParameterTools;

public class AjaxGetReplyAction extends Action{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html") ; 
		response.setCharacterEncoding("gb2312") ;
		PrintWriter out = response.getWriter();
		PagerDAO pagerDAO = new PagerDAO();
		String id = request.getParameter("article");
		TInforReply reply = new TInforReply();
		List infoReply = new ArrayList();
		try{
			infoReply= pagerDAO.findAllPage(" from TInforReply a where a.infor_id='"+id+"' order by a.reply_date");
		}catch(Exception e){
			e.printStackTrace();
		}
		int replyNum = infoReply.size();
		String tempReply = "";
		if(replyNum!=0){
			for(int i=0;i<replyNum;i++){
				reply = new TInforReply();
				reply = (TInforReply)infoReply.get(i);
				String reply_author = reply.getReply_author();
				String reply_date = "";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				reply_date = sdf.format(reply.getReply_date());
				
				String reply_content = reply.getReply_content();
				tempReply = tempReply + "<li id='view_noline'><img src='../../image/member_002.gif' border='0' align='absmiddle'/>";
				tempReply = tempReply + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='STYLE17'>"+reply_author +"</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发表于："+reply_date+"</li>";
				tempReply = tempReply + "<li id='view_line'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+reply_content+"</li>";
			}
			
		}
		if(tempReply==null||tempReply.equals("")){
			tempReply = "0______暂无用户评论";
		}else{
			tempReply = replyNum + "______"+tempReply;
		}
		out.println(tempReply);
		return null;
	}
}
