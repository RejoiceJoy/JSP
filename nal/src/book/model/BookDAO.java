//작성자: 이기쁨
package book.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


import util.DBConnection;
//DB의 Book테이블 데이터를 가져와서 사용할 DAO 클래스 
public class BookDAO {
	private BookDAO() {  } //싱글턴 처리
	private static BookDAO instance = new BookDAO();
	public static BookDAO getInstance() {
		return instance;
	}
	//keyword로 검색해서 책 정보 가져오는 메서드
	public ArrayList<BookVO> searchBook(String keyword) {
		Connection conn = null;
		String sql = "SELECT * FROM nal.book where book_title like '%" + keyword +"%'";	//브라우저에서 입력한 keyword를 가져와서 해당 keyword가 포함된 책 제목을 검색
		ArrayList<BookVO> bookinfo = new ArrayList<BookVO>();	//검색해 온 책 정보를 담을 ArrayList
		
		try {
		conn= DBConnection.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
			while (rs.next()) {
				BookVO vo = new BookVO();
				vo.setBook_title(rs.getString("book_title"));
				vo.setAuthor(rs.getString("author"));
				vo.setPublishing(rs.getString("publishing"));
				vo.setBook_sorting(rs.getString("book_sorting"));
				vo.setRoom_name(rs.getString("room_name"));
				vo.setIsbn(rs.getLong("isbn"));
				
				bookinfo.add(vo);
			}				
		}catch (SQLException e) {
			System.out.println("\n에러 발생! >> searchBook");		
			System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
		}//end try	
		return bookinfo;	//DB 정보를 담고있는 ArrayList 반환
	}//end searchBook

	
}//end class