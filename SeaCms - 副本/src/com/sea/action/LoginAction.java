package com.sea.action;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.sea.form.UserForm;
import com.sea.model.User;
import com.sea.service.UserService;

public class LoginAction extends BaseAction implements ModelDriven{
	/**
	 * 
	 */
	
	private static final long serialVersionUID = 1L;
	@Resource(name="userService")
	private UserService userService;
	private UserForm userForm =null;
	private User user ;
	private String message;
	
	public String adminLogin(){
		String phone = userForm.getPhone();
		String pwd = userForm.getPassword();
		if(!("".equals(phone)) && phone !=null && !("".equals(pwd)) && pwd !=null) {
			user = userService.login(phone,pwd);
		} else {
			message="请输入用户名、密码";
			return "fail";//检查输入用户名、密码
		}

		if(user==null || "".equals(user)){
			message="请输入正确的用户名、密码";
			return "error"; //用户名、密码错误
			//user.equals("")
		} else if ( user.getPower().equals("1")) {
			session.put("loginUser",user);
			return "adminLogin";//管理员登录，进入后台
		} else 
			message="您没有权限登录，请联系管理员";
			return "noPower";//普通用户登录 进入前端
	}
	
	public String login(){
		String phone = userForm.getPhone();
		String pwd = userForm.getPassword();
		if(!("".equals(phone)) && phone !=null && !("".equals(pwd)) && pwd !=null) {
			user = userService.login(phone,pwd);
		} else {
			message="请输入用户名、密码";
			return "fail";//检查输入用户名、密码
		}

		if(user==null || "".equals(user)){
			message="请输入正确的用户名、密码";
			return "error"; //用户名、密码错误
			//user.equals("")
		} else if ( user.getPower().equals("0")) {
			session.put("loginUser",user);
			return "userLogin";//管理员登录，进入后台
		} else 
			message="您没有权限登录，请联系管理员";
			return "noPower";//普通用户登录 进入前端		
	}
	
	public String rePassword(){
		
		return message;
		
	}
	public String logOut() {  
        session.clear();  
        return "logout";  
 	 }

	@Override
	public Object getModel() {
		if(userForm==null) userForm = new UserForm();
		return userForm;
	}

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

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
