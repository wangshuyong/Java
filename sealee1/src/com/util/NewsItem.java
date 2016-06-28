package com.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class NewsItem {

	public String title;
	public String addTime;
	public String showContent;
	
	public String getAddTime() {
		return addTime;
	}
	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}
	public String getShowContent() {
		return showContent;
	}
	public void setShowContent(String showContent) {
		this.showContent = showContent;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public void loadData(){
		this.title="≤‚ ‘ƒ⁄»›";
		this.showContent="≤‚ ‘freemarker…˙≥…æ≤Ã¨“≥√Ê";
		this.addTime=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date());
	}
}
