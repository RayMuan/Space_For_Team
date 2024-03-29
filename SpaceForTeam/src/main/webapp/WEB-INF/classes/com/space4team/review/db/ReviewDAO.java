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
	}// getReview
	
	public ReviewDTO getRe_avg(int s_num) {
		System.out.println("getRe_avg()");
		ReviewDTO dto=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		try {
			con=getConnection();
			String sql2="select round(avg(re_point), 1) from review where s_num=?";
			pstmt=con.prepareStatement(sql2);
			pstmt.setInt(1, s_num);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto=new ReviewDTO();
				dto.setRe_avg(rs.getDouble("round(avg(re_point), 1)"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try {pstmt.close();}catch (Exception e2) {}
			if(con!=null) try {con.close();}catch (Exception e2) {}
			if(rs!=null) try {pstmt.close();}catch (Exception e2) {}
		}
		return dto;
	}// getReview
	
	public ArrayList<ReviewDTO> getReviewList(int s_num, int re_startRow, int re_pageSize){
		ArrayList<ReviewDTO> reviewList=new ArrayList<ReviewDTO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			
			String sql="SELECT r.re_num, r.user_num, r.re_content, r.re_date, r.re_point, r.s_num, r.re_reply, u.user_id FROM review r join user u on r.user_num = u.user_num where r.s_num=? order by r.re_num desc limit ?, ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, s_num);
			pstmt.setInt(2, re_startRow-1);
			pstmt.setInt(3, re_pageSize);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewDTO dto=new ReviewDTO();
				dto.setRe_num(rs.getInt("r.re_num"));
				dto.setUser_num(rs.getInt("r.user_num"));
				dto.setRe_content(rs.getString("r.re_content"));
				dto.setRe_date(rs.getTimestamp("r.re_date"));
				dto.setRe_point(rs.getInt("r.re_point"));
				dto.setS_num(rs.getInt("r.s_num"));
				dto.setRe_reply(rs.getString("re_reply"));
				dto.setRe_user_id(rs.getString("u.user_id"));
				
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
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, s_num);
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
	
	public void insertReview(ReviewDTO redto) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		try {
			con=getConnection();
			// num 구하기
			int re_num=1;
			String sql="select Max(re_num) from review";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				re_num=rs.getInt("max(re_num)")+1;
			}
				sql="insert review(re_num, user_num, re_content, re_date, re_point, s_num) values(?, ?, ?, ?, ?, ?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, re_num);
				pstmt.setInt(2, redto.getUser_num());
				pstmt.setString(3, redto.getRe_content());
				pstmt.setTimestamp(4, redto.getRe_date());
				pstmt.setInt(5, redto.getRe_point());
				pstmt.setInt(6, redto.getS_num());
			
				pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try {pstmt.close();}catch (Exception e2) {}
			if(con!=null) try {con.close();}catch (Exception e2) {}
			if(rs!=null) try {pstmt.close();}catch (Exception e2) {}
		}
	} //insertReview
	
}//class
