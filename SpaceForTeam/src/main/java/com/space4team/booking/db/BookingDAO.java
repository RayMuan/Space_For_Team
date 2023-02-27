package com.space4team.booking.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;





public class BookingDAO {
	public Connection getConnection() throws Exception{

		Connection con =null;
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		con=ds.getConnection();
		return con;
	
	} //getConnection()
	public void insertBooking(BookingDTO dto) {
		Connection con =null;
		PreparedStatement pstmt = null;
		try {
			// 예외가 발생할 가능성이 높은 명령(1~4단계)
			// 1~2 단계
			con=getConnection();
			// 3단계 SQL구문 만들어서 실행할 준비(insert)
//			dto.setBk_num(bk_num);
//			dto.setS_num(s_num);
//			dto.setUser_num(user_num);
//			dto.setBk_usercount(bk_usercount);
//			dto.setBk_date(bk_date);
//			dto.setBk_price(bk_price);
//			dto.setBk_usedate(bk_usedate);
//			dto.setBk_starttime(bk_starttime);
//			dto.setBk_endtime(bk_endtime);
			
			String sql="insert into booking(s_num,user_num,bk_usercount,bk_date,bk_price,bk_usedate,bk_starttime,bk_endtime,bk_usetime) values(?,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			// ? 채워넣기 
			pstmt.setInt(1, dto.getS_num()); 
			pstmt.setInt(2, dto.getUser_num()); 
			pstmt.setInt(3, dto.getBk_usercount()); 
			pstmt.setTimestamp(4, dto.getBk_date()); 
			pstmt.setInt(5, dto.getBk_price()); 
			pstmt.setString(6, dto.getBk_usedate()); 
			pstmt.setInt(7, dto.getBk_starttime()); 
			pstmt.setInt(8, dto.getBk_endtime());
			pstmt.setInt(9, dto.getBk_usetime());

			// 4단계 SQL구문을 실행(insert,update,delete)
			pstmt.executeUpdate();
		} catch (Exception e) {
			// 예외가 발생하면 처리하는 곳
			e.printStackTrace();
		}finally {
			// 예외 상관없이 마무리작업 => 객체생성한 기억장소 해제
			if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
			if(con!=null) try { con.close();} catch (Exception e2) {}
		}
		return;
	}//insertMember() 메서드
	
	public BookingDTO getBooking(int bk_num) {
		BookingDTO dto=null;
		
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try {
//			1~2단계
			con=getConnection();
//			3단계
			String sql = "select * from booking where bk_num =?";	
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bk_num);
//			4단계
			rs = pstmt.executeQuery();
// 			rs.next() 데이터 있으면 true => 열 접근 => 한 명 정보 MemberDTO에 저장
//			5단계
			while(rs.next()){
				
			dto = new BookingDTO();
			
			dto.setBk_num(rs.getInt("bk_num")); // 예약번호
			dto.setS_num(rs.getInt("s_num"));  // 공간번호
			dto.setBk_usercount(rs.getInt("bk_usercount"));  // 예약인원
			dto.setBk_date(rs.getTimestamp("bk_date"));   // 예약날짜
			dto.setBk_price(rs.getInt("bk_price"));   // 가격
			dto.setBk_usedate(rs.getString("bk_usedate"));   // 사용일
			dto.setBk_starttime(rs.getInt("bk_starttime"));  // 시작시간
			dto.setBk_endtime(rs.getInt("bk_endtime"));  // 종료시간
			dto.setBk_usetime(rs.getInt("bk_usetime"));  // 사용시간
		}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
//			반복되므로 나중에 함수로 따로 빼줘도 됨.
			if(pstmt!=null)try {
				pstmt.close();
				} catch (Exception e2) {}
			if(con!=null)try {
				con.close();
				} catch (Exception e2) {}	
			if(rs!=null)try {
				rs.close();
				} catch (Exception e2) {}	
		}
		return dto;
	} // getBooking



