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
    
    <title>My JSP 'baoxiuupdate.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<%
		String baoxiuid=request.getParameter("id");
		Connection cn=Database.getconnect();
		PreparedStatement ps=cn.prepareStatement("select * from baoxiu where baoxiuid=?");
		ps.setString(1, baoxiuid);
		ResultSet rs=ps.executeQuery();
		rs.next();
	 %>
  </head>
  
  <body>
  	<h2 align="center">报修信息修改</h2>
    <form action="BaoxiuUpdate.bin" method="post" name="f1"> 
    	<table align="center">
    		<tr align="center">
    			<td>报修编号： </td>
    			<td><input type="text" readonly="readonly" name="baoxiuid" value=<%=rs.getString(1) %> /></td>
    		</tr>
    		<tr align="center">
    			<td>报修人：</td>
    			<td><input type="text" name="name" value=<%=rs.getString(2) %> /></td>
    		</tr>
    		<tr align="center">
    			<td>报修日期：</td>
    			<td><input type="text" name="date" value=<%=rs.getString(3) %> /></td>
    		</tr>
    		<tr align="center">
    			<td>报修内容：</td>
    			<td><input type="text" name="neirong" value=<%=rs.getString(4) %> /></td>
    		</tr>
    		<tr align="center">
    			<td>电话：</td>
    			<td><input type="text" name="tel" value=<%=rs.getString(5) %> /></td>
    		</tr>
    		<tr align="center">
    			<td>维修人：</td>
    			<td><input type="text" name="weixiuname" value=<%=rs.getString(6) %> /></td>
    		</tr>
    		<tr align="center">
    			<td>维修时间：</td>
    			<td><input type="text" name="wanchengdate" value=<%=rs.getString(7) %> /></td>
    		</tr>
    		<tr align="center">
    			<td>维修费用：</td>
    			<td><input type="text" name="feiyong" value=<%=rs.getInt(8) %> /></td>
    		</tr>
    		<tr align="center">
    			<td>处理情况：</td>
    			<td><input type="text" name="qingkuang" value=<%=rs.getString(9) %> /></td>
    		</tr>
    		<tr align="center">
    			<td>用户编号：</td>
    			<td><input type="text" name="nameid" readonly="readonly" value=<%=rs.getString(10) %> /></td>
    		</tr>
    		<tr align="center"><td><input type="submit" value="确定修改" /></td></tr>
    	</table>
    </form>
  </body>
</html>
