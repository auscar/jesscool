<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="include/head.inc" %>
		<link href="http://s.jesscool.com/csspro/profile.css" type="text/css" rel="stylesheet" />
		<link href="http://s.jesscool.com/csspro/jquery-ui.css" type="text/css" rel="stylesheet" />
		
		<script src="http://s.jesscool.com/jspro/jquery-1.4.2.min.js"></script>
		<title>Jesscool - 想搜点什么</title>
	</head>
	<body>
		
		<div id="box">

			<div id="header">
		    	<ul id="quickLink">
		        	<li><a href="/home.do">首页</a></li>
		            <li><a href="/profile.do">衣酷首页</a></li>
		            <li><a href="#">我们的微薄</a></li>
		        </ul>
		        <ul id="login">
					<li><a href="register.html">注册</a></li>
            		<li><a href="login.html">登录</a></li>
		        </ul>
		        <div id="logo"><a href="/home.do"><img src="http://s.jesscool.com/imgpro/logo.gif" /></a></div>
		        <!-- <div class="recommend"><img src="http://s.jesscool.com/imgpro/recommend.gif" /> <a href="#">最新搭配推荐！</a></div> -->
		    </div>
		    
		<h1>想搜点什么?</h1>      
		<div id="cse" style="width: 100%;">Loading</div>  
		<script src="//www.google.com/jsapi" type="text/javascript"></script>  
		<script type="text/javascript">   
			google.load('search', '1', {language : 'zh-CN', style : google.loader.themes.MINIMALIST});      
			google.setOnLoadCallback(function(){  
				var customSearchControl = new google.search.CustomSearchControl('016344004145333435208:cjcldpe6wpk'); 
				console.log(customSearchControl);   
				customSearchControl.setResultSetSize(google.search.Search.FILTERED_CSE_RESULTSET);    
				customSearchControl.disableAds();
				customSearchControl.draw('cse');   
	
				
				var s = location.search;
	
				var regx = /words=(.+)/;
				var ret = regx.exec(s);
	
				if(!ret||!ret[1])return;
	
				
				$('input')[0].focus();
				$('input')[0].value = decodeURIComponent(ret[1]);
				customSearchControl.submit();
				
				
			}, true);  
		</script>
		<link href="http://s.jesscool.com/csspro/search.css" type="text/css" rel="stylesheet" />
		
		<div id="footer">
	    	&copy; Copyright 2008 - 2010 Jesscool
	    </div>
	    
	    <div class="count"><%@ include file="include/footer.inc" %></div>
		    
		</div>
		
		
	</body>
</html>
