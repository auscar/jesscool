package com.riseful.jesscool.tools;

import javax.servlet.http.Cookie;

public class Get {
	public static String GetCookie(String key, Cookie[] cookies){
		if(cookies == null || cookies.length == 0){
			return null;
		}
		String cookieValue = "";
		for(int i = 0; i < cookies.length; i++){
			Cookie cookie = cookies[i];
			if( key.equals(cookie.getName()) ){
				cookieValue = cookie.getValue();
				break;
			}
		}
		return cookieValue;
	}
}
