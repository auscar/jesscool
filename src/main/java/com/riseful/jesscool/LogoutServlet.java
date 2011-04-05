package com.riseful.jesscool;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.riseful.jesscool.base.Env;
import com.riseful.jesscooljava.base.Util;
import com.riseful.jesscooljava.entity.User;
import com.riseful.jesscooljava.service.JesscoolService;

public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 116863095202198920L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		HttpSession session = req.getSession();
		session.setAttribute("loginUser", null);
		
		String uri = "/views/userLogin.jsp";
	
	
		try {
			res.sendRedirect(uri);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	public void doPost(HttpServletRequest req, HttpServletResponse res){
		doGet(req,res);
	}

}
