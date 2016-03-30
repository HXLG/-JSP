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

public class BaoxiuUpdate extends HttpServlet {

	
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
			String sql="update baoxiu set name=?,date=?,neirong=?,tel=?,weixiuname=?,wanchengdate=?,feiyong=?,qingkuang=?,nameid=? where baoxiuid=?";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, date);
			ps.setString(3, neirong);
			ps.setString(4, tel);
			ps.setString(5, weixiuname);
			ps.setString(6, wanchengdate);
			ps.setInt(7, feiyong);
			ps.setString(8, qingkuang);
			ps.setInt(9, nameid);
			ps.setString(10, baoxiuid);
			
			int n=ps.executeUpdate();
			if(n>0){
				response.sendRedirect("baoxiuselect.jsp");
			}
			else{
				System.out.println("¸üÐÂÊ§°Ü");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
