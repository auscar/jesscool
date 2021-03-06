package com.riseful.jesscool;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.riseful.jesscooljava.base.Util;
import com.riseful.jesscooljava.entity.Tag;
import com.riseful.jesscooljava.service.JesscoolService;

public class AddArticleServlet extends HttpServlet {
	private static final long serialVersionUID = -5446739804269648500L;
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/addArticle.jsp");
		//计算当前时间
		Date now = new Date();
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		
		
		JesscoolService service = (JesscoolService)Util.getCtx().getBean("JesscoolService");
		
		List<Tag> tags = service.getAllTag();
		
		req.setAttribute("tags", tags);
		req.setAttribute("intime", f.format(now));
		
		
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
