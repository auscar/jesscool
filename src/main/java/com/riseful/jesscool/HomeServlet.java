package com.riseful.jesscool;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.riseful.jesscool.tools.Check;
import com.riseful.jesscool.tools.Get;
import com.riseful.jesscooljava.base.Util;
import com.riseful.jesscooljava.entity.Article;
import com.riseful.jesscooljava.entity.Tag;
import com.riseful.jesscooljava.service.JesscoolService;

public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 4162308812741344727L;
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		//获取JesscoolJava的后台服务
		JesscoolService service = (JesscoolService)Util.getCtx().getBean("JesscoolService");
		
		//获取本周专题的文章
		Map<Tag,List<Article>> weekTopics = service.getSimpleArticlesWithTagByTagIds(new int[]{1},5);
		
		
		//将从后台服务获取的数据放到request当中, 以便JSP使用
		req.setAttribute("weekTopics", weekTopics);
		
		if( Check.checkLogin(req.getCookies()) ){
			req.setAttribute("loginStatus", "<li>哟，您来啦，" + Get.GetCookie("userCookieName", req.getCookies()) + "</li><li><a href='userLogout.do'>退出</a></li>");
		}else{
			req.setAttribute("loginStatus", "<li><a href='http://www.jesscool.com/views/userRegister.jsp'>注册</a></li><li><a href='http://www.jesscool.com/views/userLogin.jsp'>登录</a></li>");
		}
		
		//转向index.jsp
		RequestDispatcher rd = req.getRequestDispatcher("/views/index.jsp");
		try {
			rd.forward(req, res);
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
