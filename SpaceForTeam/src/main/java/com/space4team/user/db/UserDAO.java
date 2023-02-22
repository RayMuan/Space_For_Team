package com.space4team.user.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {
private Connection con=null;
	
	public Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		con=ds.getConnection();
		return con;
	}//connection
	
	public UserDTO getUser(int user_num) {
		UserDTO dto=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		
		try {
			con=getConnection();
			String sql="select * from user where user_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, user_num);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto=new UserDTO();
				dto.setUser_num(user_num);
				dto.setUser_email(rs.getString("user_email"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setUser_pass(rs.getString("user_pass"));
				dto.setUser_phone(rs.getString("user_phone"));
				dto.setUser_birth(rs.getString("user_birth"));
				
				}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try {pstmt.close();}catch (Exception e2) {}
			if(con!=null) try {con.close();}catch (Exception e2) {}
			if(rs!=null) try {pstmt.close();}catch (Exception e2) {}
		}
		return dto;
	}// getInfoReview

}//class
