package com.sea.action;

import java.util.List;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.sea.form.UserForm;
import com.sea.model.Page;
import com.sea.model.User;
import com.sea.service.PageService;
import com.sea.service.UserService;

public class UserAction extends BaseAction implements ModelDriven{

	
	private UserService userService;
	
	private UserForm userForm =null;
	private User user=new User();
	private List<User> list;
	private int userId;
	private Page page;
	private PageService pageService; 
	protected String currentPage;
	protected String pagerMethod;
	protected String totalRows;
	    
	public String delete(){
		userService.deleteUser(userId);
		return "delete";
	}
	
	public String list(){
		int totalRows=userService.getUserCount();
		page = pageService.getPager(getCurrentPage(), getPagerMethod(), totalRows);
		this.setCurrentPage(String.valueOf(page.getCurrentPage()));
        this.setTotalRows(String.valueOf(totalRows));
        list = userService.listUser(page.getPageSize(), page.getStartRow());
		return "list";
	}
	
	public String edit(){
		user=userService.getUser(userId);
		System.out.println(this.getUser());
		return "edit";
	}
	
	public String update(){
		User temp=userService.getUser(user.getId());
		temp.setPhone(userForm.getPhone());
		temp.setEmail(userForm.getEmail());
		temp.setSex(userForm.getSex());
		userService.updateUser(temp);
		return "update";
	}
	public String add(){
		user.setPassword(this.getPassMD5("123456"));
		userService.addUser(user);
		return "add";
	}
	
	public String userAdd(){
		return "userAdd";
	}

	@Override
	public Object getModel() {
		if(userForm==null) userForm = new UserForm();
		return userForm;
	}

	
	public UserForm getUserForm() {
		return userForm;
	}

	public void setUserForm(UserForm userForm) {
		this.userForm = userForm;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<User> getList() {
		return list;
	}

	public void setList(List<User> list) {
		this.list = list;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}
	
	public UserService getUserService() {
		return userService;
	}
	@Resource(name="userService")
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public PageService getPageService() {
		return pageService;
	}
	@Resource(name="pageService")
	public void setPageService(PageService pageService) {
		this.pageService = pageService;
	}

	public String getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}

	public String getPagerMethod() {
		return pagerMethod;
	}

	public void setPagerMethod(String pagerMethod) {
		this.pagerMethod = pagerMethod;
	}

	public String getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(String totalRows) {
		this.totalRows = totalRows;
	}

}
