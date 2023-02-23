package com.space4team.qna.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


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
				dto.setQ_resubject(rs.getString("q_resubject"));
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
	
	public ArrayList<QnaDTO> getQnaList(int s_num, int startRow, int pageSize){
		ArrayList<QnaDTO> qnaList=new ArrayList<QnaDTO>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			
			String sql="select * from qna where s_num=? order by q_num desc limit ?, ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, s_num);
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				QnaDTO dto=new QnaDTO();
				dto.setQ_num(rs.getInt("q_num"));
				dto.setUser_num(rs.getInt("user_num"));
				dto.setQ_content(rs.getString("q_content"));
				dto.setQ_date(rs.getTimestamp("q_date"));
				dto.setH_num(rs.getInt("h_num"));
				dto.setQ_resubject(rs.getString("q_resubject"));
				dto.setQ_redate(rs.getTimestamp("q_redate"));
				
				qnaList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try {pstmt.close();}catch (Exception e2) {}
			if(con!=null) try {con.close();}catch (Exception e2) {}
		}
		return qnaList;
	}//reveiwList
	
	public int getQnaCount(int s_num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		int count=0;
		try {
			con=getConnection();
			String sql="select count(q_num) from qna where s_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, s_num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt("count(q_num)");
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
	

}
