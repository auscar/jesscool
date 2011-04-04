package com.riseful.ajax;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.riseful.jesscool.tools.Check;
import com.riseful.jesscool.tools.Get;
import com.riseful.jesscooljava.base.Util;
import com.riseful.jesscooljava.entity.ImgTag;
import com.riseful.jesscooljava.service.JesscoolService;

public class GetAllImgTagServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1768844805826671376L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res){

		try {
			if (!Check.checkLogin(req.getCookies())) {
				//输出内容
				res.getWriter().println("{\"isLogin\":\"no\"}");
				return;
			}
//			JSONObject jsonObject = new JSONObject();
//			jsonObject.put("test", 1);
		}catch(IOException e){
			e.printStackTrace();
		}
		
		
		//获取JesscoolJava的后台服务
		JesscoolService service = (JesscoolService)Util.getCtx().getBean("JesscoolService");
		
		
		try{
			//获取所需图片信息
			List<ImgTag> imgTag = service.getImgTags(Get.GetCookie("userCookieName", req.getCookies()));//每个标签下的图片

			//组织所需要的html结构
			String imgTag_lis = "";
			String tstName = "You can do it!";
			
			
			if(imgTag.size() == 0){
				imgTag_lis += "{\"isEmpty\":\"yes\"}";
				res.getWriter().print(imgTag_lis);
				return;
			}
			
			imgTag_lis += "{";
			
			if(imgTag.size() == 1){
				imgTag_lis += "\"Ary\":[{\"imgTagId\":\"" + imgTag.get(0).getImgTagId() + "\",\"imgTagName\":\"" + imgTag.get(0).getImgTagName() + "\"}";
			}else if(imgTag.size() > 1){
				for(int i = 0; i < imgTag.size(); i++){
					if(i == 0){
						imgTag_lis += "\"Ary\":[{\"imgTagId\":\"" + imgTag.get(i).getImgTagId() + "\",\"imgTagName\":\"" + imgTag.get(i).getImgTagName() + "\"}";
					}else{
						imgTag_lis += ",{\"imgTagId\":\"" + imgTag.get(i).getImgTagId() + "\",\"imgTagName\":\"" + imgTag.get(i).getImgTagName() + "\"}";
					}
						
					System.out.println("------------------------------for loop-------------------------------------------------------------");
					System.out.println("imgTagId=" + imgTag.get(i).getImgTagId());
					System.out.println("imgTagName=" + imgTag.get(i).getImgTagName());
					//imgTag_lis += "<li class='dialogContent_li' tagId='" + imgTag.get(i).getImgTagId() + "'>" + imgTag.get(i).getImgTagName() + "</li>";
				}
			}
			
			imgTag_lis += "]}";
			
			res.setCharacterEncoding("UTF-8");
			
			res.getWriter().print(imgTag_lis);
		}catch(IOException e){
			e.printStackTrace();
		}
		

		
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res){
		doGet(req,res);
	}

}
