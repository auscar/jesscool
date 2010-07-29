package com.riseful.jesscool;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.riseful.jesscooljava.base.Util;
import com.riseful.jesscooljava.entity.Article;
import com.riseful.jesscooljava.entity.Tag;
import com.riseful.jesscooljava.service.JesscoolService;

public class ArticlesUnderTagServlet extends HttpServlet {
	private static final long serialVersionUID = 5420096897784014396L;
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		String tagId = req.getParameter("tag");
		
		if(tagId == null)return;
		
		JesscoolService service = (JesscoolService)Util.getCtx().getBean("JesscoolService");
		
		Map<Tag,List<Article>> article_map = service.getSimpleArticlesWithTagByTagIds(new int[]{Integer.parseInt(tagId)}, -1);
		
		
		Set<Tag> tags =  article_map.keySet();
		
		for( Tag t : tags ){
			List<Article> articles =  article_map.get(t);
			System.out.println(" article size : "+articles.size());
			
		}
		
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/articlesUnderTag.jsp");
	
		req.setAttribute("article_map",	article_map);
		
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
