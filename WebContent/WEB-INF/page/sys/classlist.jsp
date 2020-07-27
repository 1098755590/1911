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

	<script type="text/html" id='classlist_bar'>
<input type="text" id="cha_name" autocomplete="off"
						class="layui-input" placeholder="请输入查询内容"style="width:200px;display:inline-block;">
<button class="layui-btn"  onclick="class_cha()">查询</button>   

<button class="layui-btn"  onclick="class_update()">修改</button> 
<button class="layui-btn"  onclick="class_zeng()">增加</button>  
 
</script>

<script type="text/html" id="barDemo1">
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">下架</a>
</script>
<script type="text/html" id="barDemo2">
  <a class="layui-btn layui-btn-xs" lay-event="edit">上架</a>
</script>

<table class="layui-table"
		lay-data="{url:'getClass',toolbar:'#classlist_bar',id:'classlist',page:true}"
		lay-filter="classtable_filter">
		<thead>
			<tr>
				<th lay-data="{type:'radio'}"></th>
				<th lay-data="{field:'class_id'}">商品分类ID</th>
				<th lay-data="{field:'class_name'}">分类名</th>
				<th lay-data="{field:'status'}">状态</th>
				<th lay-data="{field:'puton_time'}">上架日期</th>
				<th lay-data="{align:'center',templet:function(d){
				if(d.status=='上架'){
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

	function class_del() {
		//点击一下获取数据行
		//console.log("123");
		var checkStatus = table.checkStatus('classlist');
		// console.log(checkStatus.data);
		var checkdata = table.checkStatus('classlist').data;
		//已选中		
		if (checkdata.length > 0) {
			// console.log(checkStatus);
			//获取ID -- 传到Servlet-- 删除数据
			var class_id = checkdata[0].class_id;
			var status   = checkdata[0].status;
			//重新加载列表
			$.post("change_status", {				
				"class_id" : class_id,
				"status"   :  status		
			}, function() {
				layer.msg("更改成功");
				table.reload("classlist");
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

/* 	function class_cha() {
		//alert("41");
		layer.open({
			title : "查询信息",
			type : 1,
			content : $("#cha_class_div"),
			btn : [ "查询", "关闭" ],
			btn1 : function() {
			 	table.reload("classlist",{
					 url:"getClass",
					 method:"post",
					 where:{"checktext":$("#cha_name").val()}
				 }); 
				
             layer.closeAll();
             layer.msg("查询成功");
			}		
		});
	} */
   
	function class_cha() {
	 	table.reload("classlist",{
			 url:"getClass",
			 method:"post",
			 where:{"checktext":$("#cha_name").val()}
		 }); 
		
     layer.closeAll();
     layer.msg("查询成功");
	}

	table.on('tool(classtable_filter)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
		  var data = obj.data; //获得当前行数据
	      var class_name=data.class_name;
		  var class_id=data.class_id;
		  var status=data.status;
		  if(status=='上架'){
			  layer.confirm('确认对商品'+class_name+'下架么', function(){
				  $.post("change_status",{
					  "class_id" : class_id,
					   "status"   :  status	
				  },function(){
					  table.reload("classlist");
					  layer.msg('商品'+class_name+"下架成功");
				  });
			      });
		  }
		  if(status=='下架') {
			  layer.confirm('确认对商品'+class_name+'上架么', function(){
				  $.post("change_status",{
					  "class_id" : class_id,
					   "status"   :  status	
				  },function(){
					  table.reload("classlist");
					  layer.msg('商品'+class_name+"上架成功");
				  });
			      });
		  }
		  
		});
	
	
	
		</script> 
	
</body>
</html>