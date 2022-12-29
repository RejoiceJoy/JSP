package book.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBConnection;

public class MyListDAO {

	Connection conn = null;
	
	private MyListDAO() {  } //싱글턴 처리
	private static MyListDAO instance = new MyListDAO();
	public static MyListDAO getInstance() {
		return instance;
	}
	
	public ArrayList<MyListVO> selectList(String sessionId) {
		String sql = "SELECT * FROM nal.mylist where member_id = '" + sessionId + "' order by 1";
		ArrayList<MyListVO> mylist = new ArrayList<MyListVO>();
		
		try {
			conn= DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			System.out.println("성공dao메서드");
				while (rs.next()) {
					MyListVO vo = new MyListVO();
					vo.setMylist_code(rs.getLong("mylist_code"));
					vo.setIsbn(rs.getLong("isbn"));
					vo.setBook_title(rs.getString("book_title"));
					vo.setAuthor(rs.getString("author"));
					vo.setPublishing(rs.getString("publishing"));
					vo.setBook_sorting(rs.getString("book_sorting"));
								
					mylist.add(vo);					
				}//end while					
			}catch (SQLException e) {
				System.out.println("\n에러 발생! >> selectList");		
				System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
			} catch (Exception e) {
				e.printStackTrace();
			}//end try	
		
		return mylist;		
	}//end selectList
	
	
	
	
}//end class
