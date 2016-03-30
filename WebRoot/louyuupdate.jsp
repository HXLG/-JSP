<%@page import="com.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'louyuupdate.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<%
		String louyuid=request.getParameter("id");
		Connection cn=Database.getconnect();
		PreparedStatement ps=cn.prepareStatement("select * from louyu where louyuid=?");
		ps.setString(1, louyuid);
		ResultSet rs=ps.executeQuery();
		rs.next();
		System.out.print(rs.getString(1));
	 %>
  </head>
  
  <body>
    <h2 align="center">楼宇信息修改</h2>
    <form action="ZhuhuUpdate.bin" method="post" name="f1"> 
    	<table align="center">
    		<tr align="center">
    			<td>楼号：</td>
    			<td><input type="text" readonly="readonly" name="louyuid" value=<%=rs.getString(1) %> /></td>
    		</tr>
    		<tr align="center">
    			<td>类型：</td>
    			<td><input type="text" name="leibie" value=<%=rs.getString(2) %> /></td>
    		</tr>
    		<tr align="center">
    			<td>朝向：</td>
    			<td><input type="text" name="chaoxiang" value=<%=rs.getString(3) %> /></td>
    		</tr>
    		<tr align="center">
    			<td>层数：</td>
    			<td><input type="text" name="censhu" value=<%=rs.getInt(4) %> /></td>
    		</tr>
    		<tr align="center">
    			<td>面积：</td>
    			<td><input type="text" name="mianji" value=<%=rs.getDouble(5) %> /></td>
    		</tr>
    		<tr align="center"><td><input type="submit" value="确定修改" /></td></tr>
    	</table>
    </form>
  </body>
</html>
