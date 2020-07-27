<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品列表</title>
<style type="text/css">
html,body{
	background-color: #F5F5F5;
}
a{
	text-decoration: none;
	color: #000000;
}
li{
	list-style: none;	
}
.main{
	width: 1245px;
	height: 1840px;
    background-color: #F5F5F5;  
	margin: 0 auto;
}
.main>ul{
/* 	margin: 0px; */
	padding: 0px;
}
.list_1>a>img{
	width: 200px;
	margin-top: 60px;
	margin-bottom: 10px;
}
.list_1>a{
	display: block;
	text-align: center;
}
.list_phonename{
	text-align: center;
	width: 290px;
}
.list_price{
	display: block;
	width: 290px;
	text-align: center;
	color: #FF6700;
}
.main>ul>li{
	float: left;
	margin-right: 0.625rem;
	width: 290px;
	height: 403px;
	background-color: #FFFFFF;
	margin-bottom: 18px;
}

.list_1:hover{
    transform: translateY(-10px);
    transform: translateX(-20px);  
	border:0.5px solid #FF6700;
}
#ye2{
	position: absolute;
 	left: 332px;
	top:0rem;
/* 	border: brown 2px solid; */
    width: 1250px;
	height: 1900px;
	visibility: hidden;
}
.list_fanye>ul>li{
	float: left;
	margin-right: 5px;
}
.list_fanye>ul{
	width: 85px;
	margin: 0 auto;
	font-size: 25px;
}
.list_fanye>ul>li:hover{
	cursor: pointer;
	color: blue;
}
.aa2:hover{

}
#checktext{
margin-left:950px;
}
</style>
<link rel="stylesheet"  href="layui/css/layui.css">	
</head>
<body>
<jsp:include   page="top.jsp" flush="true"/>
	
<input type="text" id="checktext" autocomplete="off"
						class="layui-input" placeholder="请输入查询内容"  style="width:200px;display:inline-block;">
<button class="layui-btn"  onclick="img_cha()">查询</button>   


<div class="main">
			<ul id="ullist">
			<!-- 	<li class="list_1"><a href="" ><img src="../img/list/1.jpg"></a><a href="" class="list_phonename">Redmi K30 5G</a><span
					 class="list_price">1999元</span></li>
				<li class="list_1"><a href=""><img src="../img/list/2.jpg"></a><a href="" class="list_phonename">Redmi K30 4G</a><span
					 class="list_price">2999元</span></li>
				<li class="list_1"><a href=""><img src="../img/list/3.jpg"></a><a href="" class="list_phonename">Redmi K50 5G</a><span
					 class="list_price">3999元</span></li>
				<li class="list_1"><a href=""><img src="../img/list/4.jpg"></a><a href="" class="list_phonename">Redmi K50 4G</a><span
					 class="list_price">5999元</span></li>
				<li class="list_1"><a href=""><img src="../img/list/1.jpg"></a><a href="" class="list_phonename">Redmi K30 5G</a><span
					 class="list_price">1999元</span></li>
				<li class="list_1"><a href=""><img src="../img/list/2.jpg"></a><a href="" class="list_phonename">Redmi K30 4G</a><span
					 class="list_price">2999元</span></li>
				<li class="list_1"><a href=""><img src="../img/list/3.jpg"></a><a href="" class="list_phonename">Redmi K50 5G</a><span
					 class="list_price">3999元</span></li>
				<li class="list_1"><a href=""><img src="../img/list/4.jpg"></a><a href="" class="list_phonename">Redmi K50 4G</a><span
					 class="list_price">5999元</span></li>
				<li class="list_1"><a href=""><img src="../img/list/1.jpg"></a><a href="" class="list_phonename">Redmi K30 5G</a><span
					 class="list_price">1999元</span></li>
				<li class="list_1"><a href=""><img src="../img/list/2.jpg"></a><a href="" class="list_phonename">Redmi K30 4G</a><span
					 class="list_price">2999元</span></li>
				<li class="list_1"><a href=""><img src="../img/list/3.jpg"></a><a href="" class="list_phonename">Redmi K50 5G</a><span
					 class="list_price">3999元</span></li>
				<li class="list_1"><a href=""><img src="../img/list/4.jpg"></a><a href="" class="list_phonename">Redmi K50 4G</a><span
					 class="list_price">5999元</span></li>
				<li class="list_1"><a href=""><img src="../img/list/1.jpg"></a><a href="" class="list_phonename">Redmi K30 5G</a><span
					 class="list_price">1999元</span></li>
				<li class="list_1"><a href=""><img src="../img/list/2.jpg"></a><a href="" class="list_phonename">Redmi K30 4G</a><span
					 class="list_price">2999元</span></li>
				<li class="list_1"><a href=""><img src="../img/list/3.jpg"></a><a href="" class="list_phonename">Redmi K50 5G</a><span
					 class="list_price">3999元</span></li>
				<li class="list_1"><a href=""><img src="../img/list/4.jpg"></a><a href="" class="list_phonename">Redmi K50 4G</a><span
					 class="list_price">5999元</span></li> -->
			</ul>
		</div>
		
		<div id="">
			<div class="list_fanye">
				<ul id="yeshu">
				<!-- 	<li onmousedown="fanye(1)">1</li>
					<li onmousedown="fanye(2)">2</li> -->
				</ul>
			</div>
		</div>
		<script type="text/javascript" src="layui/layui.all.js"></script>
		<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
		<script type="text/javascript" >
		var table = layui.table;
	    $.post("getoneclassgoods",{"page":"1"},function(e){
	    	
	    	console.log(e.count);
	    	var n=Math.ceil(e.count/16);
	    	console.log(n);
	    	for(var i=1;i<=n;i++){
	    	 	    $("#yeshu").append('<li onmousedown="fanye('+i+')">'+i+'</li>'); 
	    	}
	    	fanye(1);
	    });
	    
		function fanye(n){
			$.ajaxSettings.async = false;
			$.post("getoneclassgoods",{"page":n},function(d){
		    	var data=d.data;
		    	$(".list_1").remove();
		    	for(var i=0;i<data.length;i++){
		    		$("#ullist").append('<li class="list_1"><a class="aa2" href="godetails"><img src="./file/'+data[i].goods_picture+'"><a href="" class="list_phonename">Redmi K50 4G</a><span class="list_price">5999元</span></a></li>');	
		    	}
		    	
		    });
		}
	    	
	    	
	    
		
	    
		</script>
</body>
</html>