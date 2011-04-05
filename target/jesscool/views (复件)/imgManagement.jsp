<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link href="http://s.jesscool.com/csspro/reset.css" type="text/css" rel="stylesheet" />
		<link href="http://s.jesscool.com/csspro/imgShow.css" type="text/css" rel="stylesheet" />
		<link href="http://s.jesscool.com/csspro/jquery-ui.css" type="text/css" rel="stylesheet" />

		<script type="text/javascript" src="http://s.jesscool.com/jspro/jquery-1.4.min.js"></script>
		<script type="text/javascript" src="http://s.jesscool.com/jspro/jquery-ui.min.js"></script>
		<script type="text/javascript" src="http://s.jesscool.com/jspro/common.js"></script>
		<script type="text/javascript" src="http://s.jesscool.com/jspro/imgManagement.js"></script>
		
		<title>Jesscool-图酷管理</title>

	</head>
	<body>
		<div class="imgContainer">
			
			<div class="imgHeader">
		    	<div class="imgLogo"></div>
		        <div class="imgNav2">
		        	欢迎您回来，${ userCookieName }&nbsp;&nbsp;
		        	<a href="imgShow.do">图库首页</a>&nbsp;&nbsp;|&nbsp;
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
		        	<div class="imgBox-introduction">
		        		<h2>温馨提示：</h2>
		        		<p>如果您想<b> 删除图片 </b>，请点击大图右侧的"X"。</p>
		        		<p>如果您想<b> 编辑图片类别 </b>，请将鼠标移至左侧菜单上。</p>
		        		<p>如果您想<b> 改变图片所属类别 </b>，请将图片拖拽到左侧相应分类上。</p>
		        	</div>
		        	<div class="h2Box">
		        		<h2 class="imgBox_h2 imgBox_h2_m" imgTagId="0">约会聚会</h2>
			    	</div>
			    	<div class="imgBox_div">    
			        	<c:forEach var="imgTagImgs" items="${ imgTagImgs }">
			        		<div class="imgWrap">
			        			<img src="http://s.jesscool.com/upload/${ imgTagImgs.imgUrl }" imgId="${ imgTagImgs.id }" />
			        		</div>
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
