<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.riseful.jesscool.base.Env"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="include/head.inc" %>
		<script src="http://s.jesscool.com/jspro/common.js" type="text/javascript"></script>
		<script src="http://s.jesscool.com/jspro/swfobject_source.js" type="text/javascript"></script>
		
		<link rel="stylesheet" href="http://s.jesscool.com/jspro/formValidator/css/validationEngine.jquery.css" type="text/css" media="screen" charset="utf-8" /> 
		<link href="http://s.jesscool.com/csspro/member.css" type="text/css" rel="stylesheet" />
		<script src="http://s.jesscool.com/jspro/jquery-1.4.min.js" type="text/javascript"></script> 
		<script src="http://s.jesscool.com/jspro/formValidator/js/jquery.validationEngine-cn.js" type="text/javascript"></script> 
		<script src="http://s.jesscool.com/jspro/formValidator/js/jquery.validationEngine.js" type="text/javascript"></script>
		<script src="http://s.jesscool.com/jspro/form.js" type="text/javascript"></script>
		<script type="text/javascript">
			(function($) {
				$(function(){
					$("#userRegister").validationEngine();
				});
			})(jQuery);
		</script>
		
		<title>Jesscool!</title>
	</head>
	<body>
	
		<div class="memRegBox">
			<div class="memHeader">
		    	<div class="memLogo"><img src="images/logo.jpg" /></div>
		        <div class="memHome"><a href="http://www.jesscool.com">返回首页</a></div>	
		    </div>
		    
		    <div class="memMain">
		    	<div class="nameAndPwd">
		        	<div class="nameAndPwd-title">
		            	<img src="images/nameAndPwd_title.gif" />
		            </div>
		            <ul class="nameAndPwd-ul">
		            	<li class="nameAndPwd-li"><label>请输入账号</label><input name="" class="memInput_l" type="text" /></li>
		                <li class="nameAndPwd-li"><label>再次输入</label><input name="" class="memInput_l" type="text" /></li>
		                <li class="nameAndPwd-li"><label>请输入密码</label><input name="" class="memInput_l" type="text" /></li>
		                <li class="nameAndPwd-li"><label>再次输入</label><input name="" class="memInput_l" type="text" /></li>
		            </ul>
		        </div>
		        <div class="bodyInfo">
		        	<div class="bodyInfo-title">
		            	<p>请填写您的体型信息</p>
		                我们将根据您的体型，为你送上适合您的服饰搭配
		            </div>
		            <ul class="bodyInfo-ul">
		            	<li class="bodyInfo-li"><label>请输入您的身高</label><input name="" class="memInput_s" type="text" /></li>
		                <li class="bodyInfo-li"><label>请输入您的体重</label><input name="" class="memInput_s" type="text" /></li>
		            </ul>
		        </div>
		        <div class="memRegBtm">
		        	<input name="" type="image" src="images/registerBtm.gif" />
		        </div>
		    </div>
		
		    <div class="memFooter">
		    	&copy; Copyright 2008 - 2010 Jesscool
		    </div>
		</div>
	
		<div id="container">
			<p> 
				<c:out value="${loginMsg}"/>
			</p>
			<form method="post" id="userRegister" action="<%=Env.webRoot%>/userRegister.do" class="userRegister">
			
				
			
				<p><label>用户名称</label><input name="email" id="regEmail" value="请输入邮箱" class="validate[required,custom[email]] text-input blur" type="text"/><c:out value="${ resTips }"></c:out></p>
				<p><label>身&nbsp;&nbsp;&nbsp;高</label><input id="regHeight" name="height" class="validate[required,custom[integer]] text-input" type="text"/></p>
				<p><label>体&nbsp;&nbsp;&nbsp;重</label><input id="regWeight" name="weight" class="validate[required,custom[integer]] text-input" type="text"/></p>
				<p><label>密&nbsp;&nbsp;&nbsp;码</label><input id="regPassword" name="password" class="validate[required] text-input" type="password"/></p>
				<p><label>密码确认</label><input name="passwordCon" id="regPassword2" class="validate[required,equals[regPassword]] text-input" type="password"/></p>
				<p><label>性&nbsp;&nbsp;&nbsp;别</label><input name="gender" type="radio" class="vam" checked="checked" value="0"/>男&nbsp;&nbsp;<input name="gender" type="radio" class="vam" value="1" />女</p>
				<p class="userRegisterBtm"><input type="submit" value="立即注册"/><span class="goHome"><a href="http://www.jesscool.com/">返回首页</a></span></p>
				
				<input name="referer" type="hidden" value="<%=request.getParameter("from")%>" />
				
			</form>
		</div>
	</body>
</html>

