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

public class TousuUpdate extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String tousuid=request.getParameter("tousuid");
		String name=request.getParameter("name");
		String date=request.getParameter("date");
		String neirong=request.getParameter("neirong");
		String tel=request.getParameter("tel");
		String chuliname=request.getParameter("chuliname");
		String chulidate=request.getParameter("chulidate");
		String qingkuang=request.getParameter("qingkuang");
		int nameid=Integer.parseInt(request.getParameter("nameid"));
		
		try{
			Connection cn=Database.getconnect();
			String sql="update tousu set name=?,date=?,neirong=?,tel=?,chuliname=?,chulidate=?,qingkuang=?,nameid=? where tousuid=?";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, date);
			ps.setString(3, neirong);
			ps.setString(4, tel);
			ps.setString(5, chuliname);
			ps.setString(6, chulidate);
			ps.setString(7, qingkuang);
			ps.setInt(8, nameid);
			ps.setString(9, tousuid);
			int n=ps.executeUpdate();
			if(n>0){
				response.sendRedirect("toususelect.jsp");
			}
			else{
				System.out.println("¸üÐÂÊ§°Ü");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
