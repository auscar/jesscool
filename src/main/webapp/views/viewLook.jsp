<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="include/head.inc" %>
		<link href="http://s.jesscool.com/csspro/boxy.css" type="text/css" rel="stylesheet" />
		<link href="http://s.jesscool.com/csspro/layout.css" type="text/css" rel="stylesheet" />
		<link href="http://s.jesscool.com/csspro/boxy.css" type="text/css" rel="stylesheet" />
		
		
		<title>${article.title}-Jesscool!</title>
	</head>
	<body>
		<div id="box">

			<div id="header">
		    	<ul id="quickLink">
		        	<li><a href="/home.do">首页</a></li>
		            <li><a href="/profile.do">我的衣酷</a></li>
		            <li><a target="_blank" href="http://t.sina.com.cn/1879936431">我们的微博</a></li>
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
		                    <h2 class="articleTitle">${article.title}</h2>
		                    <div class="articleDetail">
		                    	<div class="detialText">
		                            ${article.content}
		                        </div>
		                        <dl class="articleDate">
		                            <dt>${article.areMonth}</dt>
		                            <dd>${article.areYear}</dd>
		                        </dl>
		                    </div>   
		                </div>
		            </div>
		        </div>
		        <div id="sidebar">
		        	<div id="search">
		            	<div class="search-input">
		            		<form target="_blank" id="searchForm" action="/views/quickSearch.jsp" method="get">
		            			<input name="words" id="regEmail" type="text" class="searchInput text-input" value="搜索服饰搭配，如：约会" />
		            		</form>
		                	
		                </div>
		                <div class="search-button">
		                	<input type="image" src="http://s.jesscool.com/imgpro/searchBtm.gif" class="searchBtm" />
		                </div>
		            </div>
		            <!-- <ul id="articleType"> 
		            	<li class="selected"><a href="#">阳光运动</a></li>
		                <li><a href="#">配饰精彩</a></li>
		                <li><a href="#">约会聚会</a></li>
		                <li><a href="#">商务职场</a></li>
		                <li><a href="#">形象学院</a></li>
		                <li><a href="#">本周专题</a></li>
		            </ul> -->
		            <div class="hotCase">
		            	<h2 class="hotCase-title">本周专题</h2>
		                <ul class="hotCase-lists clearFloat">
		                	<c:forEach var="kind" items="${weekTopics}">
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
		<script src="http://s.jesscool.com/jspro/jquery-1.4.2.min.js"></script>
		<script src="http://s.jesscool.com/jspro/common.js"></script>
		<script src="http://s.jesscool.com/jspro/jquery.boxy.js" type="text/javascript"></script>
		<script src="http://s.jesscool.com/jspro/imgCollect.js"></script>
		<script src="http://s.jesscool.com/jspro/form.js"></script>
		 <script src="http://s.jesscool.com/jspro/login.js"></script>
		<script> $(function(){ imgCollect(); }); </script>
		<div class="count"><%@ include file="include/footer.inc" %></div>
		</div>
	</body>
</html>

