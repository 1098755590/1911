<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册页面</title>
<link rel="stylesheet" type="text/css" href="css/zhuce.css"/>
<style type="text/css">
p{
color:red;
}
.tishi{
position:absolute;
color:red;

}
#tishi_zh{
margin-top:10px;
}
#tishi_mima{
margin-top:12px;
}
#main{
	width:860px;
	height:550px;
/* 	border: 1px solid  red ;  */
	background-color: #FFFFFF;
	margin:0 auto;	
}
</style>
</head>
<body>
<jsp:include   page="top.jsp" flush="true"/>
<!-- <img alt="" src="img/雪花.gif">
<form action="register" method="get" onSubmit="return submit1()">
<input type="text" name="param" value="register">
用户名:<input type="text" name="username" onBlur="username_blur(this)"><br>
密码:<input type="password" name="userpass"><br>
确认密码:<input type="password" name="confirmpass"><br>
<input type="submit" value="点我提交"/> 
</form> -->
<div id="main">
			 <div><img src="img/mi.png" ></div>
			 <div id="main_zhuce">注册小米账号</div>
			 	<div id="">
			 		<ul class="main_ul">
			 			<li class="guojia">账 号</li>
			 			<form action="user_zeng" method="post" onSubmit="return submit1()">
			 			<input type="hidden" name="param" value="register">
						<li><input type="text"  name="username" id="zh" style="border-color: #E0E0E0; height: 38px; width: 335px;" onBlur="user_id()"/>
						<span id="tishi_zh" class="tishi" ></span></li>
						<li class="chenggong">成功注册帐号后，国家/地区将不能被修改</li>
						<li class="shoujicode">密 码</li>
						<li><input type="password" name="password" id="mima" style="border-color: #E0E0E0;height: 38px; width: 335px; margin-bottom:10px;" onBlur="user_pass()"/>
						<span id="tishi_mima" class="tishi" ></span></li>
						
						<input  type="text" name="captcha" id="captcha" placeholder="请输入验证码" style="width:335px;height:38px;text-align:center; ">
					    <div id="code_tishi" style="color:red;margin-left:0px;"></div>
						<img src="image" id="img_id" style="width:px;height:px;">
						
						<li><input type="submit" value="立即注册" id="sec_deng" style="color: white;background-color: #FF6700;height: 40px; width: 340px;" /></li>
						</form>
						<li class="yiyuedu" >已阅读并同意：小米 <a href="">用户协议</a>和 <a href="">隐私政策</a></li>
			 		</ul>
			 	</div>		
		</div>
		 <script src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

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



/* var reg=/\w{6,12}/;
function username_blur(d){
	var user_name=d.value;
	console.log(user_name);
	var reg_t=reg.test(user_name);
	console.log(reg_t);
} */
function submit1(){
	
	if(($("#tishi_zh").val()=='1')&&($("#tishi_mima").val()=='1')){
		return true;
	}else
		return false;
}
var userid;
var userpass;
function user_id(){
var reg=/^\w{8,10}$/;
userid=document.getElementById("zh");
console.log(userid.value);
var username=userid.value;
console.log(reg.test(userid.value));
if(reg.test(userid.value)){
 	$.post("getaauser",{"username":username},function(e){
		var data=e.data;
		console.log(data.length);
		if(data.length>0){
			document.getElementById("tishi_zh").innerText="账号已存在";
			console.log($("#tishi_zh").val());
		}else{
			document.getElementById("tishi_zh").innerText="";
			$("#tishi_zh").val("1");
			console.log($("#tishi_zh").val());
			return true;
		}
	}); 

}
else{
	document.getElementById("tishi_zh").innerText="账号格式不对";
	console.log($("#tishi_zh").innerText);
	return false;
}
}
function user_pass(){
	var reg=/^\w{8,10}$/;
	userpass=document.getElementById("mima");
	console.log(userpass.value);
	if(reg.test(userpass.value)){
		document.getElementById("tishi_mima").innerText="";
		$("#tishi_mima").val("1");
		console.log($("#tishi_mima").val());
		return true;
	}
	else{
		document.getElementById("tishi_mima").innerText="密码格式不对";
		return false;
	}
	}
	
</script>

</body>
</html>