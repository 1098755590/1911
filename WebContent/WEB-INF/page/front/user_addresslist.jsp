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

	<script type="text/html" id='useraddresslist_bar'>
<button class="layui-btn"  onclick="address_add()" >增加地址</button>   
<button class="layui-btn"  onclick="address_del()">删除地址</button>
<button class="layui-btn"  onclick="address_update()">更改地址</button>  
</script>
<script type="text/html" id="barDemo1">
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">封号</a>
</script>
<script type="text/html" id="barDemo2">
  <a class="layui-btn layui-btn-xs" lay-event="edit">解封</a>
</script>
<table class="layui-table"
		lay-data="{url:'getAddress',toolbar:'#useraddresslist_bar',id:'addresslist',page:true}"
		lay-filter="usertable">
		<thead>
			<tr>
				<th lay-data="{type:'radio'}"></th>
				<!-- <th lay-data="{field:'addressid'}">收货地址ID</th>  -->
				<th lay-data="{field:'addressname'}">收货地址</th>
				
			</tr>
		</thead>
	</table>
	<!-- 弹出层 -->
	<div hidden id="update_address_div">
	    <span style="margin-left:38px;">省份:</span> <select id="a1" onchange="addOption()" ></select>
        市/县:<select id="a2"></select>
		<div class="layui-form-item">
			<label class="layui-form-label">详细地址</label>
			<div class="layui-input-inline">
				<input type="text" id="update_name" name="addressname"
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

	function address_del() {
		//点击一下获取数据行
		//console.log("123");
		var checkStatus = table.checkStatus('addresslist');
		// console.log(checkStatus.data);
		var checkdata = table.checkStatus('addresslist').data;
		//已选中		
		if (checkdata.length > 0) {
			// console.log(checkStatus);
			//获取ID -- 传到Servlet-- 删除数据
			var checkid = checkdata[0].addressid;
			//重新加载列表
			$.post("del_user_address", {				
				"addressid" : checkid
			}, function() {
				layer.msg("删除成功");
				table.reload("addresslist");
			});

		} else {
			layer.msg("请先选中数据");
		}
		//未选中,提示需要选中
	}

	function address_update() {
		//弹出对话框
		//alert("123");
		var checkStatus = table.checkStatus('addresslist');
		var checkdata = table.checkStatus('addresslist').data;
		//console.log(checkdata);
		if (checkdata.length > 0) {
			var checkid = checkStatus.data[0].addressid;
			$("#update_name").val(checkdata[0].addressname);
			layer.open({
				title : "修改信息",
				type : 1,
				content : $("#update_address_div"),
				btn : [ "保存", "关闭" ],
				btn1 : function() {
					//layer.msg("点击保存按钮");				
					$.post("update_user_address", {
				
						"addressid" : checkid,
						"addressname" : $("#update_name").val(),
						 "a1"        :$("#a1").val(),
					      "a2"        :$("#a2").val(),
					
					}, function() {
						//关闭窗口,
						layer.closeAll();
						layer.msg("修改成功");
						//列表刷新
						table.reload("addresslist");
					});
				}

			});
		} else {
			layer.msg("请先选中数据");
		}

	}
	var city = new Array;        
	city['江苏'] = ['南京','苏州','无锡','常州','镇江','连云港 ','扬州','徐州 ','南通','盐城','淮阴','泰州','宿迁'];        
	city['山东'] = ['济南','青岛','淄博','德州','烟台','潍坊','济宁','泰安','临沂','菏泽','威海','枣庄','日照','莱芜'];
	city['北京'] = ['东城区','西城区','崇文区','宣武区','朝阳区','海淀区','丰台区','石景山'];
	city['天津'] = ['和平','河北','河西','河东','南开','红桥','塘沽','汉沽','大港','东丽','西青','津南','北辰','武清'];
	city['上海'] = ['宝山','金山','南市','长宁','静安','青浦','崇明','卢湾','松江','奉贤','浦东','杨浦','虹口','普陀'];
	city['四川'] = ['成都','自贡','攀枝花','泸州','德阳','绵阳','广元','遂宁','内江','乐山','南充  ','宜宾','广安','达川','巴中','雅安'];
	
	function allCity() {            
	  var select1 = document.getElementById("a1");            
	  for(var i in city) {  //这里注意遍历数组的写法
	    select1.add(new Option(i, i), null);
	  }   
	  addOption(); // 初始化选项     
	}        
	function addOption() {            
	  var select2 = document.getElementById("a2");
	  var select1 = document.getElementById("a1").value; 
	  select2.length = 0; //每次都先清空一下市级菜单  
	  if(select1 != '请选择省份') {                
	    for(var i in city[select1 ]) {    
	      select2.add(new Option(city[select1][i], city[select1][i]), null);                
	    }            
	  }else if (sheng == '请选择省份'){              
	    select2.length = 0;           
	    select2.add(new Option("请选择城市", "请选择城市"), null); 
	  }      
	}       
	window.onload = allCity();
	function address_add() {
		//alert("12");
		layer.open({
			title : "增加信息",
			type : 1,
			content : $("#update_address_div"),
			btn : [ "保存", "关闭" ],
			btn1 : function() {
				//layer.msg("点击保存按钮");				
				$.post("add_user_address", {
				    
					      "a1"        :$("#a1").val(),
					      "a2"        :$("#a2").val(),
					"addressname" : $("#update_name").val(),
					
				}, function() {
					//关闭窗口,
					layer.closeAll();
					layer.msg("增加成功");
					//列表刷新
					table.reload("addresslist");
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