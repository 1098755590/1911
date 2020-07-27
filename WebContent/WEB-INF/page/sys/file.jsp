<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>上传图片</title>
<link rel="stylesheet"  href="layui/css/layui.css">
<style type="text/css">
.imgDiv{
	margin: 0 auto;
	display:inline-block;
	position: relative;
}

.img_delete_icon{
	font-size: 20px; 
	position: absolute;
	color:white;
	right:0px; 
	margin-top: 0;

} 
.img_delete_icon:hover{
color:red;
cursor:pointer;
}



</style>
</head>
<body>


  <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  <legend>上传多张图片</legend>
</fieldset>
 
<div class="layui-upload">
  <button type="button" class="layui-btn" id="test2">多图片上传</button> 
  <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
    预览图：
    <div class="layui-upload-list" id="demo2"></div>
 </blockquote>
</div>
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="layui/layui.all.js"></script>
	<script type="text/javascript">
	//多图片上传
	var upload=layui.upload;
	  upload.render({
	    elem: '#test2'
	    ,url: 'fileUpload' //改成您自己的上传接口
	    ,multiple: true
	    ,before: function(obj){
	      //预读本地文件示例，不支持ie8
	      obj.preview(function(index, file, result){
/* 	        $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img" style="height:80px;">') */
	        $('#demo2').append('<div class="imgDiv"><div  class="img_delete_icon layui-icon-close-fill layui-icon"></div><img  src="'+ result +'" alt="'+ file.name +'"  style="height:80px;width:120px;"></div>')
	         $(".img_delete_icon").off();
	        $(".img_delete_icon").click(function(){
	        	$(this).parent().remove();
	        });
	   	
	      });
	    }
	    ,done: function(res){
	      //上传完毕
	    }
	  });
	  
  
	
	</script>
</body>
</html>