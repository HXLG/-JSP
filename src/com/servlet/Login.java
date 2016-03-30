package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;


import com.util.Database;

public class Login extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String userid=request.getParameter("userid");
		String password=request.getParameter("password");
		int type=Integer.parseInt(request.getParameter("type"));
		
		try{
			Connection cn=Database.getconnect();
			PreparedStatement ps=cn.prepareStatement("select userid,password,type,nameid from user where userid=? and password=? and type=?");
			ps.setString(1, userid);
			ps.setString(2, password);
			ps.setInt(3, type);
			ResultSet rs=ps.executeQuery();
			
			
			
			if(rs.next()){
				if(rs.getInt(3)==0){
					response.sendRedirect("MainA.jsp");
				}
				if(rs.getInt(3)==1){
					response.sendRedirect("MainB.jsp");
				}
				HttpSession session =request.getSession();
				session.setAttribute("nameid", rs.getString(4));
			}
			else{
				response.sendRedirect("Error.jsp");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
