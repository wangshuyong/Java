package com.util;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionFilter implements Filter{

 public void destroy() {
  // TODO Auto-generated method stub
  
 }

 public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
  // TODO Auto-generated method stub
  HttpServletRequest req = (HttpServletRequest)request;
  HttpServletResponse res = (HttpServletResponse)response;
  HttpSession session = req.getSession();
  try{
   request.setCharacterEncoding("utf-8");
   //String url = req.getRequestURI();
   //System.out.println(url);
   
   if(session.getAttribute("adminuser")!=null&&!session.getAttribute("adminuser").equals("")){
   
    chain.doFilter(request, response);
    
   }else{
    res.sendRedirect("../index.html");
    //request.getRequestDispatcher("../../index.jsp").forward(request,response);
   }
  }catch(Exception e){
   e.printStackTrace();
  }
 }

 public void init(FilterConfig arg0) throws ServletException {
  // TODO Auto-generated method stub
  
 }

}

