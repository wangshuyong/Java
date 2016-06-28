package com.web.form;

import org.apache.struts.action.ActionForm;

public class SiteTypeForm extends ActionForm{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	private String id;
	private String name;
	private String name_value;
	private String type_level;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getName_value() {
		return name_value;
	}
	public void setName_value(String name_value) {
		this.name_value = name_value;
	}
	public String getType_level() {
		return type_level;
	}
	public void setType_level(String value_level) {
		this.type_level = value_level;
	}
}