//리턴할형 ArrayList<BookingDTO> getBookingList매서드 정의
	public ArrayList<BookingDTO> getBookingList(int startRow, int pageSize){
		
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		ArrayList<BookingDTO> bookingList=new ArrayList<BookingDTO>();
	//  + int pageSize int startRow를 가지고 가야됨.
		try {
//			1~2단계
			con = getConnection();
//			3단계
//			num을 기준으로 오름차순인 것을  => 최근글이 위로 올라오도록 내림차순으로 변경
			String sql = "select * from booking order by bk_num desc limit ?, ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,startRow-1);
			// limit 조건이 첫행을 포함하지 않기때문에 첫행을 포함할 수 있도록 -1을 해줌
		 	pstmt.setInt(2,pageSize);
//			4단계
			rs = pstmt.executeQuery();
			// rs.next() 데이터 있으면 true => 열 접근 => 한 명 정보 MemberDTO에 저장
//			5단계
			while(rs.next()) {
				// MemberDTO 객체생성 
				BookingDTO dto = new BookingDTO();
				// set 매서드호출을 통한 열접근
				dto.setBk_num(rs.getInt("bk_num")); // 예약번호
				dto.setS_num(rs.getInt("s_num"));  // 공간번호
				dto.setUser_num(rs.getInt("user_num"));  // 유저번호
				dto.setBk_usercount(rs.getInt("bk_usercount"));  // 예약인원
				dto.setBk_date(rs.getTimestamp("bk_date"));   // 예약날짜
				dto.setBk_price(rs.getInt("bk_price"));   // 가격
				dto.setBk_usedate(rs.getString("bk_usedate"));   // 사용일
				dto.setBk_starttime(rs.getInt("bk_starttime"));  // 시작시간
				dto.setBk_endtime(rs.getInt("bk_endtime"));  // 종료시간
				dto.setBk_usetime(rs.getInt("bk_usetime"));  // 사용시간
			
				// 배열 한칸에 회원정보+주소 저장
			;
			bookingList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null)try {
				pstmt.close();
				} catch (Exception e2) {}
			if(con!=null)try {
				con.close();
				} catch (Exception e2) {}	
			if(rs!=null)try {
				rs.close();
				} catch (Exception e2) {}	
		}
		return bookingList;
	} //getBookingList()
	
	
public int getBookingCount() {
	int count = 0;
	
	Connection con = null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	try {
		con = getConnection();
//		
	 	String sql = "select count(*) from booking";
	 	pstmt = con.prepareStatement(sql);
	 	rs = pstmt.executeQuery();
	 	if(rs.next()) {
	 		count = rs.getInt("count(*)");
	 	}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(pstmt!=null)try {
			pstmt.close();
			} catch (Exception e2) {}
		if(con!=null)try {
			con.close();
			} catch (Exception e2) {}	
		if(rs!=null)try {
			rs.close();
			} catch (Exception e2) {}
	}
	return count;
} //getBookingCount

public void updateBooking(BookingDTO dto) {
	
	Connection con = null;
	PreparedStatement pstmt=null;
	

	
//	dto.setBk_num(bk_num);
//	dto.setBk_usedate(bk_usedate);
//	dto.setBk_usercount(bk_usercount);
//	dto.setBk_starttime(bk_starttime);
//	dto.setBk_endtime(bk_endtime);
	try {
		con = getConnection();
//		num name subject content
	 	String sql = "update booking set bk_usedate = ?, bk_usercount = ?, bk_starttime=?, bk_endtime=? where bk_num = ?";
	 	pstmt = con.prepareStatement(sql);
	 	pstmt.setString(1,dto.getBk_usedate());
	 	pstmt.setInt(2,dto.getBk_usercount());
	 	pstmt.setInt(3,dto.getBk_starttime());
	 	pstmt.setInt(4,dto.getBk_endtime());
	 	pstmt.setInt(5,dto.getBk_num());
	 	pstmt.executeUpdate();	
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(pstmt!=null)try {
			pstmt.close();
			} catch (Exception e2) {}
		if(con!=null)try {
			con.close();
			} catch (Exception e2) {}					
	}

} //updateBooking

public void deleteBooking(int bk_num) {
	
	Connection con = null;
	PreparedStatement pstmt=null;
	
	try { 
		con = getConnection();
//	num name subject content
 	String sql = "delete from booking where bk_num = ?";
 	pstmt = con.prepareStatement(sql);
 	pstmt.setInt(1,bk_num);
 	pstmt.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(pstmt!=null)try {
			pstmt.close();
			} catch (Exception e2) {}
		if(con!=null)try {
			con.close();
			} catch (Exception e2) {}					
	}
}//deleteBooking

public void updateBooking(int bk_num) {
    Connection con = null;
    PreparedStatement pstmt=null;
    PreparedStatement pstmt2=null;
    ResultSet rs = null;
    
    try {
       
       con = getConnection();
       int num =1;
        
        //3 최대 num + 1
        String sql = "select max(pay_num) from booking";
        pstmt = con.prepareStatement(sql);
        
        //4
        rs=pstmt.executeQuery();
        //5
        if(rs.next()) {
           num=rs.getInt("max(pay_num)")+1;
        }
        System.out.println("bknum"+bk_num);
        System.out.println("sql 구문 진행");
        System.out.println("num"+num);
        sql = "update booking set payment=?,pay_num=? where bk_num=?";
        pstmt2 = con.prepareStatement(sql);
        String pay = "결제완료";
        pstmt2.setString(1, pay);
        
        pstmt2.setInt(2, num);
        pstmt2.setInt(3, bk_num);
        
        System.out.println("num"+ num);
        System.out.println("bk_num"+ bk_num);
        pstmt2.executeUpdate();
        
    }
       catch (Exception e) {
          e.printStackTrace();
       } finally {
          if(pstmt!=null)try {
             pstmt.close();
             } catch (Exception e2) {}
          if(con!=null)try {
             con.close();
             } catch (Exception e2) {}   
          if(rs != null) try {rs.close();} catch (Exception e2) {}
       }
 }
}