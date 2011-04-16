<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>    
	<head>      
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<%@ include file="include/head.inc" %>
		<title></title>
		<link href="http://s.jesscool.com/csspro/layout.css" type="text/css" rel="stylesheet" />
		<link href="http://s.jesscool.com/csspro/boxy.css" type="text/css" rel="stylesheet" />
		<script src="http://s.jesscool.com/jspro/jquery-1.4.2.min.js"></script>
	</head>    
<body>

<div id="box">
	
	<div id="header">
    	<ul id="quickLink">
        	<li><a href="/home.do"></a></li>
            <li><a href="/profile.do">æçè¡£é·</a></li>
            <li><a href="#">æä»¬çå¾®è</a></li>
        </ul>
        <ul id="login">
        	${ loginStatus }
        </ul>
        <div id="logo"><a href="/home.do"><img src="http://s.jesscool.com/imgpro/logo.gif" /></a></div>
    </div>
      
	<h1></h1>      
		<div id="cse" style="width: 100%;">Loading</div>  
		<script src="//www.google.com/jsapi" type="text/javascript"></script>  
		<script type="text/javascript">   
			google.load('search', '1', {language : 'zh-CN', style : google.loader.themes.MINIMALIST});      
			google.setOnLoadCallback(function(){  
				var customSearchControl = new google.search.CustomSearchControl('016344004145333435208:cjcldpe6wpk'); 
				console.log(customSearchControl);   
				customSearchControl.setResultSetSize(google.search.Search.FILTERED_CSE_RESULTSET);    
				customSearchControl.disableAds();
				customSearchControl.draw('cse');   
	
				
				var s = location.search;
	
				var regx = /words=(.+)/;
				var ret = regx.exec(s);
	
				if(!ret||!ret[1])return;
	
				
				$('input')[0].focus();
				$('input')[0].value = decodeURIComponent(ret[1]);
				customSearchControl.submit();
				
				
			}, true);  
		</script>
		
		<div id="footer">
	    	&copy; Copyright 2008 - 2010 Jesscool
	    </div>
		  
</div>
  
</body>  
</html>
