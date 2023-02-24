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
	
	public void insertUser(UserDTO dto) { 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		try {
			con = getConnection();
			int user_num = 1;
			String sql="select max(user_num) from user";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
			user_num=rs.getInt("max(user_num)")+1;
			}
			sql = "insert into user(user_num,user_email, user_id ,user_name,user_pass,user_phone,user_birth) values(?,?,?,?,?,?,?)";
				
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, user_num);
			pstmt.setString(2, dto.getUser_email());
			pstmt.setString(3, dto.getUser_id());
			pstmt.setString(4, dto.getUser_name());
			pstmt.setString(5, dto.getUser_pass() );
			pstmt.setString(6, dto.getUser_phone());
			pstmt.setString(7, dto.getUser_birth());


			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) 	try {pstmt.close();} catch (Exception e2) {}
			if (con != null) try {con.close();} catch (Exception e2) {}
		}
		return;
	}
	public UserDTO getUserId(String id) {
		UserDTO dto=null;
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			
			String sql="select user_id from user where user_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);

			rs=pstmt.executeQuery();
			if(rs.next()){
				dto=new UserDTO();
				
				dto.setUser_id(rs.getString("user_id"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return dto;
	}//getUserId()
	
	public UserDTO getUserEmail(String email) {
		UserDTO dto=null;
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			
			String sql="select user_email from user where user_email=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				dto=new UserDTO();
				
				dto.setUser_email(rs.getString("user_email"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return dto;
	}//getUserEmail()
	
	public UserDTO getReviewUser(int re_user_num) {
		UserDTO re_udto=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		
		try {
			con=getConnection();
			String sql="select * from user where user_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, re_user_num);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				re_udto=new UserDTO();
				re_udto.setUser_num(re_user_num);
				re_udto.setUser_id(rs.getString("user_id"));
				}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try {pstmt.close();}catch (Exception e2) {}
			if(con!=null) try {con.close();}catch (Exception e2) {}
			if(rs!=null) try {pstmt.close();}catch (Exception e2) {}
		}
		return re_udto;
	}// getInfoReview (User_num -> User_id)
	
}//class
