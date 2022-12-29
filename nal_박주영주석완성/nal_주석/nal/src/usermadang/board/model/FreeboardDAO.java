/* 작성자 배재연 */
package usermadang.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBConnection;

public class FreeboardDAO {
	
	// 싱글톤 처리
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
	
	// freeboard 테이블의 레코드 개수
	public int getTotalArticleListCount(String searchKeyCode, String searchKeyWord) {
		int totalarticlelistcnt = 0;	// 글 개수를 담을 int형 변수 선언
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		if(searchKeyCode == null && searchKeyWord == null) {	// 검색코드와 검색키워드가 모드 null값일 경우
			sql = "SELECT COUNT(*) FROM nal.freeboard WHERE deletion = 0 ";
		} else {	// 검색 키워드가 있을 경우
			sql = "SELECT COUNT(*) FROM nal.freeboard WHERE (" + searchKeyCode + " like '%" + searchKeyWord + "%') AND (deletion = 0) ";
		}
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totalarticlelistcnt = rs.getInt(1);	// 쿼리문을 통해 출력된 행의 개수를 받아서 변수에 저장
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
		
		return totalarticlelistcnt;	// 글 개수를 담은 변수 반환.
	}
	
	// freeboard 테이블의 레코드 가져오기
	public ArrayList<FreeboardVO> getTotalArticleList(int nowpage, int limit, String searchKeyCode, String searchKeyWord) {
		ArrayList<FreeboardVO> volist = new ArrayList<FreeboardVO>();	// 출력할 게시들을 담을 ArrayList<FreeboardVO> 형태 변수 선언
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		int totalarticlelistcnt = getTotalArticleListCount(searchKeyCode, searchKeyWord);	// 총 게시글 수를 받아옴.
		int startpage_articleno = (nowpage - 1) * limit;	// 페이지당 출력할 개수를 계산해 현재 페이지 직전까지 계산된 게시글 번호 저장.
		int index = startpage_articleno + 1;	// 현재 페이지부터 출력될 게시글 번호 저장.
		
		if(searchKeyCode == null && searchKeyWord == null) {	// 검색코드와 검색키워드가 모드 null값일 경우
			sql = "SELECT * FROM nal.freeboard WHERE deletion = 0 ORDER BY articleno DESC ";
		} else {	// 검색 키워드가 있을 경우
			sql = "SELECT * FROM nal.freeboard WHERE (" + searchKeyCode + " like '%" + searchKeyWord + "%') AND (deletion = 0) ORDER BY articleno DESC ";
		}
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);	// absolute 실행을 위해 설정.
			rs = pstmt.executeQuery();
			
			while(rs.absolute(index)) {	// absolute를 통해 이동한 커서 위치의 행에 있는 글의 모든 정보값열들을 vo 객체에 담아 ArrayList<FreeboardVO>에 저장.
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
				
				if(index < (startpage_articleno + limit) && index <= totalarticlelistcnt) {	// index값이 총 게시글수보다 작고 출력될 게시글 번호+9보다 작을 때까지 index에 +1하여 while문 진행
					index++;
				} else {
					break;	// index값이 게시글 번호+9에 도달하면 while문 탈출.
				}
			}
			
			return volist;	// ArrayList<FreeboardVO> 반환.
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
	
	// 선택된 글의 조회수 증가하기
	public void updateHit(int articleno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.getConnection();
			String sql = "SELECT hit from nal.freeboard WHERE articleno = ? ";	// 매개변수로 받은 게시글 번호의 글의 조회수를 받아옴.
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, articleno);
			rs = pstmt.executeQuery();
			
			int hit = 0;	// 조회수를 담을 int형 변수 선언.
			
			if(rs.next()) {
				hit = rs.getInt("hit") + 1;	// 담아온 조회수를 int형으로 받아와 +1 처리한 후 다시 변수에 담음.
			}
			
			sql = "UPDATE nal.freeboard SET hit = ? WHERE articleno = ?";	// 담은 조회수를 매개변수로 받은 게시글 번호의 글의 조회수로 업데이트함.
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

	// member 테이블에서 인증된 id의 사용자명 가져오기
	public String getLoginNameById(String loginid) {
		String loginname = null;	// 사용자명을 담을 문자열 변수 선언.
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT member_name FROM nal.member WHERE member_id = ?";	// 매개변수로 받은 로그인 id에 해당하는 회원의 이름을 조회하는 쿼리문.
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, loginid);
			rs = pstmt.executeQuery();
						
			if(rs.next()) {
				loginname = rs.getString("member_name");	// 실행된 쿼리문으로부터 사용자의 이름값을 받아와 문자열 변수에 저장.
			}
			
