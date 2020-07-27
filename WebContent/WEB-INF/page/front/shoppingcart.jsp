<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>确认订单</title>

<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/carts.css">
<link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<jsp:include   page="top.jsp" flush="true"/>
<section class="cartMain">
	<div class="cartMain_hd">
		<ul class="order_lists cartTop">
			<li class="list_chk">
				<!--所有商品全选-->
				<input type="checkbox" id="all" class="whole_check">
				<label for="all"></label>
				全选
			</li>
			<li class="list_con">商品信息</li>
			<li class="list_info">商品参数</li> 
			<li class="list_price">单价</li>
			<li class="list_amount">数量</li>
			<li class="list_sum">金额</li>
			<li class="list_op">操作</li>
		</ul>
	</div>
   <form action="buyallgoods" method="post">
   	<input hidden name="goods_id" id="goods_id0">
	<div class="cartBox">
		<div class="shop_info">
			<div class="all_check">
				<!--店铺全选-->
			
				<input type="checkbox" id="shop_a" class="shopChoice" >
				<label for="shop_a" class="shop" ></label>
			</div>
			<div class="shop_name">
				店铺：<a href="javascript:;">搜猎人艺术生活</a>
			</div>
		</div>
		<div class="order_content" id="art0">
			<!-- <ul class="order_lists">
				<li class="list_chk">
					<input type="checkbox" id="checkbox_2" class="son_check">
					<label for="checkbox_2"></label>
				</li>
				<li class="list_con">
					<div class="list_img"><a href="javascript:;"><img src="img/shangou/2_6.jpg" alt=""></a></div>
					<div class="list_text"><a href="javascript:;">夏季男士迷彩无袖T恤圆领潮流韩版修身男装背心青年时尚打底衫男</a></div>
				</li>
				<li class="list_info">
					<p>规格：默认</p>
					<p>尺寸：16*16*3(cm)</p>
				</li>
				<li class="list_price">
					<p class="price">￥980</p>
				</li>
				<li class="list_amount">
					<div class="amount_box">
						<a href="javascript:;" class="reduce reSty">-</a>
						<input type="text" value="1" class="sum">
						<a href="javascript:;" class="plus">+</a>
					</div>
				</li>
				<li class="list_sum">
					<p class="sum_price">￥980</p>
				</li>
				<li class="list_op">
					<p class="del"><a href="javascript:;" class="delBtn">移除商品</a></p>
				</li>
			</ul>
			<ul class="order_lists">
				<li class="list_chk">
					<input type="checkbox" id="checkbox_3" class="son_check">
					<label for="checkbox_3"></label>
				</li>
				<li class="list_con">
					<div class="list_img"><a href="javascript:;"><img src="images/2.png" alt=""></a></div>
					<div class="list_text"><a href="javascript:;">夏季男士迷彩无袖T恤圆领潮流韩版修身男装背心青年时尚打底衫男</a></div>
				</li>
				<li class="list_info">
					<p>规格：默认</p>
					<p>尺寸：16*16*3(cm)</p>
				</li>
				<li class="list_price">
					<p class="price">￥780</p>
				</li>
				<li class="list_amount">
					<div class="amount_box">
						<a href="javascript:;" class="reduce reSty">-</a>
						<input type="text" value="1" class="sum">
						<a href="javascript:;" class="plus">+</a>
					</div>
				</li>
				<li class="list_sum">
					<p class="sum_price">￥780</p>
				</li>
				<li class="list_op">
					<p class="del"><a href="javascript:;" class="delBtn">移除商品</a></p>
				</li>
			</ul>
			<ul class="order_lists">
				<li class="list_chk">
					<input type="checkbox" id="checkbox_6" class="son_check">
					<label for="checkbox_6"></label>
				</li>
				<li class="list_con">
					<div class="list_img"><a href="javascript:;"><img src="images/3.png" alt=""></a></div>
					<div class="list_text"><a href="javascript:;">夏季男士迷彩无袖T恤圆领潮流韩版修身男装背心青年时尚打底衫男</a></div>
				</li>
				<li class="list_info">
					<p>规格：默认</p>
					<p>尺寸：16*16*3(cm)</p>
				</li>
				<li class="list_price">
					<p class="price">￥180</p>
				</li>
				<li class="list_amount">
					<div class="amount_box">
						<a href="javascript:;" class="reduce reSty">-</a>
						<input type="text" value="1" class="sum">
						<a href="javascript:;" class="plus">+</a>
					</div>
				</li>
				<li class="list_sum">
					<p class="sum_price">￥180</p>
				</li>
				<li class="list_op">
					<p class="del"><a href="javascript:;" class="delBtn">移除商品</a></p>
				</li>
			</ul> -->
		</div>
		收货地址:<div id="address"><select id="address0" name="address"></select></div>
	</div>
    

	
	<!--底部-->
	<div class="bar-wrapper">
		<div class="bar-right">
			<div class="piece">已选商品<strong class="piece_num">0</strong>件</div>
			<div class="totalMoney">共计: <strong id="total_text">0.00</strong></div>
			<div class="calBtn" style="background-color:#FF4400; margin:0px;padding:0px;"><a style="background-color:#FF4400; margin:0px;padding:0px;"><button id="btn11" style="background-color:#FF4400; margin:0px;padding:0px;cursor:pointer;">清空购物车</button></a></div>
		</div>
	</div>
	 </form>
