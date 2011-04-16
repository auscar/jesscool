<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="include/head.inc" %>
		<link href="http://s.jesscool.com/csspro/profile.css" type="text/css" rel="stylesheet" />
		<link href="http://s.jesscool.com/csspro/jquery-ui.css" type="text/css" rel="stylesheet" />
		
		<title>Jesscool - 我的衣酷</title>
	</head>
	<body>
		
		<div id="box">

			<div id="header">
		    	<ul id="quickLink">
		        	<li><a href="/home.do">首页</a></li>
		            <li><a href="/profile.do">衣酷首页</a></li>
		            <li><a target="_blank" href="http://t.sina.com.cn/1879936431">我们的微博</a></li>
		        </ul>
		        <ul id="login">
		        	<li>哟，您来啦，despair2@126.com !</li>
		        	<li><a href="/logout.do">退出</a></li>
		            <li><a href="/views/userInfo.jsp">信息管理</a></li>
		        </ul>
		        <div id="logo"><a href="/home.do"><img src="http://s.jesscool.com/imgpro/logo.gif" /></a></div>
		        <div class="recommend"><img src="http://s.jesscool.com/imgpro/recommend.gif" /> <a href="/latestArticle.do">最新搭配推荐！</a></div>
		    </div>
		    
		    <div id="wrapper">
		    	<div id="main">
		        	<div class="articleBox">
		                <div class="article">
		                    <h2 class="articleTitle">您的专属衣柜<span>//2011.04.2</span></h2>
		                    <div class="articleDetail">
		                    	<div class="detailText" id="detailText">
		                            <c:forEach var="imgTagImgs" items="${ imgTagImgs }">
						        		<img src="http://s.jesscool.com/upload/${ imgTagImgs.imgUrl }" imgId="${ imgTagImgs.id }" />
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
		            	<c:forEach var="imgTags" items="${ imgTags }">
	            			<li class="imgNav1_li"><a href="#" tagId="${ imgTags.imgTagId }"><span>${ imgTags.imgTagName }</span></a></li>
	            		</c:forEach>
		            </ul>
		            <div class="someTips">
		            	<h2>温馨提示:</h2>
		            	<p>1.如果您想<b> 删除图片 </b>，请点击大图右侧的"X"。</p>
		        		<p>2.如果您想<b> 编辑图片类别 </b>，请将鼠标移至上方菜单上。</p>
		        		<p>3.如果您想<b> 改变图片所属类别 </b>，请将图片拖拽到页面右侧相应分类上。</p>
		            </div>
		        </div>
		    </div>
		    
		    <div id="footer">
		    	&copy; Copyright 2008 - 2010 Jesscool
		    </div>
			
		<script src="http://s.jesscool.com/jspro/jquery-1.4.2.min.js"></script>
		<script src="http://s.jesscool.com/jspro/jquery-ui.min.js"></script>
        <!--
		<script src="http://s.jesscool.com/jspro/common.js"></script>
        -->
		<script src="http://s.jesscool.com/jspro/profileManage.js"></script>
		    
		</div>
		
		
	</body>
</html>
