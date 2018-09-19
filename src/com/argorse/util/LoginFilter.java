package com.argorse.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.argorse.admin.domain.Admin;

public class LoginFilter implements Filter {

	
	public void destroy() {
		// TODO Auto-generated method stub

	}

	
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)resp;
		Admin admin = (Admin)request.getSession().getAttribute("admin");
		if(admin == null){
			response.sendRedirect(request.getContextPath()+"/login.html");
		}
		else{
			chain.doFilter(req, resp);
		}
	}

	
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
