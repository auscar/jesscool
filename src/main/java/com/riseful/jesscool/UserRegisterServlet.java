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

public class UserRegisterServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1768844805826671376L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		//获取用户填写的资料
		String userEmail = req.getParameter("email");
		Integer userHeight = Integer.parseInt(req.getParameter("height"));
		Integer userWeight = Integer.parseInt(req.getParameter("weight"));
		String userPwd = req.getParameter("password");
		Boolean userGender = Boolean.parseBoolean(req.getParameter("gender"));
		String referer = req.getParameter("referer");
		
		JesscoolService service = (JesscoolService)Util.getCtx().getBean("JesscoolService");
		
		//定义一个User对象，将用户填写的资料粗存起来，以便进行参数传递
		User user = new User();
		user.setName(userEmail);  //储存用户名
		user.setUserHeight(userHeight); //储存用户身高
		user.setUserWeight(userWeight);  //储存用户体重
		user.setPwd(userPwd);  //储存用户密码
		user.setUserGender(userGender);  //储存用户性别
		
		//配置成功或失败时需要跳转的路径
		String susUri = "/views/success.jsp";
		String failUri = "/views/userRegister.jsp";
		//配置分发器
		RequestDispatcher rd = req.getRequestDispatcher(susUri);
		RequestDispatcher rd_faild = req.getRequestDispatcher(failUri);
		
		try{
			//判断用户填写的资料是否完整，如不完整，提示重新输入
			if( userEmail == null || userHeight == null || userWeight == null || userPwd == null){
				res.getWriter().println("信息不完整，请重新填写！");
				req.setAttribute("resTips", "    抱歉，您的信息不完整，请重新填写！");
				rd_faild.forward(req, res);
				return;
			}else{
				//判断用户是否已经存在，如果存在，提示重新输入
				if( service.getUserByName(userEmail) != null ){  //不为空，表示已存在该用户
					req.setAttribute("resTips", "    该用户名已经存在，请重新填写！");
					rd_faild.forward(req, res);
				}else{
					//调用service对象的addUser()方法，添加用户
					int ret_user = service.addUser(user);
					
					if(ret_user > 0){  //如果添加成功
						//跳转到成功页面
						rd.forward(req, res);
						//req.setAttribute("loginMsg", "恭喜你，注册成功！");
					}else{
						//注册失败，跳回注册页面
						rd_faild.forward(req, res);
						//req.setAttribute("loginMsg", "抱歉，注册失败！");
					}
				}
			}
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
