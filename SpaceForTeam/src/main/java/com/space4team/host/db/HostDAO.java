package com.space4team.host.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.space4team.user.db.UserDTO;


public class HostDAO {
	private Connection con=null;
	
	public Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		con=ds.getConnection();
		return con;
	}//connection
	
	public void insertHost(HostDTO dto) {
		System.out.println("HostDAO insertHost()");
		System.out.println("HostDTO 바구니 전달받은 주소 : " + dto);
		System.out.println("바구니주소에서 가져온 아이디 : " + dto.getH_id());
		System.out.println("바구니주소에서 가져온 이메일 : " + dto.getH_email());
		System.out.println("바구니주소에서 가져온 비밀번호 : " + dto.getH_pass());
		System.out.println("바구니주소에서 가져온 이름 : " + dto.getH_name());
		System.out.println("바구니주소에서 가져온 휴대폰번호 : " + dto.getH_phone());
		System.out.println("바구니주소에서 가져온 생일 : " + dto.getH_birth());
		
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			
			con=getConnection();
			
			String sql="insert into host(id,email,pass,name,phone,birth) values(?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			// ? 채워넣기
			pstmt.setString(1, dto.getH_id());  
			pstmt.setString(2, dto.getH_email()); 
			pstmt.setString(3, dto.getH_pass());
			pstmt.setString(4, dto.getH_name());
			pstmt.setString(5, dto.getH_phone());
			pstmt.setString(6, dto.getH_birth());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return;
	}//insertHost() 메서드
	
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

}//class
