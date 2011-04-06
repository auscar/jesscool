<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.riseful.jesscool.base.Env"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="include/head.inc" %>
		<link href="http://s.jesscool.com/csspro/login.css" type="text/css" rel="stylesheet" />
		<title>Jesscool!</title>
	</head>
	<body>

		<div id="box">

			<div id="header">
		    	<ul id="quickLink">
		        	<li><a href="/home.do">首页</a></li>
		            <li><a href="/profile.do">衣酷管理</a></li>
		            <li><a href="#">我们的微薄</a></li>
		        </ul>
		        <ul id="login">
		        	<li><a href="/views/userRegister.jsp">注册</a></li>
		            <li><a href="/views/userLogin.jsp">登录</a></li>
		        </ul>
		        <div id="logo"><a href="/home.do"><img src="http://s.jesscool.com/imgpro/logo.gif" /></a></div>
			</div>
		    
		    <div id="wrapper">
		    	<div id="main" class="clearFloat">
		        	<form name="register" method="post" action="<%=Env.webRoot%>/userInfo.do">
		                <div class="userLogin userInfo">
		                    <h2 class="loginTitle">信息管理</h2>
		                    <p class="loginDec">您可以修改以下信息，</p>
		                    <ul class="userInfo-form loginForm">
		                        <li><label>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</label><input name="userPwd" class="text-input loginPwd loginInput" type="password" /></li>
		                        <li><label>密码确认：</label><input class="text-input loginPwd loginInput" type="password" /></li>
		                        <li><label>身&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;高：</label><input name="userHeight" class="text-input loginPwd loginInput" type="text" /></li>
		                        <li><label>体&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;重：</label><input name="userWeight" class="text-input loginPwd loginInput" type="text" /></li>
		                        <li>
		                            <input class="userInfoSubmit" type="image" src="http://s.jesscool.com/imgpro/submit.gif" />
		                            <input type="reset" class="registerReset" value="重置" />
		                        </li>
		                        <li><c:out value="${ modifyStatus }"></c:out></li>
		                    </ul>
		                </div>
		            </form>
		    	</div>
		    </div>
		    
		    <div id="footer">
		    	&copy; Copyright 2008 - 2010 Jesscool
		    </div>
		    
		    <script src="http://s.jesscool.com/jspro/jquery-1.4.2.min.js"></script>
			<script src="http://s.jesscool.com/jspro/form.js"></script>
			<div class="count"><%@ include file="include/footer.inc" %></div>
		</div>	
		
		
		
	</body>
</html>

