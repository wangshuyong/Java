package com.sea.thread.thread1;

public class Task {

	public int num=0;
	synchronized public void otherMethod() {
		String str = new String();
//		synchronized (str) {
			for (int i = 0 ; i<100; i++){
				System.out.println("sychronized threadName=" + Thread.currentThread().getName() + "i==" + (i+1) +"===============================run------otherMethod"+"num=====" +num);
				num++;
			}
//		}
	}
	
	public void doLongTimeTask () {
		synchronized (this) {
			for (int i = 0 ; i<100; i++){
				System.out.println("sychronized threadName=" + Thread.currentThread().getName() + "i==" + (i+1)+"num=====" +num);
				num++;
			}
		}
	}
}
