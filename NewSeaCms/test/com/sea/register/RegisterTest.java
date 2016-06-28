package com.sea.register;

import static org.junit.Assert.*;

import java.awt.List;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.sea.dao.UserDao;
import com.sea.dao.impl.UserDaoImpl;
import com.sea.model.User;
import com.sea.service.UserService;

public class RegisterTest {

	ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
	@Test
	public void testAdd() {
//		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
//		UserService user =new UserServiceImpl();
		UserService userService =(UserService) ctx.getBean("userService");
		User u = new User();
		u.setPhone("13426371019");
		u.setPassword("123456");
		u.setEmail("wangshuyong@163.com");
		u.setSex("0");
		if(!userService.exists(u)){		
			userService.addUser(u);
		}else {
			System.out.println("exists");
		}
//		assertEquals(true, userService.exists(u));
	}
	@Test
	public void testdelete() {
		UserService userService =(UserService) ctx.getBean("userService");
		userService.deleteUser(24);
	}
	
	@Test
	public void testDaoAdd() {
		
		UserDao user =(UserDao) ctx.getBean("u");
//		UserDao user = new UserDaoImpl();
		User u = new User();
		u.setPhone("13426370014");
		u.setPassword("123456");
		u.setEmail("wangshuyong@163.com");
		u.setSex("0");
		user.save(u);
		assertEquals(true, user.findUserByPhone("13426370014"));
	}
	@Test
	public void testDaofind() {
		UserDao user = (UserDao) ctx.getBean("u");
		assertEquals(true, user.findUserByPhone("13426370014"));
	}
	
	@Test
	public void testDaodelete() {
		UserDao user = (UserDao) ctx.getBean("u");
		user.delete(24);
	}
	/*
	@Test
	public void testDaolist() {
		UserDao user = (UserDao) ctx.getBean("u");
		java.util.List list = user.list("from User",null);
		System.out.println(list.size());
//		assertEquals(true, user.findUserByPhone("13212345678"));
	}
*/

}
