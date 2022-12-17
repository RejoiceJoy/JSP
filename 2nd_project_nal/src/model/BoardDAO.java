package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBManager;

public class BoardDAO {

	private static BoardDAO instance;
	
	private BoardDAO() {
		
	}

	public static BoardDAO getInstance() {
		if (instance == null)
			instance = new BoardDAO();
		return instance;
	}
	
	//board 테이블의 레코드 개수
	public int getListCount(String items, String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int articlecnt = 0;

		String sql;
		
		if (items == null && text == null)
			sql = "SELECT COUNT(*)	FROM nal.freeboard where deletion = 0";
		else
			sql = "SELECT COUNT(*)	FROM nal.freeboard where (" + items + " like '%" + text + "%') AND (deletion = 0)";
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) 
				articlecnt = rs.getInt(1);
			
		} catch (Exception ex) {
			System.out.println("getListCount() 에러: " + ex);
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
		return articlecnt;
	}
	//board 테이블의 레코드 가져오기
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
	}
	//member 테이블에서 인증된 id의 사용자명 가져오기
	public String getLoginNameById(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	

		String name = null;
		String sql = "select * from member where member_id = ? ";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) 
				name = rs.getString("name");	
			
			return name;
		} catch (Exception ex) {
			System.out.println("getBoardByNum() 에러 : " + ex);
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
	}

	//board 테이블에 새로운 글 삽입히가
	public void insertBoard(BoardDTO board)  {

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();		

			String sql = "insert into nal.freeboard values(articleno_seq.nextval, ?, ?, ?, ?, ?, ?)";
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getWritedate());
			pstmt.setString(4, board.getMember_id());
			pstmt.setString(5, board.getMember_name());
			pstmt.setInt(6, board.getDeletion());
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("insertBoard() 에러 : " + ex);
		} finally {
			try {									
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}		
	} 
	//선택된 글의 조회수 증가하기
	public void updateHit(int num) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();

			String sql = "select hit from board where num = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			int hit = 0;

			if (rs.next())
				hit = rs.getInt("hit") + 1;
		

			sql = "update board set hit=? where num=?";
			pstmt = conn.prepareStatement(sql);		
			pstmt.setInt(1, hit);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("updateHit() 에러 : " + ex);
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
	}
	//선택된 글 상세 내용 가져오기
	public BoardDTO getBoardByNum(int articleno, int page) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO board = new BoardDTO();

		updateHit(articleno);
		String sql = "select * from nal.freeboard where articleno = ? ";

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, articleno);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				board.setArticleno(rs.getInt("articleno"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setWritedate(rs.getString("writedate"));
				board.setHit(rs.getInt("hit"));
				board.setMember_id(rs.getString("member_id"));
				board.setMember_name(rs.getString("member_name"));
				board.setDeletion(rs.getInt("deletion"));
			}
			
			return board;
		} catch (Exception ex) {
			System.out.println("getBoardByNum() 에러 : " + ex);
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
	}
	//선택된 글 내용 수정하기
	public void updateBoard(BoardDTO board) {

		Connection conn = null;
		PreparedStatement pstmt = null;
	
		try {
			String sql = "update nal.freeboard set title=?, content=? where articleno = ? ";

			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			conn.setAutoCommit(false);

			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getArticleno());

			pstmt.executeUpdate();			
			conn.commit();

		} catch (Exception ex) {
			System.out.println("updateBoard() 에러 : " + ex);
		} finally {
			try {										
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}
	} 
	//선택된 글 삭제하기
	public void deleteBoard(int articleno) {
		Connection conn = null;
		PreparedStatement pstmt = null;		

		String sql = "delete from board where articleno = ? ";	

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, articleno);
			pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("deleteBoard() 에러 : " + ex);
		} finally {
			try {										
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}
	}	
}
