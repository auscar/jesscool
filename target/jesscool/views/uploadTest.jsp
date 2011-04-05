<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.riseful.jesscool.base.Env"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="include/head.inc" %>
		<script src="http://s.jesscool.com/jspro/common.js" type="text/javascript"></script>
		<script src="http://s.jesscool.com/jspro/swfobject_source.js" type="text/javascript"></script>
		
		<title>Jesscool!</title>
	</head>
	<body>
		<div id="container">
			<form action="/upload.do" method="post" enctype="multipart/form-data">
				<input type="file" name="file"></input>
				<input type="submit" name="submit"></input>
			</form>
		</div>
	</body>
</html>
