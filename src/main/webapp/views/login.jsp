<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.riseful.jesscool.base.Env"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="include/head.inc" %>
		<script src="http://s.jesscool.com/jspro/jquery-1.4.2.min.js"></script>
		<script src="http://s.jesscool.com/jspro/common.js" type="text/javascript"></script>
		<script src="http://s.jesscool.com/jspro/swfobject_source.js" type="text/javascript"></script>
		
		<title>Jesscool!</title>
	</head>
	<body>
		<div id="container">
			<p>
				
					<c:out value="${loginMsg}"/>
				
				
			</p>
			<form method="post" action="<%=Env.webRoot%>/login.do">
				<p><label>用户名称</label><input name="userName" type="text"/></p>
				<p><label>用户密码</label><input name="password" type="password"/></p>
				<p><input type="submit" value="登录"/></p>
				
				<input name="referer" type="hidden" value="<%=request.getParameter("from")%>">
				
			</form>
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
