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
    
    <title>My JSP 'baoxiushow.jsp' starting page</title>
    
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
  <br>
    <h2 align="center">报修信息</h2>
   	<table width="100%" align="center" border="1">
    	<tr><th>报修编号</th><th>报修人</th><th>报修日期</th><th>报修内容</th><th>电话</th><th>维修人</th><th>维修时间</th><th>维修费用</th><th>处理情况</th></tr>
    	<%
    		
			ResultSet rs=st.executeQuery("select * from baoxiu");
			while(rs.next()){
    	 %>
    	 <tr>
    	 	<td align="center"><%=rs.getString(1) %></td>
    	 	<td align="center"><%=rs.getString(2) %></td>
    	 	<td align="center"><%=rs.getString(3) %></td>
    	 	<td align="center"><%=rs.getString(4) %></td>
    	 	<td align="center"><%=rs.getString(5) %></td>
			<td align="center"><%=rs.getString(6) %></td>
    	 	<td align="center"><%=rs.getString(7) %></td>
    	 	<td align="center"><%=rs.getInt(8) %></td>
    	 	<td align="center"><%=rs.getString(9) %></td>
    	 </tr>
    	 <%} %>
    </table>
  </body>
</html>
