package com.riseful.jesscool.tools;

import javax.servlet.http.Cookie;

public class Set {
	public static void SetCookie(String key, String value, Cookie[] cookies){
		for(int i = 0; i < cookies.length; i++){
			Cookie cookie = cookies[i];
			if( key.equals(cookie.getName()) ){
				cookie.setValue(value);
			}
		}
	}
}
