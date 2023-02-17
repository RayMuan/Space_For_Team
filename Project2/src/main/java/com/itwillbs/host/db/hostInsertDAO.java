package com.itwillbs.host.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class hostInsertDAO {
	public Connection getConnection() throws Exception {
		Connection con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		con = ds.getConnection();
		return con;
	}


	public void insertMember(hostInsertDTO dto) { 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		try {
			con = getConnection();
			int h_num = 1;
			String sql="select max(h_num) from host";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
			h_num=rs.getInt("max(h_num)")+1;
			}
			sql = "insert into host(h_num,h_email, h_id ,h_name,h_pass,h_phone,h_birth) values(?,?,?,?,?,?,?)";
				
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, h_num);
			pstmt.setString(2, dto.getH_email());
			pstmt.setString(3, dto.getH_id());
			pstmt.setString(4, dto.getH_name());
			pstmt.setString(5, dto.getH_pass() );
			pstmt.setString(6, dto.getH_phone());
			pstmt.setString(7, dto.getH_birth());
//			pstmt.setTimestamp(7, dto.getDate());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) 	try {pstmt.close();} catch (Exception e2) {}
			if (con != null) try {con.close();} catch (Exception e2) {}
		}
		return;
	}
	public hostInsertDTO getMember(String id) {
		hostInsertDTO dto=null;
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			
			String sql="select h_id from host where h_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);

			rs=pstmt.executeQuery();
			if(rs.next()){
				dto=new hostInsertDTO();
				
//				dto.setH_email(rs.getString("H_email"));
				dto.setH_id(rs.getString("H_id"));
//				dto.setH_name(rs.getString("H_name"));
//				dto.setH_pass(rs.getString("H_pass"));
//				dto.setH_phone(rs.getString("H_phone"));
//				dto.setH_birth(rs.getString("H_birth"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 예외 상관없이 마무리작업 => 객체생성한 기억장소 해제
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return dto;
	}//getMember()
	public hostInsertDTO getMember1(String email) {
		hostInsertDTO dto=null;
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			
			String sql="select h_email from host where h_email=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				dto=new hostInsertDTO();
				
				dto.setH_email(rs.getString("H_email"));
//				dto.setH_id(rs.getString("H_id"));
//				dto.setH_name(rs.getString("H_name"));
//				dto.setH_pass(rs.getString("H_pass"));
//				dto.setH_phone(rs.getString("H_phone"));
//				dto.setH_birth(rs.getString("H_birth"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 예외 상관없이 마무리작업 => 객체생성한 기억장소 해제
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return dto;
	}//getMember()
}//class

