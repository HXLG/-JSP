<%@page import="com.util.Database"%>
<%@page import="java.sql.*"%>
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
    
    <title>My JSP 'louyuselect.jsp' starting page</title>
    
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
  <Br/>
    <h2 align="center">楼宇信息</h2>
    <table width="80%" align="center" border="1">
    	<tr><th>楼号</th><th>类别</th><th>朝向</th><th>层数</th><th>面积</th><th>操作</th></tr>
    	<%
			ResultSet rs=st.executeQuery("select * from louyu");
			while(rs.next()){
    	 %>
    	 <tr>
    	 	<td align="center"><%=rs.getString(1) %></td>
    	 	<td align="center"><%=rs.getString(2) %></td>
    	 	<td align="center"><%=rs.getString(3) %></td>
    	 	<td align="center"><%=rs.getInt(4) %></td>
    	 	<td align="center"><%=rs.getDouble(5) %>&nbsp;平方米</td>
    	 	<td align="center">
	    	 	<a href="louyuupdate.jsp?id=<%=rs.getString(1) %>">修改</a>&nbsp;&nbsp;
	    	 	<a href="LouyuDelete.bin?id=<%=rs.getString(1) %>" onclick="return confirm('确定删除？')">删除</a>
    	 	</td>
    	 </tr>
    	 <%} %>
    </table>
    <p align="center"><input type="submit" value="楼宇信息增加" onclick="window.location.href='louyuinsert.jsp'"/></p>
  </body>
</html>
