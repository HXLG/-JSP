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

public class BaoxiuInsert extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String baoxiuid=request.getParameter("baoxiuid");
		String name=request.getParameter("name");
		String date=request.getParameter("date");
		String neirong=request.getParameter("neirong");
		String tel=request.getParameter("tel");
		String weixiuname=request.getParameter("weixiuname");
		String wanchengdate=request.getParameter("wanchengdate");
		int feiyong=Integer.parseInt(request.getParameter("feiyong"));
		String qingkuang=request.getParameter("qingkuang");
		int nameid=Integer.parseInt(request.getParameter("nameid"));
		
		try{
			Connection cn=Database.getconnect();
			String sql="insert into baoxiu values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, baoxiuid);
			ps.setString(2, name);
			ps.setString(3, date);
			ps.setString(4, neirong);
			ps.setString(5, tel);
			ps.setString(6, weixiuname);
			ps.setString(7, wanchengdate);
			ps.setInt(8, feiyong);
			ps.setString(9, qingkuang);
			ps.setInt(10, nameid);
			int n=ps.executeUpdate();
			if(n>0){
				response.sendRedirect("baoxiuselect.jsp");
			}
			else{
				System.out.println("���ʧ��");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
