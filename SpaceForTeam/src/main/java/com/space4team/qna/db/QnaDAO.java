package com.space4team.qna.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.space4team.review.db.ReviewDTO;


public class QnaDAO {
private Connection con=null;
	
	public Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		con=ds.getConnection();
		return con;
	}//connection
	
	public QnaDTO getQna(int s_num) {
		System.out.println("getQna()");
		QnaDTO dto=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		try {
			con=getConnection();
			String sql="select * from qna where s_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, s_num);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto=new QnaDTO();
				dto.setQ_num(rs.getInt("q_num"));
				dto.setUser_num(rs.getInt("user_num"));
				dto.setQ_content(rs.getString("q_content"));
				dto.setQ_date(rs.getTimestamp("q_date"));
				dto.setH_num(rs.getInt("h_num"));
				dto.setQ_recontent(rs.getString("q_recontent"));
				dto.setQ_redate(rs.getTimestamp("q_redate"));
				}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try {pstmt.close();}catch (Exception e2) {}
			if(con!=null) try {con.close();}catch (Exception e2) {}
			if(rs!=null) try {pstmt.close();}catch (Exception e2) {}
		}
		return dto;
	}// getQna
	
	public void insertQna(QnaDTO qdto) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		try {
			con=getConnection();
			// num 구하기
			int q_num=1;
			String sql="select Max(q_num) from Qna";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				q_num=rs.getInt("max(q_num)")+1;
			}
//			q_num, user_num, q_content, q_date, h_num, q_recontent, q_redate, s_num
				sql="insert review(q_num, user_num, q_content, q_date, h_num, q_recontent, q_redate, s_num) values(?, ?, ?, ?, ?, ?, ?, ?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, q_num);
				pstmt.setInt(2, qdto.getUser_num());
				pstmt.setString(3, qdto.getQ_content());
				pstmt.setTimestamp(4, qdto.getQ_date());
				pstmt.setInt(5, qdto.getH_num());
				pstmt.setString(6, qdto.getQ_recontent());
				pstmt.setTimestamp(7, qdto.getQ_redate());
				pstmt.setInt(8, qdto.getQ_s_num());
			
				pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try {pstmt.close();}catch (Exception e2) {}
			if(con!=null) try {con.close();}catch (Exception e2) {}
			if(rs!=null) try {pstmt.close();}catch (Exception e2) {}
		}
	} //insertQna
	
	public ArrayList<QnaDTO> getQnaList(int s_num, int q_startRow, int q_pageSize){
		ArrayList<QnaDTO> qnaList=new ArrayList<QnaDTO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			
			String sql="select q.q_num, q.user_num, q.q_content, q.q_date, q.h_num, q.q_recontent, q.q_redate, u.user_id, s.s_num, h.h_name from qna q join user u on q.user_num=u.user_num join space s on s.h_num=q.h_num join host h on h.h_num=q.h_num where s.s_num=? order by q_num desc limit ?, ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, s_num);
			pstmt.setInt(2, q_startRow-1);
			pstmt.setInt(3, q_pageSize);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				QnaDTO dto=new QnaDTO();
				dto.setQ_num(rs.getInt("q.q_num"));
				dto.setUser_num(rs.getInt("q.user_num"));
				dto.setQ_content(rs.getString("q.q_content"));
				dto.setQ_date(rs.getTimestamp("q.q_date"));
				dto.setH_num(rs.getInt("q.h_num"));
				dto.setQ_recontent(rs.getString("q.q_recontent"));
				dto.setQ_redate(rs.getTimestamp("q_redate"));
				dto.setQ_user_id(rs.getString("u.user_id"));
				dto.setQ_s_num(rs.getInt("s.s_num"));
				
				qnaList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try {pstmt.close();}catch (Exception e2) {}
			if(con!=null) try {con.close();}catch (Exception e2) {}
		}
		return qnaList;
	}//qnaList
	
	public int getQnaCount(int s_num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		int count=0;
		try {
			con=getConnection();
			String sql="select count(q.q_num),s.s_num from qna q join space s on q.h_num=s.h_num group by s.s_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, s_num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt("count(q.q_num)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null) try {pstmt.close();}catch (Exception e2) {}
			if(pstmt!=null) try {pstmt.close();}catch (Exception e2) {}
			if(rs!=null) try {pstmt.close();}catch (Exception e2) {}
		}
		return count;
	} // getqnaCount
	

}
