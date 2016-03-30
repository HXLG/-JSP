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

public class ZhuhuInsert extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String zhuhuid=request.getParameter("zhuhuid");
		String name=request.getParameter("name");
		String sex=request.getParameter("sex");
		String idcard=request.getParameter("idcard");
		String fangxing=request.getParameter("fangxing");
		double mianji=Double.parseDouble(request.getParameter("mianji"));
		String tel=request.getParameter("tel");
		
		try{
			Connection cn=Database.getconnect();
			String sql="insert into zhuhu values(?,?,?,?,?,?,?)";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, zhuhuid);
			ps.setString(2, name);
			ps.setString(3, sex);
			ps.setString(4, idcard);
			ps.setString(5, fangxing);
			ps.setDouble(6, mianji);
			ps.setString(7, tel);
			int n=ps.executeUpdate();
			if(n>0){
				response.sendRedirect("zhuhuselect.jsp");
			}
			else{
				System.out.println("ÃÌº” ß∞‹");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
