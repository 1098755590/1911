<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String path = request.getContextPath();  
    String  basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改用户信息</title>
<link rel="stylesheet" href="layui/css/layui.css">
</head>

<body class="layui-layout-body">
		<div class="layui-layout layui-layout-admin">
			<div class="layui-header">
				<div class="layui-logo">个人信息管理</div>
				<!-- 头部区域（可配合layui已有的水平导航） -->
				<ul class="layui-nav layui-layout-left">
				<!-- 	<li class="layui-nav-item" ><a href="" id="show_onlineCount">控制台</a></li>
					<li class="layui-nav-item"><a href="">商品管理</a></li>
					<li class="layui-nav-item"><a href="">用户</a></li> 
					<li class="layui-nav-item">
						<a href="javascript:;" >在线人数: <%=session.getServletContext().getAttribute("onlineCount") %>人</a>
					</li>-->
				</ul>			   
				<ul class="layui-nav layui-layout-right">
					<li class="layui-nav-item">
					
						<a href="javascript:;">
							<img src="http://t.cn/RCzsdCq" class="layui-nav-img">
							<%=session.getAttribute("name") %>
						</a>
						<dl class="layui-nav-child" style="position:absolute;z-index:999;">
						<!-- 	<dd><a href="javascript:;">基本资料</a></dd>
							<dd><a href="javascript:;">安全设置</a></dd> -->
							<dd><a href="javascript:;" onclick="update_password()">修改密码</a></dd>
							<dd><a href="javascript:;" page="user_addresslist">收货地址管理</a></dd>
							<dd><a href="javascript:;" page="orderlist">订单管理</a></dd>
						</dl>
					</li>
					<li class="layui-nav-item"><a href="user_logout" >退出</a></li>
				</ul>
				

			<div class="layui-side layui-bg-black">
				<div class="layui-side-scroll">
					<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
					<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<!-- 	<li class="layui-nav-item layui-nav-itemed">
							<a class="" href="javascript:;">所有商品</a>
							<dl class="layui-nav-child">
								<dd><a href="javascript:;">列表一</a></dd>
								<dd><a href="javascript:;">列表二</a></dd>
								<dd><a href="javascript:;">列表三</a></dd>
								<dd><a href="">超链接</a></dd>
							</dl>
						</li> -->
						<!-- <li class="layui-nav-item">
							<a href="javascript:;">解决方案</a>
							<dl class="layui-nav-child">
								<dd><a href="javascript:;">列表一</a></dd>
								<dd><a href="javascript:;">列表二</a></dd>
								<dd><a href="">超链接</a></dd>
							</dl>
						</li> -->
						<!-- <li class="layui-nav-item"><a href="javascript:;" page="userlist">用户管理</a></li>
						<li class="layui-nav-item"><a href="javascript:;" page="classlist">商品分类管理</a></li>
						<li class="layui-nav-item"><a href="javascript:;" page="goodslist">商品管理</a></li>
						<li class="layui-nav-item"><a href="javascript:;" page="goodsimglist">商品图片管理</a></li> -->
					</ul>
				</div>
			</div>

			<div class="layui-body">
			   <iframe style="height:98%;width:98%;" src=""></iframe>
			</div>

			<div class="layui-footer">
				<!-- 底部固定区域 -->
				© layui.com - 底部固定区域
			</div>
		</div>
		<div hidden id="update_password" >
		
			<div class="layui-form-item">
			<label class="layui-form-label">原密码</label>
			<div class="layui-input-inline">
				<input type="password" id="update_before" name="update_before"
					autocomplete="off" class="layui-input">
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">新密码</label>
			<div class="layui-input-inline">
				<input type="password" id="update_new" name="update_new"
					autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">确认密码</label>
			<div class="layui-input-inline">
				<input type="password" id="update_confirm" name="update_confirm"
					autocomplete="off" class="layui-input">
			</div>
		</div>
			</div>
				<div hidden id="add_admin" >
		<div class="layui-form-item">
			<label class="layui-form-label">输入账号</label>
			<div class="layui-input-inline">
				<input type="text" id="account" name="account"
					autocomplete="off" class="layui-input" onchange="add_tishi()">
			</div>
			<div id="add_tishi" style="color:red;margin-left:115px;"></div>
		</div>
			</div>
		<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
		<script src="layui/layui.all.js"></script>
		<script>
		var table = layui.table;
		var layer = layui.layer;
			//JavaScript代码区域
			layui.use('element', function() {
				var element = layui.element;
			});
			
/* 	  	$.post("user?param=admin",function(d){				
				$("#show").html("在线人数 :"+d);
			});   */
	  	 $("[page]").click(function(){
	  		 $("iframe").attr("src",$(this).attr("page"));
	  	 });
	  	 

	   	function update_password() {
			//弹出对话框
			/* alert("123"); */
			//console.log(checkdata);
			 	layer.open({
					title : "修改密码",
					type : 1,
					content : $("#update_password"),
					btn : [ "确认更改", "关闭" ],
					btn1 : function() {
						// console.log("123");
						//layer.msg("点击确认更改按钮");				
						$.post("userupdate_password", {
							"update_before":$("#update_before").val(),
							"update_new" : $("#update_new").val(),
							"update_confirm" : $("#update_confirm").val()
						}, function(d) {
							//关闭窗口,
							if(d=='1'){
							layer.closeAll();
							layer.msg("密码修改成功!");
							}if(d=='0'){
								layer.closeAll();
								layer.msg("两次密码输入不一致!");	
							}if(d=='2'){
								layer.closeAll();
								layer.msg("原密码输入错误!");	
							}
						});
					}

				}); 
			}  
	   	
/* 	   	function admin_quit() {
			$.post("admin_quit",function(){
		
			});
		} */
		function add_admin(){
			console.log("12");
			layer.open({
				title : "新增管理员",
				type : 1,
				content : $("#add_admin"),
				btn : [ "确认新增", "关闭" ],
				btn1 : function() {
					//layer.msg("点击保存按钮");
					var tishi=add_tishi();
					console.log(tishi);
					if(!add_tishi()){
						layer.closeAll();
						layer.msg("账号格式有误!");
					}
					else {$.post("add_admin", {				
						"account" : $("#account").val(),
					}, function() {
						//关闭窗口,
						layer.closeAll();
						layer.msg("增加成功");
					});
					
					}
					
				}

			});
		}
    
		function add_tishi(){
			var reg=/^[a-zA-Z]\w{5,7}$/;
			userpass=document.getElementById("account");
			console.log(userpass.value);
			if(reg.test(userpass.value)){
				document.getElementById("add_tishi").innerText="";
				return true;
			}
			else{
				document.getElementById("add_tishi").innerText="以字母开头,总共6~8位";
				return false;
			}
			}
		 
		
	 	
		</script>
	</body>
</html>