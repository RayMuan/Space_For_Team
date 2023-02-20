package com.space4team.host.db;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.space4team.user.db.UserDTO;

public class HostDAO {
	
	public Connection getConnection() throws Exception {
		Connection con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		con = ds.getConnection();
		return con;
	}
	
	
	public HostDTO getMember(String email) {
		HostDTO dto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		 	con = getConnection();
			String sql="select * from host where user_email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,email);

			rs=pstmt.executeQuery();

		if(rs.next()) {
			dto = new HostDTO();
			dto.setH_email("email");
			dto.setH_pass("pass");
			}
		      } catch(Exception e) {
			e.printStackTrace();
		      } finally {
			if(pstmt != null) try { pstmt.close(); } catch (Exception e2) {}
			if(con != null) try { con.close(); } catch (Exception e2) {}
			if(rs != null) try { rs.close(); } catch (Exception e2) {}
			}
			  return dto;
		} //getMember()
	
	// hostCheck 메서드 정의
	public HostDTO hostCheck(String id, String pass) {
		
		HostDTO dto=null;
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con = getConnection();
			
			String sql="select * from host where email=? and pass=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				
				dto=new HostDTO();
				dto.setH_id(rs.getString("host_id"));
				dto.setH_email(rs.getString("host_email"));
				dto.setH_pass(rs.getString("host_pass"));
				dto.setH_name(rs.getString("host_name"));
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
	
	
	
	
}
