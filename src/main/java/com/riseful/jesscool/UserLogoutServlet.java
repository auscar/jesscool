package com.riseful.jesscool;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.riseful.cache.UserCache;
import com.riseful.jesscool.tools.Get;
import com.riseful.jesscool.tools.Remove;


public class UserLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 116863095202198920L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		//获取Cookie
		Cookie[] cookies = req.getCookies();
		String uri = "/views/userLogin.jsp";
		
		//清空HashMap中key为UserCookieValue的值
		UserCache.tickets.remove("userCookieValue");
		//删除Cookie中的用户信息
		Remove.RemoveCookie("userCookieName", cookies, res);
		Remove.RemoveCookie("userCookieValue", cookies, res);
		
		Cookie[] cookies_lt = req.getCookies();
		System.out.println("======================================UserLogoutServlet===================================================");
		System.out.println("HashMap.userCookieValue= " + UserCache.tickets.get("userCookieValue"));
		System.out.println("userCookieName= " + Get.GetCookie("userCookieName", cookies_lt));
		System.out.println("userCookieValue= " + Get.GetCookie("userCookieValue", cookies_lt));
		
		try {
			res.sendRedirect(uri);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	public void doPost(HttpServletRequest req, HttpServletResponse res){
		doGet(req,res);
	}

}
