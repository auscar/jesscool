<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" midia="all" href="http://s.jesscool.com/csspro/reset-grids.css">
		<link rel="stylesheet" type="text/css" midia="all" href="http://s.jesscool.com/csspro/index.css">
		<title>丈夫</title>
		<style type="text/css"></style>
	</head>
	<body class="for_debug">
		<div class="page">
			<%@ include file="include/manage_header.inc" %>
			<form id="article_form" method="post" action="doAddArticle">
				<p><label for="article_title">标题</label><input id="article_title" type="text" name="articleTitle"/></p>
				<p><label for="article_tag_id">类别</label>
					<select id="article_tag_id" name="articleTagId">
						<c:forEach var="tag" items="${tags}">
							<option value="${tag.id}">${tag.name}(${tag.id})</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<label for="article_cover">文章封面地址</label>
					<input id="article_cover" name="articleCover" type="text" value="" size="100" />
				</p>
				<input id="articleBody" name="articleBody" type="hidden"/>
				<iframe ID="seditor" name="seditor" src="../seditor/seditor.html" frameborder="0" scrolling="no" width="100%" HEIGHT="362px"></iframe>
				<p>
					<input id="seditor_submit" type="button" value="提交">
				</p>
			</form>
		</div>	
	<script type="text/javascript" src="http://s.jesscool.com/jspro/JC.page.addArticle.js"></script>
	
	
	<!--
	<p><label for="article_title">Tag id</label><input id="article_tag_id" type="text" name="articleTagId"/></p>
	-->
	</body>
</html>
