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

public class LatestArticleServlet extends HttpServlet {
	private static final long serialVersionUID = -5446739804269648500L;
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		
		JesscoolService service = (JesscoolService)Util.getCtx().getBean("JesscoolService");
		int articleId = service.getMaxArticleId();
		//int articleId = 467;
		int tagId = 7;
		Article article = null;
		Map<Tag,List<Article>> weekTopics = null;
		
		try{
			article = service.getSimpleArticleByIdAndTagId( articleId, tagId );
			
			//获取本周专题的文章
			weekTopics = service.getSimpleArticlesWithTagByTagIds(new int[]{1},30);
		}catch( Exception e){
			e.printStackTrace();
			return;
		}
		//Map<Tag,List<Article>> sideBarMap = service.getSimpleArticlesWithTagByTagIds(new int[]{1,2,3,4,5,12},8);
		
		//将从后台服务获取的数据放到request当中, 以便JSP使用
		req.setAttribute("weekTopics", weekTopics);
		req.setAttribute("article", article);
		
		if( Check.checkLogin(req.getCookies()) ){
			req.setAttribute("loginStatus", "<li>哟，您来啦，" + Get.GetCookie("userCookieName", req.getCookies()) + "</li><li><a href='userLogout.do'>退出</a></li>");
		}else{
			req.setAttribute("loginStatus", "<li><a href='http://www.jesscool.com/views/userRegister.jsp'>注册</a></li><li><a href='http://www.jesscool.com/views/userLogin.jsp'>登录</a></li>");
		}
		
		//转向index.jsp
		RequestDispatcher rd = req.getRequestDispatcher("/views/viewLook.jsp");
		
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
