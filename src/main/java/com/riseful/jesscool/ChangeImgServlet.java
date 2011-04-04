package com.riseful.jesscool;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.riseful.jesscool.base.Env;
import com.riseful.jesscooljava.base.Util;
import com.riseful.jesscooljava.entity.Article;
import com.riseful.jesscooljava.entity.Tag;
import com.riseful.jesscooljava.entity.User;
import com.riseful.jesscooljava.entity.Img;
import com.riseful.jesscooljava.entity.ImgTag;
import com.riseful.jesscooljava.service.JesscoolService;

public class ChangeImgServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1768844805826671376L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		
		//接收请求参数
		Integer tagId = Integer.parseInt(req.getParameter("tagId"));
		
		//获取JesscoolJava的后台服务
		JesscoolService service = (JesscoolService)Util.getCtx().getBean("JesscoolService");
		
		//获取所需图片信息
		List<Img> newImgTagImg = service.getImgsByTagId(tagId);//每个标签下的图片
		
		//组织所需要的html结构
		String imgTagImg_lis = "";
		for(int i = 0; i < newImgTagImg.size(); i++){
			imgTagImg_lis += "<img src='http://s.jesscool.com/upload/" + newImgTagImg.get(i).getImgUrl() + "' imgId=" + newImgTagImg.get(i).getId() + " />";
		}
		
		try {
			//直接输出，作为ajax请求的响应数据
			res.getWriter().print(imgTagImg_lis.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res){
		doGet(req,res);
	}

}
