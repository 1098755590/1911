// 鼠标移动到小米手机上显示third
function show_nav(){
	 // console.log("鼠标悬浮");
	 var  th1=document.getElementById("third_id");
	 th1.style.display="block";
}
function hid_nav(){
	 var  th1=document.getElementById("third_id");
	 th1.style.display="none";
}
 var i=0;
setInterval(function(){
	 var lb_div=document.getElementById("max2_id");
	 var max_id=document.getElementById("max_id");
	 
	 var max_width=max_id.offsetWidth;  //获得宽
	 var max_left=max_id.offsetLeft;   //获得左边距
	 // console.log(max_width+"---"+max_left);
	 // console.log(lb_div.style.left);
	 
	 // lb_div.style.left=lb_div.offsetLeft-(1240+max_left)+"px";
	 // i++;
	 // if(i==5){
  //    i=0;
	 // lb_div.style.left=0+"px";
	 // }
	 i=1;
	 lb_div.style.left=-(i * 1240)+"px";
	 i++;
}
,2000);
// 第五部分,滚动条上的文字
function hid_fif(){
	var hid_div=document.getElementById("fif_gh_id");
	// console.log(hid_div);
	hid_div.style.display="none";
}
function show_fif(){
	 var div1=document.getElementById("fif_gh_id");
	 div1.style.display="block";
}
// 翻页
