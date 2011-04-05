package com.riseful.jesscool;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.riseful.jesscooljava.base.Util;
import com.riseful.jesscooljava.entity.Article;
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
		
		//返回json数据
		JSONObject obj = new JSONObject();
		JSONObject temp = null;
		JSONArray temp_ary = null;
		Set<String> keys = articleSets.keySet();
		try {
			for( String key : keys ){
				temp_ary = new JSONArray();
				for( Article art : articleSets.get(key) ){
					temp = new JSONObject();
					temp.put("title", art.getTitle())
						.put("content", art.getContent())
						.put("cover", art.getCover())
						.put("firstImg", art.getFirstImg())
						.put("intime", art.getIntime())
						.put("id", art.getId());
					temp_ary.put(temp);
				}
				obj.put("ary",temp_ary);
			}
			res.setCharacterEncoding("UTF-8");
			res.setContentType("text/html;charset=UTF-8");
			res.getWriter().println(obj.toString());
			
		}catch (Exception e){
			e.printStackTrace();
		}
	}
}
