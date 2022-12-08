package sec03.brd01;

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
	}//end class

	//오라클 DB 테이블 계층 질의  select
	public List selectAllArticles() {
		//db SQL 결과 저장 인터페이스 사용은 거의 문법 수준
		List articlesList = new ArrayList();
		try {
			//DBCP 이용 연결됨 싱글턴 사용 효과
			conn = dataFactory.getConnection();
			String query = "SELECT LEVEL,articleNO,parentNO,title,content,id,writeDate" 
			             + " from t_board"
					     + " START WITH  parentNO=0" + " CONNECT BY PRIOR articleNO=parentNO"
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
	
}//end BoardDAO
