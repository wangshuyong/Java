package com.sea.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.sea.form.UserForm;
import com.sea.model.User;
import com.sea.service.UserService;

public class RegisterAction extends BaseAction implements ModelDriven{
	
	@Resource(name="userService")
	private UserService userService;
	private UserForm userForm =null;
	private User user= new User();
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public UserForm getUserForm() {
		return userForm;
	}
	
	public void setUserForm(UserForm userForm) {
		this.userForm = userForm;
	}
	
	public String excute(){	
		user.setPhone(userForm.getPhone());
		user.setPassword(this.getPassMD5(userForm.getPassword()));
		user.setEmail(userForm.getEmail());
		user.setSex(userForm.getSex());
		return userService.addUser(user);		
	}

	@Override
	public Object getModel() {
		if(userForm==null) userForm = new UserForm();
		return userForm;
	}

}
