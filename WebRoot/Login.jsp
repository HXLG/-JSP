<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
   <style>
		body{margin:0px;padding:0px}
	</style>
  </head>
  
  <body >
  <img border='0' src='img/1.jpg' width='100%' height='100%' style='position: absolute;left:0px;top:0px;z-index: -1'>
  <h1 align="center">欢迎登录XXX小区物业管理信息系统</h1>
   	<form action="Login.bin" method="post">
   		<table align="center">
   			<tr> 
   				<td>帐号：</td><td><input type="text" name="userid"/></td>
   			</tr>
   			<tr>
   				<td>密码：</td><td><input type="password" name="password"/></td>
   			</tr>
   			<tr>
   			<td>
   				<select name="type">
   					<option value="">请选择身份</option>
   					<option value="1">管理员</option>
   					<option value="0">业主</option>
   				</select>
   			</td>
   			<td align="center"><input width="7" type="submit" value="登录"/></td>
   			</tr>
   			
   		</table>
   		
   	</form>
  </body>
</html>
