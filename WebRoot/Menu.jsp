<%@ page contentType="text/html;charset=utf-8" %>
<%@page import="java.sql.*"%>
<%@page import="com.util.*"%>
<html>
    <head>
        <link rel="stylesheet" href="css/products.css" type="text/css">

    </head>
	
	<body>
		<div id="title">
			<div id="item">
 <ul>
          <%
        
      		 String  nameid = (String)session.getAttribute("nameid");
      		 Connection cn=Database.getconnect();
      		 Statement st=cn.createStatement();
      		 ResultSet rs2=st.executeQuery("select * from user where nameid='"+nameid+"'");
      		 rs2.next();
      		 String username=rs2.getString(2);
         
       %>
          
            <li>您好，<%=username %>欢迎来到小区物业管理系统！</li>

				
				<li id="plac"></li>
				<li><a href="myinfo.jsp?nameid=<%=nameid %>">我的帐号</a></li>
				<li id="plac"></li>
				<li><a href="mytousu.jsp?nameid=<%=nameid %>">我的投诉</a></li>
				<li id="plac"></li>
				<li><A href="mybaoxiu.jsp?nameid=<%=nameid %>">我的报修</A></li>
				<li id="plac"></li>
				<li><a href="mimaxiugai.jsp">修改密码</a></li>
				
				<li><a href="index.jsp">退出系统</a></li>
				</ul>
			</div>
		</div>
	</body>
</html>
