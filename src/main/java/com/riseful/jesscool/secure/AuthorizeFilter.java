package com.riseful.jesscool.secure;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.riseful.jesscool.base.Env;
import com.riseful.jesscooljava.entity.User;

public class AuthorizeFilter extends HttpServlet implements Filter {
	private String allowRole;
	private String redirectUrl;
	public void doFilter(ServletRequest req, ServletResponse res,FilterChain filterChain) throws IOException, ServletException {
		
		HttpServletRequest httpReq = (HttpServletRequest)req;
		HttpServletResponse httpRes = (HttpServletResponse)res;
		HttpSession session = httpReq.getSession();
		
		System.out.println("ooooooooooooooooooo--->request URI : "+httpReq.getRequestURI());
		User loginUser = (User)session.getAttribute("loginUser");
		
		
		if(loginUser == null){
			httpRes.sendRedirect(redirectUrl+"?from="+httpReq.getRequestURL());
		}else{
			filterChain.doFilter(req, res);
		}
		
	}

	public void init(FilterConfig conf) throws ServletException {
		allowRole = conf.getInitParameter("allowRole");
		System.out.println("### redirect url : "+redirectUrl);
		redirectUrl = Env.webRoot+"/views/login.jsp";
	}

}
