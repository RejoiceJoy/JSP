//작성자: 이기쁨
package book.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBConnection;
//DB의 mylist VIEW의 데이터를 가져와서 사용할 DAO 클래스 
public class MyListDAO {
	Connection conn = null;	
	private MyListDAO() {  } 
	private static MyListDAO instance = new MyListDAO();
	public static MyListDAO getInstance() {
		return instance;
	}
	//회원 아이디를 세션값으로 저장해두고 이를 토대로 검색하여 해당 사용자의 내서재목록을 불러오는 메서드
	public ArrayList<MyListVO> selectList(String sessionId) {
		String sql = "SELECT * FROM nal.mylist where member_id = '" + sessionId + "' order by 1";
		ArrayList<MyListVO> mylist = new ArrayList<MyListVO>();		
		try {
			conn= DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

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
		return mylist;	//회원 아이디에 해당하는 책 정보를 반환
	}//end selectList

}//end class
