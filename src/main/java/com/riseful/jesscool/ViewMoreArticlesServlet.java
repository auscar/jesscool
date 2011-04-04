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

public class ViewMoreArticlesServlet extends HttpServlet {
	private static final long serialVersionUID = 4162308812741344727L;
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		String tagId = req.getParameter("tagId");
		if(tagId == null && "".equals(tagId)){return;}
		
		//获取JesscoolJava的后台服务
		JesscoolService service = (JesscoolService)Util.getCtx().getBean("JesscoolService");
		
		//获取所需类别的文章
		Map<String,List<Article>> articleSets = service.getSimpleArticleDigestsByTagIds(new int[]{Integer.parseInt(tagId)},-1,180);
		
		Map<Tag,List<Article>> sideBarMap = service.getSimpleArticlesWithTagByTagIds(new int[]{1,2,3,4,5,12},8);
		
		//将从后台服务获取的数据放到request当中, 以便JSP使用
		req.setAttribute("articleSets", articleSets);
		req.setAttribute("sideBarMap", sideBarMap);
		if( Check.checkLogin(req.getCookies()) ){
			req.setAttribute("gallery", "<li><a href='http://www.jesscool.com/imgShow.do'>我的图库</a></li>");
			req.setAttribute("loginStatus", "<li>欢迎您回来，<a href='http://www.jesscool.com/imgShow.do'>" + Get.GetCookie("userCookieName", req.getCookies()) + "</a></li><li><a href='userLogout.do'>退出</a></li>");
		}else{
			req.setAttribute("loginStatus", "<li><a href='http://www.jesscool.com/views/userRegister.jsp'>注册</a></li><li><a href='http://www.jesscool.com/views/userLogin.jsp'>登录</a></li>");
		}
		
		//转向index.jsp
		RequestDispatcher rd = req.getRequestDispatcher("/views/moreLook.jsp");
		try {
			rd.forward(req, res);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
