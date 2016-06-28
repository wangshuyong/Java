package com.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;

public class EncodingFilter extends HttpServlet implements Filter {
	private FilterConfig filterConfig;
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterChain) throws IOException, ServletException {

		
		try {
			request.setCharacterEncoding("utf-8");
			filterChain.doFilter(request, response);
		} catch (ServletException ex) {
			//ex.printStackTrace();
			throw ex;
		} catch (Exception ex) {
			//ex.printStackTrace();
			throw new ServletException(ex);
		}

	}

	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;

	}

}
