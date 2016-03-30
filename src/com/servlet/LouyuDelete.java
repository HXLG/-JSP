package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import com.util.Database;

public class LouyuDelete extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String louyuid=request.getParameter("id");
		
		try{
			Connection cn=Database.getconnect();
			PreparedStatement ps=cn.prepareStatement("delete from louyu where louyuid=?");
			ps.setString(1, louyuid);
			int n=ps.executeUpdate();
			if(n>0){
				response.sendRedirect("louyuselect.jsp");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
