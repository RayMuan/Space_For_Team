package com.space4team.space.db;

	import java.sql.Connection;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
	import javax.naming.InitialContext;
	import javax.sql.DataSource;

import com.space4team.host.db.HostDTO;


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
			System.out.println("getSpace()");
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
					dto.setS_gungu(rs.getString("s_gungu"));
					dto.setS_memo(rs.getString("s_memo"));
					dto.setS_opt(rs.getString("s_opt"));
					dto.setS_max(rs.getString("s_max"));
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
		
		public ArrayList<SpaceDTO> getSpaceList(int startRow,int pageSize){
			System.out.println("SpaceDAO getSpaceList()");
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			ArrayList<SpaceDTO> spaceList=new ArrayList<>();
			try {
				// 1~2 단계
				con=getConnection();
				// 3단계 sql
				// 기본 num기준 오름차순 => 최근글 위로 올라오게 정렬 (num 내림차순)
//				String sql="select * from space order by num desc";
//			    String sql=select * from space order by num desc limit 시작행-1, 몇개
				String sql="select * from space order by s_num desc";
				pstmt=con.prepareStatement(sql);
			
				//4
				rs=pstmt.executeQuery();
				//5
				while(rs.next()) {
					// 하나의 글의 바구니에 저장
					SpaceDTO sdto=new SpaceDTO();
					sdto.setS_name(rs.getString("s_name"));
					sdto.setS_memo(rs.getString("s_memo"));
					sdto.setS_max(rs.getNString("s_max"));
					sdto.setS_file(rs.getString("s_file"));
					sdto.setS_bill(rs.getString("s_bill"));
					sdto.setH_num(rs.getInt("h_num"));
					sdto.setS_sido(rs.getString("s_sido"));
					
					
					// 바구니의 주소값을 배열 한칸에 저장
					spaceList.add(sdto);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				// 예외 상관없이 마무리작업 => 객체생성한 기억장소 해제
				if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
			return spaceList;
		}//
		
		public int getSpaceCount() {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int count=0;
			try {
				// 1~2 단계
				con=getConnection();
				// 3단계 sql
				String sql="select count(*) from space";
				pstmt=con.prepareStatement(sql);
				//4
				rs=pstmt.executeQuery();
				//5
				if(rs.next()) {
					count=rs.getInt("count(*)");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				// 예외 상관없이 마무리작업 => 객체생성한 기억장소 해제
				if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}	
			}
			return count;
		}// getspaceCount()
		
		public int getSpaceCount(HostDTO hdto) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int count=0;
			try {
				// 1~2 단계
				con=getConnection();
				// 3단계 sql
				String sql="select count(*) from Host";
				pstmt=con.prepareStatement(sql);
				//4
				rs=pstmt.executeQuery();
				//5
				if(rs.next()) {
					count=rs.getInt("count(*)");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				// 예외 상관없이 마무리작업 => 객체생성한 기억장소 해제
				if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}	
			}
			return count;
		}// getspaceCount()
		public ArrayList<SpaceDTO> getSpaceList(int startRow,int pageSize, String search){
			System.out.println("SpaceDAO getSpaceList()");
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			ArrayList<SpaceDTO> spaceList=new ArrayList<>();
			try {
				// 1~2 단계
				con=getConnection();
				// 3단계 sql
				// 기본 num기준 오름차순 => 최근글 위로 올라오게 정렬 (num 내림차순)
//				String sql="select * from space order by num desc";
//			    String sql=select * from space order by num desc limit 시작행-1, 몇개
				String sql="select * from space  where s_name like ? order by s_num desc limit ?,?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, "%"+search+"%");
				pstmt.setInt(2, startRow-1);
				pstmt.setInt(3, pageSize);
				//4
				rs=pstmt.executeQuery();
				//5
				while(rs.next()) {
					// 하나의 글의 바구니에 저장
					SpaceDTO sdto=new SpaceDTO();
					sdto.setS_name(rs.getString("s_name"));
					sdto.setS_memo(rs.getString("s_memo"));
					sdto.setS_max(rs.getNString("s_max"));
					sdto.setS_file(rs.getString("s_file"));
					sdto.setS_bill(rs.getString("s_bill"));
					sdto.setH_num(rs.getInt("h_num"));
					
					// 바구니의 주소값을 배열 한칸에 저장
					spaceList.add(sdto);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				// 예외 상관없이 마무리작업 => 객체생성한 기억장소 해제
				if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
			return spaceList;
		}//
		
		public int getSpaceCount(String search) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int count=0;
			try {
				// 1~2 단계
				con=getConnection();
				// 3단계 sql
				String sql="select count(*) from space where subject like ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, "%"+search+"%");
				//4
				rs=pstmt.executeQuery();
				//5
				if(rs.next()) {
					count=rs.getInt("count(*)");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				// 예외 상관없이 마무리작업 => 객체생성한 기억장소 해제
				if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}	
			}
			return count;
		}// getspaceCount()
		
//		 호스트
		public ArrayList<SpaceDTO> getSpaceList(int startRow, int pageSize, HostDTO hdto){
			System.out.println("getSpaceList()");
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ArrayList<SpaceDTO> spaceList = new ArrayList<SpaceDTO>(); // 생성은 try 안에서 
			
			try {
				
				con = getConnection();
				
				// select 명시적으로 컬럼 적기 
				String sql = "select * from space where h_num =? order by s_num desc limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, hdto.getH_num());
				pstmt.setInt(2, startRow -1);
				pstmt.setInt(3, pageSize);
				rs = pstmt.executeQuery();
				System.out.println(hdto.getH_num());
				while(rs.next()) {
					SpaceDTO dto = new SpaceDTO();
					dto.setS_num(rs.getInt("s_num"));
					dto.setS_name(rs.getString("s_name"));
					
					spaceList.add(dto);
				}
		
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(con != null) {try {con.close();} catch (Exception e2) {}}
				if(pstmt != null) {try {pstmt.close();} catch (Exception e2) {}}
				if(rs != null) {try {rs.close();} catch (Exception e2) {}}
			}
				return spaceList;
		}	
	}//class

