package com.bistu.survey.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bistu.survey.entities.User;

public class RequestFilter implements Filter{

	

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest requestHttp = (HttpServletRequest) request;  
		HttpServletResponse responseHttp = (HttpServletResponse)response;
		String path = requestHttp.getContextPath();
	    String basePath = requestHttp.getScheme()+"://"+requestHttp.getServerName()+":"+requestHttp.getServerPort()+path+"/";

		User user = (User)requestHttp.getSession().getAttribute("user");
        if(user == null) {
        	responseHttp.sendRedirect(basePath+ "front/SessionOverdue.jsp");
        	return;
        }else {
        	chain.doFilter(request, response);
		}
         
            
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}
	
	@Override
	public void destroy() {
		
	}
	
}
