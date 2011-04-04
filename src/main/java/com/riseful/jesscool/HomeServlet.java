package com.riseful.jesscool;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.riseful.jesscool.tools.Check;
import com.riseful.jesscool.tools.Get;
import com.riseful.jesscooljava.base.Util;
import com.riseful.jesscooljava.entity.Article;
import com.riseful.jesscooljava.entity.Tag;
import com.riseful.jesscooljava.service.JesscoolService;

public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 4162308812741344727L;
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		//获取JesscoolJava的后台服务
		JesscoolService service = (JesscoolService)Util.getCtx().getBean("JesscoolService");
		
		//获取所需类别的文章
//		Map<String,List<Article>> sideBarMap = service.getSimpleArticlesByTagIds(new int[]{1,2},8);
//		Map<String,List<Article>> mainMap = service.getSimpleArticlesByTagIds(new int[]{4},8);
		Map<Tag,List<Article>> sideBarMap = service.getSimpleArticlesWithTagByTagIds(new int[]{1,2,3,4,5,12},8);
		Map<Tag,List<Article>> mainMap = service.getSimpleArticlesWithTagByTagIds(new int[]{4},8);
		
		
		Map<Tag,List<Article>> hots = service.getSimpleArticlesWithTagByTagIds(new int[]{7},5);
		Map<Tag,List<Article>> peishi = service.getSimpleArticlesWithTagByTagIds(new int[]{12},5);
		Map<Tag,List<Article>> kerioa = service.getSimpleArticlesWithTagByTagIds(new int[]{17},8);//韩国风上
		Map<Tag,List<Article>> kerioa_special = service.getSimpleArticlesWithTagByTagIds(new int[]{13},3);//韩国风下(含有图片展示)
		Map<Tag,List<Article>> europe = service.getSimpleArticlesWithTagByTagIds(new int[]{16},8);//欧美风上
		Map<Tag,List<Article>> europe_special = service.getSimpleArticlesWithTagByTagIds(new int[]{14},3);//欧美风下(含有图片展示)
		
		
		//将从后台服务获取的数据放到request当中, 以便JSP使用
		req.setAttribute("sideBarMap", sideBarMap);
		req.setAttribute("mainMap", mainMap);
		req.setAttribute("hots", hots);
		req.setAttribute("peishi", peishi);
		req.setAttribute("kerioa", kerioa);
		req.setAttribute("kerioa_special", kerioa_special);
		req.setAttribute("europe", europe);
		req.setAttribute("europe_special", europe_special);
		
		if( Check.checkLogin(req.getCookies()) ){
			req.setAttribute("gallery", "<li><a href='http://www.jesscool.com/imgShow.do'>我的图库</a></li>");
			req.setAttribute("loginStatus", "<li>欢迎您回来，<a href='http://www.jesscool.com/imgShow.do'>" + Get.GetCookie("userCookieName", req.getCookies()) + "</a></li><li><a href='userLogout.do'>退出</a></li>");
		}else{
			req.setAttribute("loginStatus", "<li><a href='http://www.jesscool.com/views/userRegister.jsp'>注册</a></li><li><a href='http://www.jesscool.com/views/userLogin.jsp'>登录</a></li>");
		}
		

		
		//转向index.jsp
		RequestDispatcher rd = req.getRequestDispatcher("/views/index.jsp");
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
