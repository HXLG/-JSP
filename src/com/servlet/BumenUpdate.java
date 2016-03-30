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

public class BumenUpdate extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String bumenid=request.getParameter("bumenid");
		String bumenname=request.getParameter("bumenname");
		String zhiwu=request.getParameter("zhiwu");
		String name=request.getParameter("name");
		
		try{
			Connection cn=Database.getconnect();
			String sql="update bumen set bumenname=?,zhiwu=?,name=? where bumenid=?";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, bumenname);
			ps.setString(2, zhiwu);
			ps.setString(3, name);
			ps.setString(4, bumenid);;
			int n=ps.executeUpdate();
			if(n>0){
				response.sendRedirect("bumenselect.jsp");
			}
			else{
				System.out.println("¸üÐÂÊ§°Ü");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
