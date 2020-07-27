<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
 margin: 0;
 padding: 0;
 }
 a{
 color: #666;
 text-decoration: none;
 }
 body{
 padding:20px;
 color: #666;
 }
 .fl{
 float: left;
 }
 .fr{
 float: right;
 }
 table{
 border-collapse: collapse;
 border-spacing: 0;
 border: 0;
 text-align: center;
 width: 937px;
 }
 th,td{
 border: 1px solid #cadeff;
 }
 th{
 background: #e2f2ff;
 border-top: 3px solid #a7cbff;
 height: 30px;
 }
 td{
 padding: 10px;
 color: #444;
 }
 tbody tr:hover{
 background: RGB(238,246,255);
 }
 .checkbox{width: 60px;}
 .goods{width: 300px;}
 .goods span{
 width: 180px;
 margin-top: 20px;
 text-align: left;
 float: left;
 }
 .price{width: 130px;}
 .count{width: 90px;}
 .count .add, .count input, .count .reduce{
 float: left;
 margin-left: -1px;
 position: relative;
 z-index: 0;
 }
 .count .add, .count .reduce{
 height: 23px;
 width: 17px;
 border: 1px solid #e5e5e5;
 background: #f0f0f0;
 text-align: center;
 line-height: 23px;
 color: #444;
 }
 .count .add:hover, .count .reduce:hover{
 color: #f50;
 z-index: 3;
 border-color: #f60;
 cursor: pointer;
 }
 .count input{
 width: 50px;
 height: 15px;
 line-height: 15px;
 border: 1px solid #aaa;
 color: #343434;
 text-align: center;
 padding: 4px 0;
 background-color: #fff;
 z-index: 2;
 }
 .subtotal{
 width: 150px;
 color: red;
 font-weight: bold;
 }
 .operation{width: 80px;}
 .operation span:hover, .a:hover{
 cursor: pointer;
 color: red;
 text-decoration: underline;
 }
 img{
 width: 100px;
 height: 80px;
 margin-right: 10px;
 float: left;
 }
 .foot{
 width: 935px;
 margin-top: 10px;
 color: #666;
 height: 48px;
 border: 1px solid #c8c8c8;
 background-image: linear-gradient(RGB(241,241,241),RGB(226,226,226));
 position: relative;
 z-index: 8;
 }
 .foot div, .foot a{
 line-height: 48px;
 height: 48px;
 }
 .foot .select-all{
 width: 100px;
 height: 48px;
 line-height: 48px;
 padding-left: 5px;
 color: #666;
 }
 .foot .closing{
 border-left: 1px solid #c8c8c8;
 width: 100px;
 text-align: center;
 color: #000;
 font-weight: bold;
 background: RGB(238,238,238);
 cursor: pointer;
 }
 .foot .total{
 margin: 0 20px;
 cursor: pointer;
 }
 .foot #priceTotal, .foot #selectedTotal{
 color: red;
 font-family: "微软雅黑";
 font-weight: bold;
 }
 .foot .select{
 cursor: pointer;
 }
 .foot .select .arrow{
 position: relative;
 top: -3px;
 margin-left: 3px;
 }
 .foot .select .down{
 position: relative;
 top: 3px;
 display: none;
 }
 .show .select .down{
 display: inline;
 }
 .show .select .up{
 display: none;
 }
 .foot .select:hover .arrow{
 color: red;
 }
 .foot .selected-view{
 width: 935px;
 border: 1px solid #c8c8c8;
 position: absolute;
 height: auto;
 background: #fff;
 z-index: 9;
 bottom: 48px;
 left: -1px;
 display: none;
 }
 .show .selected-view{display: block;}
 .foot .selected-view div{height: auto;}
 .foot .selected-view .arrow{
 font-size: 16px;
 line-height: 100%;
 color: #c8c8c8;
 position: absolute;
 right: 330px;
 bottom: -9px;
 }
 .foot .selected-view .arrow span{
 color: #fff;
 position: absolute;
 left: 0;
 bottom: 1px;
 }
 #selectedViewList{
 padding: 20px;
 margin-bottom: -20px;
 }
 #selectedViewList div{
 display: inline-block;
 position: relative;
 width: 100px;
 height: 80px;
 border: 1px solid #ccc;
 margin: 10px;
 }
 #selectedViewList div span{
 display: none;
 color: #fff;
 font-size: 12px;
 position: absolute;
 top: 0;
 right: 0;
 width: 60px;
 height: 18px;
 line-height: 18px;
 text-align: center;
 background: RGBA(0,0,0,.5);
 cursor: pointer;
 }
 #selectedViewList div:hover span{
 display: block;
 }
