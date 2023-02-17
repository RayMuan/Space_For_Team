package com.space4team.review.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class ReviewDAO {
	private Connection con=null;
	
	public Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		con=ds.getConnection();
		return con;
	}//connection
	
	public ReviewDTO getReview(int s_num) {
		System.out.println("getReview()");
		ReviewDTO dto=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		
		
		try {
			con=getConnection();
			String sql="select * from review where s_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, s_num);

			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto=new ReviewDTO();
				dto.setRe_num(rs.getInt("re_num"));
				dto.setUser_num(rs.getInt("user_num"));
				dto.setRe_subject(rs.getString("re_subject"));
				dto.setRe_content(rs.getString("re_content"));
				dto.setRe_date(rs.getTimestamp("re_date"));
				dto.setRe_point(rs.getInt("re_point"));
				dto.setRe_reply(rs.getString("re_reply"));
				
				}
			String sql2="select avg(re_point) from review where s_num=?";
			pstmt=con.prepareStatement(sql2);
			pstmt.setInt(1, s_num);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto.setRe_avg(rs.getDouble("avg(re_point)"));
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
	
	public ArrayList<ReviewDTO> getReviewList(int startRow, int pageSize){
		ArrayList<ReviewDTO> reviewList=new ArrayList<ReviewDTO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			con=getConnection();
			
			String sql="select * from review where s_num=? order by re_num desc limit ?, ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewDTO dto=new ReviewDTO();
				dto.setRe_num(rs.getInt("re_num"));
				dto.setUser_num(rs.getInt("User_num"));
				dto.setRe_subject(rs.getString("re_subject"));
				dto.setRe_content(rs.getString("re_content"));
				dto.setRe_date(rs.getTimestamp("re_date"));
				dto.setRe_point(rs.getInt("re_point"));
				dto.setS_num(rs.getInt("s_num"));
				dto.setRe_reply(rs.getString("re_reply"));
				
				reviewList.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try {pstmt.close();}catch (Exception e2) {}
			if(con!=null) try {con.close();}catch (Exception e2) {}
		}
		
		return reviewList;
	}//reveiwList
	
	public int getReviewCount(int s_num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		int count=0;
		try {
			con=getConnection();
			String sql="select count(re_num) from Review where s_num=?";
			pstmt.setInt(1, s_num);
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt("count(re_num)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null) try {pstmt.close();}catch (Exception e2) {}
			if(pstmt!=null) try {pstmt.close();}catch (Exception e2) {}
			if(rs!=null) try {pstmt.close();}catch (Exception e2) {}
		}
		return count;
	} // getBoardCount
	
}//class
