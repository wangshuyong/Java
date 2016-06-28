package com.sea.thread.list;

public class Service {

	public MyList addService(MyList list, String data) {

		try {
			synchronized(list) {
				if (list.getSize() < 1) {
					Thread.sleep(2000);
					list.add(data);
				}
			}
			
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
