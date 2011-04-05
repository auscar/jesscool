package com.riseful.jesscool;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.riseful.cache.UserCache;
import com.riseful.jesscool.tools.Check;
import com.riseful.jesscool.tools.Set;
import com.riseful.jesscool.base.Env;
import com.riseful.jesscooljava.base.Util;
import com.riseful.jesscooljava.entity.User;
import com.riseful.jesscooljava.entity.UserCookie;
import com.riseful.jesscooljava.service.JesscoolService;

public class UserLoginServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1768844805826671376L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		//System.out.println("********************UserLoginServlet");
		//获取用户请求信息，如用户名、密码等
		//获取数据库用户信息
		/*
		 * if(登录成功)｛
		 * 	  跳转到首页；
		 * 	  显示登录状态，如“xxx欢迎您回来！”;
		 * ｝else｛
		 * 	  跳转至登录页面
		 * ｝ 
		 * 
		 * */
		//比较客户所填写的信息与数据库的是否一直，如果一致，跳转到请求的页面，如果不正确，跳转到登录页面
		
		//获取用户填写的信息
		String userName = req.getParameter("userName");
		String userPwd = req.getParameter("userPwd");

		//设置登录成功后跳转的到的页面
		String susUri = "profile.do";
		String faildUri = "/views/userLogin.jsp";
		
		//设置分发器的值
		RequestDispatcher rd = req.getRequestDispatcher(susUri);
		RequestDispatcher rdFaild = req.getRequestDispatcher(faildUri);
		
		//设置登录失败后的提示信息
		req.setAttribute("loginMsg", "抱歉，帐户名或密码不正确！");
		
		try{
			//判断是否有填写或是否为空
			if(userName == null || userName.equals("") || userPwd == null || userPwd.equals("")){
				rdFaild.forward(req, res);
				return;
			}
			
			//获取jesscoolService
			JesscoolService service = (JesscoolService)Util.getCtx().getBean("JesscoolService");
			
			//查询数据库，检查用户信息是否正确
			User user = service.getUserByName(userName);
			
			//如果登录成功
			if(user != null && user.getPwd().equals(userPwd)){
				System.out.println("888888888888888888888888登录成功");
				
				String cookieValue = userName + Math.random();
				
				//获取Cookie数组
				Cookie[] cookies = req.getCookies();
				//int isSetCookie = Check.CheckCookie("userCookieValue", cookies);
//				if(isSetCookie == 1){  //已经设置过Cookie，覆盖旧值
//					Set.SetCookie("userCookieName", userName, cookies);
//					Set.SetCookie("userCookieValue", cookieValue, cookies);
//					System.out.println("==============================================UserLoginServlet===========================================");
//					System.out.println("Cookie has been seted !");
//				}else{
					//在cookie中设置登录时需要查询的信息
					Cookie userCookieName = new Cookie("userCookieName",userName);
					Cookie userCookieValue = new Cookie("userCookieValue",cookieValue);
					//设置Cookie的有效区域
					userCookieName.setPath("/");
					userCookieValue.setPath("/");
					//向客户端发送Cookie
					res.addCookie(userCookieName);
					res.addCookie(userCookieValue);
				//}
				
				System.out.println("==============================================UserLoginServlet value===========================================");
				System.out.println("cookieValue= " + cookieValue);
				
				//将userCookieValue的值方入HashMap,以便查询与对照
				UserCache.tickets.put( userName, cookieValue );
				//UserCache.tickets.put("userCookieValue2", "OKHere");
				
				//rd.forward(req, res);
				res.sendRedirect(susUri);
				return;
				
				//创建UserCookie对象，用以存放写入到数据库的资料
//				UserCookie userCookie = new UserCookie();
//				userCookie.setCookieName(userName);
//				userCookie.setCookieValue(cookieValue);
				
				//将userCookieValue的值写入数据库,以便查询与对照
				//service.saveCookie(userCookie);
				
				//req.setAttribute("gellery", "<li><a href='http://www.jesscool.com/imgShow.do'>我的图库</a></li>");

				
			}else{ //密码不正确
				System.out.println("------- 密码不正确  ----");
				rdFaild.forward(req, res);
				return;
			}
						
		}catch(ServletException e){
			e.printStackTrace();			
		}catch(IOException e){
			e.printStackTrace();			
		}
				
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res){
		doGet(req,res);
	}

}
