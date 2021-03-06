<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="include/head.inc" %>
		<script src="http://s.jesscool.com/jspro/common.js" type="text/javascript"></script>
		<script src="http://s.jesscool.com/jspro/swfobject_source.js" type="text/javascript"></script>
		
		<title>Jesscool-男士形象专家</title>
	</head>
	<body>
		<div id="container">
		
			<div id="header"></div>
		
			<div id="main" class="clearFloat">
				
				<div id="content" class="view_look">
					<div class="news_more">
					
					<c:forEach var="set" items="${articleSets}">
						<h1>${set.key}</h1>
						<c:forEach var="article" items="${set.value}">
							
							
							<div class="more_list_box clearFloat">
								<img src="${article.cover}" alt="" />
								<div class="more_list_text">
									<h2><a href="viewLook.do?lookId=${article.id}&tagId=${article.tag.id}" target="_blank">${article.title}</a><span class="time">${article.intime}</span></h2>
									<p><a href="viewLook.do?lookId=${article.id}&tagId=${article.tag.id}" target="_blank">${article.content}</a></p>
								</div>		
							</div>
							
						</c:forEach>
					</c:forEach>
							
					</div>
				</div>
				
				
				<div id="sidebar">
					<%@ include file="include/sidebar.inc" %>
				</div>
				
			</div>
			
			<%@ include file="include/header.inc"%>
			
			<%@ include file="include/footer.inc" %>
					
			<div id="extra1"></div>
			<div id="extra2"></div>
		</div>
	</body>
</html>

