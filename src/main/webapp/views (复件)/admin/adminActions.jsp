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
			<h3>系统管理</h3>
			<ul>
				<li><a href="http://www.jesscool.com/logout.do">退出后台</a></li>
			</ul>
			<br/>
			<h3>文章管理</h3>
			<ul>
				<li><a href="http://www.jesscool.com/secure/addArticle">发表文章</a></li>
				<li><a id="modifyBtn" href="http://www.jesscool.com/secure/modifyArticle">修改文章</a></li>
				<li><a id="delArticleBtn" href="http://www.jesscool.com/secure/delArticle.do">删除文章</a></li>
			</ul>
			<br/>
			<h3>Tag管理</h3>
			<ul>
				<li><a href="http://www.jesscool.com/secure/allTags.do">管理全部tag</a></li>
			</ul>
			
		</div>	
	<%--
	<script type="text/javascript" src="http://s.jesscool.com/jspro/JC.page.addArticle.js"></script>
	--%>
	<script type="text/javascript" src="http://s.jesscool.com/jspro/base.js"></script>
	<script type="text/javascript" src="http://s.jesscool.com/jspro/pages/jc.page.adminAction.js"></script>
	</body>
</html>
