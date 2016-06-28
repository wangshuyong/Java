package com.sea.thread.AB;


public class ThreadA extends Thread {

	private Service task;
	public ThreadA (Service task) {
		this.task = task;
	}
	@Override
	public void run() {
		super.run();
		task.setUsernamePassword("threadA", "aaaaa");
	}
	
}
