package com.util;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ConversionServlet extends HttpServlet{
	public ConversionServlet(){
		super();
	}
	public void destory(){
		super.destroy();
	}
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		//��ȡ�����URL
		String reqTarget = request.getParameter("name");
		
		System.out.println(reqTarget);
		//ָ����ӦJSP��html����
		String name = reqTarget.substring(reqTarget.lastIndexOf("/")+1, reqTarget.lastIndexOf("."));
		System.out.println(name);
		File file = new File(request.getRealPath("/")+name+".html");
		
		if(!file.exists()){
			//������ָ��HTMLҳ��
			try{
				file.createNewFile();//����HTMLҳ��
				//��jspҳ������д���Ӧ��HTMLҳ��
				InputStream in ;
				StringBuffer sb = new StringBuffer("");
				URL url = new java.net.URL(reqTarget.toString()+"");
				HttpURLConnection connection =(HttpURLConnection)url.openConnection();
				connection.setRequestProperty("User-Agent", "Mozilla/");
				connection.connect();
				in = connection.getInputStream();
				java.io.BufferedReader breader = new java.io.BufferedReader(new InputStreamReader(in,"GBK"));
				
				String currentLine;
				FileOutputStream fos = new FileOutputStream(file);
				while((currentLine = breader.readLine())!=null){
					sb.append(currentLine);
					fos.write(currentLine.getBytes());	
				}
				if(breader!=null) breader.close();
				if(fos!=null) fos.close();
				response.sendRedirect(request.getRealPath("/")+name+".html");
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}else{
			//����ָ����HTMLҳ�棬ֱ�Ӵ򿪸�ҳ��
			response.sendRedirect(request.getRealPath("/")+name+".html");
		}
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		doGet(request,response);
	}
	public void init()throws ServletException{
		
	}
}
