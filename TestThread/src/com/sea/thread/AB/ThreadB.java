package com.sea.thread.AB;


public class ThreadB extends Thread {

	private Service task;
	public ThreadB (Service task) {
		this.task = task;
	}
	@Override
	public void run() {
		super.run();
		task.setUsernamePassword("threadB", "BBBBBB");
	}
	
}