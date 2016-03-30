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
    
    <title>My JSP 'bumeninsert.jsp' starting page</title>
    
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
		ResultSet rs=st.executeQuery("select max(bumenid) from bumen");
		rs.next();

	 %>
  </head>
  
  <body>
    <h2 align="center">部门信息添加</h2>
    <form action="BumenInsert.bin" method="post" name="f1"> 
    	<table align="center">
    		<tr align="center">
    			<td>部门编号：</td>
    			<td><input type="text" readonly="readonly" name="bumenid" value=<%=rs.getInt(1)+1 %> /></td>
    		</tr>
    		<tr align="center">
    			<td>部门名称：</td>
    			<td><input type="text" name="bumenname" /></td>
    		</tr>
    		<tr align="center">
    			<td>职务：</td>
    			<td><input type="text" name="zhiwu" /></td>
    		</tr>
    		<tr align="center">
    			<td>姓名：</td>
    			<td><input type="text" name="name"  /></td>
    		</tr>
    		<tr align="center"><td><input type="submit" value="确定添加" /></td></tr>
    	</table>
    </form>
  </body>
</html>
