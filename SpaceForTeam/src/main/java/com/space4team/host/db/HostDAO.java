package com.space4team.host.db;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.space4team.user.db.UserDTO;


public class HostDAO {
//	private Connection con=null;
	
	public Connection getConnection() throws Exception{
	
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
		
//		Context init=new InitialContext();
//		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
//		con=ds.getConnection();
//		System.out.println("con주소 : "+con);
//		return con;
		
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
			
			String sql="select h_id from host where h_num=?";
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
			
			String sql="select h_id, h_name, h_phone, h_num from host where h_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, h_num);

			rs=pstmt.executeQuery();
			if(rs.next()){
				dto=new HostDTO();
				
				dto.setH_id(rs.getString("h_id"));
				dto.setH_name(rs.getString("h_name"));
				dto.setH_phone(rs.getString("h_phone"));
				dto.setH_num(h_num);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return dto;
	}//getHost Name, Phone, Num

	
	public HostDTO hostCheck(String h_id, String h_pass) {
		System.out.println("hostCheck()");
		HostDTO dto=null;
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con = getConnection();
			
			String sql="select * from host where h_id=? and h_pass=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, h_id);
			pstmt.setString(2, h_pass);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				
				dto=new HostDTO();
//				dto.setH_num(0);
				dto.setH_email(rs.getString("h_email"));
				dto.setH_id(rs.getString("h_id"));
				dto.setH_name(rs.getString("h_name"));
//				dto.setH_pass(rs.getString("h_pass"));
				dto.setH_phone(rs.getString("h_phone"));
//				dto.setH_birth(rs.getString("h_birth"));
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
	
	public HostDTO userCheck(String id, String pass) {
		// 바구니 주소가 저장되는 변수에 null 초기화 
		System.out.println("usercheck 실행전 ");
		HostDTO dto=null;
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//1,2단계 디비연결 메서드 호출
			con = getConnection();

			// 3단계 SQL구문 만들어서 실행할 준비(select    where id=? and pass=?)
			String sql="select * from host where h_id=? and h_pass=?";
			System.out.println(sql);
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			//4단계 SQL구문을 실행(select) => 결과 저장.
			rs=pstmt.executeQuery();
			System.out.println(id + pass);
			//5단계 결과를 출력, 데이터 담기 (select)
			// if next() 다음행 => 리턴값 데이터 있으면 true => 아이디 비밀번호 일치
//			                 => 세션값 생성 "id",id , main.jsp 이동
//			                         데이터 없으면 false => 아이디 비밀번호 틀림
//			                 => script   "아이디 비밀번호 틀림" 뒤로이동
			if(rs.next()){
				//next() 다음행 => 리턴값 데이터 있으면 true => 아이디 비밀번호 일치
			    // => 세션값 생성 "id",id(페이지 상관없이 값을 유지) , main.jsp 이동
				// dto 바구니 객체생성 => 기억장소 할당
				dto=new HostDTO();
				dto.setH_id(rs.getString("h_id"));
				dto.setH_pass(rs.getString("h_pass"));
				dto.setH_name(rs.getString("h_name"));
				dto.setH_num(rs.getInt("h_num"));


			}else{
				//next() 다음행 =>       데이터 없으면 false => 아이디 비밀번호 틀림
			    // 	           => script   "아이디 비밀번호 틀림" 뒤로이동
				// 바구니주소 null 초기값 설정
			}	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 예외 상관없이 마무리작업 => 객체생성한 기억장소 해제
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return dto;
	
	}//userCheck()

	public HostDTO getHost(String h_id) {
		HostDTO hdto=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		try {
			con=getConnection();
			String sql="select * from host where h_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, h_id);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				hdto=new HostDTO();
				
				hdto.setH_id(rs.getString("h_id"));
				hdto.setH_num(rs.getInt("h_num"));
				hdto.setH_name(rs.getString("h_name"));
				hdto.setH_email(rs.getString("h_email")); 
				hdto.setH_pass(rs.getString("h_pass"));
				hdto.setH_birth(rs.getString("h_birth"));
				
				}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try {pstmt.close();}catch (Exception e2) {}
			if(con!=null) try {con.close();}catch (Exception e2) {}
			if(rs!=null) try {pstmt.close();}catch (Exception e2) {}
		}
		return hdto;
	}
	

	
	public void deleteHost(String id) {
		Connection con =null;
		PreparedStatement pstmt=null;
		try {
			con=getConnection();
		 	String sql="delete from host where h_id = ?";
		 	 pstmt=con.prepareStatement(sql);
		 	pstmt.setString(1, id);
		 	pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 예외 상관없이 마무리작업 => 객체생성한 기억장소 해제
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
	}//deleteHost
	
	// id 체크
      public HostDTO idCheck(String id) {
         HostDTO dto=null;
         Connection con =null;
         PreparedStatement pstmt=null;
         ResultSet rs=null;
         try {
            con = getConnection();
            String sql="select * from user where user_id=?";
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs=pstmt.executeQuery();
            if(rs.next()){
               dto=new HostDTO();
				dto.setH_email(rs.getString("h_email"));
				dto.setH_id(rs.getString("h_id"));
				dto.setH_name(rs.getString("h_name"));
				dto.setH_pass(rs.getString("h_pass"));
				dto.setH_phone(rs.getString("h_phone"));
				dto.setH_birth(rs.getString("h_birth"));
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
      }//idCheck()
      
   // 비밀번호 변경
      public void modifyPass(HostDTO modifyPassDto) {
         Connection con =null;
         PreparedStatement pstmt2=null;
         try {
            con=getConnection();
            String sql2="update host set h_pass=? where h_id =?";
            pstmt2=con.prepareStatement(sql2);
            pstmt2.setString(1, modifyPassDto.getH_pass()); 
            pstmt2.setString(2, modifyPassDto.getH_id());  
            pstmt2.executeUpdate();
         } catch (Exception e) {
            e.printStackTrace();
         }finally {
            if(pstmt2!=null) try { pstmt2.close();} catch (Exception e2) {}
            if(con!=null) try { con.close();} catch (Exception e2) {}
         }
      }//modifyPass()
      
		public HostDTO gethost(String id) {
			HostDTO dto=null;
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				  con=getConnection();
				String sql="select * from host where h_id=? ";
				  pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				  rs=pstmt.executeQuery();
				if(rs.next()){
					dto=new HostDTO();
					dto.setH_num(rs.getInt("h_num"));
					dto.setH_email(rs.getString("h_email"));
					dto.setH_id(rs.getString("h_id"));
					dto.setH_name(rs.getString("h_name"));
					dto.setH_pass(rs.getString("h_pass"));
					dto.setH_phone(rs.getString("h_phone"));
					dto.setH_birth(rs.getString("h_birth"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) try {	pstmt.close();} catch (Exception e2) {}
				if(con != null) try { con.close();} catch (Exception e2) {}
				if(rs != null) try { rs.close();} catch (Exception e2) {}
			}
			return dto;
	}//getUser()
		
		public void updateHost (HostDTO updateDto) {
			Connection con=null;
			PreparedStatement pstmt=null;

			try {
				  con=getConnection();
						
			 	String sql="update host set h_name=?, h_email=?, h_phone=?, h_birth=? where h_id =?";
			 	pstmt=con.prepareStatement(sql);
			 	//? 채워넣기
			 	pstmt.setString(1, updateDto.getH_name()); //set 문자열(1번째 물음표, 값 name)
			 	pstmt.setString(2, updateDto.getH_email()); //set 문자열(1번째 물음표, 값 name)
			 	pstmt.setString(3, updateDto.getH_phone()); //set 문자열(1번째 물음표, 값 name)
			 	pstmt.setString(4, updateDto.getH_birth()); //set 문자열(1번째 물음표, 값 name)
			 	pstmt.setString(5, updateDto.getH_id());  //set 문자열 (5번째 물음표, 값 id)
			 	pstmt.executeUpdate();
			 			
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(pstmt != null) try {	pstmt.close();} catch (Exception e2) {}
				if(con != null) try { con.close();} catch (Exception e2) {}

			}
	}//updateUser
	
}//class
