<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品管理</title>
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

	<script type="text/html" id='goodslist_bar'>
<input type="text" id="cha_name" autocomplete="off"
						class="layui-input" placeholder="请输入查询内容"  style="width:200px;display:inline-block;">
<button class="layui-btn"  onclick="goods_cha()">查询</button>    
<button class="layui-btn"  onclick="goods_zeng()">增加</button>  
<button class="layui-btn"  onclick="goods_update()">修改</button> 

</script>
<script type="text/html" id="barDemo1">
  <a class="layui-btn layui-btn-xs" lay-event="upload" >上传图片</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">下架</a>
</script>
<script type="text/html" id="barDemo2">
  <a class="layui-btn layui-btn-xs" lay-event="upload" >上传图片</a>
  <a class="layui-btn layui-btn-xs" lay-event="del">上架</a>
</script>
<table class="layui-table"
		lay-data="{url:'getGoods',toolbar:'#goodslist_bar',id:'goodslist',page:true}"
		lay-filter="goodstable">
		<thead>
			<tr>
				<th lay-data="{type:'radio'}"></th>
				<th lay-data="{field:'goods_id'}">商品ID</th>
				<th lay-data="{field:'goodsname'}">商品名称</th>
			<!-- 	<th lay-data="{field:'goods_classifyid'}">商品所属分类ID</th> -->
				<th lay-data="{field:'class_name'}">商品所属分类</th>
				<th lay-data="{field:'goods_price'}">单价</th>
				<th lay-data="{field:'goods_stocks'}">库存</th>
				<th lay-data="{field:'goods_status'}">状态</th>
			
				<th lay-data="{field:'goods_detail'}">详细信息</th>
				<th lay-data="{align:'center',templet:function(d){
				if(d.goods_status=='已上架'){
				return $('#barDemo1').html();
				}else{
				return $('#barDemo2').html();
				}}
				}">编辑</th>
			</tr>
		</thead>
	</table>
	<!-- 弹出层 -->
	<div hidden id="update_user_div">
		<div class="layui-form-item">
			<label class="layui-form-label">分类名</label>
			<div class="layui-input-inline">
				<input type="text" id="update_name" 
					autocomplete="off" class="layui-input">
			</div>
		</div>

		

	</div>
	<div hidden id="update_goods_div">
		<div class="layui-form-item">
			<label class="layui-form-label">商品名称</label>
			<div class="layui-input-inline">
				<input type="text" id="goodsname" 
					autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">所属分类ID</label>
			<div class="layui-input-inline">
				<input type="text" id="goods_classifyid" 
					autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">商品价格</label>
			<div class="layui-input-inline">
				<input type="text" id="goods_price" 
					autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">库存</label>
			<div class="layui-input-inline">
				<input type="text" id="goods_stocks" 
					autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">商品描述</label>
			<div class="layui-input-inline">
				<input type="text" id="goods_detail" 
					autocomplete="off" class="layui-input">
			</div>
		</div>
	</div>
	<div hidden id="zeng_update" >
	 <form class="layui-form" action="">
			<div class="layui-form-item" >
				<label class="layui-form-label">商品名称</label>
				<div class="layui-input-inline">
					<input type="text" id="goodsname_z" autocomplete="off" 
						class="layui-input">
				</div>
			</div>
		 <div class="layui-form-item">
    <label class="layui-form-label">商品分类</label>
    <div class="layui-input-block">
      <select id="goods_fl" name="goods_fl" lay-verify="required">
         <option value="0" >北京</option>
        <option value=""></option>
        <option value="1">上海</option>
 
      </select>
    </div>
  </div>
			<div class="layui-form-item" >
				<label class="layui-form-label">商品价格</label>
				<div class="layui-input-inline">
					<input type="text" id="goods_price_z" autocomplete="off"  
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item" >
				<label class="layui-form-label">数量</label>
				<div class="layui-input-inline">
					<input type="text" id="goods_stocks_z" autocomplete="off" 
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item" >
				<label class="layui-form-label">商品描述</label>
				<div class="layui-input-inline"> 
					<input type="text" id="goods_detail_z" autocomplete="off" 
						class="layui-input">
				</div>
			</div>
			
			
			</form>
		</div>
		<div hidden id="cha_class_div">
		<div class="layui-form-item">
			<label class="layui-form-label">查询信息</label>
			<div class="layui-input-inline">
				<input type="text" id="cha_name" 
					autocomplete="off" class="layui-input">
			</div>
		</div>
	</div>
	
	
	<div hidden id="img_div">
	<form  id="img" class="layui-form" action="goods_imgadd" method="post">
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  <legend>上传多张图片</legend>
</fieldset>
 
<div class="layui-upload">
  <button type="button" class="layui-btn" id="test2" >多图片上传</button> 
  <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
    预览图：
    <div class="layui-upload-list" id="demo2" ></div>
 </blockquote>
</div>
   <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1" onclick="tishi()">立即提交</button> 
