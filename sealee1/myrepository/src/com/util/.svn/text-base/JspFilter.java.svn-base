package com.util;

import java.io.IOException;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URLConnection;
import java.net.URL;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public  class JspFilter implements Filter {
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterChain) throws IOException, ServletException {
		HttpServletRequest hreq = (HttpServletRequest)request;
		HttpServletResponse hres = (HttpServletResponse)response;
		String name = hreq.getRequestURI().substring(hreq.getRequestURI().indexOf("/")+1,hreq.getRequestURI().indexOf("."));
		if(hreq.getRequestURI().indexOf("shtml")!=-1 && (hreq.getParameter("article")==null||hreq.getParameter("article").equals(""))){
			hres.sendRedirect(hreq.getContextPath()+"/testservlet?name="+hreq.getRequestURI());
			return;
		}
		filterChain.doFilter(hreq,hres);
	}

	public void init(FilterConfig filterConfig) throws ServletException {

	}
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
