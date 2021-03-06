package com.riseful.jesscool;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.riseful.jesscooljava.base.Util;
import com.riseful.jesscooljava.entity.Tag;
import com.riseful.jesscooljava.service.JesscoolService;

public class DoModifyTagServlet extends HttpServlet {
	private static final long serialVersionUID = -2718148829612917773L;
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		String id = req.getParameter("id");
		String tagName = req.getParameter("tagName");
		String isAtHome = req.getParameter("isAtHome");
		String description = req.getParameter("description");
		
		if(id == null)return;
		
		JesscoolService service = (JesscoolService)Util.getCtx().getBean("JesscoolService");
		
		Tag tag = new Tag();
		tag.setId(Integer.parseInt(id));
		tag.setName(tagName);
		tag.setDescription(description);
		tag.setAtHome(Boolean.parseBoolean(isAtHome));
		int ret = service.updateTag(tag);
		
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
