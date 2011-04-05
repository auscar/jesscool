package com.riseful.jesscool;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.riseful.cache.UserCache;
import com.riseful.jesscool.base.Env;
import com.riseful.jesscool.tools.Check;
import com.riseful.jesscool.tools.Get;
import com.riseful.jesscooljava.base.Util;
import com.riseful.jesscooljava.entity.Article;
import com.riseful.jesscooljava.entity.Tag;
import com.riseful.jesscooljava.entity.User;
import com.riseful.jesscooljava.entity.UserCookie;
import com.riseful.jesscooljava.entity.Img;
import com.riseful.jesscooljava.entity.ImgTag;
import com.riseful.jesscooljava.service.JesscoolService;

public class ProfileManagementServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1768844805826671376L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		try {
			//获取JesscoolJava的后台服务
			JesscoolService service = (JesscoolService)Util.getCtx().getBean("JesscoolService");
			//获取Cookie数组
			Cookie[] cookies = req.getCookies();
			String userName = Get.GetCookie("userCookieName", cookies);
			Boolean isLogin = Check.checkLogin(cookies);
			
			//设置转向
			RequestDispatcher rd = req.getRequestDispatcher("/views/profileManagement.jsp");
			RequestDispatcher rdFaild = req.getRequestDispatcher("/views/userLogin.jsp");
			
			if(isLogin){  //Cookie内有值，说明已经登录或被注入
				//获取Cookie的值
//				userCookieName = Get.GetCookie("userCookieName", cookies);
//				userCookieValue = Get.GetCookie("userCookieValue", cookies);
				//获取所需图片标签及其下的图片信息
				List<ImgTag> imgTag = service.getImgTags(userName);//图片的类别
				List<Img> imgTagImg = service.getImgsByTagId(service.getMaxImgTagIdByName(userName));//每个标签下的图片
					
				//将从后台服务获取的数据放到request当中, 以便JSP使用
				req.setAttribute("imgTags", imgTag);
				req.setAttribute("imgTagImgs", imgTagImg);
				req.setAttribute("userCookieName", Get.GetCookie("userCookieName", cookies));
					
				//从后台获取最新的userCookieValue
				//String DBCookieValue = service.getUserCookieValueByName(userCookieName).getCookieValue();
				
				rd.forward(req, res);
					
			}else{  //没登录
				rdFaild.forward(req, res);
			}
			
			
			
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res){
		doGet(req,res);
	}

}
