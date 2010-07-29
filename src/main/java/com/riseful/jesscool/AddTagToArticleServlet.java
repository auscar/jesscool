package com.riseful.jesscool;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.riseful.jesscooljava.base.Util;
import com.riseful.jesscooljava.entity.Article;
import com.riseful.jesscooljava.service.JesscoolService;

public class AddTagToArticleServlet extends HttpServlet {
	private static final long serialVersionUID = -2718148829612917773L;
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		String articleId = req.getParameter("article");
		String tag = req.getParameter("tag");
		if(articleId == null)return;
		
		JesscoolService service = (JesscoolService)Util.getCtx().getBean("JesscoolService");
		
		Article article = new Article();
		article.setId( Integer.parseInt(articleId));
		
		int ret = service.addTagIdToArticle(article, Integer.parseInt(tag));
		
		String rese;
		if(ret>0){
			rese = "{code:0,msg:'sus'}";
		}else{
			rese = "{code:1,msg:'faild'}";
		}
		
		try {
			res.getWriter().println(rese);
		} catch (IOException e) {
			e.printStackTrace();
		}
		

	}
	public void doPost(HttpServletRequest req, HttpServletResponse res){
		doGet(req,res);
	}

}
