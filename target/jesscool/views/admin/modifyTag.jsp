<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" midia="all" href="http://s.jesscool.com/csspro/reset-grids.css">
		<link rel="stylesheet" type="text/css" midia="all" href="http://s.jesscool.com/csspro/index.css">
		<script type="text/javascript" src="http://s.jesscool.com/jspro/base.js"></script>

		<title>Jesscool</title>
	</head>
	<body class="for_debug">
		<div class="page">
			<%@ include file="include/manage_header.inc" %>
			<form action="http://www.jesscool.com/secure/doModifyTag.do">
				<label>更新tag标签</label><input name="tagName" type="text" value="${tag.name}" /><input name="description" type="text" value="${tag.description}" /><input name="isAtHome" type="text" value="${tag.isAtHome}" /><input type="submit" value="确认修改" />
				<input name="id" type="hidden" value="${tag.id}" />
			</form>
		</div>	
	</body>
</html>