</style>
</head>
<body>
<table id="cartTable">
 <thead>
 <tr>
 <th><label><input class="check-all check" type="checkbox"/> 全选</label></th>
 <th>商品</th>
 <th>单价</th>
 <th>数量</th>
 <th>小计</th>
 <th>操作</th>
 </tr>
 </thead>
 <tbody>
 <tr>
 <td class="checkbox"><input class="check-one check" type="checkbox" /></td>
 <td class="goods"><img src="img/top_phone/3.png" alt="" /><span>Casio/卡西欧 EX-TR350</span></td>
 <td class="price">5999.88</td>
 <td class="count"><span class="reduce"></span><input class="count-input" type="text" value="1"/><span class="add">+</span></td>
 <td class="subtotal">5999.88</td>
 <td class="operation"><span class="delete">删除</span></td>
 </tr>
 <tr>
 <td class="checkbox"><input class="check-one check" type="checkbox" /></td>
 <td class="goods"><img src="img/top_phone/3.png" alt="" /><span>Canon/佳能 PowerShot SX50 HS</span></td>
 <td class="price">3888.50</td>
 <td class="count"><span class="reduce"></span><input class="count-input" type="text" value="1"/><span class="add">+</span></td>
 <td class="subtotal">3888.50</td>
 <td class="operation"><span class="delete">删除</span></td>
 </tr>
 <tr>
 <td class="checkbox"><input class="check-one check" type="checkbox" /></td>
 <td class="goods"><img src="img/top_phone/3.png" alt="" /><span>Sony/索尼 DSC-WX300</span></td>
 <td class="price">1428.50</td>
 <td class="count"><span class="reduce"></span><input class="count-input" type="text" value="1"/><span class="add">+</span></td>
 <td class="subtotal">1428.50</td>
 <td class="operation"><span class="delete">删除</span></td>
 </tr>
 <tr>
 <td class="checkbox"><input class="check-one check" type="checkbox" /></td>
 <td class="goods"><img src="img/top_phone/3.png" alt="" /><span>Fujifilm/富士 instax mini 25</span></td>
 <td class="price">640.60</td>
 <td class="count"><span class="reduce"></span><input class="count-input" type="text" value="1"/><span class="add">+</span></td>
 <td class="subtotal">640.60</td>
 <td class="operation"><span class="delete">删除</span></td>
 </tr>
 </tbody>
</table>
<div class="foot" id="foot">
 <label class=" fl select-all"><input type="checkbox" class="check-all check" /> 全选</label>
 <a class="fl delete" id="deleteAll" href="javascript:;" rel="external nofollow" >删除</a>
 <div class="fr closing">结 算</div>
 <div class="fr total">合计：￥<span id="priceTotal">0.00</span></div>
 <div class="fr select" id="selected">已选商品<span id="selectedTotal">0</span>件<span class="arrow up">︽</span><span class="arrow down">︾</span></div>
 <div class="selected-view">
 <div id="selectedViewList" class="clearfix">
 <div><img src="img/top_phone/3.png" ><span>取消选择</span></div>
 </div>
 <span class="arrow">◆<span>◆</span></span>
 </div>
