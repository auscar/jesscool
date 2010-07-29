package com.riseful.jesscool;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.riseful.jesscooljava.base.Util;
import com.riseful.jesscooljava.entity.Tag;
import com.riseful.jesscooljava.service.JesscoolService;

public class ModifyTagServlet extends HttpServlet {
	private static final long serialVersionUID = 4263105153842811190L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		String id = req.getParameter("id");
		
		if(id == null)return;
		
		JesscoolService service = (JesscoolService)Util.getCtx().getBean("JesscoolService");
		
		Tag tag = service.getTagById(Integer.parseInt(id));
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/modifyTag.jsp");
	
		req.setAttribute("tag",	tag);
		
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
