package book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBManager;


public class BookDAO {
	Connection conn = null;
	
	
	 private BookDAO() {  } //싱글턴 처리
	  private static BookDAO instance = new BookDAO();
	  public static BookDAO getInstance() {
	    return instance;
	  }
	
	
	
	//select
	public void showbookinfo() {
		String sql = "select * from nal.book";
		try {
			conn= DBManager.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				long book_code = rs.getLong("book_code");
				String book_title = rs.getString("book_title");
				String author = rs.getString("author");
				String publishing = rs.getString("publishing");
				String room_name = rs.getString("room_name");
				String book_sorting = rs.getString("book_sorting");
				String shape = rs.getString("shape");
				long isbn = rs.getLong("isbn");
				
				System.out.print(book_code + book_title + author + publishing + room_name + book_sorting + shape + isbn);			
			}			
		}catch (SQLException e) {
			System.out.println("\n에러 발생! >> showbookinfo");		
			System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
		}//end try
	}//end showbookinfo()

	public String showBookTitle() {
		BookVO bookVO = new BookVO();
		
		String sql = "select book_title from nal.book";
		try {
			conn= DBManager.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {			
				bookVO.setBook_title(rs.getString("book_title"));
				
//				vo.setSight_name(rs.getString("sight_name"));
				
				System.out.print(rs.getString("book_title"));			
			}			
		}catch (SQLException e) {
			System.out.println("\n에러 발생! >> showBookTitle");		
			System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
		}//end try
		
		return bookVO.getBook_title();
		
	}
	
}
