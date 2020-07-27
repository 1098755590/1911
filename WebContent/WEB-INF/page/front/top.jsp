<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

html,body{
	margin:0px;
	padding:0px;
	width:100%;
	background-color: #F5F5F5;
}
li{
	list-style: none;
}
a{
	text-decoration: none;
	color: #000000;
}
.page_left{
	margin-left: 340px;
}
.page_right{
	float:right;
	margin-right: 340px;
}
.sep{
	margin:2px;
	color:white;
}
.page_top {
	height: 30px;
	background-color: #333333;
	/* 璁剧疆琛岄珮搴�,鏈瀛椾綋浼氬瀭鐩村眳涓� */
	line-height:30px;
	
}
.page_top>div{
 	display:inline-block; 
}

.page_top a{
	/* 鍘婚櫎鏂囨湰涓嬪垝绾� */
	text-decoration: none;
	/* 璁剧疆瀛椾綋澶у皬 */
	font-size: 12px;
}
/* 娌℃湁璁块棶鐨勯摼鎺� */
.page_top a:link{
	color: #b0b0b0;
	
}
/* 宸茬粡璁块棶杩囩殑杩炴帴 */
.page_top a:visited{
	color:#b0b0b0;
}
/* 榧犳爣鎮诞鍦ㄤ笂鐨勯摼鎺� */
.page_top a:hover{
	color:#fff;
}
/* 榧犳爣鐐瑰嚮鏃剁殑鏁堟灉 */
.page_top a:active{
	color: #fff;
}
</style>
</head>
<body>
<div class="page_top">
			<div class="page_left" style="margin-left:90px;">
			    <a id="top0" href="https://www.mi.com/" target="_blank">小米商城</a>
				<span class="sep"> | </span>
				<a id="top1" href="">MIUI</a> <span class="sep"> | </span>
				<a id="top2" href="">LoT</a><span class="sep"> | </span>
				<a id="top3" href="">云服务</a><span class="sep"> | </span>
				<a id="top4" href="">金融</a><span class="sep"> | </span>
				<a id="top5" href="">有品</a><span class="sep"> | </span>
				<a id="top6" href="">小爱开放平台</a><span class="sep"> | </span>
				<a id="top7" href="">企业团购</a><span class="sep"> | </span>
				<a id="top8" href="">资质证照</a><span class="sep"> | </span>
				<a id="top9" href="">协议规则</a><span class="sep"> | </span>
				<a id="top10" href="">下载app</a><span class="sep"> | </span>
				<a id="top11" href="">Select Location</a>
			</div>
			<div class="page_right" style="margin-right:90px;">
				<a id="username" href="login" target="_blank">登录</a>
				<span id="logout"></span>
				 <span class="sep"> | </span>
				<a href="register" target="_blank">注册</a> <span class="sep"> | </span>
				<a href="">消息通知</a> <span class="sep"> | </span>
				<a href="gotocart" target="_blank"><img src="./img/top_phone/shopping_basket_72px_1230836_easyicon.net.ico" style='height: 18px;'>购物车</a>
			</div>
		</div>
			<script src="js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
		 var name=<%=session.getAttribute("name")%>;	
		 if(name!='null'){
			 console.log(name);
			 $("#username").html(name);
			 $("#username").attr("href","userdetail");
			 $("#logout").append('<a id="tuichu" href="user_logout" target="_self">退出</a>');
		 } else{
			 console.log("我");
			 $("#username").html("登录");
			 $("#username").attr("href","login");
			 $("#tuichu").remove();
		 }
		</script>
		
</body>
</html>