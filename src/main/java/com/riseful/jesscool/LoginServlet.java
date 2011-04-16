package com.riseful.jesscool;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.riseful.jesscool.base.Env;
import com.riseful.jesscool.tools.Check;
import com.riseful.jesscooljava.base.Util;
import com.riseful.jesscooljava.entity.User;
import com.riseful.jesscooljava.service.JesscoolService;

public class LoginServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1768844805826671376L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		String userName = req.getParameter("userName");
		String userPwd = req.getParameter("password");
		String referer = req.getParameter("referer");
		HttpSession session = req.getSession();
		String uri = "/views/admin/adminActions.jsp";
		referer = Env.webRoot + uri;
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/login.jsp");
		req.setAttribute("loginMsg", "用户名或密码不正确!");
		
		System.out.println(userName+"  "+userPwd);
		
		try {
			if( userName == null || userName.equals("") || userPwd == null || userPwd.equals("")){
					rd.forward(req, res);
					return;
			}	
			
			JesscoolService service = (JesscoolService)Util.getCtx().getBean("JesscoolService");
			
			User user = service.getUserByName(userName);
			
			if(user == null){
				System.out.println("user null");
				rd.forward(req, res);
				return;
			}
			
			if(Check.checkLogin(req.getCookies())&&userName.equals("auscar@qq.com")){
				req.getSession().setAttribute("loginUser", user);
				rd = req.getRequestDispatcher(uri);
			}else{
				
				rd.forward(req, res);
				return;
			}
			
			res.sendRedirect(referer);

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
