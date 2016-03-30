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
    
    <title>My JSP 'myinfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<%
		request.setCharacterEncoding("gb2312");
		String nameid2=request.getParameter("nameid");
		ResultSet rs=st.executeQuery("select * from user where nameid='"+nameid+"'");
		rs.next();
		
	 %>
  </head>
  
  <body>
  <br/>
    <h1 align="center">我的帐号</h1>
    <table align="center">
    	<tr>
    		<td>账户编号：</td><td><input type="text" readonly="readonly" value="<%=rs.getInt(1) %>"/></td>
    	</tr>
    	<tr>
    		<td>账户名称：</td><td><input type="text" readonly="readonly" value="<%=rs.getString(2) %>"/></td>
    	</tr>
    	<tr>
    		<td>账户密码：</td><td><input type="text" readonly="readonly" value="<%=rs.getString(3) %>"/></td>
    	</tr>
    	<tr>
    		<td>账户类型：</td><td><input type="text" readonly="readonly" value="<%=rs.getInt(4) %>"/></td>
    	</tr>
    </table>
    
  </body>
</html>
