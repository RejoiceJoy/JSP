package sec03.brd06;

import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import sec03.brd06.ArticleVO;

public class BoardDAO {
	// DBCP 처리 위해 생성
	private DataSource dataFactory;
	Connection conn;
	PreparedStatement pstmt;

	// DBCP 설정 01_DBCP_Test.jsp 테스트
	public BoardDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}//end try
	}//end BoardDAO

	// 오라클 DB 테이블 계층 질의 select
	public List<ArticleVO> selectAllArticles() {
		// db SQL 결과 저장 인터페이스 사용은 거의 문법 수준
		List<ArticleVO> articlesList = new ArrayList<ArticleVO>();
		try {
			// DBCP 이용 연결됨 싱글턴 사용 효과
			conn = dataFactory.getConnection();
			String query = " SELECT LEVEL,articleNO,parentNO "
					+ " ,title,content,id,writeDate " 
			        + " from t_board "
					+ " START WITH  parentNO=0 " 
			        + " CONNECT BY PRIOR articleNO=parentNO "
					+ " ORDER SIBLINGS BY articleNO DESC ";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				int level = rs.getInt("level");
				int articleNO = rs.getInt("articleNO");
				int parentNO = rs.getInt("parentNO");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String id = rs.getString("id");
				Date writeDate = rs.getDate("writeDate");
				ArticleVO article = new ArticleVO();
				article.setLevel(level);
				article.setArticleNO(articleNO);
				article.setParentNO(parentNO);
				article.setTitle(title);
				article.setContent(content);
				article.setId(id);
				article.setWriteDate(writeDate);
				articlesList.add(article);
			}//end while
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}//end try
		return articlesList;
	}//end selectAllArticles

	// getNewArticleNO() 시퀀스 nextval 기능
	private int getNewArticleNO() {
		try {
			// DBCP 이용 연결됨 싱글턴 사용 효과
			conn = dataFactory.getConnection();
			String query = "SELECT  max(articleNO) from t_board ";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery(query);
			// 데이터 반환하면
			if (rs.next())
				// 현재번호 + 1 메소드 나가기
				return (rs.getInt(1) + 1);
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}//end try
		// 데이터없으면
		return 0;
	}//end getNewArticleNO

	// t_board insert
	public int insertNewArticle(ArticleVO article) {
		int articleNO = getNewArticleNO();
		try {
			// DBCP 이용 연결됨 싱글턴 사용 효과
			conn = dataFactory.getConnection();
			int parentNO = article.getParentNO();
			String title = article.getTitle();
			String content = article.getContent();
			String id = article.getId();
			String imageFileName = article.getImageFileName();
			String query = "INSERT INTO t_board "
					+ " (articleNO, parentNO, title, content, imageFileName, id)"
					+ " VALUES (?, ? ,?, ?, ?, ?) ";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, articleNO);
			pstmt.setInt(2, parentNO);
			pstmt.setString(3, title);
			pstmt.setString(4, content);
			pstmt.setString(5, imageFileName);
			pstmt.setString(6, id);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}//end try

		return articleNO;
	}//end insertNewArticle

	// 상세 페이지 보기
	public ArticleVO selectArticle(int articleNO) {
		// t_board 데이터 담을 공간
		ArticleVO article = new ArticleVO();
		try {
			conn = dataFactory.getConnection();
			String query = "select articleNO,parentNO,title,content, "
					+ " NVL(imageFileName, 'null') as imageFileName"
					+ " ,id, writeDate" + " from t_board "
					+ " where articleNO = ? ";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, articleNO);
			ResultSet rs = pstmt.executeQuery();
			//가져올 데이터 가 1행이라고 예상하니 while 사용않함
			rs.next();
			
			//ArticleVO로 데이터를 전달하기 위한 처리
			int _articleNO = rs.getInt("articleNO");
			int parentNO = rs.getInt("parentNO");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String imageFileName = 
					URLEncoder.encode(rs.getString("imageFileName"), "UTF-8"); 
			if(imageFileName.equals("null")) {
				imageFileName = null;
			}//end if			
			String id = rs.getString("id");
			Date writeDate = rs.getDate("writeDate");

			//ArticleVO 데이터 채우기
			article.setArticleNO(_articleNO);
			article.setParentNO(parentNO);
			article.setTitle(title);
			article.setContent(content);
			article.setImageFileName(imageFileName);
			article.setId(id);
			article.setWriteDate(writeDate);
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}//end try
		return article;
	}//end selectArticle

	//게시글 업데이트
	public void updateArticle(ArticleVO article) {
		
		//업데이트 수행할 정보 저장
		int articleNO = article.getArticleNO();
		String title = article.getTitle();
		String content = article.getContent();
		String imageFileName = article.getImageFileName();
		
		try {
			// DBCP 이용 연결됨 싱글턴 사용 효과
			conn = dataFactory.getConnection();
			String query = "update t_board  "
					+ "set title=?,content=? ";
			//해당게시물에 이미지 업로드 했으면
			if (imageFileName != null && imageFileName.length() != 0) {
				query += ",imageFileName=?";
			}//end if
			query += " where articleNO=?";
			//sql문 출력
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			//해당게시물에 이미지 업로드 했으면
			if (imageFileName != null && imageFileName.length() != 0) {
				pstmt.setString(3, imageFileName);
				pstmt.setInt(4, articleNO);
			} else {
				pstmt.setInt(3, articleNO);
			}//end if
			//SQL 실행
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}//end try
	}//end updateArticle

	//삭제할 게시물 번호 가져오기 계층형 구조이기때문에
	public List<Integer> selectRemovedArticles(int  articleNO) {
		//삭제할 게시물의 번호들 저장할 공간
		List<Integer> articleNOList = new ArrayList<Integer>();
		try {
			// DBCP 이용 연결됨 싱글턴 사용 효과
			conn = dataFactory.getConnection();
			String query = "SELECT articleNO FROM  t_board  ";
			query += " START WITH articleNO = ?";
			query += " CONNECT BY PRIOR  articleNO = parentNO";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, articleNO);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				articleNO = rs.getInt("articleNO");
				//ArrayList 저장
				articleNOList.add(articleNO);
			}//end while
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}//end try
		
		return articleNOList;
	}//end selectRemovedArticles
	
	//게시글 삭제
	public void deleteArticle(int  articleNO) {
		try {
			// DBCP 이용 연결됨 싱글턴 사용 효과
			conn = dataFactory.getConnection();
			//서브퀴리 이용 삭제
			String query = "DELETE FROM t_board ";
			query += " WHERE articleNO in ( ";
			query += "  SELECT articleNO FROM  t_board ";
			query += " START WITH articleNO = ? ";
			query += " CONNECT BY PRIOR  articleNO = parentNO )";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, articleNO);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}//end try
	}//end deleteArticle

	

}//end BoardDAO