</section>
<section class="model_bg"></section>
<section class="my_model">
	<p class="title">删除宝贝<span class="closeModel">X</span></p>
	<p>您确认要删除该宝贝吗？</p>
	<div class="opBtn"><a href="javascript:;" class="dialog-sure">确定</a><a href="javascript:;" class="dialog-close">关闭</a></div>
</section>

<script src="js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="layui/layui.all.js"></script>
<script type="text/javascript">
var layer = layui.layer;
var goods_id=<%=session.getAttribute("goods_id")%>;

$.ajax({
	   async: false,
	    type : "post",
	    url : "getcartgoods",
	    datatype : 'json',
	    success : function(e) {
	    	var data=e.data;
			   console.log(data);
			   var j=0;
			    for(var i=0;i<data.length;i++){
			       j=i+2;
			       console.log(j);
				   $("#art0").append('<ul class="order_lists"><li class="list_chk"><input type="checkbox" id="checkbox_'+j+'" class="son_check"><label for="checkbox_'+j+'"></label></li><li class="list_con"><div class="list_img"><a href="javascript:;"><img src="./file/'+data[i].goods_picture+'" alt=""></a></div><div class="list_text"><a href="javascript:;">'+data[i].goodsname+'</a></div></li><li class="list_info"><p>规格：默认</p><p>'+data[i].goods_detail+'</p></li><li class="list_price"><p class="price">￥'+data[i].goods_price+'</p></li><li class="list_amount"><div class="amount_box"><a href="javascript:;" class="reduce reSty">-</a><input type="text" value="1" class="sum"><a href="javascript:;" class="plus">+</a></div></li><li class="list_sum"><p class="sum_price">￥'+data[i].goods_price+'</p></li><li class="list_op"><p class="del"><a href="javascript:;" class="delBtn">移除商品</a></p></li></ul>');

			   } 
	    }
	  });

$.ajax({
	    async: false,
	    type : "post",
	    url : "getuseraddress",
	    datatype : 'json',
	    success : function(e) {
	    	var data=e.data;
			   console.log(data);
		// 	   $("#art0").append('<ul class="order_lists"><li class="list_chk"><input  type="checkbox" id="checkbox_2" class="son_check"><label for="checkbox_2"></label></li><li class="list_con"><div class="list_img"><a href="javascript:;"><img src="./file/'+data[0].goods_picture+'" alt=""></a></div><div class="list_text"><a href="javascript:;">'+data[0].goodsname+'</a></div></li><li class="list_info"><p>规格：默认</p><p>'+data[0].goods_detail+'</p></li><li class="list_price"><p class="price">￥'+data[0].goods_price+'</p></li><li class="list_amount"><div class="amount_box"><a href="javascript:;" class="reduce reSty">-</a><input type="text" value="1" class="sum"><a href="javascript:;" class="plus">+</a></div></li><li class="list_sum"><p class="sum_price">￥'+data[0].goods_price+'</p></li><li class="list_op"><p class="del"><a href="javascript:;" class="delBtn">移除商品</a></p></li></ul>');
             for(var i=0;i<data.length;i++){
            	 
            	 $("#address0").append('<option>'+data[i].addressname+'</option>')
             }
			   
	    }
	  });


	
	

