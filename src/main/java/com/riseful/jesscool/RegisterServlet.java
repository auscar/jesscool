package com.riseful.jesscool;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.riseful.jesscooljava.base.Util;
import com.riseful.jesscooljava.entity.User;
import com.riseful.jesscooljava.service.JesscoolService;

public class RegisterServlet extends HttpServlet {
	
	private static final long serialVersionUID = -1768844805826671376L;
	
	public void doGet(HttpServletRequest req,HttpServletResponse res){
		/*
		 * 1、获取用户信息
		 * 2、判断用户名是否存在，如果存在，跳回注册页面，重新填写注册信息 
		 * 3、如果不存在，将用户信息写入数据库，提示注册成功
		 * 4、跳转到登录页面
		 * */
		
		//获取用户提交的信息
		String userName = req.getParameter("userName");
		String userPwd = req.getParameter("userPwd");
		String userPhone = req.getParameter("userPhone");
		String userGender = req.getParameter("userGender");
		String userHeight = req.getParameter("userHeight");
		String userWeight = req.getParameter("userWeight");
		
		//定义页面跳转的路径及分发器，以便做页面跳转操作
		String uri = "views/userLogin.jsp";
		String uriFail = "views/userRegister.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(uri);
		RequestDispatcher rdFail = req.getRequestDispatcher(uriFail);
		
		//获取jesscoolService,然后根据用户填写的用户名获取用户信息
		JesscoolService service = (JesscoolService)Util.getCtx().getBean("jesscoolService");
		User user = service.getUserByName(userName);//根据用户名获取用户信息		
		User userNew = new User();
		
		try{
			//判断用户名是否存在
			if(user == null || user.getName().equals("")){ //用户名未填写或为空
				rdFail.forward(req, res);//跳回注册页面 
				return;
			}else{
				userNew.setName(userName);
				userNew.setPwd(userPwd);
				userNew.setUserHeight(Integer.parseInt(userHeight));
				userNew.setUserGender(Boolean.parseBoolean(userGender));
				userNew.setUserPhone(userPhone);
				userNew.setUserWeight(Integer.parseInt(userWeight));
				
				//往数据库写资料
				service.addUser(user);
				rd.forward(req, res);//跳转到登录页面
				return;
			}			
		}catch(ServletException e){
			e.printStackTrace();			
		}catch(IOException e){
			e.printStackTrace();
		}
		
	}
	
	public void doPost(HttpServletRequest req,HttpServletResponse res){
		doGet(req,res);
	}
	
}
