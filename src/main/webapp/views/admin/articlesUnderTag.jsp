<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" midia="all" href="http://s.jesscool.com/csspro/reset-grids.css">
		<link rel="stylesheet" type="text/css" midia="all" href="http://s.jesscool.com/csspro/index.css">
		<script type="text/javascript" src="http://s.jesscool.com/jspro/base.js"></script>
		<style>
			.page table{
				border : solid 1px #CCC;
				cellspacing : 0;
			}
			.page table td{
				border : solid 1px #CCC;
			}
		</style>
		<title>Jesscool</title>
	</head>
	<body class="for_debug">
		<div class="page">
			<%@ include file="include/manage_header.inc" %>
			<c:forEach var="kind" items="${article_map}" >
			<form action="http://www.jesscool.com/secure/addTagToArticle.do" method="post">
				<h3>在tag"${kind.key.name}"下添加文章</h3>
				<label>文章id</label><input name="article" type="text" /><input type="submit" value="添加" />
				<input name="tag" type="hidden" value="${kind.key.id}" />
			</form>
			<table>
				
					<c:forEach var="article" items="${kind.value}" >
						
						<tr>
							<td>${article.id}</td><td><a target="_blank" href="http://www.jesscool.com/secure/modifyArticle?articleId=${article.id}">${article.title}</a></td><td>${article.intime}</td><td><a href="http://www.jesscool.com/secure/removeFromTag.do?article=${article.id}&tag=${kind.key.id}" onclick="return confirm('确定要移出吗?')">从tag移除</a></td>
						</tr>
					
					</c:forEach>
				
			</table>
			
			</c:forEach>
		</div>	
	</body>
</html>
