<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品分类管理</title>
<link rel="stylesheet"  href="layui/css/layui.css">
</head>
<body>

	<script type="text/html" id='imglist_bar'>
<input type="text" id="checktext" autocomplete="off"
						class="layui-input" placeholder="请输入查询内容"  style="width:200px;display:inline-block;">
<button class="layui-btn"  onclick="img_cha()">查询</button>   
<button class="layui-btn" id="list_del" onclick="img_del()">删除图片</button>
</script>
<table class="layui-table"
		lay-data="{url:'getimg',toolbar:'#imglist_bar',id:'imgtable',page:true}">
		<thead>
			<tr>
				<th lay-data="{type:'radio'}"></th>
				<th lay-data="{field:'img_id'}">图片ID</th>
				<th lay-data="{field:'goods_id'}">图片所属商品ID</th>
				<th lay-data="{field:'img_name'}">图片名</th>
				<th lay-data="{field:'img_uptime'}">图片上传时间</th>
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
	<div hidden id="update_class_div">
		<div class="layui-form-item">
			<label class="layui-form-label">新分类名</label>
			<div class="layui-input-inline">
				<input type="text" id="class_name" 
					autocomplete="off" class="layui-input">
			</div>
		</div>
	</div>
	<div hidden id="zeng_update">
			<div class="layui-form-item">
				<label class="layui-form-label">分类名</label>
				<div class="layui-input-inline">
					<input type="text" id="zeng_name" autocomplete="off"
						class="layui-input">
				</div>
			</div>
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
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="layui/layui.all.js"></script>
	 <script type="text/javascript">
	var table = layui.table;
	var layer = layui.layer;

	function img_del() {
		//点击一下获取数据行
		//console.log("123");
		var checkStatus = table.checkStatus('imgtable');
		// console.log(checkStatus.data);
		var checkdata = table.checkStatus('imgtable').data;
		//已选中		
		if (checkdata.length > 0) {
			// console.log(checkStatus);
			//获取ID -- 传到Servlet-- 删除数据
			var img_id = checkdata[0].img_id;
			var img_name   = checkdata[0].img_name;
			//重新加载列表
			$.post("goodsimg_del", {				
				"img_id" : img_id,
				"img_name"   :  img_name		
			}, function() {
				layer.msg("删除成功");
				table.reload("imgtable");
			});

		} else {
			layer.msg("请先选中数据");
		}
		//未选中,提示需要选中
	}

	function class_update() {
		//弹出对话框
		//alert("123");
		var checkStatus = table.checkStatus('classlist');
		var checkdata = table.checkStatus('classlist').data;
		//console.log(checkdata);
		if (checkdata.length > 0) {
			var class_id = checkStatus.data[0].class_id;
			$("#class_name").val(checkdata[0].class_name);

			layer.open({
				title : "修改信息",
				type : 1,
				content : $("#update_class_div"),
				btn : [ "保存", "关闭" ],
				btn1 : function() {
					//layer.msg("点击保存按钮");				
					$.post("update_class_name", {
				
						"class_id" : class_id,
						"class_name" : $("#class_name").val()
					}, function() {
						//关闭窗口,
						layer.closeAll();
						layer.msg("修改成功");
						//列表刷新
						table.reload("classlist");
					});
				}

			});
		} else {
			layer.msg("请先选中数据");
		}

	}

	function class_zeng() {
		//alert("12");
		layer.open({
			title : "增加信息",
			type : 1,
			content : $("#zeng_update"),
			btn : [ "保存", "关闭" ],
			btn1 : function() {
				//layer.msg("点击保存按钮");				
				$.post("class_zeng", {
				
					"class_name" : $("#zeng_name").val()
					
				}, function() {
					//关闭窗口,
					layer.closeAll();
					layer.msg("增加成功");
					//列表刷新
					table.reload("classlist");
				});
			}

		});

	}

	function img_cha() {
		//alert("41");
		 	table.reload("imgtable",{
					 url:"getimg",
					 method:"post",
					 where:{"checktext":$("#checktext").val()}
				 }); 
      
             layer.msg("查询成功");

	}


	</script> 
	
</body>
</html>