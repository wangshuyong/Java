package com.util;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

public class Test {
	public static void main(String args[]) throws UnsupportedEncodingException{
		System.out.println("����" + new Date().getDay()+"����������ǣ�"+new Date());
		System.out.println("���ܿ�ʼ�ĵ����ǣ�����" + 1);
		
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -(new Date().getDay()-1)); 
		System.out.println("����һ�������ǣ�"+cal.getTime().toLocaleString().substring(0, 10));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date dt = new java.util.Date();
		String tempDate = sdf.format(dt);
		System.out.println(tempDate);
		
		String tempString = "��ҳ���";
		
		tempString = java.net.URLEncoder.encode(tempString, "gb2312");
		System.out.println(tempString);
		
		System.out.println(java.net.URLDecoder.decode("%E7%BD%91%E7%AB%99%E6%8E%A8%E5%B9%BF"));
		
		String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()); 
		System.out.println(dt);
		
		java.util.UUID tempId = UUID.randomUUID();
		String id = tempId.toString();
		System.out.println(id);
		
	}

	
	
}
