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

public class ViewArticleServlet extends HttpServlet {
	private static final long serialVersionUID = -5446739804269648500L;
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		String articleId = req.getParameter("lookId");
		String tagId = req.getParameter("tagId");
		
		if( articleId == null || articleId.equals("") || tagId == null ||  tagId.equals("") )return;
		
		JesscoolService service = (JesscoolService)Util.getCtx().getBean("JesscoolService");

		Article article = service.getSimpleArticleByIdAndTagId(Integer.parseInt(articleId), Integer.parseInt(tagId));
		
		Map<Tag,List<Article>> sideBarMap = service.getSimpleArticlesWithTagByTagIds(new int[]{1,2,3,4,5,12},8);
		
		
		System.out.println("&&&&&&&&&&&&& content : "+article.getTitle());
		//System.out.println("&&&&&&&&&&&&& content : "+article.getTag().getName());
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/viewLook.jsp");
		System.out.println("acticle content : "+article.getContent());
		req.setAttribute("article",	article);
		req.setAttribute("sideBarMap", sideBarMap);
		if( Check.checkLogin(req.getCookies()) ){
			req.setAttribute("gallery", "<li><a href='http://www.jesscool.com/imgShow.do'>我的图库</a></li>");
			req.setAttribute("loginStatus", "<li>欢迎您回来，<a href='http://www.jesscool.com/imgShow.do'>" + Get.GetCookie("userCookieName", req.getCookies()) + "</a></li><li><a href='userLogout.do'>退出</a></li>");
		}else{
			req.setAttribute("loginStatus", "<li><a href='http://www.jesscool.com/views/userRegister.jsp'>注册</a></li><li><a href='http://www.jesscool.com/views/userLogin.jsp'>登录</a></li>");
		}
		
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
