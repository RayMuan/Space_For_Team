package com.space4team.host.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;




public class HostDAO {
	private Connection con=null;
	
	public Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		con=ds.getConnection();
		return con;
	}//connection
	
	public HostDTO getHost(int h_num) {
		System.out.println("getHost()");
		HostDTO dto=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		try {
			con=getConnection();
			String sql="select * from host where h_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, h_num);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto=new HostDTO();
				dto.setH_num(h_num);
				dto.setH_name(rs.getString("h_name"));
				dto.setH_email(rs.getString("h_email")); 
				dto.setH_id(rs.getString("h_id"));
				dto.setH_pass(rs.getString("h_pass"));
				dto.setH_phone(rs.getString("h_phone"));
				dto.setH_birth(rs.getString("h_birth"));
				}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try {pstmt.close();}catch (Exception e2) {}
			if(con!=null) try {con.close();}catch (Exception e2) {}
			if(rs!=null) try {pstmt.close();}catch (Exception e2) {}
		}
		return dto;
	}//getHost
	

	public HostDTO getHost(String id) {
		HostDTO dto=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		try {
			con=getConnection();
			String sql="select * from host where h_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto=new HostDTO();
				dto.setH_id(rs.getString("h_id"));
				dto.setH_name(rs.getString("h_name"));
				dto.setH_email(rs.getString("h_email")); 
				dto.setH_id(rs.getString("h_id"));
				dto.setH_pass(rs.getString("h_pass"));
				dto.setH_birth(rs.getString("h_birth"));
				
				}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try {pstmt.close();}catch (Exception e2) {}
			if(con!=null) try {con.close();}catch (Exception e2) {}
			if(rs!=null) try {pstmt.close();}catch (Exception e2) {}
		}
		return dto;
	}
}//class
