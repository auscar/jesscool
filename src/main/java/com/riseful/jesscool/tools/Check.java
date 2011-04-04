package com.riseful.jesscool.tools;

import javax.servlet.http.Cookie;

import com.riseful.cache.UserCache;

public class Check {
	
	public static Boolean CheckCookie(String key, Cookie[] cookies){
		Boolean isSetCookie = false;
		for(int i = 0; i < cookies.length; i++){
			Cookie cookie = cookies[i];
			if( key.equals(cookie.getName()) ){
				if(cookie.getValue() != null && cookie.getValue() != ""){
					isSetCookie = true;
				}else{
					isSetCookie = false;
				}
			}
		}
		return isSetCookie;
	}
	
	public static Boolean checkLogin(Cookie[] cookies){
		if(cookies == null || cookies.length == 0){
			return false;
		}
		
		Boolean isLogin = false;
		String userName = Get.GetCookie("userCookieName", cookies);
		System.out.println("999999999999999999999999 fuck userName: "+userName);
		for( Cookie c : cookies ){
			System.out.println("ooooooooooooooooooooo    "+c.getName()+" "+c.getValue());
		}
		
		if(userName==null||userName.equals("")){
			System.out.println("cookie内没有userCookieName");
			return false;
		}
		Object ticket = UserCache.tickets.get(userName);
		if( ticket == null || ticket.equals("") ){
			System.out.println("ticke 为空");
			return false;
		}
		
		String strTicket = ticket.toString();
		
		try {
			for (int i = 0; i < cookies.length; i++) {
				Cookie cookie = cookies[i];
				if (cookie.getName().equals("userCookieValue")) {
					if(cookie.getValue() == null){
						System.out.println("userCookieValue为null");
						return false;
					}
					
					if (cookie.getValue().equals( strTicket) ) {
						isLogin = true;
						System.out.println("======================================Check====================================================");
						System.out.println("Comparing");
						break;
					} else {
						System.out.println("userCookieValue跟cache里的不一样  "+cookie.getValue()+"  "+strTicket);
						isLogin = true;
						System.out.println("======================================Check====================================================");
						System.out.println("cookieValue= " + cookie.getValue());
						System.out.println("HashMap.cookieValue= " + UserCache.tickets.get("userCookieValue").toString() );
						break;
					}
				}
			}
			
			
		} catch (Exception e) {
			isLogin = false;
			System.out.println("======================================Check====================================================");
			System.out.println("Error!");
			e.printStackTrace();
		}
		return isLogin;
	}
	
}
