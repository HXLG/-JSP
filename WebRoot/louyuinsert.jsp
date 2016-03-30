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
    
    <title>My JSP 'louyuinsert.jsp' starting page</title>
    
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
		ResultSet rs=st.executeQuery("select max(louyuid) from louyu");
		rs.next();
	 %>
  </head>
  
  <body>
    <h2 align="center">楼宇信息添加</h2>
    <form action="LouyuInsert.bin" method="post">
    	<table align="center">
    		<tr>
    			<td>楼号：</td><td><input type="text" name="louyuid" readonly="readonly" value="<%=rs.getInt(1)+1 %>" /></td>
    		</tr>
    		<tr>
    			<td>类别：</td><td><input type="text" name="leibie" /></td>
    		</tr>
    		<tr>
    			<td>朝向：</td><td><input type="text" name="chaoxiang" /></td>
    		</tr>
    		<tr>
    			<td>层数：</td><td><input type="text" name="censhu" /></td>
    		</tr>
    		<tr>
    			<td>面积：</td><td><input type="text" name="mianji" /></td>
    		</tr>
    		<tr><td><input type="submit" value="确定添加" /></td></tr>
    	</table>
    </form>
  </body>
</html>
