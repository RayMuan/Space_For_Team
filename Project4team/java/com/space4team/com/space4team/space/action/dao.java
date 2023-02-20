package com.space4team.space.action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dao {
	private Connection con;
	private static final String username = "class1_221020_team4";
	private static final String password = "1234";
	private static final String url = "jdbc:mysql://db.itwillbs.dev:3306/class1_221020_team4";
	
	public dao() {
		try {
			System.out.println("생성자");
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password);
			System.out.println("드라이버 로딩 성공");
			
		} catch (Exception e) {
			System.out.println("드라이버 로딩실패");
			try {
				con.close();
			} catch (SQLException e2) {
				
			}
		}
	}	
}
