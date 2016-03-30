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
    
    <title>My JSP 'tousuupdate.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<%
		String tousuid=request.getParameter("id");
		Connection cn=Database.getconnect();
		PreparedStatement ps=cn.prepareStatement("select * from tousu where tousuid=?");
		ps.setString(1, tousuid);
		ResultSet rs=ps.executeQuery();
		rs.next();
		
	 %>
  </head>
  	<h2 align="center">投诉信息修改</h2>
    <form action="TousuUpdate.bin" method="post" name="f1"> 
    	<table align="center">
    		<tr align="center">
    			<td>投诉编号： </td>
    			<td><input type="text" readonly="readonly" name="tousuid" value=<%=rs.getString(1) %> /></td>
    		</tr>
    		<tr align="center">
    			<td>投诉人：</td>
    			<td><input type="text" name="name" value=<%=rs.getString(2) %> /></td>
    		</tr>
    		<tr align="center">
    			<td>投诉日期：</td>
    			<td><input type="text" name="date" value=<%=rs.getString(3) %> /></td>
    		</tr>
    		<tr align="center">
    			<td>投诉内容：</td>
    			<td><input type="text" name="neirong" value=<%=rs.getString(4) %> /></td>
    		</tr>
    		<tr align="center">
    			<td>电话：</td>
    			<td><input type="text" name="tel" value=<%=rs.getString(5) %> /></td>
    		</tr>
    		<tr align="center">
    			<td>处理人：</td>
    			<td><input type="text" name="chuliname" value=<%=rs.getString(6) %> /></td>
    		</tr>
    		<tr align="center">
    			<td>处理时间：</td>
    			<td><input type="text" name="chulidate" value=<%=rs.getString(7) %> /></td>
    		</tr>
    		<tr align="center">
    			<td>处理情况：</td>
    			<td><input type="text" name="qingkuang" value=<%=rs.getString(8) %> /></td>
    		</tr>
    		<tr align="center">
    			<td>用户编号：</td>
    			<td><input type="text" name="nameid" readonly="readonly" value=<%=rs.getString(9) %> /></td>
    		</tr>
    		<tr align="center"><td><input type="submit" value="确定修改" /></td></tr>
    	</table>
    </form>
  <body>
    
  </body>
</html>
