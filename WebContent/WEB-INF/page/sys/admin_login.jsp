<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="<%=basePath%>">
<title>管理员登录</title>
<link rel="stylesheet" type="text/css" href="css/login.css" />
</head>
<body>
		<div id="first_0">
			<div class="first_sum">
				<a href=""><span><img src="./img/shouji/mi.png"></span><span class="first_zi" id="cheng">小米商城</span><span id="qu"
					 class="first_zi ">
						让每个人都能享受科技的乐趣
					</span></a>
			</div>
		</div>
		<div id="">
			<div class="sec_main" style="position:absolute;right:5px;">
				<div class="sec_2">
					<ul>
						<li class="sec_4"><a href=""><span id="sec_4_zh">管理员登录</span></a></li>
						<li class="sec_4_0"><span id="sec_4_01">|</span></li>
						<li class="sec_4"><a href=""><span id="sec_4_sao">扫码登录</span></a></li>
					</ul>
				</div>
				<div class="login">
					<form action="adminlogin" method="post">
						<input type="text" name="zh" id="zh" placeholder="请输入账号" style="border-color: #E0E0E0;"/>
						<input type="password" name="mima" id="mima" placeholder="请输入密码" style="border-color: #E0E0E0;"/>									
						<input  type="text" name="captcha" id="captcha" placeholder="请输入验证码" style="width:350px;height:50px; ">
					    <div id="code_tishi" style="color:red;margin-left:160px;"></div>
						<img src="image" id="img_id" style="margin-left:135px">
						<input type="submit" value="登录" id="sec_deng" style="color: white;background-color: #FF6700" />				
					</form>
				</div>
		
				<!-- 	手机短信登录 -->
	<!-- 			<div class="sec_1">
					<ul>
						<span id="sec_duanxin">
							<a href="" class="sec_11"><span id="">手机短信登录/注册</span></a>
						</span>
						<span id="sec_liji">
							<a href="" class="sec_12">立即注册</a>
							<span id="" class="sec_12">|</span>
							<a href="" class="sec_12">忘记密码?</a>
						</span>
					</ul>
				</div> -->
			
				<!-- 	其他方式登录 -->				
				<!-- <div class="sec_3">其他方式登录</div> -->
			</div>
			<div id="sec_zhutu">
				<a href="" class="sec_da"><img src="./img/shouji/dahengtu.jpg"></a>
			</div>
		</div>
		
    <script src="js/jquery-3.4.1.min.js"></script>
   <script type="text/javascript" >
   $("#img_id").click(function(){
	   var r=Math.random();
	   $("#img_id").attr("src","image?i="+r);
	   
   });
   
   $("#captcha").change(function(){
	   
	$.ajaxSettings.async = false; 
	$.post("checkCode",function(d){
	    console.log(d);
		if(d==$("#captcha").val()){
		$("#code_tishi").text("");  
		  console.log("正确");
		}else{
		  	$("#code_tishi").text("验证码错误");  
			console.log("错误");
		}
	});
	   
}); 
 
   
   </script>
	</body>
</html>