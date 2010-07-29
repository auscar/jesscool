package com.riseful.jesscool;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.riseful.jesscooljava.base.Util;
import com.riseful.jesscooljava.entity.Tag;
import com.riseful.jesscooljava.service.JesscoolService;

public class AllTagsServlet extends HttpServlet {
	private static final long serialVersionUID = -2718148829612917773L;
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		
		
		JesscoolService service = (JesscoolService)Util.getCtx().getBean("JesscoolService");
		
		List<Tag> tags = service.getAllTag();
		//-------------------------
		req.setAttribute("tags", tags);
		
		//-------------------------
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/allTags.jsp");
		
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
