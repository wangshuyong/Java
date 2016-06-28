package com.sea.thread.list;

public class ThreadList2 extends Thread {

	private MyList list;
	
	public ThreadList2(MyList list){
		super();
		this.list=list;
	}
	
	@Override
	public void run() {
		Service service = new Service();
		service.addService(list, "bbbb");
	}
}
