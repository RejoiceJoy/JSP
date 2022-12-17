package book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import book.BookVO;
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

	public ArrayList<BookVO> searchBook(String keyword) {
		String sql = "SELECT * FROM nal.book where book_title like '%" + keyword +"%'";
		ArrayList<BookVO> bookinfo = new ArrayList<BookVO>();
		
		try {
		conn= DBManager.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
			while (rs.next()) {
				BookVO vo = new BookVO();
				vo.setBook_title(rs.getString("book_title"));
				vo.setAuthor(rs.getString("author"));
				vo.setPublishing(rs.getString("publishing"));
				vo.setRoom_name(rs.getString("room_name"));
				vo.setBook_sorting(rs.getString("book_sorting"));
				vo.setShape(rs.getString("shape"));
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
	
/*	//board 테이블의 레코드 가져오기
	public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int total_record = getListCount(items, text );
		int start = (page - 1) * limit;
		int index = start + 1;

		String sql;

		if (items == null && text == null)
			sql = "SELECT * FROM nal.freeboard where deletion = 0 ORDER BY articleno DESC";
		else
			sql = "SELECT * FROM nal.freeboard where (" + items + " like '%" + text + "%') AND (deletion = 0) ORDER BY articleno DESC ";

		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs = pstmt.executeQuery();

			while (rs.absolute(index)) {
				BoardDTO board = new BoardDTO();
				board.setArticleno(rs.getInt("articleno"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setWritedate(rs.getString("writedate"));
				board.setHit(rs.getInt("hit"));
				board.setMember_id(rs.getString("member_id"));
				board.setMember_name(rs.getString("member_name"));
				board.setDeletion(rs.getInt("deletion"));
				list.add(board);

				if (index < (start + limit) && index <= total_record)
					index++;
				else
					break;
			}
			return list;
		} catch (Exception ex) {
			System.out.println("getBoardList() 에러 : " + ex);
		} finally {
			try {
				if (rs != null) 
					rs.close();							
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}			
		}
		return null;
	}//end method
*/	
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
	}//end showBookTitle()
	
	
}