/**
 * Created by Administrator on 2017/5/24.
 */

$(function () {

    //全局的checkbox选中和未选中的样式
    var $allCheckbox = $('input[type="checkbox"]'),     //全局的全部checkbox
        $wholeChexbox = $('.whole_check'),
        $cartBox = $('.cartBox'),                       //每个商铺盒子
        $shopCheckbox = $('.shopChoice'),               //每个商铺的checkbox
        $sonCheckBox = $('.son_check');                 //每个商铺下的商品的checkbox
    $allCheckbox.click(function () {
        if ($(this).is(':checked')) {
            $(this).next('label').addClass('mark');
        } else {
            $(this).next('label').removeClass('mark')
        }
    });

    //===============================================全局全选与单个商品的关系================================
    $wholeChexbox.click(function () {
        var $checkboxs = $cartBox.find('input[type="checkbox"]');
        if ($(this).is(':checked')) {
            $checkboxs.prop("checked", true);
            $checkboxs.next('label').addClass('mark');
        } else {
            $checkboxs.prop("checked", false);
            $checkboxs.next('label').removeClass('mark');
        }
        totalMoney();
    });


    $sonCheckBox.each(function () {
        $(this).click(function () {
            if ($(this).is(':checked')) {
                //判断：所有单个商品是否勾选
                var len = $sonCheckBox.length;
                var num = 0;
                $sonCheckBox.each(function () {
                    if ($(this).is(':checked')) {
                        num++;
                    }
                });
                if (num == len) {
                    $wholeChexbox.prop("checked", true);
                    $wholeChexbox.next('label').addClass('mark');
                }
            } else {
                //单个商品取消勾选，全局全选取消勾选
                $wholeChexbox.prop("checked", false);
                $wholeChexbox.next('label').removeClass('mark');
            }
        })
    })

    //=======================================每个店铺checkbox与全选checkbox的关系/每个店铺与其下商品样式的变化===================================================

    //店铺有一个未选中，全局全选按钮取消对勾，若店铺全选中，则全局全选按钮打对勾。
    $shopCheckbox.each(function () {
        $(this).click(function () {
            if ($(this).is(':checked')) {
                //判断：店铺全选中，则全局全选按钮打对勾。
                var len = $shopCheckbox.length;
                var num = 0;
                $shopCheckbox.each(function () {
                    if ($(this).is(':checked')) {
                        num++;
                    }
                });
                if (num == len) {
                    $wholeChexbox.prop("checked", true);
                    $wholeChexbox.next('label').addClass('mark');
                }

                //店铺下的checkbox选中状态
                $(this).parents('.cartBox').find('.son_check').prop("checked", true);
                $(this).parents('.cartBox').find('.son_check').next('label').addClass('mark');
            } else {
                //否则，全局全选按钮取消对勾
                $wholeChexbox.prop("checked", false);
                $wholeChexbox.next('label').removeClass('mark');

                //店铺下的checkbox选中状态
                $(this).parents('.cartBox').find('.son_check').prop("checked", false);
                $(this).parents('.cartBox').find('.son_check').next('label').removeClass('mark');
            }
            totalMoney();
        });
    });


    //========================================每个店铺checkbox与其下商品的checkbox的关系======================================================

    //店铺$sonChecks有一个未选中，店铺全选按钮取消选中，若全都选中，则全选打对勾
    $cartBox.each(function () {
        var $this = $(this);
        var $sonChecks = $this.find('.son_check');
        $sonChecks.each(function () {
            $(this).click(function () {
                if ($(this).is(':checked')) {
                    //判断：如果所有的$sonChecks都选中则店铺全选打对勾！
                    var len = $sonChecks.length;
                    var num = 0;
                    $sonChecks.each(function () {
                        if ($(this).is(':checked')) {
                            num++;
                        }
                    });
                    if (num == len) {
                        $(this).parents('.cartBox').find('.shopChoice').prop("checked", true);
                        $(this).parents('.cartBox').find('.shopChoice').next('label').addClass('mark');
                    }

                } else {
                    //否则，店铺全选取消
                    $(this).parents('.cartBox').find('.shopChoice').prop("checked", false);
                    $(this).parents('.cartBox').find('.shopChoice').next('label').removeClass('mark');
                }
                totalMoney();
            });
        });
    });


    //=================================================商品数量==============================================
    var $plus = $('.plus'),
        $reduce = $('.reduce'),
        $all_sum = $('.sum');
    $plus.click(function () {
        var $inputVal = $(this).prev('input'),
            $count = parseInt($inputVal.val())+1,
            $obj = $(this).parents('.amount_box').find('.reduce'),
            $priceTotalObj = $(this).parents('.order_lists').find('.sum_price'),
            $price = $(this).parents('.order_lists').find('.price').html(),  //单价
            $priceTotal = $count*parseInt($price.substring(1));
        $inputVal.val($count);
        $priceTotalObj.html('￥'+$priceTotal);
        if($inputVal.val()>1 && $obj.hasClass('reSty')){
            $obj.removeClass('reSty');
        }
        totalMoney();
    });

    $reduce.click(function () {
        var $inputVal = $(this).next('input'),
            $count = parseInt($inputVal.val())-1,
            $priceTotalObj = $(this).parents('.order_lists').find('.sum_price'),
            $price = $(this).parents('.order_lists').find('.price').html(),  //单价
            $priceTotal = $count*parseInt($price.substring(1));
        if($inputVal.val()>1){
            $inputVal.val($count);
            $priceTotalObj.html('￥'+$priceTotal);
        }
        if($inputVal.val()==1 && !$(this).hasClass('reSty')){
            $(this).addClass('reSty');
        }
        totalMoney();
    });

    $all_sum.keyup(function () {
        var $count = 0,
            $priceTotalObj = $(this).parents('.order_lists').find('.sum_price'),
            $price = $(this).parents('.order_lists').find('.price').html(),  //单价
            $priceTotal = 0;
        if($(this).val()==''){
            $(this).val('1');
        }
        $(this).val($(this).val().replace(/\D|^0/g,''));
        $count = $(this).val();
        $priceTotal = $count*parseInt($price.substring(1));
        $(this).attr('value',$count);
        $priceTotalObj.html('￥'+$priceTotal);
        totalMoney();
    })

    //======================================移除商品========================================

    var $order_lists = null;
    var $order_content = '';
    $('.delBtn').click(function () {
        $order_lists = $(this).parents('.order_lists');
        $order_content = $order_lists.parents('.order_content');
        $('.model_bg').fadeIn(300);
        $('.my_model').fadeIn(300);
    });

    //关闭模态框
    $('.closeModel').click(function () {
        closeM();
    });
    $('.dialog-close').click(function () {
        closeM();
    });
    function closeM() {
        $('.model_bg').fadeOut(300);
        $('.my_model').fadeOut(300);
    }
    //确定按钮，移除商品
    $('.dialog-sure').click(function () {
        $order_lists.remove();
        if($order_content.html().trim() == null || $order_content.html().trim().length == 0){
            $order_content.parents('.cartBox').remove();
        }
        closeM();
        $sonCheckBox = $('.son_check');
        totalMoney();
    })

    //======================================总计==========================================

    function totalMoney() {
        var total_money = 0;
        var total_count = 0;
        var calBtn = $('.calBtn a');
        $sonCheckBox.each(function () {
            if ($(this).is(':checked')) {
              
                var num =  parseInt($(this).parents('.order_lists').find('.sum').val());
                var goods = parseInt($(this).parents('.order_lists').find('.sum_price').html().substring(1));
                total_count += num;
                total_money += goods;
             
            }
        });
 
        $("#total_text").html(total_money);
        $('.piece_num').html(total_count);
        // console.log(total_money,total_count);

        if(total_money!=0 && total_count!=0){
            if(!calBtn.hasClass('btn_sty')){
                calBtn.addClass('btn_sty');
            }
        }else{
            if(calBtn.hasClass('btn_sty')){
                calBtn.removeClass('btn_sty');
            }
        } 
    }


});
</script>

</body>
</html>
