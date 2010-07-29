<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" midia="all" href="http://s.jesscool.com/csspro/reset-grids.css">
		<link rel="stylesheet" type="text/css" midia="all" href="http://s.jesscool.com/csspro/index.css">
		<style>
			.page table{
				border : solid 1px #CCC;
				cellspacing : 0;
			}
			.page table td{
				border : solid 1px #CCC;
			}
		</style>
		<script type="text/javascript" src="http://s.jesscool.com/jspro/base.js"></script>
		<title>Jesscool</title>
	</head>
	<body class="for_debug">
		<div class="page">
		<%@ include file="include/manage_header.inc" %>
			<form action="http://www.jesscool.com/secure/addTag.do">
				<label>添加标签</label><input name="tagName" type="text" /><input name="description" type="text" /><input name="isAtHome" type="text" /><input type="submit" value="添加" />
			</form>
			<br/>
			<table>
				<c:forEach var="tag" items="${tags}" >
				
				<tr>
					<td>${tag.id}</td><td>${tag.name}</td><td>${tag.description}</td><td><a href="http://www.jesscool.com/secure/delTag.do?id=${tag.id}" onclick="return confirm('确定要删除吗?');">删除</a><a href="http://www.jesscool.com/secure/modifyTag.do?id=${tag.id}">修改</a>&nbsp;<a href="http://www.jesscool.com/secure/getArticlesByTag.do?tag=${tag.id}">所有文章</a></td>
				</tr>
				
				</c:forEach>
			</table>
		</div>	
	</body>
</html>
