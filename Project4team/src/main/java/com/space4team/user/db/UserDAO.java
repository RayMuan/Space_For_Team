package com.space4team.user.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.space4team.user.db.UserDTO;

public class UserDAO {
	
	public Connection getConnection() throws Exception {
		Connection con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		con = ds.getConnection();
		return con;
	}
	
	
	public UserDTO getMember(String email) {
		UserDTO dto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		 	con = getConnection();
			String sql="select * from user where user_email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,email);

			rs=pstmt.executeQuery();

		if(rs.next()) {
			dto = new UserDTO();
			dto.setUser_email("email");
			dto.setUser_pass("pass");
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
	
	// userCheck 메서드 정의
	public UserDTO userCheck(String id, String pass) {
		
		UserDTO dto=null;
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con = getConnection();
			
			String sql="select * from user where email=? and pass=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				
				dto=new UserDTO();
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_email(rs.getString("user_email"));
				dto.setUser_pass(rs.getString("user_pass"));
				dto.setUser_name(rs.getString("user_name"));
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
	
	
	
	
}
