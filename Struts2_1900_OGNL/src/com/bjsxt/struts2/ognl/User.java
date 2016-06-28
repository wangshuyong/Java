package com.bjsxt.struts2.ognl;

public class User {
	private int age = 8;
	private String name;
	public User() {
		
	}
	
	public User(String name) {
		this.setName(name);
	}
	
	public User(int age) {
		this.age = age;
	}
	

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
	@Override
	public String toString() {
		return "user is:" + age +","+"and name is:" +name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
