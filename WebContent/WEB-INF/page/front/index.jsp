<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首 页</title>
	<link rel="stylesheet" type="text/css" href="css/index.css" />
		<!-- 	<base target="_blank" /> -->
		<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
<style type="text/css">
.fif_name{
position:relative;
top:3px;
}
.jiaobiao{
margin-top:-10px;
color:white;
}
.img1{
width:40px;
height:50px;
}
.img11{
display:inline-block;
}
.img_li{
display:inline-block;
margin-top:20px;
margin-left:50px;
}
.tz00{
font-color:white;
color:white;
}
.tuzi{
line-height:5px;
}
</style>
<base target="_blank"/>			
</head>
<body>
		<jsp:include   page="top.jsp" flush="true"/>
		<div class="page_left2">

			<div id="fenge" style="margin-left:90px;margin-top:25px;">
				<img src="img/top_phone/8SN@K3Y2Y33$P3W%60VK%7DU$$I.png">
			</div>
			<div class="page_left2_wenzi" onmouseleave="hid_nav()">
				<ul class="page_next">
					<li onmouseover="show_nav()"><a href="http://127.0.0.1:8848/MyPage/js/list.html" target="_blank"><span>商品列表</span></a></li>
					<li onmouseover="show_nav()"><a href="#"><span>Redmi红米</span></a></li>
					<li onmouseover="show_nav()"><a href="#"><span>电视</span></a></li>
					<li onmouseover="show_nav()"><a href="#"><span>笔记本</span></a></li>
					<li onmouseover="show_nav()"><a href="#"><span>家电</span></a></li>
					<li onmouseover="show_nav()"><a href="#"><span>路由器</span></a></li>
					<li onmouseover="show_nav()"><a href="#"><span>智能硬件</span></a></li>
					<li onmouseover="show_nav()"><a href="#"><span>服务</span></a></li>
					<li onmouseover="show_nav()"><a href="#"><span>社区</span></a></li>
				</ul>
			</div>
		</div>
		<div class="third" id="third_id" onmouseover="show_nav()" onmouseleave="hid_nav()">
			<ul>
				<li id="teshu1"><span><img src="img/top_phone/1.png"></span><span>小米C99 Pro </span><span class="third_price">2799元起
					</span></li>
				<li id="teshu2"><span><img src="img/top_phone/2.png"></span><span>小米9 Pro 5G </span><span class="third_price">3699元起
					</span></li>
				<li><span><img src="img/top_phone/3.png"></span><span>小米CC9 </span><span class="third_price">1699元起 </span></li>
				<li><span><img src="img/top_phone/4.png"></span><span>小米CC9e </span><span class="third_price">1099元起 </span></li>
				<li><span><img src="img/top_phone/5.png"></span><span>小米CC9 美图定制版 </span><span class="third_price">1999元
					</span></li>
				<li><span><img src="img/top_phone/6.png"></span><span>小米MIX3 </span><span class="third_price">2599元 </span></li>
			</ul>
		</div>
		
		<div class="lb_max" id="max_id" style="margin-top:-25px;">
			<div class="sum">
				<div class="sum_2">
					<ul>
						<div class="beijing">
						
						    <a class="tz00" href="list?goods_classifyid=000"><li class="tuzi" lid="001" id="000" onmouseover="show_fif()" onmouseleave="hid_fif()"><span class="jiaobiao">></span></li></a>
							 <a class="tz00" href="list?goods_classifyid=001"><li class="tuzi" lid="001" id="001" onmouseover="show_fif()" onmouseout="hid_fif()"><span class="jiaobiao">></span></li></a>
						 <a class="tz00" href="list?goods_classifyid=002"><li class="tuzi" lid="001" id="002" onmouseover="show_fif()" onmouseout="hid_fif()"><span class="jiaobiao">></span></li></a>
						 <a class="tz00" href="list?goods_classifyid=003">	<li class="tuzi" lid="001" id="003" onmouseover="show_fif()" onmouseout="hid_fif()"><span class="jiaobiao">></span></li></a>
						 <a class="tz00" href="list?goods_classifyid=004">	<li class="tuzi" lid="001" id="004" onmouseover="show_fif()" onmouseout="hid_fif()"><span class="jiaobiao">></span></li></a>
						 <a class="tz00" href="list?goods_classifyid=005">	<li class="tuzi" lid="001" id="005" onmouseover="show_fif()" onmouseout="hid_fif()"><span class="jiaobiao">></span></li></a>
						 <a class="tz00" href="list?goods_classifyid=006">	<li class="tuzi" lid="001" id="006" onmouseover="show_fif()" onmouseout="hid_fif()"><span class="jiaobiao">></span></li></a>
						 <a class="tz00" href="list?goods_classifyid=007">	<li class="tuzi" lid="001" id="007" onmouseover="show_fif()" onmouseout="hid_fif()"><span class="jiaobiao">></span></li></a>
						 <a class="tz00" href="list?goods_classifyid=008">	<li class="tuzi" lid="001" id="008" onmouseover="show_fif()" onmouseout="hid_fif()"><span class="jiaobiao">></span></li></a>
						 <a class="tz00" href="list?goods_classifyid=009">	<li class="tuzi" lid="001" id="009" onmouseover="show_fif()" onmouseout="hid_fif()"><span class="jiaobiao">></span></li></a>
							
						</div>
					</ul>
				</div>
				<div class="fif_gh" id="fif_gh_id" onmouseover="show_fif()"onmouseout="hid_fif()">
									<ul>
									<li class=img_li ><a id="aa0" class=img01 href="phonedetails?goods_id=009"><img id="im0" class=img1 src="" alt=""><b id="b0" class=img11> </b> </a></li>
									<li class=img_li ><a id="aa1" class=img01 href="phonedetails"><img id="im1" class=img1 src=""alt=""><b id="b1" class=img11> </b> </a></li>
									<li class=img_li ><a id="aa2" class=img01 href="phonedetails"><img id="im2" class=img1 src=""alt=""><b id="b2" class=img11></b> </a></li>
									<li class=img_li ><a id="aa3" class=img01 href="phonedetails"><img id="im3" class=img1 src=""alt=""><b id="b3" class=img11> </b> </a></li>
									<li class=img_li ><a id="aa4" class=img01 href="phonedetails"><img id="im4" class=img1 src=""alt=""><b id="b4" class=img11> </b> </a></li>
									<li class=img_li ><a id="aa5" class=img01 href="phonedetails"><img id="im5" class=img1 src=""alt=""><b id="b5" class=img11> </b> </a></li>
									<li class=img_li ><a id="aa6" class=img01 href="phonedetails"><img id="im6" class=img1 src=""alt=""><b id="b6" class=img11> </b> </a></li>
									<li class=img_li ><a id="aa7" class=img01 href="phonedetails"><img id="im7" class=img1 src=""alt=""><b id="b7" class=img11> </b> </a></li>
									<li class=img_li ><a id="aa8" class=img01 href="phonedetails"><img id="im8" class=img1 src=""alt=""><b id="b8" class=img11> </b> </a></li>
									<li class=img_li ><a id="aa9" class=img01 href="phonedetails"><img id="im9" class=img1 src=""alt=""><b id="b9" class=img11> </b> </a></li>
									<li class=img_li ><a id="aa10" class=img01 href="phonedetails"><img id="im10" class=img1 src=""alt=""><b id="b10" class=img11> </b> </a></li>
									<li class=img_li ><a id="aa11" class=img01 href="phonedetails"><img id="im11" class=img1 src=""alt=""><b id="b11" class=img11> </b> </a></li>
									<li class=img_li ><a id="aa12" class=img01 href="phonedetails"><img id="im12" class=img1 src=""alt=""><b id="b12" class=img11> </b> </a></li>
									<li class=img_li ><a id="aa13" class=img01 href="phonedetails"><img id="im13" class=img1 src=""alt=""><b id="b13" class=img11> </b> </a></li>
									<li class=img_li ><a id="aa14" class=img01 href="phonedetails"><img id="im14" class=img1 src=""alt=""><b id="b14" class=img11> </b> </a></li>
									<li class=img_li ><a id="aa15" class=img01 href="phonedetails"><img id="im15" class=img1 src=""alt=""><b id="b15" class=img11> </b> </a></li>
									<li class=img_li ><a id="aa16" class=img01 href="phonedetails"><img id="im16" class=img1 src=""alt=""><b id="b16" class=img11> </b> </a></li>
					</ul>
				</div>
			</div>
			<div class="hebing" id="max2_id">
				<img class="lb_tupian" src="img/lunbo/16b8570b29cbefaaef2d5ec28cf7d02f.webp">
				<img class="lb_tupian" src="img/lunbo/6bd4174b8c5aad67a64864a5716ad152.webp">
				<img class="lb_tupian" src="img/lunbo/a38b1d56409913d5dc869023ade36d94.webp">
				<img class="lb_tupian" src="img/lunbo/b7ae0d2c909b86572e5632954725194e.jpg">
				<img class="lb_tupian" src="img/lunbo/cc4124894726fe36dde892fd1032629b.webp">
			</div>
		</div>
		<!--    第六部分 -------小米秒杀等------------- -->
		<div class="six_1">
			<div class="six_11">
				<ul class="six_ul">
					<li class="six_li "> <a href="#"><span class="six_tu"><img src="img/sixth/6_3.png"></span><span class="six_wenzi">小米秒杀</span></a></li>
					<li class="six_li "> <a href="#"><span class="six_tu"><img src="img/sixth/6_4.png"></span><span class="six_wenzi">企业团购</span></a></li>
					<li class="six_li"> <a href="#"><span class="six_tu"><img src="img/sixth/6_5.png"></span><span class="six_wenzi">F码通道</span></a></li>
					<li class="six_li clear "> <a href="#"><span class="six_tu"><img src="img/sixth/6_4.png"></span><span class="six_wenzi">米粉卡</span></a></li>
					<li class="six_li "> <a href="#"><span class="six_tu"><img src="img/sixth/6_5.png"></span><span class="six_wenzi">以旧换新</span></a></li>
					<li class="six_li"> <a href="#"><span class="six_tu"><img src="img/sixth/6_6.png"></span><span class="six_wenzi">话费充值</span></a></li>
				</ul>
			</div>

			<div class="six_2">
				<img src="img/sixth/6_71.jpg">
				<img src="img/sixth/6_72.jpg">
				<img src="img/sixth/6_73.jpg">
			</div>
		</div>
		<!--      ------第七部分 -->

		<div class="sev_main">
			<div class="sev_0" >
				<span style="position:relative;left:-250px;">小米闪购</span>
			</div>
			<div class="sev_1">
				<ul class="sev_ul">
					<div>
						<li class="sev_i1"><img src="img/shangou/2_0.png" /></li>
					</div>
					<div class="layui-carousel" id="test1">
						<div carousel-item>
							<div class="sev_lun">
							<img src="img/shangou/2_1.jpg" >
							<img src="img/shangou/2_2.jpg" >
							<img src="img/shangou/2_3.jpg" >
							<img src="img/shangou/2_4.jpg" >
							</div>
							<div class="sev_lun">
							<img src="img/shangou/2_2.jpg" >
							<img src="img/shangou/2_3.jpg" >
							<img src="img/shangou/2_4.jpg" >
							<img src="img/shangou/2_5.jpg" >
							</div>
							<div class="sev_lun">
							<img src="img/shangou/2_3.jpg" >
							<img src="img/shangou/2_4.jpg" >
							<img src="img/shangou/2_5.jpg" >
							<img src="img/shangou/2_6.jpg" >
							</div>
													
						</div>
					</div>
				</ul>
			</div>
		</div>
		<img src="img/shouji/hengtu.webp" class="heng" style="margin-left:90px;">
		<!-- 	第八部分 -->
		<div id="" class="shouji clear" style="margin-left:90px;">
			手机
		</div>
		<div id="" class="f_0">
			<div id="" class="f_1">
				<img src="img/shouji/0.webp">
			</div>
			<div id="" class="f_2">
				<ul>
					<div>
						<li class="f_21"><a href="godetails"><span><img id="eighth_img0"src="img/shouji/1.webp"></span><span id="name0"></span><span id="detail0"></span><span
								 id="price0" class="fif_price"></span></a></li>
						<li class="f_21"><a href="godetails"><span><img id="eighth_img1"src="img/shouji/2.webp"></span><span id="name1"></span><span id="detail1"></span><span
								 id="price1" class="fif_price"></span></a></li>
						<li class="f_21"><a href="godetails"><span><img id="eighth_img2"src="img/shouji/3.webp"></span><span id="name2"></span><span id="detail2"></span><span
								 id="price2" class="fif_price"></span></a></li>
						<li class="f_21"><a href="godetails"><span><img id="eighth_img3"src="img/shouji/4.webp"></span><span id="name3"></span><span id="detail3"></span><span
								 id="price3" class="fif_price"></span></a></li>
					</div>
					<div>
						<li class="f_22"><a href="godetails"><span><img id="eighth_img4"src="img/shouji/5.webp"></span><span id="name4"></span><span id="detail4"></span><span
								 id="price4" class="fif_price"></span></a></li>
						<li class="f_22"><a href="godetails"><span><img id="eighth_img5"src="img/shouji/6.webp"></span><span id="name5"></span><span id="detail5"></span><span
								 id="price5" class="fif_price"></span></a></li>
						<li class="f_22"><a href="godetails"><span><img id="eighth_img6"src="img/shouji/7.webp"></span><span id="name6"></span><span id="detail6"></span><span
								 id="price6" class="fif_price"></span></a></li>
						<li class="f_22"><a href="godetails"><span><img id="eighth_img7"src="img/shouji/8.webp"></span><span id="name7"></span><span id="detail7"></span><span
								 id="price7" class="fif_price"></span></a></li>
					</div>
				</ul>
			</div>
		</div>
		<script src="js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="layui/layui.all.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
		
		
		//第八部分 商品图片 
	/* 	$.post("get_eighth_img",function(e){
			 console.log(e); 
			var data=e.data;
			console.log(data);
			console.log(data[0].img_name);
			for(var i=0;i<8;i++){
				 $("#eighth_img"+i).attr("src","./file/"+data[i].img_name); 
			}
			
		}); */
		
		// 鼠标移动到小米手机上显示third
		
		function show_nav(){
			 // console.log("鼠标悬浮");
			
				 var  th1=document.getElementById("third_id");
				 th1.style.display="block";
		}
		
		function hid_nav(){
			 var  th1=document.getElementById("third_id");
			 th1.style.display="none";
			
		}
		 var i=0;
		setInterval(function(){
			 var lb_div=document.getElementById("max2_id");
			 var max_id=document.getElementById("max_id");
			 
			 var max_width=max_id.offsetWidth;  //获得宽
			 var max_left=max_id.offsetLeft;   //获得左边距
			 // console.log(max_width+"---"+max_left);
			 // console.log(lb_div.style.left);
			 
			  lb_div.style.left=lb_div.offsetLeft-(1240+max_left)+"px";
			  i++;
			  if(i==5){
		      i=0;
			  lb_div.style.left=0+"px";
			  } 
		/* 	 i=1;
			 lb_div.style.left=-(i * 1240)+"px";
			 i++; */
		}
		,2000);
		// 第五部分,滚动条上的文字
		function hid_fif(){
		 	var hid_div=document.getElementById("fif_gh_id");
			hid_div.style.display="none"; 
		}

		 function show_fif(){
	        
		 	var el = window.document.body;  //声明一个变量，默认值为body
			window.document.body.onmouseover = function(event){ 
			 el =event.target;//鼠标每经过一个元素，就把该元素赋值给变量el
			var goods_classifyid=el.id;	
			
			   console.log('当前鼠标在', goods_classifyid, '元素上');//在控制台中打印该变量	    	
		    
		    	 $.post("getsomeGoods",{
					  "goods_classifyid":goods_classifyid
				  },function(f){
					 var data=f.data;
					 console.log(data.length);	 
				        for(var i=0;i<data.length;i++){
				         $("#im"+i).attr("src","./file/"+data[i].goods_picture);
						 $("#b"+i).html(data[i].goodsname);
						 $("#aa"+i).attr("href","phonedetails?goods_id="+data[i].goods_id);
					 } 				    
				  }); 
		   	   
				 	}
					
			     var div1=document.getElementById("fif_gh_id");
				 div1.style.display="block";  
	
		} 
		
		
			 var carousel = layui.carousel;
			  //建造实例
			  carousel.render({
			    elem: '#test1'
			    ,width: '990px',//设置容器宽度
				 height:"340px"
			    ,arrow: 'always' //始终显示箭头
			  });
			  
 		 	 
 		 	   
 		 	   
			  
			   $.post("getClass",function(e){
				 var json2=eval(e);
				 for(var i=0;i<10;i++){
					 if(json2.data[i].status=='上架'){
						 $("#00"+i).html(json2.data[i].class_name);
					 }
					 if(json2.data[i].status=='下架'){
						 $("#00"+i).html();
					 }
				 }				  
			  }); 
			  
			  $.post("getGoods",function(d){
				  var json=eval(d);
				  for(var i=0;i<8;i++){
						 $("#name"+i).html(json.data[i].goodsname);
						 $("#price"+i).html(json.data[i].goods_price+"元起");
						 $("#detail"+i).html(json.data[i].goods_detail);
					 }	
			  }); 

		</script>
	</body>
</html>