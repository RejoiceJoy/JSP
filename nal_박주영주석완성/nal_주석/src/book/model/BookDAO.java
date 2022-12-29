package book.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


import util.DBConnection;


public class BookDAO {
	
	
	
	private BookDAO() {  } //싱글턴 처리
	private static BookDAO instance = new BookDAO();
	public static BookDAO getInstance() {
		return instance;
	}


	public ArrayList<BookVO> searchBook(String keyword) {
		Connection conn = null;
		String sql = "SELECT * FROM nal.book where book_title like '%" + keyword +"%'";
		ArrayList<BookVO> bookinfo = new ArrayList<BookVO>();
		
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
		return bookinfo;
	}//end searchBook

	
}//end class