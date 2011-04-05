<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="include/head.inc" %>
		<link href="http://s.jesscool.com/csspro/profile.css" type="text/css" rel="stylesheet" />
		<title>Jesscool - 我的衣酷</title>
	</head>
	<body>
		<div id="box">

			<div id="header">
		    	<ul id="quickLink">
		        	<li><a href="/home.do">首页</a></li>
		            <li><a href="/profileManagement.do">衣酷管理</a></li>
		            <li><a href="#">我们的微薄</a></li>
		        </ul>
		        <ul id="login">
		        	<li>哟，您来啦，${ userCookieName } !</li>
		        	<li><a href="/logout.do">退出</a></li>
		            <li><a href="/views/userInfo.jsp">信息管理</a></li>
		        </ul>
		        <div id="logo"><a href="/home.do"><img src="http://s.jesscool.com/imgpro/logo.gif" /></a></div>
		        <div class="recommend"><img src="http://s.jesscool.com/imgpro/recommend.gif" /> <a href="#">最新搭配推荐！</a></div>
		    </div>
		    
		    <div id="wrapper">
		    	<div id="main">
		        	<div class="articleBox">
		                <div class="article">
		                    <h2 class="articleTitle">您的专属衣柜<span>//2011.04.2</span></h2>
		                    <div class="articleDetail">
		                    	<div class="detialText">
		                    		<c:forEach var="imgTagImgs" items="${ imgTagImgs }">
						        		<img src="http://s.jesscool.com/upload/${ imgTagImgs.imgUrl }" imgId="${ imgTagImgs.id }" />
						        		<p>当下的情侣款牛仔裤，不再限于款式的雷同，细节上的呼应才是全新的趋势。</p>
						        	</c:forEach>
		                        </div>
		                        <dl class="articleDate">
		                            <dt>04/02</dt>
		                            <dd>2011</dd>
		                        </dl>
		                    </div>   
		                </div>
		            </div>
		        </div>
		        <div id="sidebar">
		            <ul id="articleType">
		            	<li class="selected"><a href="#">阳光运动</a></li>
		            	<c:forEach var="imgTags" items="${ imgTags }">
	            			<li class="imgNav1_li"><a href="#" tagId="${ imgTags.imgTagId }"><span>${ imgTags.imgTagName }</span></a></li>
	            		</c:forEach>
		            </ul>
		            
		        </div>
		    </div>
		    
		    <div id="footer">
		    	&copy; Copyright 2008 - 2010 Jesscool
		    </div>
		    <script src="http://s.jesscool.com/jspro/jquery-1.4.2.min.js"></script>
			<script src="http://s.jesscool.com/jspro/common.js"></script>
			<div class="count"><%@ include file="include/footer.inc" %></div>
		</div>
		
	</body>
</html>
