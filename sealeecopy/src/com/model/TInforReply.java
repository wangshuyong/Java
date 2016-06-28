package com.model;

import java.util.Date;

public class TInforReply {
	/**
	 * 
	 */
	private String id;
	private String infor_id;
	private String reply_author;
	private String reply_content;
	private Date reply_date;
	private int reply_state;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getInfor_id() {
		return infor_id;
	}
	public void setInfor_id(String infor_id) {
		this.infor_id = infor_id;
	}
	public String getReply_author() {
		return reply_author;
	}
	public void setReply_author(String reply_author) {
		this.reply_author = reply_author;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public Date getReply_date() {
		return reply_date;
	}
	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}
	public int getReply_state() {
		return reply_state;
	}
	public void setReply_state(int reply_state) {
		this.reply_state = reply_state;
	}
}
