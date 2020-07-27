<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品详情</title>
<link rel="stylesheet" type="text/css" href="css/details.css"/>
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
<style type="text/css">
.img_c{
width:390px;
height:400px;
margin-top:100px;
margin-left:80px;
}
#phone_detail1{
color:#FF6700;
}
.liji{
	display: inline-block; 
	width: 140px;
	height: 40px;
	background-color: #FFD9BC;
	text-align: center;
	line-height: 40px;
	color: #FF6700;
	margin-right:15px;
	
}
.jiaru{
	display: inline-block; 
	width: 180px;
	height: 40px;
	background-color: #F22D00;
	text-align: center;
	line-height: 40px;
	color: white;
}
#name{
font-size:25px; 
height:35px;
}
#price0{
margin-top:10px;
color:#FF6700;

}
#price1{
margin-top:10px;
margin-bottom:10px;
color:#FF6700;
font-size:23px;
font-weight:100; 
}
#form1{
margin-top:110px;
}
#count{
margin-top:20px;
margin-bottom:30px;
}
#sum{
width:50px;
height:20.5px;
text-align:center;

}
#down{
height:25px;
width:25px;
margin-right:-5px;
margin-left:29px;
}
#add{
height:25px;
width:25px;
margin-left:-5px;
}
</style>
</head>
<body>
<jsp:include   page="top.jsp" flush="true"/>
<div class="main">

			<div class="layui-carousel" id="test1">
  <div carousel-item>
    <a href=""><img class="img_c" id="img1" src="img/details&gouwu/zhutu.jpg" ></a>
     <a href=""><img class="img_c" id="img2" src="img/details&gouwu/zhutu.jpg" ></a>
      <a href=""><img class="img_c" id="img3" src="img/details&gouwu/zhutu.jpg" ></a>
    
  </div>
</div>
			<form id="form1" action="gotobalance" method="post">
			<input id="goods_id1" name="goods_id" type="hidden" value="123">
			<input id="addtocart" name="wherebtn" type="hidden" value="123">
			<div class="details_2">
				 <div class="de_name" id="name"></div>
				 <div ><span id="phone_detail1"></span ><span id="phone_detail2"></span></div>
				 <div class="de_list">
				 	<div id="price0">小米自营</div>
				 	<div id="price1">
				 		<span id="price">¥18800.00</span>
				 	</div>
				 	收货地址:<div id="address"><select id="address0" name="address"></select></div>
					 <div id="count">数量
 <button id='down' type="button">-</button>
 <input name="countinput" id='sum' value='1'>
 <button id='add' type="button">+</button>
 </div>
					  <div class="de_mai">
					  	  <button class="liji">立即购买</button>
					  	  <button onclick="change()" class="jiaru" >加入购物车</button>
					  </div>
					
				 </div>
			</div>
			</form>
			
		</div>
		<script src="js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="layui/layui.all.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
		
		function change(){
			$("#addtocart").val("购物车");
		}
		
		$.post("get_the_good",function(e){
			console.log(e);
			var data=e.data;
			$("#goods_id1").val(data[0].goods_id);
		 	$("#name").html(data[0].goodsname);
			$("#price").html(data[0].goods_price+"元");
			$("#phone_detail1").html(data[0].goods_introduction1);
			$("#phone_detail2").html(data[0].goods_introduction2);
			for(var i=1;i<4;i++){
				 $("#img"+i).attr("src","./file/"+data[i].img_name); 
			}
			
		});
		$.post("getAddress",function(e){
			var data=e.data;
			for(var j=0;j<data.length;j++){
				/* $("#address").html("寄送至:"+data[4].addressname); */
				$("#address0").append('<option>'+data[j].addressname+'</option>')
			}
			console.log(data);
		});
		
		
		layui.use('carousel', function(){
			  var carousel = layui.carousel;
			  //建造实例
			  carousel.render({
			    elem: '#test1'
			    ,width: '550px'  //设置容器宽度
			    ,arrow: 'always' //始终显示箭头
			    //,anim: 'updown' //切换动画方式
			    ,height: '580px'
			//      ,indicator:'none' 
			
			  });
			});
		
		     //商品数量的增加
		         $(document).ready(function(){
			   
			  $("#add").click(function(){
			     var sum = $("#sum").val();
			     var result = Number(sum)+1;
			     $("#sum").val(result);
			  });
			 $("#down").click(function(){
			     var sum = $("#sum").val();
			     var result = Number(sum)-1;
			     if(result>1){
			    	  $("#sum").val(result);
			     }else{
			    	 $("#sum").val("1");
			     }
			    
			  });
			});
		
		</script>
</body>
</html>