<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.util.Database"%>
<%@include file="Menu.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'zhigongselect.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   	<br/>
   	<h2 align="center">职工信息</h2>
   	<table width="90%" align="center" border="1">
    	<tr><th>职工编号</th><th>姓名</th><th>性别</th><th>部门</th><th>出勤</th><th>工资</th><th>电话</th><th>操作</th></tr>
    	<%
			ResultSet rs=st.executeQuery("select * from zhigong");
			while(rs.next()){
    	 %>
    	 <tr>
    	 	<td align="center"><%=rs.getString(1) %></td>
    	 	<td align="center"><%=rs.getString(2) %></td>
    	 	<td align="center"><%=rs.getString(3) %></td>
    	 	<td align="center"><%=rs.getString(4) %></td>
    	 	<td align="center"><%=rs.getString(5) %></td>
    	 	<td align="center"><%=rs.getDouble(6) %>&nbsp;元</td>
    	 	<td align="center"><%=rs.getString(7) %></td>
    	 	<td align="center">
	    	 	<a href="zhigongupdate.jsp?id=<%=rs.getString(1) %>">修改</a>&nbsp;&nbsp;
	    	 	<a href="ZhigongDelete.bin?id=<%=rs.getString(1) %>" onclick="return confirm('确定删除？')">删除</a>
    	 	</td>
    	 </tr>
    	 <%} %>
    </table>
    <p align="center"><input type="submit" value="职工信息增加" onclick="window.location.href='zhigonginsert.jsp'"/></p>
   	
  </body>
</html>
