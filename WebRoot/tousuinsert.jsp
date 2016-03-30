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
    
    <title>My JSP 'tousuinsert.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<%
		int tousuid=0;
		int nameid=0;
		Connection cn=Database.getconnect();
		Statement st=cn.createStatement(); 
		ResultSet rs=st.executeQuery("select max(tousuid) from tousu");
		if(rs.next()){
		tousuid=rs.getInt(1)+1;}
		ResultSet rs2=st.executeQuery("select max(nameid) from user");
		if(rs2.next()){
		nameid=rs2.getInt(1)+1;}
	 %>
  </head>
  
  <body>
   	<h2 align="center">投诉信息添加</h2>
    <form action="TousuInsert.bin" method="post">
    	<table align="center">
    		<tr align="center">
    			<td>投诉编号： </td>
    			<td><input type="text" readonly="readonly" name="tousuid" value="<%=tousuid %>" /></td>
    		</tr>
    		<tr align="center">
    			<td>投诉人：</td>
    			<td><input type="text" name="name"   /></td>
    		</tr>
    		<tr align="center">
    			<td>投诉日期：</td>
    			<td><input type="text" name="date"  /></td>
    		</tr>
    		<tr align="center">
    			<td>投诉内容：</td>
    			<td><input type="text" name="neirong" /></td>
    		</tr>
    		<tr align="center">
    			<td>电话：</td>
    			<td><input type="text" name="tel" /></td>
    		</tr>
    		<tr align="center">
    			<td>处理人：</td>
    			<td><input type="text" name="chuliname"  /></td>
    		</tr>
    		<tr align="center">
    			<td>处理时间：</td>
    			<td><input type="text" name="chulidate"  /></td>
    		</tr>
    		<tr align="center">
    			<td>处理情况：</td>
    			<td><input type="text" name="qingkuang" /></td>
    		</tr>
    		<tr align="center">
    			<td>用户编号：</td>
    			<td><input type="text" name="nameid" readonly="readonly" value="<%=nameid %>" /></td>
    		</tr>
    		<tr><td><input type="submit" value="确定添加" /></td></tr>
    	</table>
    </form>
  </body>
</html>
