<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品详情</title>
<link rel="stylesheet" type="text/css" href="css/details.css"/>
</head>
<body>
<jsp:include   page="top.jsp" flush="true"/>
<div class="main">
			<div class="details_1">
				<a href=""><img src="../img/details&gouwu/zhutu.jpg" ></a>
			</div>
			
			<div class="details_2">
				 <div class="de_name">土耳其进口皮毛一体男外套中长款羊羔毛机车服绵羊皮<br>新款连帽皮衣</div>
				 <div class="de_list">
				 	<div class="de_price">
				 		价格<span id="">¥18800.00</span>
				 	</div>
					<form action="local" method="get" class="de_size">尺码
				 		<input type="radio" name="size" id="" value="" />165/M
				 		<input type="radio" name="size" id="" value="" />170/L
				 		<input type="radio" name="size" id="" value="" />175/XL
				 		<input type="radio" name="size" id="" value="" />180/XXL
				 	</form>
					<form action="local" method="get" class="de_color">颜色
						<input type="radio" name="color" id="" value="" />红色
						<input type="radio" name="color" id="" value="" />橙色
						<input type="radio" name="color" id="" value="" />藏青
						<input type="radio" name="color" id="" value="" />雪白
					</form>
					 数量<select name="nums" class="de_nums" >
					 	<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
					 </select>
					  <div class="de_mai">
					  	  <span class="liji"><a href="">立即购买</a>
					  	  	
					  	  </span><span class="jiaru"><a href="">加入购物车</a>
					  	  	 
					  	  </span>
					  </div>
					  
				 </div>
			</div>
		</div>
</body>
</html>