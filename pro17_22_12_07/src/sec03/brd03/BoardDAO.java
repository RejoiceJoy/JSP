package sec03.brd03;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	//DBCP 처리 위해 생성
	private DataSource dataFactory;
	Connection conn;
	PreparedStatement pstmt;

	//DBCP 설정  01_DBCP_Test.jsp 테스트 
	public BoardDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}//end try
	}//end BoardDAO

	//오라클 DB 테이블 계층 질의  select
	public List<ArticleVO> selectAllArticles() {
		//db SQL 결과 저장 인터페이스 사용은 거의 문법 수준
		List<ArticleVO> articlesList = new ArrayList<ArticleVO>();
		try {
			//DBCP 이용 연결됨 싱글턴 사용 효과
			conn = dataFactory.getConnection();
			String query = "SELECT LEVEL,articleNO,parentNO,"
					+ "title,content,id,writeDate" 
					+ " from t_board"
					+ " START WITH  parentNO=0" 
					+ " CONNECT BY PRIOR articleNO = parentNO"
					+ " ORDER SIBLINGS BY articleNO DESC";
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

	//getNewArticleNO() 시퀀스 nextval 기능
	private int getNewArticleNO() {
		try {
			//DBCP 이용 연결됨 싱글턴 사용 효과
			conn = dataFactory.getConnection();
			String query = "SELECT  max(articleNO) from t_board ";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery(query);
			//데이터 반환하면
			if (rs.next())
				//현재번호 + 1 메소드 나가기
				return (rs.getInt(1) + 1); 
			//end if
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}//end try
		//데이터없으면
		return 0;
	}//end getNewArticleNO

	//t_board insert
	public int insertNewArticle(ArticleVO article) {
		int articleNO = getNewArticleNO();
		try {
			//DBCP 이용 연결됨 싱글턴 사용 효과
			conn = dataFactory.getConnection();
			int parentNO = article.getParentNO();
			String title = article.getTitle();
			String content = article.getContent();
			String id = article.getId();
			String imageFileName = article.getImageFileName();
			String query = "INSERT INTO t_board (articleNO, parentNO, title, content, imageFileName, id)"
					+ " VALUES (?, ? ,?, ?, ?, ?)";
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

}//end BoardDAO
