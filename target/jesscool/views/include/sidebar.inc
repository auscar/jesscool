<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>  
<c:forEach var="kind" items="${sideBarMap}">
<div class="news_list_box con_spacer40">
	<h1 class="con_spacer">${kind.key.name}</h1>
	<ul>
		<c:forEach var="article" items="${kind.value}">
			<li><a href="viewLook.do?lookId=${article.id}&tagId=${kind.key.id}" target="_blank">${article.title}</a><img src="http://s.jesscool.com/imgpro/dec_new.jpg" /><span>${article.intime}</span></li>
		</c:forEach>
	</ul>
	<div class="more position_topRight bold font_en"><a href="moreLook.do?tagId=${kind.key.id}">+ more</a></div>
</div>
</c:forEach>