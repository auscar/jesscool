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
				
				<div id="content">
					
					<div id="hot_style" class="con_spacer">
						
						<div>
							<c:forEach var="kind" items="${hots}">
							<h1 style="text-indent:-9999px;">${kind.key.name}</h1>
								<c:forEach var="article" items="${kind.value}">
									<dl>
										<dt><a target="_blank" href="viewLook.do?lookId=${article.id}&tagId=${kind.key.id}"><img width="100" height="100" src="${article.cover}" /></a></dt>
										<dd><a target="_blank" href="viewLook.do?lookId=${article.id}&tagId=${kind.key.id}">${article.title}</a></dd>
									</dl>
								</c:forEach>
							</c:forEach>
						</div>
					</div>
					
					<dl id="dec_style" class="con_spacer">
						<c:forEach var="kind" items="${peishi}">
								<dt><a target="_blank" href="http://www.jesscool.com/moreLook.do?tagId=${kind.key.id}"><input name="" type="image" src="http://s.jesscool.com/imgpro/more_dec.jpg" /></a></dt>
								<c:forEach var="article" items="${kind.value}" varStatus="status">
								
									<dd><a title="${article.title}" target="_blank" href="http://www.jesscool.com/viewLook.do?lookId=${article.id}&tagId=${kind.key.id}"><img src="${article.cover}" width="80" height="80" /></a></dd>
									
								</c:forEach>
						</c:forEach>
						
					</dl>
					
					<div class="han_style con_spacer">
						<h1 class="han" style="text-indent:-9999px;">${kind.key.name}</h1>
						<c:forEach var="kind" items="${kerioa}">
					
						<p class="con_spacer15">${kind.key.description}</p>
						<ul class="clearFloat con_spacer15">
								
								<c:forEach var="article" items="${kind.value}">
								
									<li><a target="_blank" href="viewLook.do?lookId=${article.id}&tagId=${kind.key.id}">${article.title}</a></li>
									
								</c:forEach>
						
						</ul>
						</c:forEach>
						

						
						<div class="clearFloat han_example_box">
							<c:forEach var="kind" items="${kerioa_special}">
									<c:forEach var="article" items="${kind.value}">
									
										<dl>
											<dt><a target="_blank" href="viewLook.do?lookId=${article.id}&tagId=${kind.key.id}"><img src="${article.cover}" /></a></dt>
											<dd><a target="_blank" href="viewLook.do?lookId=${article.id}&tagId=${kind.key.id}">${article.title}</a></dd>
										</dl>
										
									</c:forEach>
									
									<div class="more clear"><a target="_blank" href="moreLook.do?tagId=${kind.key.id}">>> 更多</a></div>
									
							</c:forEach>
						</div>
						
					</div>
					
					<div class="han_style con_spacer">
						
						
						<c:forEach var="kind" items="${europe}">
						<h1 class="oumei">${kind.key.name }</h1>
						<p class="con_spacer15">${kind.key.description}</p>
						<ul class="clearFloat con_spacer15">
								
								<c:forEach var="article" items="${kind.value}">
								
									<li><a target="_blank" href="viewLook.do?lookId=${article.id}&tagId=${kind.key.id}">${article.title}</a></li>
									
								</c:forEach>
						
						</ul>
						</c:forEach>
						

						
						<div class="clearFloat han_example_box">
							<c:forEach var="kind" items="${europe_special}">
									<c:forEach var="article" items="${kind.value}">
									
										<dl>
											<dt><a target="_blank" href="viewLook.do?lookId=${article.id}&tagId=${kind.key.id}"><img src="${article.cover}" /></a></dt>
											<dd><a target="_blank" href="viewLook.do?lookId=${article.id}&tagId=${kind.key.id}">${article.title}</a></dd>
										</dl>
										
									</c:forEach>
									
									<div class="more clear"><a target="_blank" href="moreLook.do?tagId=${kind.key.id}">>> 更多</a></div>
									
							</c:forEach>
						</div>
						
					</div>
				</div>
				
				
				<div id="sidebar">
					
					<%@ include file="include/sidebar.inc" %>
				</div>
				
			</div>
			
		<%@ include file="include/header.inc"%>	
		
			<div id="banner">
			<script type=text/javascript>
			   var s1 = new SWFObject("http://s.jesscool.com/swf/focusFlash_fp.swf", "mymovie1", "623", "216", "5", "#ffffff");
				var _urls = "http://www.jesscool.com/viewLook.do?lookId=1%26tagId=2|http://www.jesscool.com/viewLook.do?lookId=351%26tagId=3|http://www.jesscool.com/viewLook.do?lookId=316%26tagId=2|http://www.jesscool.com/viewLook.do?lookId=301%26tagId=5";
				var _href = "http://www.jesscool.com/viewLook.do?lookId=1&amp;tagId=2|http://www.jesscool.com/viewLook.do?lookId=351&amp;tagId=3|http://www.jesscool.com/viewLook.do?lookId=316&amp;tagId=2|http://www.jesscool.com/viewLook.do?lookId=355&amp;tagId=5";
				s1.addParam("wmode", "transparent");
			   s1.addParam("AllowscriptAccess", "sameDomain");
			   s1.addVariable("bigSrc", "http://s.jesscool.com/imgpro/01.jpg?ver=2|http://s.jesscool.com/imgpro/02.jpg?ver=2|http://s.jesscool.com/imgpro/03.jpg?ver=2|http://s.jesscool.com/imgpro/04.jpg?ver=2");
			   s1.addVariable("smallSrc", "|images/06.jpg|||");
			   s1.addVariable("href", _urls);
			   s1.addVariable("urls", _urls);
			   s1.addVariable("txt", "Jessful|Jessful|Jessful|Jessful");
			   s1.addVariable("width", "623");
			   s1.addVariable("height", "216");
			   s1.write("banner");
			 </script>
			</div>
			
			
			
			<div id="extra1"></div>
			<div id="extra2"></div>
		</div>
	<%@ include file="include/footer.inc" %>
	</body>
</html>
