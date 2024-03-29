package com.space4team.user.db;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;




public class UserDAO {
private Connection con=null;
	
	public Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		con=ds.getConnection();
		return con;
	}//connection
	
	
	public void insertUser(UserDTO dto) { 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		try {
			con = getConnection();
			int user_num = 1;
			String sql="select max(user_num) from user";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
			user_num=rs.getInt("max(user_num)")+1;
			}
			sql = "insert into user(user_num,user_email, user_id ,user_name,user_pass,user_phone,user_birth) values(?,?,?,?,?,?,?)";
				
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, user_num);
			pstmt.setString(2, dto.getUser_email());
			pstmt.setString(3, dto.getUser_id());
			pstmt.setString(4, dto.getUser_name());
			pstmt.setString(5, dto.getUser_pass() );
			pstmt.setString(6, dto.getUser_phone());
			pstmt.setString(7, dto.getUser_birth());


			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) 	try {pstmt.close();} catch (Exception e2) {}
			if (con != null) try {con.close();} catch (Exception e2) {}
		}
		return;
	}
	
	public UserDTO getUserId(String id) {
		UserDTO dto=null;
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			
			String sql="select user_id from user where user_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);

			rs=pstmt.executeQuery();
			if(rs.next()){
				dto=new UserDTO();
				dto.setUser_id(rs.getString("user_id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return dto;
	}//getUserId()
	
	public UserDTO getUserEmail(String email) {
		UserDTO dto=null;
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=getConnection();
			
			String sql="select user_email from user where user_email=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				dto=new UserDTO();
				
				dto.setUser_email(rs.getString("user_email"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();} catch (Exception e2) {}
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return dto;
	}//getUserEmail()
	
	public UserDTO getUserCheck(String user_id, String user_pass) {
		// 바구니 주소가 저장되는 변수에 null 초기화 
		UserDTO dto=null;
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//1,2단계 디비연결 메서드 호출
			con = getConnection();
			// 3단계 SQL구문 만들어서 실행할 준비(select    where id=? and pass=?)
			String sql="select * from user where user_id=? and user_pass=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_pass);
			//4단계 SQL구문을 실행(select) => 결과 저장
			rs=pstmt.executeQuery();
			//5단계 결과를 출력, 데이터 담기 (select)
			// if next() 다음행 => 리턴값 데이터 있으면 true => 아이디 비밀번호 일치
//			                 => 세션값 생성 "id",id , main.jsp 이동
//			                         데이터 없으면 false => 아이디 비밀번호 틀림
//			                 => script   "아이디 비밀번호 틀림" 뒤로이동
			if(rs.next()){
				//next() 다음행 => 리턴값 데이터 있으면 true => 아이디 비밀번호 일치
			    // => 세션값 생성 "id",id(페이지 상관없이 값을 유지) , main.jsp 이동
				// dto 바구니 객체생성 => 기억장소 할당
				dto=new UserDTO();
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_pass(rs.getString("user_pass"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setUser_num(rs.getInt("user_num"));
			
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
	
	public UserDTO getUserInfo(String re_user_id) {
		UserDTO re_udto=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		
		try {
			con=getConnection();
			String sql="select user_id, user_num from user where user_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, re_user_id);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				re_udto=new UserDTO();
				re_udto.setUser_id(re_user_id);
				re_udto.setUser_num(rs.getInt("user_num"));
				}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try {pstmt.close();}catch (Exception e2) {}
			if(con!=null) try {con.close();}catch (Exception e2) {}
			if(rs!=null) try {pstmt.close();}catch (Exception e2) {}
		}
		return re_udto;
	}// getuserInfo (User_id User_num)
	
	public void deleteUser(String id) {
		Connection con =null;
		PreparedStatement pstmt=null;
		try {
			con=getConnection();
		 	String sql="delete from user where user_id = ?";
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
	}//deleteUser
	
	// id 체크
      public UserDTO idCheck(String id) {
         UserDTO dto=null;
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
               dto=new UserDTO();
				dto.setUser_email (rs.getString("user_email"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setUser_pass(rs.getString("user_pass"));
				dto.setUser_phone(rs.getString("user_phone"));
				dto.setUser_birth(rs.getString("user_birth"));
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
      public void modifyPass(UserDTO modifyPassDto) {
         Connection con =null;
         PreparedStatement pstmt2=null;
         try {
            con=getConnection();
            String sql2="update user set user_pass=? where user_id =?";
            pstmt2=con.prepareStatement(sql2);
            pstmt2.setString(1, modifyPassDto.getUser_pass()); 
            pstmt2.setString(2, modifyPassDto.getUser_id());  
            pstmt2.executeUpdate();
         } catch (Exception e) {
            e.printStackTrace();
         }finally {
            if(pstmt2!=null) try { pstmt2.close();} catch (Exception e2) {}
            if(con!=null) try { con.close();} catch (Exception e2) {}
         }
      }//modifyPass()
      
		public UserDTO getUser(String id) {
			UserDTO dto=null;
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				// 1,2 디비연결 메서드
				  con=getConnection();
				
				// 3단계 SQL구문 만들어서 실행할 준비(select where id=?)
				String sql="select * from user where user_id=? ";
				  pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);

				// 4단계 SQL구문을 실행(select) => 결과 저장
				  rs=pstmt.executeQuery();

				// 5단계 결과를 출력, 데이터 담기(select)
				// next() 다음행 => 리턴값 데이터 있으면 true/ 데이터 없으면 false
				// 조건이 true 실행문 => 다음행 데이터 있으면 true => 열접근
				if(rs.next()){
					// next() 다음행 => 리턴값 데이터 있으면 true/ 아이디 일치
					// 바구니 객체생성 => 기억장소 할당
					dto=new UserDTO();
					// set메서드호출 바구니에 디비에서 가져온 값 저장
					dto.setUser_id(rs.getString("user_id"));
					dto.setUser_pass(rs.getString("user_pass"));
					dto.setUser_name(rs.getString("user_name"));
					dto.setUser_email(rs.getString("user_email"));
					dto.setUser_phone(rs.getString("user_phone"));
					dto.setUser_birth(rs.getString("user_birth"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				// 예외 상관없이 마무리작업 => 객체생성한 기억장소 해제
				if(pstmt != null) try {	pstmt.close();} catch (Exception e2) {}
				if(con != null) try { con.close();} catch (Exception e2) {}
				if(rs != null) try { rs.close();} catch (Exception e2) {}
			}
			return dto;
	}//getUser()
		
		public UserDTO userCheck(String id, String pass) {
			// 바구니주소가 저장되는 변수를 null로 초기화
			UserDTO dto=null;
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				con=getConnection();
				String sql="select * from user where user_id=? and user_pass=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, pass);
				rs=pstmt.executeQuery();
				if(rs.next()){
					dto=new UserDTO();
					dto.setUser_id(rs.getString("user_id"));
					dto.setUser_pass(rs.getString("user_pass"));
					dto.setUser_name(rs.getString("user_name"));
				}else{
					//	next() 다음행 => 데이터 없으면 false => 아이디 비밀번호 틀림 
					//	=> script	"입력정보틀림" 뒤로이동
					// 바구니주소 null 초기값 설정
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(pstmt != null) try {	pstmt.close();} catch (Exception e2) {}
				if(con != null) try { con.close();} catch (Exception e2) {}
				if(rs != null) try { rs.close();} catch (Exception e2) {}
			}
			return dto;
	}//userCheck()
		
		public void updateUser (UserDTO updateDto) {
			Connection con=null;
			PreparedStatement pstmt=null;

			try {
				  con=getConnection();
						
			 	String sql="update user set user_name=?, user_email=?, user_phone=?, user_birth=? where user_id =?";
			 	pstmt=con.prepareStatement(sql);
			 	//? 채워넣기
			 	pstmt.setString(1, updateDto.getUser_name()); //set 문자열(1번째 물음표, 값 name)
			 	pstmt.setString(2, updateDto.getUser_email()); //set 문자열(1번째 물음표, 값 name)
			 	pstmt.setString(3, updateDto.getUser_phone()); //set 문자열(1번째 물음표, 값 name)
			 	pstmt.setString(4, updateDto.getUser_birth()); //set 문자열(1번째 물음표, 값 name)
			 	pstmt.setString(5, updateDto.getUser_id());  //set 문자열 (5번째 물음표, 값 id)
			 	pstmt.executeUpdate();
			 			
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(pstmt != null) try {	pstmt.close();} catch (Exception e2) {}
				if(con != null) try { con.close();} catch (Exception e2) {}

			}
	}//updateUser
		public int getUserNum(String id) {
			Connection con =null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			int user_num = 0;
			try {
				con=getConnection();
				
				String sql="select user_num from user where user_id=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);

				rs=pstmt.executeQuery();
				if(rs.next()){
					user_num = rs.getInt("user_num");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
			return user_num;
		}//getUserNum()
		
		public String getUserID(int num) {
			Connection con =null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String user_id = null;
			try {
				con=getConnection();
				
				String sql="select user_id from user where user_num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);

				rs=pstmt.executeQuery();
				if(rs.next()){
					user_id = rs.getString("user_id");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
			return user_id;
		}//getUserNum()
		
}//class
