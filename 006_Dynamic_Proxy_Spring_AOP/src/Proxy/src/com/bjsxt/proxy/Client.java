package com.bjsxt.proxy;


public class Client {
	public static void main(String[] args) throws Exception {
		Tank t = new Tank();
		InvocationHandler h = new TimeHandler(t);
		
		Moveable m = (Moveable)Proxy.newProxyInstance(Moveable.class, h);
		
		m.move();
		m.stop();
	}
}
//���Զ�����Ķ�������Ľӿڷ�����ʵ������Ĵ���