package com.sea.thread.list;

public class ThreadList1 extends Thread {

	private MyList list;
	
	public ThreadList1(MyList list){
		super();
		this.list=list;
	}
	
	@Override
	public void run() {
		Service service = new Service();
		service.addService(list, "AAAA");
	}
}
