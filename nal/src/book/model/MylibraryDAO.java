//작성자: 이기쁨
package book.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBConnection;
//DB의 mylibrary 테이블 데이터를 가져와서 사용할 DAO 클래스 
public class MylibraryDAO {
	Connection conn = null;
	
	private MylibraryDAO() {  } //싱글턴 처리
	private static MylibraryDAO instance = new MylibraryDAO();
	public static MylibraryDAO getInstance() {
		return instance;
	}
	//내서재에 회원아이디, isbn을 INSERT 하는 메서드
	public void insertMyLibrary(MylibraryVO vo) {
		String sql = "INSERT INTO nal.mylibrary(mylibrary_code, member_id, isbn) VALUES(mylibrary_seq.nextval, ?, ?)";				
		try {
			conn= DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, vo.getMember_id());
			pstmt.setLong(2, vo.getIsbn());	
			pstmt.executeUpdate();
			System.out.println("성공");
		}catch (SQLException e) {
			System.out.println("\n에러 발생! >> insertMyLibrary");		
			System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
		}//end try			
	}//end insertMyLibrary
	

}
