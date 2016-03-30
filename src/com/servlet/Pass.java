package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import com.util.Database;

public class Pass extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int nameid=Integer.parseInt(request.getParameter("nameid"));
		String oldpass=request.getParameter("oldpass");
		String newpass=request.getParameter("newpass");
		
		try{
			Connection cn=Database.getconnect();
			PreparedStatement ps=cn.prepareStatement("select * from user where password=? and nameid=?");
			ps.setString(1, oldpass);
			ps.setInt(2, nameid);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				PreparedStatement ps2=cn.prepareStatement("update user set password=? where nameid=?");
				ps2.setString(1, newpass);
				ps2.setInt(2, nameid);
				int n=ps2.executeUpdate();
				if(n>0){
					response.sendRedirect("Login.jsp");
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
