<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link href="http://s.jesscool.com/csspro/reset.css" type="text/css" rel="stylesheet" />
		<link href="http://s.jesscool.com/csspro/imgShow.css" type="text/css" rel="stylesheet" />
		
		<script type="text/javascript" src="http://s.jesscool.com/jspro/jquery-1.4.min.js"></script>
		<script type="text/javascript" src="http://s.jesscool.com/jspro/common.js"></script>
		<script type="text/javascript" src="http://s.jesscool.com/jspro/imgShow.js"></script>
		
		<title>Jesscool-我的图酷</title>
	</head>
	<body>
		<div class="imgContainer">

			<div class="imgHeader">
		    	<div class="imgLogo"></div>
		        <div class="imgNav2">
		        	欢迎来到您的个人衣酷，${ userCookieName }&nbsp;&nbsp;
		        	<a href="imgManagement.do">衣酷管理</a>&nbsp;&nbsp;|&nbsp;
		        	<a href="userLogout.do">退出</a>&nbsp;|&nbsp;
		            <a href="http://www.jesscool.com">首页</a>
		        </div>
		    </div>
		    
		    <div class="imgContent clearFloat">
		    	<div class="imgSidebar">
		        	<div class="imgPre"><img src="http://s.jesscool.com/imgpro/imgPre.gif" /></div>
		            <div class="imgNav1">
		            	<ul class="imgNav1_ul">
		            		<c:forEach var="imgTags" items="${ imgTags }">
		            			<li class="imgNav1_li"><a href="#" tagId="${ imgTags.imgTagId }"><span>${ imgTags.imgTagName }</span></a></li>
		            		</c:forEach>
		                </ul>
		            </div>
		            <div class="imgNext"><img src="http://s.jesscool.com/imgpro/imgNext.gif" /></div>
		        </div>
		        <div class="imgBox">
		        	<h2 class="imgBox_h2" imgTagId="0">约会聚会</h2>
			    	<div class="imgBox_div">    
			        	<c:forEach var="imgTagImgs" items="${ imgTagImgs }">
			        		<img src="http://s.jesscool.com/upload/${ imgTagImgs.imgUrl }" imgId="${ imgTagImgs.id }" />
			        	</c:forEach>
		        	</div>
		        </div>
		    </div>
		    
		    <div class="imgFooter">
				&copy; Copyright 2008 - 2010 Jesscool
		    </div>
		    
		    <div class="imgLogo"><img src="http://s.jesscool.com/imgpro/imgLogo.gif" /></div>
		
		</div>
	</body>
</html>
