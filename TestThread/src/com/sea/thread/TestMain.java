package com.sea.thread;

import com.sea.thread.AB.Service;
import com.sea.thread.AB.ThreadA;
import com.sea.thread.AB.ThreadB;
import com.sea.thread.list.MyList;
import com.sea.thread.list.ThreadList1;
import com.sea.thread.list.ThreadList2;
import com.sea.thread.thread1.Task;
import com.sea.thread.thread1.Thread1;
import com.sea.thread.thread1.Thread2;

public class TestMain {

	public static void main(String[] args) throws InterruptedException {
		MyList list = new MyList();
		ThreadList1 t1 = new ThreadList1(list);
		t1.setName("AAAAAAA");
		t1.start();
		ThreadList2 t2 = new ThreadList2(list);
		t2.setName("BBBBBBB");
		t2.start();
		
		Thread.sleep(5000);
		System.out.println("listSize is :  " + list.getSize());
		
//		Service service = new Service();
//		ThreadA t1 = new ThreadA(service);
//		t1.start();
//		ThreadB t2 = new ThreadB(service);
//		t2.start();
//		
		
//		Task task = new Task();
//		Thread1 t1 = new Thread1(task);
//		t1.setName("A");
//		t1.start();
//		Thread2 t2 = new Thread2(task);
//		t2.setName("B");
//		t2.start();
	}

}


