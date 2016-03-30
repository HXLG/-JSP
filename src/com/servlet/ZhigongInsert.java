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

public class ZhigongInsert extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String zhigongid=request.getParameter("zhigongid");
		String name=request.getParameter("name");
		String sex=request.getParameter("sex");
		String bumen=request.getParameter("bumen");
		String chuqing=request.getParameter("chuqing");
		int gongzi=Integer.parseInt(request.getParameter("gongzi"));
		String tel=request.getParameter("tel");
		
		try{
			Connection cn=Database.getconnect();
			String sql="insert into zhigong values(?,?,?,?,?,?,?)";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, zhigongid);
			ps.setString(2, name);
			ps.setString(3, sex);
			ps.setString(4, bumen);
			ps.setString(5, chuqing);
			ps.setInt(6, gongzi);
			ps.setString(7, tel);
			int n=ps.executeUpdate();
			if(n>0){
				response.sendRedirect("zhigongselect.jsp");
			}
			else{
				System.out.println("ÃÌº” ß∞‹");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
