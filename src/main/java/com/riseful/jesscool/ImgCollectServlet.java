package com.riseful.jesscool;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.riseful.jesscool.base.Env;
import com.riseful.jesscool.tools.Get;
import com.riseful.jesscooljava.base.Util;
import com.riseful.jesscooljava.entity.ImgTag;
import com.riseful.jesscooljava.entity.User;
import com.riseful.jesscooljava.entity.Img;
import com.riseful.jesscooljava.service.JesscoolService;

public class ImgCollectServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1768844805826671376L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		
		//获取JesscoolJava的后台服务
		JesscoolService service = (JesscoolService)Util.getCtx().getBean("JesscoolService");
		
		String userId = "", tagName = "", imgName = "";
		int tagId = 0;
		
		try{
			//获取用户填写的信息
			tagName = req.getParameter("tagName");
			//创建ImgTag实例保存数据
			ImgTag imgTag = new ImgTag();
			imgTag.setImgTagName(tagName);
			imgTag.setUserName(Get.GetCookie("userCookieName", req.getCookies()));
			
			if(req.getParameter("tagId") != null && Integer.parseInt(req.getParameter("tagId")) != 0){
				tagId = Integer.parseInt(req.getParameter("tagId"));
			}else{
				tagId = service.addImgTag(imgTag);
			}
			
			userId = Get.GetCookie("userCookieName", req.getCookies());
			imgName = req.getParameter("imgName");
			
			System.out.println("===========================================================================================================================================");
			System.out.println("userId=" + userId);
			
		}catch(Exception e){  //出现异常，即所填写的信息不正确，重新填写
			//设置跳转的页面
			String url = "/views/imgCollect.jsp";
			//设置分发器
			RequestDispatcher rdCollect = req.getRequestDispatcher(url);
			try {
				rdCollect.forward(req, res);
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		//新建一Img对象存储数据
		Img img = new Img();
		img.setImgName(imgName);
		img.setTagName(tagName);
		img.setTagId(tagId);
		img.setUserId(userId);
		
		
		//调用addImg()方法写入数据
		int add_sign = service.addImg(img);
		
		//给请求页面发送添加信号，add_sign为1表示成功，0表示失败
		req.setAttribute("add_sign", add_sign);
		
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res){
		doGet(req,res);
	}

}
