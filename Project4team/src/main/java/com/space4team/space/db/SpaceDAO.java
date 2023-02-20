package com.space4team.space.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class SpaceDAO {
	private Connection con=null;
	
	public Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		con=ds.getConnection();
		return con;
	}//connection
	
	public void insertSpace (SpaceDTO dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("insert성공");
		try {
			con = getConnection();

			int num=4;
			String sql ="select max(s_num) from space";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt("max(s_num)") + 1;	}
			
			String sql2 ="insert into space(s_num, s_name, s_address, s_bill, h_num, s_sido, s_sigungu, s_memo) values (?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql2);
			pstmt.setInt(1,num);
			pstmt.setString(2, dto.getS_name());
			pstmt.setString(3, dto.getS_address());
			pstmt.setString(4, dto.getS_bill());
			pstmt.setInt(5, 1);
			pstmt.setString(6, dto.getS_sido());
			pstmt.setString(7, dto.getS_sigungu());
			pstmt.setString(8, dto.getS_memo());
			
			pstmt.executeUpdate();
			
			System.out.println("con주소"+con);
			
		} catch (Exception e) {
			System.out.println("예외처리함");
			e.printStackTrace();
		} finally {
			if(con!=null) {try {con.close();} catch (Exception e2) {}}
			if(pstmt!=null){try {pstmt.close();} catch (Exception e2) {}}
			}
		}//insertSpace
	
	public SpaceDTO getSpace(int s_num) {
		SpaceDTO dto=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		try {
			con=getConnection();
			String sql="select * from space where s_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, s_num);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto=new SpaceDTO();
				dto.setS_num(s_num);
				dto.setS_name(rs.getString("s_name"));
				dto.setS_address(rs.getString("s_address"));
				dto.setS_bill(rs.getString("s_bill"));
				dto.setH_num(rs.getInt("h_num"));
				dto.setS_sido(rs.getString("s_sido"));
				dto.setS_sigungu(rs.getString("s_sigungu"));
				dto.setS_memo(rs.getString("s_memo"));
				dto.setS_elevator(rs.getInt("s_elevator"));
				dto.setS_parking(rs.getInt("s_parking"));
				dto.setS_wifi(rs.getInt("s_wifi"));
				dto.setS_drink(rs.getInt("s_drink"));
				dto.setS_toilet(rs.getInt("s_toliet"));
				dto.setS_socket(rs.getInt("s_socket"));
				dto.setS_heating(rs.getInt("s_heating"));
				dto.setS_air(rs.getInt("s_air"));
				dto.setS_locker(rs.getInt("s_locker"));
				dto.setS_print(rs.getInt("s_print"));
				dto.setS_beam(rs.getInt("s_beam"));
				dto.setS_laptop(rs.getInt("s_laptop"));
				}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try {pstmt.close();}catch (Exception e2) {}
			if(con!=null) try {con.close();}catch (Exception e2) {}
			if(rs!=null) try {pstmt.close();}catch (Exception e2) {}
		}
		return dto;
	}// getSpace
	
}//class