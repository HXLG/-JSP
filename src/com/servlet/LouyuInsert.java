package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import com.util.Database;

public class LouyuInsert extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String louyuid=request.getParameter("louyuid");
		String leibie=request.getParameter("leibie");
		String chaoxiang=request.getParameter("chaoxiang");
		int censhu=Integer.parseInt(request.getParameter("censhu"));
		double mianji=Double.parseDouble(request.getParameter("mianji"));
		
		try{
			Connection cn=Database.getconnect();
			String sql="insert into louyu values(?,?,?,?,?)";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, louyuid);
			ps.setString(2, leibie);
			ps.setString(3, chaoxiang);
			ps.setInt(4, censhu);
			ps.setDouble(5, mianji);
			int n=ps.executeUpdate();
			if(n>0){
				response.sendRedirect("louyuselect.jsp");
			}
			else{
				System.out.println("ÃÌº” ß∞‹");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
