package com.riseful.jesscool.secure;

import java.util.Iterator;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.UrlPathHelper;

import com.riseful.jesscooljava.entity.User;

public class Authorizer extends HandlerInterceptorAdapter {
	private UrlPathHelper urlPathHelper = new UrlPathHelper();
	private PathMatcher pathMatcher = new AntPathMatcher();
	private Properties groupMappings = new Properties();
	
	public void setGroupMappings(Properties groupMappings) {
		this.groupMappings = groupMappings;
	}
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception{
		String url = urlPathHelper.getLookupPathForRequest(req);
		String group = lookupGroup(url);
		
		if(group == null){
			return true;
		}
		
		User loginUser = (User)req.getSession().getAttribute("loginUser");
		ModelAndView mav = new ModelAndView("system/authorizeError");
		
		if(loginUser == null){
			mav.addObject("errorMsg", "你还没登录哦!");
			throw new ModelAndViewDefiningException(mav);
		}else{
			if(!loginUser.getGroups().contains(group)){
				mav.addObject("errorMsg", "你不在<b><"+group+"/b>组当中");
				throw new ModelAndViewDefiningException(mav);
			}
			return true;
		}
	}
	public String lookupGroup(String url){
		String group = groupMappings.getProperty(url);//通过url获得url对应的组
		if(group == null){
			String lastMatchPattern = null;
			for(Iterator it = this.groupMappings.keySet().iterator();it.hasNext();) {
				String groupPattern = (String)it.next();
				
				//这个遍历url pattern, 看看哪个最符合 url, 然后再看看最符合的pattern所对应的group
				if(pathMatcher.match(groupPattern, url) && (lastMatchPattern == null || lastMatchPattern.length() < groupPattern.length() )){
					lastMatchPattern = groupPattern;
					group = groupMappings.getProperty(lastMatchPattern);
				}
			}
		}
		return group;
	}
}
