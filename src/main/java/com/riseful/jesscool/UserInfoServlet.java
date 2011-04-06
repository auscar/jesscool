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
import com.riseful.jesscool.tools.Get;
import com.riseful.jesscooljava.base.Util;
import com.riseful.jesscooljava.entity.User;
import com.riseful.jesscooljava.service.JesscoolService;

public class UserInfoServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1768844805826671376L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		
		
		//获取用户填写的资料
		Integer userHeight = Integer.parseInt(req.getParameter("userHeight"));
		Integer userWeight = Integer.parseInt(req.getParameter("userWeight"));
		String userPwd = req.getParameter("userPwd");
		
		JesscoolService service = (JesscoolService)Util.getCtx().getBean("JesscoolService");
		
		//定义一个User对象，将用户填写的资料粗存起来，以便进行参数传递
		User user = new User();
		user.setPwd(userPwd);
		user.setUserHeight(userHeight);
		user.setUserWeight(userWeight);
		user.setName(Get.GetCookie("userCookieName", req.getCookies()));
		
		//配置成功或失败时需要跳转的路径
		String susUri = "/views/userInfo.jsp";
		String failUri = "/views/userInfo.jsp";
		//配置分发器
		RequestDispatcher rd = req.getRequestDispatcher(susUri);
		RequestDispatcher rd_faild = req.getRequestDispatcher(failUri);
		
		try{
			
			if(!Check.checkLogin(req.getCookies())){
				req.setAttribute("modifyStatus", "抱歉，您还没登录！");
				rd_faild.forward(req, res);
				return;
			}
			
			int num =service.updateUserInfo(user);
			if(num > 0){
				req.setAttribute("modifyStatus", "资料保存成功！");
			}else{
				req.setAttribute("modifyStatus", "资料保存失败！");
			}
			rd.forward(req, res);
		}catch(ServletException e){
			e.printStackTrace();
		}catch(IOException e){
			e.printStackTrace();
		}
		
		
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res){
		doGet(req,res);
	}

}
