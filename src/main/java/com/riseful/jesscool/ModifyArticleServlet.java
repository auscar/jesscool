package com.riseful.jesscool;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.riseful.jesscooljava.base.Util;
import com.riseful.jesscooljava.entity.Article;
import com.riseful.jesscooljava.service.JesscoolService;

public class ModifyArticleServlet extends HttpServlet {
	private static final long serialVersionUID = -5446739804269648500L;
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		String articleId = req.getParameter("articleId");
		JesscoolService service = (JesscoolService)Util.getCtx().getBean("JesscoolService");
		//System.out.println("&&&&&&&&&&&&& article id get is : "+articleId);
		if(articleId==null || articleId.equals(""))return;
		
		Article article = service.getArticleById(Integer.parseInt(articleId));
		
		//System.out.println("&&&&&&&&&&&&& content : "+article.getTitle());
		//System.out.println("&&&&&&&&&&&&& content : "+article.getTag().getName());
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/modifyArticle.jsp");
		//System.out.println("acticle content : "+article.getContent());
		req.setAttribute("article",	article);
		
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
