package com.util;

import java.sql.*;


public class Database {
	public static Connection getconnect(){
		Connection cn=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			cn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/wuye","root","123456");
		}catch(Exception e){
			e.printStackTrace();
		}
		return cn;
	}
}
