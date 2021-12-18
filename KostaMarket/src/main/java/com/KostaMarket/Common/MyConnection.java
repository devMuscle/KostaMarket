package com.KostaMarket.Common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MyConnection {
	static {
		//1. JDBC드라이버로드
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() throws SQLException {
		Connection con = null;
		String url="jdbc:mysql://27.96.135.250:3306/kosta?serverTimezone=UTC&characterEncoding=UTF-8"; // localhost대신 ip값도 가능
		String user="kosta";
		String password="kosta";
		con = DriverManager.getConnection(url, user, password);
		System.out.println("DB와 연결 성공");
		return con;
	}
	
	public static void close(ResultSet rs) {
		if( rs!= null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void close(Statement stmt) {
		if( stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void close(Connection con) {
		if( con!= null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void close(ResultSet rs, Statement stmt, Connection con) {
		close(rs);
		close(stmt);
		close(con);
	}
	public static void close(Statement stmt, Connection con) {
		close(stmt);
		close(con);
	}
	
	public static void main(String[] args) {
		try {
			getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
