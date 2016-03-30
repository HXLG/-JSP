<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.util.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'zhuhuinsert.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<%
		Connection cn=Database.getconnect();
		Statement st=cn.createStatement(); 
		ResultSet rs=st.executeQuery("select max(zhuhuid) from zhuhu");
		rs.next();
	 %>
  </head>
  
  <body>
     <h2 align="center">住户信息添加</h2>
    <form action="ZhuhuInsert.bin" method="post">
    	<table align="center">
    		<tr>
    			<td>住户编号：</td><td><input type="text" name="zhuhuid" readonly="readonly" value="<%=rs.getInt(1)+1 %>" /></td>
    		</tr>
    		<tr>
    			<td>姓名：</td><td><input type="text" name="name" /></td>
    		</tr>
    		<tr>
    			<td>性别：</td><td><input type="text" name="sex" /></td>
    		</tr>
    		<tr>
    			<td>身份证号：</td><td><input type="text" name="idcard" /></td>
    		</tr>
    		<tr>
    			<td>房型：</td><td><input type="text" name="fangxing" /></td>
    		</tr>
    		<tr>
    			<td>面积：</td><td><input type="text" name="mianji" /></td>
    		</tr>
    		<tr>
    			<td>电话：</td><td><input type="text" name="tel" /></td>
    		</tr>
    		<tr><td><input type="submit" value="确定添加" /></td></tr>
    	</table>
    </form>
  </body>
</html>
