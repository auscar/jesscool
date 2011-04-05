<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.riseful.jesscool.base.Env"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link rel="stylesheet" href="http://s.jesscool.com/jspro/formValidator/css/validationEngine.jquery.css" type="text/css" media="screen" charset="utf-8" /> 
		<link href="http://s.jesscool.com/csspro/reset.css" type="text/css" rel="stylesheet" />
		<link href="http://s.jesscool.com/csspro/member.css" type="text/css" rel="stylesheet" />
		
		<script src="http://s.jesscool.com/jspro/common.js" type="text/javascript"></script>
		<script src="http://s.jesscool.com/jspro/swfobject_source.js" type="text/javascript"></script>
		
		<script src="http://s.jesscool.com/jspro/jquery-1.4.2.min.js" type="text/javascript"></script> 
		<script src="http://s.jesscool.com/jspro/formValidator/js/jquery.validationEngine-cn.js" type="text/javascript"></script> 
		<script src="http://s.jesscool.com/jspro/formValidator/js/jquery.validationEngine.js" type="text/javascript"></script>
		<script src="http://s.jesscool.com/jspro/form.js" type="text/javascript"></script>
		
		<script type="text/javascript">
			(function($) {
				$(function(){
					
					$("#userLoginForm").validationEngine();
					
				});
			})(jQuery);
		</script>
		
		<title>Jesscool! - 用户登录</title>
	</head>
	<body>
	
		<form method="post" action="<%=Env.webRoot%>/userLogin.do" class="userLoginForm" id="userLoginForm">
			<div class="memRegBox">
				<div class="memHeader">
			    	<div class="memLogo"><img src="http://s.jesscool.com/imgpro/logo.jpg" /></div>
			    	<p class="slogan"> </p>
			        <div class="memHome"><a href="http://www.jesscool.com">返回首页</a></div>	
			    </div>
			    
			    <div class="memMain">
			    	<div class="nameAndPwd">
			        	<div class="nameAndPwd-title">
			            	<img src="http://s.jesscool.com/imgpro/userLoginTitle.gif" />
			            </div>
			            <ul class="nameAndPwd-ul">
			            	<li class="nameAndPwd-li"><label>请输入账号</label><input name="userName" id="regEmail" value="请输入邮箱" class="validate[required,custom[email]] text-input blur memInput_l" type="text"/><c:out value="${loginMsg}" /></li>
			                <li class="nameAndPwd-li"><label>请输入密码</label><input id="userPwd" name="userPwd" class="validate[required] text-input memInput_l" type="password"/></li>
			            </ul>
			        </div>
			        <div class="memRegBtm">
			        	<input name="" type="image" src="http://s.jesscool.com/imgpro/loginBtm.gif" class="loginBtm" />&nbsp;&nbsp;<span class="getPwd"><a href="http://www.jesscool.com/views/memberForget.jsp">找回密码</a></span>
			        </div>
			    </div>
			
			    <div class="memFooter userLoginFooter">
			    	&copy; Copyright 2008 - 2010 Jesscool
			    </div>
			</div>
		</form>
	
	</body>
</html>