			return loginname;	// 저장된 사용자의 이름값을 반환.
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
	
	// 선택된 글 상세 내용 가져오기
	public FreeboardVO getArticleByArticleno(int articleno, int page) {
		FreeboardVO vo = new FreeboardVO();	// 글의 상세 내용을 담을 vo 객체 선언 및 생성.
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM nal.freeboard WHERE articleno = ?";	// 상세 내용을 가져올 게시글을 게시글 번호를 통회 조회하는 쿼리문.
		
		updateHit(articleno);	// 글의 상세 페이지 조회가 실행되므로 조회수를 1 증가 해준다.
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, articleno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {	// 게시글 번호는 primary key로서 게시글당 단 하나뿐이므로 while문이 아닌 if문 실행하여 정보 받아와 vo 객체에 저장.
				vo.setArticleno(rs.getInt("articleno"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setWritedate(rs.getString("writedate"));
				vo.setMember_id(rs.getString("member_id"));
				vo.setMember_name(rs.getString("member_name"));
				vo.setHit(rs.getInt("hit"));
				vo.setDeletion(rs.getInt("deletion"));
			}
			
			return vo;	// 게시글 정보를 담은 vo 객체를 반환.
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

	// 선택된 글의 이전글번호 가져오기
	public int getBeforeArticleno(int articleno, String searchKeyCode, String searchKeyWord) {
		int boforeArticleno = 0;	// 이전글번호를 담을 int형 변수 선언.
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		if(searchKeyCode == null && searchKeyWord == null) {	// 검색코드와 검색키워드가 모드 null값일 경우
			sql = "SELECT articleno, LAG(articleno, 1, 0) OVER(ORDER BY articleno DESC) AS beforeno FROM nal.freeboard WHERE deletion=0 ";
		} else {	// 검색 키워드가 있을 경우
			sql = "SELECT articleno, LAG(articleno, 1, 0) OVER(ORDER BY articleno DESC) AS beforeno FROM nal.freeboard WHERE (" + searchKeyCode + " like '%" + searchKeyWord + "%') AND (deletion = 0) ";
		}
		
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {	// 쿼리 실행 결과 중 상세글에 해당하는 글번호에 해당하는 행을 찾아 해당글의 직전 글번호를 변수에 저장.
				if(rs.getInt("articleno")==articleno) {
					boforeArticleno = rs.getInt("beforeno");
					System.out.println(boforeArticleno);
				}
			}
			
			return boforeArticleno;	// 이전글번호 반환. 없을 경우 0 반환.
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
	
	// 선택된 글의 다음글번호 가져오기
	public int getAfterArticleno(int articleno, String searchKeyCode, String searchKeyWord) {
		int afterArticleno = 0;	// 다음글번호를 담을 int형 변수 선언.
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		if(searchKeyCode == null && searchKeyWord == null) {	// 검색코드와 검색키워드가 모드 null값일 경우
			sql = "SELECT articleno, LEAD(articleno, 1, 0) OVER(ORDER BY articleno DESC) AS afterno FROM nal.freeboard WHERE deletion=0 ";
		} else {	// 검색 키워드가 있을 경우
			sql = "SELECT articleno, LEAD(articleno, 1, 0) OVER(ORDER BY articleno DESC) AS afterno FROM nal.freeboard WHERE (" + searchKeyCode + " like '%" + searchKeyWord + "%') AND (deletion = 0) ";
		}
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {	// 쿼리 실행 결과 중 상세글에 해당하는 글번호에 해당하는 행을 찾아 해당글의 직후 글번호를 변수에 저장.
				if(rs.getInt("articleno")==articleno) {
					afterArticleno = rs.getInt("afterno");
					System.out.println(afterArticleno);
				}
			}
			
			return afterArticleno;	// 다음글번호 반환. 없을 경우 0 반환.
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
	
	// freeboard 테이블에 새로운 글 삽입히가
	public void insertArticle(FreeboardVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// 매개변수로 받은 새로운 글 정보를 담은 VO 객체의 각종 정보를 DB로 insert할 쿼리문. 
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
	
	// 선택된 글 내용 수정하기
	public void updateArticle(FreeboardVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// 매개변수로 받은 수정한 글 정보를 담은 VO 객체의 각종 정보를 DB의 해당 게시글번호에 해당하는 행에 update할 쿼리문.
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
	
	// 선택된 글 삭제하기
	public void deleteArticle(int articleno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// 해당되는 게시글번호를 받아 게시글의 deletion열값을 0에서 1로 변환. 이후 브라우저에 게시글 출력 시 deletion값이 0인 게시글만 출력됨.
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
