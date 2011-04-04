<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" media="all" href="http://s.jesscool.com/csspro/reset-grids.css"/>
		<link rel="stylesheet" type="text/css" media="all" href="http://s.jesscool.com/csspro/index.css"/>
		<script type="text/javascript" src="http://s.jesscool.com/seditor/swfupload.js"></script>
		<script type="text/javascript" src="http://s.jesscool.com/jspro/yui-min.js"></script>
		<title>jesscool-添加文章</title>
		<style type="text/css"></style>
	</head>
	<body class="for_debug">
		<div class="page">
			<%@ include file="include/manage_header.inc" %>
			<form id="article_form" method="post" action="doAddArticle">
				<p>
					<label for="article_title">文章标题</label>
					<input id="article_title" type="text" name="articleTitle" />
					<span id="upload_btn">upload</span>
				</p>
				
				<p>
					<label for="article_tag_id">类别</label>
					<select id="article_tag_id" name="articleTagId">
						<c:forEach var="tag" items="${tags}">
							<option value="${tag.id}">${tag.name}(${tag.id})</option>
						</c:forEach>
					</select>
				</p>
				
				<p>
					<label for="article_intime">编辑时间</label>
					<input id="article_intime" type="text" name="articleIntime" value="${intime}"/>
				</p>
				
				<p>
					<label for="post_url">文章封面地址</label>
					<input id="post_url" name="postUrl" type="text" value="" size="93" />
					<span id="post_url_btn" >上传封面图片</span>
				</p>
				
				<iframe ID="seditor" name="seditor" src="../seditor/seditor.html" frameborder="0" scrolling="no" width="100%" HEIGHT="362px"></iframe>
				<p>
					<input id="seditor_submit" type="button" value="提交"/>
				</p>
				
				
				<input id="articleBody" name="articleBody" type="hidden"/>
			</form>
		</div>	
		
	<script type="text/javascript" src="http://s.jesscool.com/jspro/pages/jc.page.addArticle.js"></script>
	<script type="text/javascript">
	try{
		var swfup = new SWFUpload({
	        upload_url : "http://www.jesscool.com/upload.do",
	        flash_url : "http://www.jesscool.com/seditor/swfupload.swf",
	        file_size_limit : "4 MB",
	        button_placeholder_id : "upload_btn",
	        button_image_url : "http://s.xnimg.cn/imgpro/editor/image.gif", 
	        button_width : 100, 
	        button_height : 22, 
	        button_text : '<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;insert Image</b>' ,
	        file_queued_handler : function(){
	                this.startUpload();
	        },
	        upload_error_handler : function(file,code,message){
	                alert(message);
	        },
	        upload_success_handler : function( file, r ){
		        try{
	                var obj = eval('('+ r +')');
	                window.frames[0].format('InsertImage',obj.fileNames[0])
		        }catch(e){
					alert('上传失败! 服务器返回的内容为着'+r +'\n 客户端的错误信息为:\n'+e);
			    }
			    
	                
	        }
		});
	}catch(e){
		alert(e);
	}
		
		var postUp = new SWFUpload({
	        upload_url : "http://www.jesscool.com/upload.do",
	        flash_url : "http://www.jesscool.com/seditor/swfupload.swf",
	        file_size_limit : "4 MB",
	        button_placeholder_id : "post_url_btn",
	        button_image_url : "http://s.xnimg.cn/imgpro/editor/image.gif", 
	        button_width : 100, 
	        button_height : 22, 
	        button_text : '<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Post Image</b>' ,
	        file_queued_handler : function(){
	                this.startUpload();
	        },
	        upload_error_handler : function(file,code,message){
	                alert('图片上传出错, 错误代码是'+message+' 重试一下可能就没问题了～');
	        },
	        upload_success_handler : function( file, r ){
		        try{
	                var obj = eval('('+ r +')');
	                //alert('上传成功!');
	                $('post_url').value = obj.fileNames[0];
	                //window.frames[0].format('InsertImage',obj.fileNames[0])
		        }catch(e){
					alert('上传失败! 服务器返回的内容为着'+r +'\n 客户端的错误信息为:\n'+e);
			    }   
	        }
		});
	</script>	
	
	</body>
</html>
