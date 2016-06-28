package com.sea.thread.AB;

public class Service {

	private String username;
	private String password;
	private String str = new String();

	public void setUsernamePassword(String name, String pass) {
		try {
			synchronized (str) {
				System.out.println("thread name is :"+Thread.currentThread().getName()+"start at:"+System.currentTimeMillis());
				username = name;
				Thread.sleep(3000);
				password = pass;
				System.out.println("thread name is :"+Thread.currentThread().getName()+"end in:"+System.currentTimeMillis());
			}
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
