<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="include/head.inc" %>
		<link href="http://s.jesscool.com/csspro/layout.css" type="text/css" rel="stylesheet" />
		<title>Jesscool - 男士形象顾问</title>
	</head>
	<body>
		<div id="box">

			<div id="header">
		    	<ul id="quickLink">
		        	<li><a href="/home.do">首页</a></li>
		            <li><a href="/profile.do">我的衣酷</a></li>
		            <li><a href="#">我们的微薄</a></li>
		        </ul>
		        <ul id="login">
		        	<li><a href="/views/userRegister.jsp">注册</a></li>
		            <li><a href="/views/userLogin.jsp">登录</a></li>
		        </ul>
		        <div id="logo"><a href="/home.do"><img src="http://s.jesscool.com/imgpro/logo.gif" /></a></div>
		    </div>
		    
		    <div id="wrapper">
		    	<div id="main">
		        	<div class="articleBox">
		                <div class="article">
		                    <h2 class="articleTitle">
		                    	<a href="/views/articleDetail.jsp">爱意大胆穿出来 教你情侣如何着装</a>
		                    </h2>
		                    <div class="articleDec">
		                    	<a href="/views/articleDetail.jsp">不再含蓄，不再私密。感情的表达早已不同昔日，有情话就要大胆说出来，有爱意就要大胆穿出来。穿情侣装就是表达爱意最为时尚的方式！……</a>
		                    </div>
		                    <div class="articleImg">
		                        <a href="/views/articleDetail.jsp"><img src="http://s.jesscool.com/imgpro/articleImg1.jpg" /></a>
		                        <dl class="articleDate">
		                            <dt>04/02</dt>
		                            <dd>2011</dd>
		                        </dl>
		                    </div>   
		                </div>
		                <div class="article">
		                    <h2 class="articleTitle">
		                    	<a href="/views/articleDetail.jsp">爱意大胆穿出来 教你情侣如何着装</a>
		                    </h2>
		                    <div class="articleDec">
		                    	<a href="/views/articleDetail.jsp">不再含蓄，不再私密。感情的表达早已不同昔日，有情话就要大胆说出来，有爱意就要大胆穿出来。穿情侣装就是表达爱意最为时尚的方式！……</a>
		                    </div>
		                    <div class="articleImg noBorder">
		                        <a href="/views/articleDetail.jsp"><img src="http://s.jesscool.com/imgpro/articleImg2.jpg" /></a>
		                        <dl class="articleDate">
		                            <dt>04/02</dt>
		                            <dd>2011</dd>
		                        </dl>
		                    </div>   
		                </div>
		            </div>
		        </div>
		        <div id="sidebar">
		        	<div id="search">
		            	<div class="search-input">
		                	<input type="text" class="searchInput" />
		                </div>
		                <div class="search-button">
		                	<input type="image" src="http://s.jesscool.com/imgpro/searchBtm.gif" class="searchBtm" />
		                </div>
		            </div>
		            <ul id="articleType">
		            	<li class="selected"><a href="#">阳光运动</a></li>
		                <li><a href="#">配饰精彩</a></li>
		                <li><a href="#">约会聚会</a></li>
		                <li><a href="#">商务职场</a></li>
		                <li><a href="#">形象学院</a></li>
		                <li><a href="#">本周专题</a></li>
		            </ul>
		            <div class="hotCase">
		            	<h2 class="hotCase-title">热门方案</h2>
		                <ul class="hotCase-lists clearFloat">
		                	<c:forEach var="kind" items="${hots}">
								<c:forEach var="article" items="${kind.value}">
									<li class="hotCase-lists-li">
				                    	<a target="_blank" href="viewLook.do?lookId=${article.id}&tagId=${kind.key.id}"><img class="hotCase-img" src="${article.cover}" /></a>
				                        <div class="hotCase-div">
				                        	<p class="title"><a target="_blank" href="viewLook.do?lookId=${article.id}&tagId=${kind.key.id}">${article.title}</a></p>
				                            <p class="date">2011-04-02</p>
				                        </div>
				                    </li>
								</c:forEach>
							</c:forEach>
		                </ul>
		            </div>
		        </div>
		    </div>
		    
		    <div id="footer">
		    	&copy; Copyright 2008 - 2010 Jesscool
		    </div>
		    
		<div class="count"><%@ include file="include/footer.inc" %></div>
		</div>
		
	</body>
</html>
