package com.riseful.jesscool.tools;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

public class Remove {
	public static void RemoveCookie(String key, Cookie[] cookies, HttpServletResponse res){
		for(int i = 0; i < cookies.length; i++){
			Cookie cookie = cookies[i];
			if( key.equals(cookie.getName()) ){
				cookie.setMaxAge(0);
				cookie.setPath("/");
				res.addCookie(cookie); //设置好之后，通知浏览器删除Cookie,否则将不成功
			}
		}
	}
}
