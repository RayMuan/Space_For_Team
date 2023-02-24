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

	public void insertHost(HostDTO dto) { 
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

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) 	try {pstmt.close();} catch (Exception e2) {}
			if (con != null) try {con.close();} catch (Exception e2) {}
		}
		return;
	}//insertHost
	public HostDTO getHostID(String id) {
		HostDTO dto=null;
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
				dto=new HostDTO();
				
				dto.setH_id(rs.getString("H_id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return dto;
<<<<<<< HEAD
	}//getHost
	
=======
	}//getHostID
	public HostDTO getHostEmail(String email) {
		HostDTO dto=null;
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
				dto=new HostDTO();
				
				dto.setH_email(rs.getString("H_email"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return dto;
	}//getHostEmail
	
	public HostDTO getHostInfo(int h_num) {
		HostDTO dto=null;
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			
			String sql="select h_name, h_phone from host where h_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, h_num);

			rs=pstmt.executeQuery();
			if(rs.next()){
				dto=new HostDTO();
				
				dto.setH_name(rs.getString("h_name"));
				dto.setH_phone(rs.getString("h_phone"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return dto;
	}//getHostName, Phone

	
	public HostDTO hostCheck(String host_email, String host_pass) {
		System.out.println("hostCheck()");
		HostDTO dto=null;
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con = getConnection();
			
			String sql="select * from host where host_email=? and host_pass=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, host_email);
			pstmt.setString(2, host_pass);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				
				dto=new HostDTO();
				dto.setH_num(0);
				dto.setH_email(rs.getString("host_email"));
				dto.setH_id(rs.getString("host_id"));
				dto.setH_name(rs.getString("host_name"));
				dto.setH_pass(rs.getString("host_pass"));
				dto.setH_phone(rs.getString("host_phone"));
				dto.setH_birth(rs.getString("host_birth"));
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
	}//hostCheck()
	
	
>>>>>>> branch 'master' of https://github.com/RayMuan/Space_For_Team.git

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
