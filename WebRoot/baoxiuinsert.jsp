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
    
    <title>My JSP 'baoxiuinsert.jsp' starting page</title>
    
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
		int yhbh=0;
		int bxbh=0;
		ResultSet rs=st.executeQuery("select max(baoxiuid) from baoxiu");
		if(rs.next()){bxbh=rs.getInt(1)+1;};
		ResultSet rs2=st.executeQuery("select max(nameid) from user");
		if(rs2.next()){yhbh=rs2.getInt(1)+1;};
	 %>
  </head>
  
  <body>
    	<h2 align="center">报修信息添加</h2>
    <form action="BaoxiuInsert.bin" method="post">
    	<table align="center">
    		<tr align="center">
    			<td>报修编号： </td>
    			<td><input type="text" readonly="readonly" name="baoxiuid" value="<%=bxbh %>" /></td>
    		</tr>
    		<tr align="center">
    			<td>报修人：</td>
    			<td><input type="text" name="name"   /></td>
    		</tr>
    		<tr align="center">
    			<td>报修日期：</td>
    			<td><input type="text" name="date"  /></td>
    		</tr>
    		<tr align="center">
    			<td>报修内容：</td>
    			<td><input type="text" name="neirong" /></td>
    		</tr>
    		<tr align="center">
    			<td>电话：</td>
    			<td><input type="text" name="tel" /></td>
    		</tr>
    		<tr align="center">
    			<td>维修人：</td>
    			<td><input type="text" name="weixiuname"  /></td>
    		</tr>
    		<tr align="center">
    			<td>完成时间：</td>
    			<td><input type="text" name="wanchengdate"  /></td>
    		</tr>
    		<tr align="center">
    			<td>报修费用：</td>
    			<td><input type="text" name="feiyong"  /></td>
    		</tr>
    		<tr align="center">
    			<td>处理情况：</td>
    			<td><input type="text" name="qingkuang" /></td>
    		</tr>
    		<tr align="center">
    			<td>用户编号：</td>
    			<td><input type="text" readonly="readonly" name="nameid"  value="<%=yhbh %>"/></td>
    		</tr>
    		<tr><td><input type="submit" value="确定添加" /></td></tr>
    	</table>
    </form>
  </body>
</html>
