<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="include/head.inc" %>
		<script src="http://s.jesscool.com/jspro/common.js" type="text/javascript"></script>
		<script src="http://s.jesscool.com/jspro/swfobject_source.js" type="text/javascript"></script>
		
		<title>${article.title}-Jesscool!</title>
	</head>
	<body>
		<div id="container">
		
			<div id="header"></div>
		
			<div id="main" class="clearFloat">
				
				<div id="content" class="view_look">
					<div class="news_more">
						<h1><a target="_blank" href="http://www.jesscool.com/moreLook.do?tagId=${article.tag.id}">${article.tag.name}</a> &gt;&gt; ${article.title}</h1>
						
						<div id="ckepop">
							<span style="float:left;">分享到：</span>
							<a title="" class="jiathis_button_renren"> </a>
							<a class="jiathis_button_kaixin001"> </a>
							<a class="jiathis_button_qq"> </a>
							<a class="jiathis_button_tsina"> </a>
							<span class="separator">|</span>
							<a href="http://www.jiathis.com/share.html" class="jiathis button jtico jtico_more">更多</a>
						</div>
						<!-- JiaThis Button BEGIN -->
						<script type="text/javascript" src="http://www.jiathis.com/code/jia.js" charset=utf-8></script>
						<!-- JiaThis Button END -->
						
						<div class="article_body">
							${article.content}
						</div>
					</div>
				</div>
				
				
				<div id="sidebar">
					<%@ include file="include/sidebar.inc" %>
				</div>
				
			</div>
		
			<%@ include file="include/footer.inc" %>
			<%--
			<div id="footer">
				<dl id="links">
					<dt>友情链接：</dt>
					<dd><a href="#" target="_blank">百度</a></dd>
					<dd><a href="#" target="_blank">Google</a></dd>
					<dd><a href="#" target="_blank">优酷</a></dd>
					<dd><a href="#" target="_blank">懒人图库</a></dd>
				</dl>
				<div id="copyright">&copy; Copyright 2008 - 2010 Jesscool , Inc. All Rights Reserved</div>
			</div>
			 --%>
			
			
			<%@ include file="include/header.inc"%>
			
			<div id="extra1"></div>
			<div id="extra2"></div>
		</div>
	</body>
</html>



<%--
		<dl>
		<c:forEach var="kind" items="${sideBarMap}">
			<dt><h3>${kind.key}</h3></dt>
			<c:forEach var="article" items="${kind.value}">
				<dd><h4>${article.title}(id:${article.id})</h4><dd>
				<dd>${article.content}<dd>
				<dd>(${article.intime})<dd>
			</c:forEach>
		</c:forEach>
		</dl>

--%>