</form>
</div>
	
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="layui/layui.all.js"></script>
	 <script type="text/javascript">
	var table = layui.table;
	var layer = layui.layer;
	var upload=layui.upload;
	var form=layui.form;
	function tishi(){
		layer.msg("上传成功");
	}
	
      table.on('tool(goodstable)',function(obj){
    	  var data=obj.data;
    	  var goods_id=data.goods_id;
    	  var goods_status=data.goods_status;
    	  
    	  switch(obj.event){
  
          case 'upload':
        	    $(".newimg").remove();
        	    table.reload("goodslist");
        		$.post("click_add",{
        			"goods_id" : goods_id
        		},function(){
           			
          		});
        	  layer.open({
        		    title : "上传图片",
        			type : 1,
        			area: ['1000px', '500px'],
        			content : $("#img_div")
        	      });	
          break;
          case 'del':
        	  $.post("change_goods_status",{
    		      "goods_id":goods_id,
    		      "goods_status":goods_status
    	  },function(){
    		  table.reload("goodslist");
    		  layer.msg("操作成功!");		
    	  });
          break;
        };
    	  
    	
      });
      
      function goods_zeng() {
  		//alert("12");
         
  		$.post("getClass",function(d){	
  			var data=d.data;
  			console.log(d); 
  			console.log(data);
  			if(data.length>0){
  				$("#goods_fl").empty();
  				for(var i=0;i<data.length;i++){
  					$("#goods_fl").append("<option>"+data[i].class_name+ "<option>")
  				}
  				form.render();
  			}
  		});
  		
  		
  		layer.open({
  			title : "增加商品",
  			type : 1, 
  			content : $("#zeng_update"),
  			btn : [ "确定", "关闭" ],
  			btn1 : function() {
  				//layer.msg("点击保存按钮");				
  				$.post("goods_zeng",{ 				    
  					"goodsname" :  $("#goodsname_z").val(), 
  					"class_name": $("#goods_fl").val(), 
  					"goods_price":  $("#goods_price_z").val(),  
  					"goods_stocks":  $("#goods_stocks_z").val(), 
  					"goods_detail":  $("#goods_detail_z").val()					
  				}, function() {
  					//关闭窗口,
  					layer.closeAll();
  					layer.msg("增加成功");
  					//列表刷新
  					table.reload("goodslist");
  				});
  			}

  		});

  	}
      
      function goods_update() {
  		//弹出对话框
  		//alert("123");
  		var checkStatus = table.checkStatus('goodslist');
  		var checkdata = table.checkStatus('goodslist').data;
  		//console.log(checkdata);
  		if (checkdata.length > 0) {
  			var goods_id = checkStatus.data[0].goods_id;
  			$("#goodsname").val(checkdata[0].goodsname);
  			$("#goods_classifyid").val(checkdata[0].goods_classifyid);
  			$("#goods_price").val(checkdata[0].goods_price);
  			$("#goods_stocks").val(checkdata[0].goods_stocks);
  			$("#goods_detail").val(checkdata[0].goods_detail);

  			layer.open({
  				title : "修改信息",
  				type : 1,
  				content : $("#update_goods_div"),
  				btn : [ "保存", "关闭" ],
  				btn1 : function() {
  					//layer.msg("点击保存按钮");				
  					$.post("update_goods", {
  				         "goods_id":goods_id,
  						"goodsname":$("#goodsname").val(),
  			  			"goods_classifyid":$("#goods_classifyid").val(),
  			  			"goods_price":$("#goods_price").val(),
  			  			"goods_stocks":$("#goods_stocks").val(),
  			  			"goods_detail":$("#goods_detail").val()
  					}, function() {
  						//关闭窗口,
  						layer.closeAll();
  						layer.msg("修改成功");
  						//列表刷新
  						table.reload("goodslist");
  					});
  				}

  			});
  		} else {
  			layer.msg("请先选中数据");
  		}

  	}
     
/*       function goods_cha() {
  		//alert("41");
  		layer.open({
  			title : "查询商品信息",
  			type : 1,
  			content : $("#cha_class_div"),
  			btn : [ "查询", "关闭" ],
  			btn1 : function() {
  			 	table.reload("goodslist",{
  					 url:"getGoods",
  					 method:"post",
  					 where:{"checktext":$("#cha_name").val()}
  				 }); 
  				
               layer.closeAll();
               layer.msg("查询成功");
  			}  		
  		});
  	} */
      
      upload.render({
  	    elem: '#test2'
  	    ,url: 'fileUpload' //改成您自己的上传接口
  	    ,multiple: true
  	    ,before: function(obj){
  	      //预读本地文件示例，不支持ie8
  	      obj.preview(function(index, file, result){
  /* 	        $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img" style="height:80px;">') */
  	        $('#demo2').append('<div class="imgDiv"><div  class="img_delete_icon layui-icon-close-fill layui-icon"></div><img  class="newimg" src="'+ result +'" alt="'+ file.name +'"  style="height:80px;width:120px;"></div>')
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
     
      function goods_cha() {
  		//alert("41");
  		 	table.reload("goodslist",{
  					 url:"getGoods",
  					 method:"post",
  					 where:{"checktext":$("#cha_name").val()}
  				 }); 
        
               layer.msg("查询成功");

  	}
      
	</script> 
	
</body>
</html>