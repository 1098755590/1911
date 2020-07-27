<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
td{
border:1px red solid;
}
td{
width:100px;
height:20px;
}
</style>
</head>
<body>
<!-- HTML注释 -->
<%-- JSP注释 --%>
<table>
<%for(int i=0;i<20;i++){
	%>

<tr><td></td><td></td><td></td></tr>
<%} %>
</table>

<form action="test1" method="post">
<input type="text" name="username">
<input type="text" name="password">
<button>提交</button>
</form>
</body>
</html>