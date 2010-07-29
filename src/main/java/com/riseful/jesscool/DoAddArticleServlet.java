package com.riseful.jesscool;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.riseful.jesscooljava.base.Util;
import com.riseful.jesscooljava.entity.Article;
import com.riseful.jesscooljava.entity.Tag;
import com.riseful.jesscooljava.service.JesscoolService;

public class DoAddArticleServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -745679970419552226L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		String title = req.getParameter("articleTitle");
		String content = req.getParameter("articleBody");
		String articleTagId = req.getParameter("articleTagId");
		String articleCover = req.getParameter("articleCover");
		Article article = new Article();
		article.setTitle(title);
		article.setContent(content);
		Date now = new Date();
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		article.setIntime(f.format(now)) ;
		
		System.out.println("wwwwwwwwwwwww tag : "+articleTagId);
		if(articleTagId != null){
			Tag tag = new Tag();
			tag.setId(Integer.parseInt(articleTagId));
			article.setTag(tag);
		}
		if(articleCover != null && !articleTagId.equals("")){
			article.setCover(articleCover);
		}
		
		JesscoolService service = (JesscoolService)Util.getCtx().getBean("JesscoolService");
		
		int ret = service.addArticle(article);//add
		
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
