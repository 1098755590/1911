<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  href="layui/css/layui.css">
<style type="text/css">


</style>
</head>
<body>

	<script type="text/html" id='userlist_bar'>
<input type="text" id="cha_name" autocomplete="off"
						class="layui-input" placeholder="请输入查询内容"  style="width:200px;display:inline-block;">
<button class="layui-btn"  onclick="user_cha()" >查询</button>   
<button class="layui-btn"  onclick="user_update()">编辑</button> 
</script>
<script type="text/html" id="barDemo1">
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">封号</a>
</script>
<script type="text/html" id="barDemo2">
  <a class="layui-btn layui-btn-xs" lay-event="edit">解封</a>
</script>
<table class="layui-table"
		lay-data="{url:'getUser',toolbar:'#userlist_bar',id:'userlist',page:true}"
		lay-filter="usertable">
		<thead>
			<tr>
				<th lay-data="{type:'radio'}"></th> 
				<th lay-data="{field:'userid'}">ID</th>
				<th lay-data="{field:'username'}">用户名</th>
				<th lay-data="{field:'password'}">密码</th>
				<th lay-data="{field:'status'}">账号状态</th>
				<th lay-data="{align:'center',templet:function(d){
				if(d.status=='正常'){
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
			<label class="layui-form-label">用户名</label>
			<div class="layui-input-inline">
				<input type="text" id="update_name" name="username"
					autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">密码</label>
			<div class="layui-input-inline">
				<input type="text" id="update_pass" name="password"
					autocomplete="off" class="layui-input">
			</div>
		</div>
		

	</div>
	<div hidden id="cha_user">
			<div class="layui-form-item">
				<label class="layui-form-label">查询的信息</label>
				<div class="layui-input-inline">
					<input type="text" id="cha_name" autocomplete="off"
						class="layui-input">
				</div>
			</div>
		</div>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="layui/layui.all.js"></script>
	 <script type="text/javascript">
	var table = layui.table;
	var layer = layui.layer;

	function user_del() {
		//点击一下获取数据行
		//console.log("123");
		var checkStatus = table.checkStatus('userlist');
		// console.log(checkStatus.data);
		var checkdata = table.checkStatus('userlist').data;
		//已选中		
		if (checkdata.length > 0) {
			// console.log(checkStatus);
			//获取ID -- 传到Servlet-- 删除数据
			var checkid = checkdata[0].userid;
			//重新加载列表
			$.post("del", {				
				"userid" : checkid
			}, function() {
				layer.msg("删除成功");
				table.reload("userlist");
			});

		} else {
			layer.msg("请先选中数据");
		}
		//未选中,提示需要选中
	}

	function user_update() {
		//弹出对话框
		//alert("123");
		var checkStatus = table.checkStatus('userlist');
		var checkdata = table.checkStatus('userlist').data;
		//console.log(checkdata);
		if (checkdata.length > 0) {
			var checkid = checkStatus.data[0].userid;
			$("#update_name").val(checkdata[0].username);
			$("#update_pass").val(checkdata[0].password);

			layer.open({
				title : "修改信息",
				type : 1,
				content : $("#update_user_div"),
				btn : [ "保存", "关闭" ],
				btn1 : function() {
					//layer.msg("点击保存按钮");				
					$.post("update", {
				
						"userid" : checkid,
						"username" : $("#update_name").val(),
						"userpass" : $("#update_pass").val()
					}, function() {
						//关闭窗口,
						layer.closeAll();
						layer.msg("修改成功");
						//列表刷新
						table.reload("userlist");
					});
				}

			});
		} else {
			layer.msg("请先选中数据");
		}

	}

	function user_zeng() {
		//alert("12");
		layer.open({
			title : "增加信息",
			type : 1,
			content : $("#update_user_div"),
			btn : [ "保存", "关闭" ],
			btn1 : function() {
				//layer.msg("点击保存按钮");				
				$.post("zeng", {
				
					"username" : $("#update_name").val(),
					"userpass" : $("#update_pass").val()
				}, function() {
					//关闭窗口,
					layer.closeAll();
					layer.msg("增加成功");
					//列表刷新
					table.reload("userlist");
				});
			}

		});

	}

	function user_chaa() {
		//alert("41");
		layer.open({
			title : "查询信息",
			type : 1,
			content : $("#cha_user"),
			btn : [ "查询", "关闭" ],
			btn1 : function() {
			 	table.reload("userlist",{
					 url:"getUser",
					 method:"post",
					 where:{"checktext":$("#cha_name").val()}
				 }); 
				
             layer.closeAll();
             layer.msg("查询成功");
			}

				
		});

	}

			function user_cha() {
			 	table.reload("userlist",{
					 url:"getUser",
					 method:"post",
					 where:{"checktext":$("#cha_name").val()}
				 }); 
				
             layer.closeAll();
             layer.msg("查询成功");
			}
      
			
			table.on('tool(usertable)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
				  var data = obj.data; //获得当前行数据
			      var userid=data.userid;
				  var status=data.status;
				  if(status=='正常'){
					  layer.confirm('确认对用户'+userid+'封号么', function(){
						  $.post("changestatus",{
							  "userid":userid,
							  "status":status
						  },function(){
							  table.reload("userlist");
							  layer.msg('用户'+userid+"封号成功");
						  });
					      });
				  }
				    else {
					  layer.confirm('确认对用户'+userid+'解封么', function(){
						  $.post("changestatus",{
							  "userid":userid,
							  "status":status
						  },function(){
							  table.reload("userlist");
							  layer.msg('用户'+userid+"解封成功");
						  });
					      });
				  }
				  
				});
       
	</script> 
	
</body>
</html>