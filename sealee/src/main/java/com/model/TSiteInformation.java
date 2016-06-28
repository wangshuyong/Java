package com.model;

import java.util.Date;

public class TSiteInformation {
	/**
	 * 
	 */
	private int id;
	private String title;
	private String source;
	private String source_link;
	private String author;
	private String filetype;
	private String summury;
	private String content;
	private Date date_created;
	private int is_show;
	private String remark;
	private int is_view;
	private int click_num;
	private int reply_num;
	private String note_keyword;
	private String note_description;
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate_created() {
		return date_created;
	}
	public void setDate_created(java.util.Date dt) {
		this.date_created = (Date) dt;
	}
	public int getid() {
		return id;
	}
	public void setid(int id) {
		this.id = id;
	}
	public int getIs_show() {
		return is_show;
	}
	public void setIs_show(int is_show) {
		this.is_show = is_show;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getSummury() {
		return summury;
	}
	public void setSummury(String summury) {
		this.summury = summury;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getSource_link() {
		return source_link;
	}
	public void setSource_link(String source_link) {
		this.source_link = source_link;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFiletype() {
		return filetype;
	}
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	public int getIs_view() {
		return is_view;
	}
	public void setIs_view(int is_view) {
		this.is_view = is_view;
	}
	public int getClick_num() {
		return click_num;
	}
	public void setClick_num(int click_num) {
		this.click_num = click_num;
	}
	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	public String getNote_description() {
		return note_description;
	}
	public void setNote_description(String note_description) {
		this.note_description = note_description;
	}
	public String getNote_keyword() {
		return note_keyword;
	}
	public void setNote_keyword(String note_keyword) {
		this.note_keyword = note_keyword;
	}
}
