<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.riseful.jesscool.base.Env"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="include/head.inc" %>
		<link href="http://s.jesscool.com/csspro/login.css" type="text/css" rel="stylesheet" />
		<link rel="stylesheet" href="http://s.jesscool.com/jspro/formValidator/css/validationEngine.jquery.css" type="text/css" media="screen" charset="utf-8" /> 
		<title>Jesscool!</title>
	</head>
	<body>

		<div id="box">

			<div id="header">
		    	<ul id="quickLink">
		        	<li><a href="/home.do">首页</a></li>
		            <li><a href="/profile.do">我的衣酷</a></li>
		            <li><a href="#">我们的微薄</a></li>
		        </ul>
		        <ul id="login">
		        	<li><a href="/views/userRegister.jsp">注册</a></li>
		            <li><a href="/views/userLogin.jsp">登录</a></li>
		        </ul>
		        <div id="logo"><a href="/home.do"><img src="http://s.jesscool.com/imgpro/logo.gif" /></a></div>
			</div>
		    
		    <div id="wrapper">
		    	${ loginMsg }
		    	<div id="main" class="clearFloat">
		    	
		    		<form method="post" action="<%=Env.webRoot%>/userLogin.do" class="userLoginForm" id="userLoginForm">
			        	<div class="userLogin">
			            	<h2 class="loginTitle">用户登录</h2>
			                <p class="loginDec">请填写您的相关信息，</p>
			                <ul class="loginForm">
			                	<li><label>帐号：</label><input name="userName" id="regEmail" value="请输入邮箱" class="loginEmail loginInput validate[required,custom[email]] text-input" type="text" /></li>
			                    <li><label>密码：</label><input id="userPwd" name="userPwd" class="validate[required] text-input loginPwd loginInput" type="password" /></li>
			                    <li><input class="loginSubmit" type="image" src="http://s.jesscool.com/imgpro/loginSubmit.gif" /></li>
			                </ul>
			            </div>
			        </form>
		            
		            <form method="post" action="<%=Env.webRoot%>/memberForget.do" id="memberForgetForm">
			            <div class="memberForget">
			            	<h2 class="loginTitle">找回密码</h2>
			                <p class="loginDec">请填写您邮箱，</p>
			                <ul class="loginForm">
			                	<li><label>邮箱：</label><input id="userName" name="userName" class="validate[required,custom[email]] text-input memInput loginInput" type="text" /></li>
			                    <li><input class="memSubmit loginSubmit" type="image" src="http://s.jesscool.com/imgpro/getPwd.gif" /></li>
			                </ul>
			            </div>
			        </form>
		        
		        </div>
		    </div>
		    
		    <div id="footer">
		    	&copy; Copyright 2008 - 2010 Jesscool
		    </div>
		
		</div>
		<script src="http://s.jesscool.com/jspro/jquery-1.4.2.min.js"></script>
		<script src="http://s.jesscool.com/jspro/formValidator/js/jquery.validationEngine-cn.js" type="text/javascript"></script> 
		<script src="http://s.jesscool.com/jspro/formValidator/js/jquery.validationEngine.js" type="text/javascript"></script>
		<script src="http://s.jesscool.com/jspro/common.js"></script>
		<script src="http://s.jesscool.com/jspro/form.js"></script>
		<script src="http://s.jesscool.com/jspro/login.js"></script>	
		
	</body>
	
</html>

