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

public class ZhigongUpdate extends HttpServlet {

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
			String sql="update zhigong set name=?,sex=?,bumen=?,chuqing=?,gongzi=?,tel=? where zhigongid=?";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, sex);
			ps.setString(3, bumen);
			ps.setString(4, chuqing);
			ps.setInt(5, gongzi);
			ps.setString(6, tel);
			ps.setString(7, zhigongid);
			int n=ps.executeUpdate();
			if(n>0){
				response.sendRedirect("zhigongselect.jsp");
			}
			else{
				System.out.println("¸üÐÂÊ§°Ü");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
