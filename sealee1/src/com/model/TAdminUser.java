package com.model;

public class TAdminUser {
	/**
	 * 
	 */
	private int id;
	private String username;
	private String password;
	private String admin_power;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAdmin_Power() {
		return admin_power;
	}
	public void setAdmin_Power(String admin_power) {
		this.admin_power = admin_power;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
}
