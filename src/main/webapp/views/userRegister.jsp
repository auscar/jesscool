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
		        	<form method="post" id="userRegister" action="<%=Env.webRoot%>/userRegister.do" class="userRegister">
		                <div class="userLogin register">
		                    <h2 class="loginTitle">用户注册</h2>
		                    <p class="loginDec">请填写您的相关信息，</p>
		                    <ul class="loginForm">
		                        <li><label>账号：</label><input name="email" id="regEmail" value="请输入邮箱" class="validate[required,custom[email]] text-input loginEmail loginInput" type="text" /></li>
		                        <li><label>密码：</label><input id="regPassword" name="password" class="validate[required] text-input loginPwd loginInput" type="password" /></li>
		                        <li><label>确认密码：</label><input id="regPassword2" name="passwordCon" class="validate[required,equals[regPassword]] text-input loginPwd loginInput" type="password" /></li>
		                    </ul>
		                    <p class="loginDec">我们将根据您的体型，为你送上适合您的服饰搭配 </p>
		                    <ul class="loginForm">
		                        <li><label>身高：</label><input id="regHeight" name="height" class="validate[required,custom[integer]] text-input loginInput" type="text" /> cm</li>
		                        <li><label>体重：</label><input id="regWeight" name="weight" class="validate[required,custom[integer]] text-input loginInput" type="text" /> kg</li>
		                        <li>
		                            <input class="loginSubmit" type="image" src="http://s.jesscool.com/imgpro/loginSubmit.gif" />
		                            <input type="reset" class="registerReset" value="重置" />
		                        </li>
		                    </ul>
		                </div>
		            </form>
		    	</div>
		    </div>
		    
		    <div id="footer">
		    	&copy; Copyright 2008 - 2010 Jesscool
		    </div>
		    
		<script src="http://s.jesscool.com/jspro/jquery-1.4.2.min.js"></script>
		<script src="http://s.jesscool.com/jspro/formValidator/js/jquery.validationEngine-cn.js" type="text/javascript"></script> 
		<script src="http://s.jesscool.com/jspro/formValidator/js/jquery.validationEngine.js" type="text/javascript"></script>
		<script src="http://s.jesscool.com/jspro/form.js"></script>
		<script src="http://s.jesscool.com/jspro/login.js"></script>
		
		</div>	
		
		
		
	</body>
</html>

