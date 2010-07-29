package com.riseful.jesscool;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.riseful.jesscooljava.base.Util;
import com.riseful.jesscooljava.entity.Article;
import com.riseful.jesscooljava.service.JesscoolService;

public class DoModifyArticleServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -745679970419552226L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		String title = req.getParameter("articleTitle");
		String intime = req.getParameter("articleIntime");
		String content = req.getParameter("articleBody");
		String articleId = req.getParameter("articleId");
		String cover = req.getParameter("postUrl");
		if(articleId==null || articleId.equals(""))return;
		
		Article article = new Article();
		article.setId(Integer.parseInt(articleId));
		article.setIntime(intime);
		article.setTitle(title);
		article.setContent(content);
		article.setCover(cover);
		
		JesscoolService service = (JesscoolService)Util.getCtx().getBean("JesscoolService");
		
		int ret = service.updateSimpleArticle(article);
		
		try {
			if(ret>0){
				res.getWriter().println("{code:0,msg:'sus'}");
			}else{
				res.getWriter().println("{code:2,msg:'fail'}");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res){
		doGet(req,res);
	}

}
