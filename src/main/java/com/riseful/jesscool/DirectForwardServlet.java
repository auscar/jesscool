package com.riseful.jesscool;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DirectForwardServlet extends HttpServlet {
	private static final long serialVersionUID = -5446739804269648500L;
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		String target = req.getParameter("forwardTo");
		if(target == null || target.equals(""))return;
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/"+ target +".jsp");
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
