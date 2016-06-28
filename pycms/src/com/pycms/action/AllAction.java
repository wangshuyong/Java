package com.pycms.action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import sun.print.resources.serviceui;

import com.pycms.dao.ConfigDao;
import com.pycms.framework.ActionSupportBase;
import com.pycms.framework.DateTool;
import com.pycms.moble.Information;
import com.pycms.moble.Teacher;

public class AllAction  extends ActionSupportBase{
	private ConfigDao configDao; 
	private String title;		//标题
	private String type;		//类型
	private String startDate;	//开始时间
	private String endDate;		//结束时间
	private String author;		//老师
	private int npageNum;		//当前第几页
	private int npageRecordSize;//每页条数
	private int  distinguish;		//代表学校动态页与动态管理区分
	private int infmid = 0;		//资讯ID
	private String data;
	public Map<String, Object> mapdata = new HashMap<String, Object>();

	
	
	
	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public int getInfmid() {
		return infmid;
	}

	public void setInfmid(int infmid) {
		this.infmid = infmid;
	}

	public int getDistinguish() {
		return distinguish;
	}

	public void setDistinguish(int distinguish) {
		this.distinguish = distinguish;
	}

	public int getNpageNum() {
		return npageNum;
	}

	public void setNpageNum(int npageNum) {
		this.npageNum = npageNum;
	}

	public int getNpageRecordSize() {
		return npageRecordSize;
	}

	public void setNpageRecordSize(int npageRecordSize) {
		this.npageRecordSize = npageRecordSize;
	}






	public Map<String, Object> getMapdata() {
		return mapdata;
	}

	public void setMapdata(Map<String, Object> mapdata) {
		this.mapdata = mapdata;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public ConfigDao getConfigDao() {
		return configDao;
	}

	public void setConfigDao(ConfigDao configDao) {
		this.configDao = configDao;
	}
	
	public String allInfo() throws UnsupportedEncodingException{
		if(mapdata!=null){
			mapdata.clear();
		}
		String where ="";
		if(title!=null&&!title.equals("")){
			where += "where title like '%"+title+"%'"; 
			mapdata.put("title", title);
		}else{
			where += "where title like '%%'"; 
		}
		if(author!=null&&!author.equals("")){
			where += "and author like '%"+author+"%'"; 
			mapdata.put("author", author);
		}
		if(type!=null&&!type.equals("")){
			where += "and type like '%"+type+"%'"; 
			mapdata.put("type", type);
		}
		if (distinguish==1) {
			where += " and type!='作业'"; 
		}
		
		if(startDate!=null&&!startDate.equals("")){
			where += "and createtime >='"+startDate+"'"; 
			mapdata.put("startDate", startDate);
		}
		if(endDate!=null&&!endDate.equals("")){
			where += "and changetime <='"+endDate+"'"; 
			mapdata.put("endDate", endDate);
		}
		where+="order by is_top   DESC , createtime  DESC";
		
		try {
			
//			pageNum=nPageNum!=null?Integer.parseInt(nPageNum):1;
//			PageRecordSize=nPageRecordSize!=null?Integer.parseInt(nPageRecordSize):10;
			npageNum=npageNum!=0?npageNum:1;
			npageRecordSize=npageRecordSize!=0?npageRecordSize:2;
			int count = configDao.getTableTotal("Information",where);
			int pageCount = count%npageRecordSize!=0?(count/npageRecordSize)+1:(count/npageRecordSize);
			if(npageNum>pageCount){
				npageNum=pageCount;
			}
			List<Object> listMaps= configDao.getTableInformation("Information",where,npageNum,npageRecordSize);
			List<Object> teacherMap = configDao.getTable("Teacher","");
			
			mapdata.put("informationMaps", listMaps);
			mapdata.put("teacherMap", teacherMap);
			mapdata.put("pageCount", pageCount);
			mapdata.put("count", count);
			mapdata.put("npageNum", npageNum);
			mapdata.put("npageRecordSize", npageRecordSize);
		} catch (Exception e) {
			
		}
		return SUCCESS;
	}
	
	
	public String  delInfo(){
		if(infmid!=0){
			configDao.deleteInformation("Information", infmid);
			mapdata.put("zhi", "删除成功");
		}else{
			mapdata.put("zhi", "删除失败");
		}
		return SUCCESS;
		
	}
	
	public String saveInfo(){
		if(infmid!=0){
			String where = "where id ="+infmid;
			List<Object> informationList = configDao.getTable("Information", where);
			Information infm = (Information) informationList.get(0);
			if(infm.getIsTop()==1){
				infm.setIsTop(0);
			}else{
				infm.setIsTop(1);	
			}
			configDao.saveInformation(infm);
 			mapdata.put("zhi", "修改成功");
		}else{
			mapdata.put("zhi", "修改失败");
		}
		return SUCCESS;
	}

	public String getInfo(){
		if(infmid!=0){
			String where = "where id ="+infmid;
			List<Object> informationList = configDao.getTable("Information", where);
			Information infm = (Information) informationList.get(0);
			mapdata.put("infm",infm);
		}else{
			mapdata.put("infm", "");
		}
		return SUCCESS;
	}
	
	public String addInfm(){
		System.out.println("----tianjia------");
		System.out.println("--");
		if(data!=null){
			Information infm =new Information();
			System.out.println(data.toString());
			JSONObject dataJson =JSONObject.fromObject(data);
			infm.setId(0);
			infm.setTitle((String) dataJson.get("title"));
			infm.setContent((String)dataJson.get("content"));
			infm.setType("通知");
			
//			infm.setAuthor((String)(session.getAttribute("mms_sessionid")));
			infm.setCreatetime( DateTool.getDate((String)dataJson.get("start_time"),"yyyy-MM-dd hh:mm"));
			infm.setStatus("0");
			infm.setIsTop(0);
			configDao.saveInformation(infm);
			mapdata.put("success", "true");
		}else{
			mapdata.put("success", "false");
		}
//		private Date changetime;
//		private String schoolId;
//		private String subjectId;
//		private Integer count;
//		private Integer participantCount;
		return SUCCESS;
	}
	
}
