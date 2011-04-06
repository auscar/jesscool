<html>    
	<head>      
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>搜索男士形象方案</title>
		<script src="http://s.jesscool.com/jspro/jquery-1.4.2.min.js"></script>
	</head>    
<body>      
	<h1>想在Jesscool搜点啥?</h1>      
<body>  
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

			//获得搜索词
			var s = location.search;

			var regx = /words=(.+)/;
			var ret = regx.exec(s);

			if(!ret||!ret[1])return;

			//用这个词搜索
			$('input')[0].focus();
			$('input')[0].value = decodeURIComponent(ret[1]);//某些浏览器(如FF)会将url上的参数encode, 所以这里decode一下
			customSearchControl.submit();
			
			
		}, true);  
	</script>    
</body>  
</html>
