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
		System.out.println("UserDAO insertUser()");
		System.out.println("UserDTO 바구니 전달받은 주소 : " + dto);
		System.out.println("바구니주소에서 가져온 아이디 : " + dto.getUser_id());
		System.out.println("바구니주소에서 가져온 이메일 : " + dto.getUser_email());
		System.out.println("바구니주소에서 가져온 비밀번호 : " + dto.getUser_pass());
		System.out.println("바구니주소에서 가져온 이름 : " + dto.getUser_name());
		System.out.println("바구니주소에서 가져온 휴대폰번호 : " + dto.getUser_phone());
		System.out.println("바구니주소에서 가져온 생일 : " + dto.getUser_birth());
		
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			
			con=getConnection();
			
			String sql="insert into user(id,email,pass,name,phone,birth) values(?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			// ? 채워넣기
			pstmt.setString(1, dto.getUser_id());  
			pstmt.setString(2, dto.getUser_email()); 
			pstmt.setString(3, dto.getUser_pass());
			pstmt.setString(4, dto.getUser_name());
			pstmt.setString(5, dto.getUser_phone());
			pstmt.setString(6, dto.getUser_birth());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return;
	}//insertUser() 메서드
	
	
	public UserDTO getUser(int user_num) {
		System.out.println("getUser()");
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
	
	public UserDTO userCheck(String user_email, String user_pass) {
		System.out.println("userCheck()");
		UserDTO dto=null;
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con = getConnection();
			
			String sql="select * from user where user_email=? and user_pass=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, user_email);
			pstmt.setString(2, user_pass);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				
				dto=new UserDTO();
				dto.setUser_num(0);
				dto.setUser_email(rs.getString("user_email"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setUser_pass(rs.getString("user_pass"));
				dto.setUser_phone(rs.getString("user_phone"));
				dto.setUser_birth(rs.getString("user_birth"));
			}else{

			}	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return dto;
	}//userCheck()
	

}//class
