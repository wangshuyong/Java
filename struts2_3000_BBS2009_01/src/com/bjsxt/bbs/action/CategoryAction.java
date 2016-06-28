package com.bjsxt.bbs.action;

import java.util.List;

import com.bjsxt.bbs.model.Category;
import com.bjsxt.bbs.service.CategoryService;
import com.opensymphony.xwork2.ActionSupport;

public class CategoryAction extends ActionSupport{
	
	private List<Category> categories;
	private CategoryService categoryservice=new CategoryService();
	private Category category;
	private int id;
	
	public String list() throws Exception {
			categories=categoryservice.list();		
		return SUCCESS;
	}
	
	public String add(){	
		categoryservice.add(category);
		return SUCCESS;
	}
	
	public String delete(){
		categoryservice.deleteById(id);
		return SUCCESS;
	}
	
	public String update(){
		categoryservice.update(category);
		return SUCCESS;
	}
	
	public String addInput(){
		return INPUT;
	}
	
	public String updateInput(){
		return INPUT;
	}
	
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

}