</div>
<script src="js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
var cartTable = document.getElementById('cartTable');
var tr = cartTable.children[1].rows;//获取table下的tbody下的每一行
var checkInputs = document.getElementsByClassName('check');
var checkAllInputs = document.getElementsByClassName('check-all');
var selectedTotal = document.getElementById('selectedTotal');
var priceTotal = document.getElementById('priceTotal');
//计算总数和价格
function getTotal(){
var selected = 0;
var price = 0;
for(var i=0;i < tr.length; i++){
if(tr[i].getElementsByTagName('input')[0].checked){
 selected += parseInt(tr[i].getElementsByTagName('input')[1].value);
 price += parseFloat(tr[i].cells[4].innerHTML);//cells属性为获得tr下面的td
}
}
selectedTotal.innerHTML = selected;
priceTotal.innerHTML = price.toFixed(2);//保留两位小数
}
for(var i=0;i<checkInputs.length;i++){
checkInputs[i].onclick = function(){
if(this.className === 'check-all check'){//如果点击的是全选按钮，则使所有按钮的状态和它相同
 for(var j=0;j<checkInputs.length;j++){
 checkInputs[j].checked = this.checked;
 }
}
if(this.checked == false){//如果其中一个变为未选中状态，则使全选按钮取消选中
 for(var i=0;i<checkAllInputs.length;i++){
 checkAllInputs[i].checked = false;
 }
}
getTotal();
}
}
function getTotal(){
	 var selected = 0;
	 var price = 0;
	 var HTMLstr = '';
	 for(var i=0;i < tr.length; i++){
	 if(tr[i].getElementsByTagName('input')[0].checked){
	  tr[i].className = 'on';
	  selected += parseInt(tr[i].getElementsByTagName('input')[1].value);
	  price += parseFloat(tr[i].cells[4].innerHTML);//cells属性为获得tr下面的td
	  HTMLstr += '<div><img src="'+ tr[i].getElementsByTagName('img')[0].src + '"><span>取消选择</span></div>';
	 }
	 else{
	  tr[i].className = '';
	 }
	 }
	 selectedTotal.innerHTML = selected;
	 priceTotal.innerHTML = price.toFixed(2);//保留两位小数
	 selectedViewList.innerHTML = HTMLstr;
	 if(selected == 0){
	 foot.className = 'foot';
	 }
	 }
	 for(var i=0;i<checkInputs.length;i++){
	 checkInputs[i].onclick = function(){
	 if(this.className === 'check-all check'){//如果点击的是全选按钮，则使所有按钮的状态和它相同
	  for(var j=0;j<checkInputs.length;j++){
	  checkInputs[j].checked = this.checked;
	  }
	 }
	 if(this.checked == false){//如果其中一个变为未选中状态，则使全选按钮取消选中
	  for(var i=0;i<checkAllInputs.length;i++){
	  checkAllInputs[i].checked = false;
	  }
	 }
	 getTotal();
	 }
	 }
	 
	 selected.onclick = function(){
	 if(foot.className == 'foot'){
	 if(selectedTotal.innerHTML != 0){
	  foot.className = 'foot show';
	 }
	 }else{
	 foot.className = 'foot';
	 }
	 }
	 selectedViewList.onclick = function(e){
		  var el = e.srcElement;
		  if(el.className == 'del'){
		  var index = el.getAttribute('index');
		  var input = tr[index].getElementsByTagName('input')[0];
		  input.checked = false;
		  input.onclick();
		  }
		 }
	 
	//增减商品数量事件代理
	 for(var i=0;i<tr.length;i++){
	  tr[i].onclick = function(e){
	  e = e|| window.event;
	  var el = e.srcElement;
	  var cls = el.className;
	  var input = this.getElementsByTagName('input')[1];
	  var val = parseInt(input.value);
	  var reduce = this.getElementsByTagName('span')[1];
	  switch (cls){
	   case 'add':
	   input.value = val + 1;
	   reduce.innerHTML = '-';
	   getsubTotal(this);
	   break;
	   case 'reduce':
	   if(val > 1){
	    input.value = val - 1;
	     getsubTotal(this);
	   }else{
	    reduce.innerHTML = '';
	   }
	  }
	  getTotal();
	  }
	  tr[i].getElementsByTagName('input')[1].onkeyup = function(){
	  var val = parseInt(this.value);
	  var tr = this.parentNode.parentNode;//this指的是当前的input，其父节点的父节点就是当前的tr
	  var reduce = tr.getElementsByTagName('span')[1];
	  if(isNaN(val) || val < 1){
	   val = 1;
	  }
	  this.value = val;//保证输入框中都是大于1的纯数字
	  if(val <= 1){
	   reduce.innerHTML = '';
	  }
	  else{
	   reduce.innerHTML = '-';
	  }
	
	  getsubTotal(tr);
	  
	  getTotal();
	  
	  } 
	 
	 }
	
	//删除商品
	 deleteAll.onclick = function(){
	  if(selectedTotal.innerHTML != '0'){
	  var conf = confirm("确定要删除所选商品吗");
	  if(conf){
	   for(var i=0;i<tr.length;i++){
	   var input = tr[i].getElementsByTagName('input')[0];
	   if(input.checked){
	    tr[i].parentNode.removeChild(tr[i]);
	    i --;//因为删除数组中的一个后，后面的索引就会向前移，此时要让i也向前移一个，回置下标i
	   }
	   }
	   getTotal();
	  }
	  }
	 }

</script>
</body>
</html>