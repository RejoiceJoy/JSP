package usermadang.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBConnection;

public class FreeboardDAO {
	
	private static FreeboardDAO instance;

	private FreeboardDAO() {
		super();
	}
	
	public static FreeboardDAO getInstance() {
		if(instance == null) {
			instance = new FreeboardDAO();
		}
		return instance;
	}
	
	public int getTotalArticleListCount(String searchKeyCode, String searchKeyWord) {
		int totalarticlelistcnt = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		if(searchKeyCode == null && searchKeyWord == null) {
			sql = "SELECT COUNT(*) FROM nal.freeboard WHERE deletion = 0 ";
		} else {
			sql = "SELECT COUNT(*) FROM nal.freeboard WHERE (" + searchKeyCode + " like '%" + searchKeyWord + "%') AND (deletion = 0) ";
		}
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totalarticlelistcnt = rs.getInt(1);
			}
		} catch(Exception e) {
			System.out.println("getTotalArticleListCount() 에러 : " + e);
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch(Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		
		return totalarticlelistcnt;
	}
	
	public ArrayList<FreeboardVO> getTotalArticleList(int nowpage, int limit, String searchKeyCode, String searchKeyWord) {
		ArrayList<FreeboardVO> volist = new ArrayList<FreeboardVO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		int totalarticlelistcnt = getTotalArticleListCount(searchKeyCode, searchKeyWord);
		int startpage_articleno = (nowpage - 1) * limit;
		int index = startpage_articleno + 1;
		
		if(searchKeyCode == null && searchKeyWord == null) {
			sql = "SELECT * FROM nal.freeboard WHERE deletion = 0 ORDER BY articleno DESC ";
		} else {
			sql = "SELECT * FROM nal.freeboard WHERE (" + searchKeyCode + " like '%" + searchKeyWord + "%') AND (deletion = 0) ORDER BY articleno DESC ";
		}
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs = pstmt.executeQuery();
			
			while(rs.absolute(index)) {
				FreeboardVO vo = new FreeboardVO();
				vo.setArticleno(rs.getInt("articleno"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setWritedate(rs.getString("writedate"));
				vo.setMember_id(rs.getString("member_id"));
				vo.setMember_name(rs.getString("member_name"));
				vo.setHit(rs.getInt("hit"));
				vo.setDeletion(rs.getInt("deletion"));
				volist.add(vo);
				
				if(index < (startpage_articleno + limit) && index <= totalarticlelistcnt) {
					index++;
				} else {
					break;
				}
			}
			
			return volist;
		} catch(Exception e) {
			System.out.println("getTotalArticleList() 에러 : " + e);
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch(Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		
		return null;
	}
	
	public void updateHit(int articleno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.getConnection();
			String sql = "SELECT hit from nal.freeboard WHERE articleno = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, articleno);
			rs = pstmt.executeQuery();
			
			int hit = 0;
			
			if(rs.next()) {
				hit = rs.getInt("hit") + 1;
			}
			
			sql = "UPDATE nal.freeboard SET hit = ? WHERE articleno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hit);
			pstmt.setInt(2, articleno);
			pstmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("getTotalArticleList() 에러 : " + e);
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch(Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}

	public String getLoginNameById(String loginid) {
		String loginname = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT member_name FROM nal.member WHERE member_id = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, loginid);
			rs = pstmt.executeQuery();
						
			if(rs.next()) {
				loginname = rs.getString("member_name");
			}
			
			return loginname;
		} catch(Exception e) {
			System.out.println("getTotalArticleList() 에러 : " + e);
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch(Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		
		return null;
	}
	
	public FreeboardVO getArticleByArticleno(int articleno, int page) {
		FreeboardVO vo = new FreeboardVO();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM nal.freeboard WHERE articleno = ?";
		
		updateHit(articleno);
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, articleno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setArticleno(rs.getInt("articleno"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setWritedate(rs.getString("writedate"));
				vo.setMember_id(rs.getString("member_id"));
				vo.setMember_name(rs.getString("member_name"));
				vo.setHit(rs.getInt("hit"));
				vo.setDeletion(rs.getInt("deletion"));
			}
			
			return vo;
		} catch(Exception e) {
			System.out.println("getTotalArticleList() 에러 : " + e);
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch(Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		
		return null;
	}

	public int getBeforeArticleno(int articleno, String searchKeyCode, String searchKeyWord) {
		int boforeArticleno = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		if(searchKeyCode == null && searchKeyWord == null) {
			sql = "SELECT articleno, LAG(articleno, 1, 0) OVER(ORDER BY articleno DESC) AS beforeno FROM nal.freeboard WHERE deletion=0 ";
		} else {
			sql = "SELECT articleno, LAG(articleno, 1, 0) OVER(ORDER BY articleno DESC) AS beforeno FROM nal.freeboard WHERE (" + searchKeyCode + " like '%" + searchKeyWord + "%') AND (deletion = 0) ";
		}
		
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(rs.getInt("articleno")==articleno) {
					boforeArticleno = rs.getInt("beforeno");
					System.out.println(boforeArticleno);
				}
			}
			
			return boforeArticleno;
		} catch(Exception e) {
			System.out.println("getBeforeArticleno() 에러 : " + e);
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch(Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		
		return 0;
	}
	
	public int getAfterArticleno(int articleno, String searchKeyCode, String searchKeyWord) {
		int afterArticleno = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		if(searchKeyCode == null && searchKeyWord == null) {
			sql = "SELECT articleno, LEAD(articleno, 1, 0) OVER(ORDER BY articleno DESC) AS afterno FROM nal.freeboard WHERE deletion=0 ";
		} else {
			sql = "SELECT articleno, LEAD(articleno, 1, 0) OVER(ORDER BY articleno DESC) AS afterno FROM nal.freeboard WHERE (" + searchKeyCode + " like '%" + searchKeyWord + "%') AND (deletion = 0) ";
		}
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(rs.getInt("articleno")==articleno) {
					afterArticleno = rs.getInt("afterno");
					System.out.println(afterArticleno);
				}
			}
			
			return afterArticleno;
		} catch(Exception e) {
			System.out.println("getAfterArticleno() 에러 : " + e);
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch(Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		
		return 0;
	}
	
	public void insertArticle(FreeboardVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "INSERT INTO nal.freeboard(articleno, title, content, member_id, member_name) VALUES(articleno_seq.nextval, ?, ?, ?, ?)";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getMember_id());
			pstmt.setString(4, getLoginNameById(vo.getMember_id()));
			pstmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("getTotalArticleList() 에러 : " + e);
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch(Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}
		
	public void updateArticle(FreeboardVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "UPDATE nal.freeboard SET title = ?, content = ? WHERE articleno = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getArticleno());
			pstmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("getTotalArticleList() 에러 : " + e);
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch(Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}
	
	public void deleteArticle(int articleno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "UPDATE nal.freeboard SET deletion = 1 WHERE articleno = ? ";

		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, articleno);
			pstmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("getTotalArticleList() 에러 : " + e);
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch(Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}
	
}
