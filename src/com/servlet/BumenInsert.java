package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.Database;

public class BumenInsert extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String bumenid=request.getParameter("bumenid");
		String bumenname=request.getParameter("bumenname");
		String zhiwu=request.getParameter("zhiwu");
		String name=request.getParameter("name");
		
		try{
			Connection cn=Database.getconnect();
			String sql="insert into bumen values(?,?,?,?)";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, bumenid);
			ps.setString(2, bumenname);
			ps.setString(3, zhiwu);
			ps.setString(4, name);
			int n=ps.executeUpdate();
			if(n>0){
				response.sendRedirect("bumenselect.jsp");
			}
			else{
				System.out.println("ÃÌº” ß∞‹");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
