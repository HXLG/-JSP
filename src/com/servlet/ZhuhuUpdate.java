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

public class ZhuhuUpdate extends HttpServlet {

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
			String sql="update zhuhu set name=?,sex=?,idcard=?,fangxing=?,mianji=?,tel=? where zhuhuid=?";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, sex);
			ps.setString(3, idcard);
			ps.setString(4, fangxing);
			ps.setDouble(5, mianji);
			ps.setString(6, tel);
			ps.setString(7, zhuhuid);
			int n=ps.executeUpdate();
			if(n>0){
				response.sendRedirect("zhuhuselect.jsp");
			}
			else{
				System.out.println("¸üÐÂÊ§°Ü");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
