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
		
		<script src="http://s.jesscool.com/jspro/jquery-1.4.min.js" type="text/javascript"></script> 
		<script src="http://s.jesscool.com/jspro/formValidator/js/jquery.validationEngine-cn.js" type="text/javascript"></script> 
		<script src="http://s.jesscool.com/jspro/formValidator/js/jquery.validationEngine.js" type="text/javascript"></script>
		
		<script type="text/javascript">
			(function($) {
				$(function(){
					$("#memberForgetForm").validationEngine();
				});
			})(jQuery);
		</script>
		
		<title>Jesscool-男士形象专家</title>
	</head>
	<body>
	
		<div class="memRegBox">
				<div class="memHeader">
			    	<div class="memLogo"><img src="http://s.jesscool.com/imgpro/logo.jpg" /></div>
			    	<p class="slogan"> </p>
			        <div class="memHome"><a href="http://www.jesscool.com">返回首页</a></div>	
			    </div>
			    
			    <div class="memMain">
			    	<div class="nameAndPwd">
			            
			            <c:if test="${ memSendFlag == null || memSendFlag == 'false' }">
							<form method="post" action="<%=Env.webRoot%>/memberForget.do" id="memberForgetForm">
								<div id="memberForget">	
									<h2 class="memberForget_h2">找回密码</h2>
									<p>请输入您的邮箱，</p>
									<ul>
										<li><label>E-mail:</label><input type="text" id="userName" name="userName" class="validate[required,custom[email]] text-input" /> <input type="submit" class="getPwdBtm" value="立即找回密码" /><span class="goHome"></span></li>
										<li>${ memberMsg } </li>
									</ul>	
								</div>
							</form>
						</c:if>
						
						<c:if test="${ memSendFlag == 'true' }" >
							<div id="getPwdSus">
								<p>亲爱的用户，密码已发送至邮箱，请打开查收！</p>
							</div>
						</c:if>
						
			        </div>
			        
			    </div>
			
			    <div class="memFooter userLoginFooter">
			    	&copy; Copyright 2008 - 2010 Jesscool
			    </div>
			</div>

	
	</body>
</html>
