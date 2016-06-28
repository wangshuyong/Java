package com.sea.thread.list;

import java.util.ArrayList;
import java.util.List;

public class MyList {

	private List list = new ArrayList();

	synchronized public void add(String name) {
//		System.out.println("thread name is :"
//				+ Thread.currentThread().getName() + "  start do method add ");
		list.add(name);
//		System.out.println("thread name is :"
//				+ Thread.currentThread().getName() + "   exist methd add:");
	}
	
	synchronized public int getSize() {
//		System.out.println("thread name is :"
//				+ Thread.currentThread().getName() + "  start do method getSize ");
		int size = list.size();
//		System.out.println("thread name is :"
//				+ Thread.currentThread().getName() + "exist methd getSize:");
		return size;
	}
}
