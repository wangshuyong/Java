package com.web.form;

import java.util.Date;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

public class AdvertiseForm extends ActionForm{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	private String id;
	private int adv_type;
	private String adv_title;
	private String adv_link;
	private String link_color;
	
	private int image_height;
	private int image_width;
	private Date add_date;
	private String take_effect_date;
	private String ineffective_date;
	private int auditing;
	private FormFile adv_image;
	private String image;
	public Date getAdd_date() {
		return add_date;
	}
	public void setAdd_date(Date add_date) {
		this.add_date = add_date;
	}
	
	public String getAdv_link() {
		return adv_link;
	}
	public void setAdv_link(String adv_link) {
		this.adv_link = adv_link;
	}
	public String getAdv_title() {
		return adv_title;
	}
	public void setAdv_title(String adv_title) {
		this.adv_title = adv_title;
	}
	public int getAdv_type() {
		return adv_type;
	}
	public void setAdv_type(int adv_type) {
		this.adv_type = adv_type;
	}
	public int getAuditing() {
		return auditing;
	}
	public void setAuditing(int auditing) {
		this.auditing = auditing;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getImage_height() {
		return image_height;
	}
	public void setImage_height(int image_height) {
		this.image_height = image_height;
	}
	public int getImage_width() {
		return image_width;
	}
	public void setImage_width(int image_width) {
		this.image_width = image_width;
	}
	public String getIneffective_date() {
		return ineffective_date;
	}
	public void setIneffective_date(String ineffective_date) {
		this.ineffective_date = ineffective_date;
	}
	public String getLink_color() {
		return link_color;
	}
	public void setLink_color(String link_color) {
		this.link_color = link_color;
	}
	public String getTake_effect_date() {
		return take_effect_date;
	}
	public void setTake_effect_date(String take_effect_date) {
		this.take_effect_date = take_effect_date;
	}
	public FormFile getAdv_image() {
		return adv_image;
	}
	public void setAdv_image(FormFile adv_image) {
		this.adv_image = adv_image;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
}
