<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="Menu.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'mimaxiugai.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<%
	String nameid2=(String)session.getAttribute("nameid");
 %>
  </head>
  
  <body>
  <form action="Pass.bin?nameid=<%=nameid2 %>" method="post">
  <br>
  <h1 align="center">密码修改</h1>
    <table align="center">
    	<tr>
    		<Td>请输入原密码：</Td><td><input type="password" name="oldpass" /></td>
    		<Td>请输入新密码：</Td><td><input type="password" name="newpass" /></td>
   			<td><input type="submit" value="确定修改"/></td>	
    	</tr>
    </table>
    </form>
  </body>
</html>
