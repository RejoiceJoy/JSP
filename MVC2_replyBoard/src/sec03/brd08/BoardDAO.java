package sec03.brd08;

import java.net.URLEncoder;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



import utill.DBManager;

public class BoardDAO {
	
	 private BoardDAO() {  } //싱글턴 처리
	  private static BoardDAO instance = new BoardDAO();
	  public static BoardDAO getInstance() {
	    return instance;
	  }
	//
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	PreparedStatement cstmt = null;

	

	// 페이징 처리한 글목록 view
	public List selectAllArticles2(Map pagingMap) {
		List articlesList = new ArrayList();
		// 섹션값
		int section = (Integer) pagingMap.get("section");
		// 페이지 번호
		int pageNum = (Integer) pagingMap.get("pageNum");
		try {
			
			//한 섹션은 10개식 10개 100개라고 생각
			 String query =" SELECT * FROM ( "
						+ " select ROWNUM  as recNum,"+"LVL,"
							+"articleNO,"
							+"parentNO,"
							+"title,"
							+"id,"
							+"writeDate"
				                  +" from (select LEVEL as LVL, "
								+"articleNO, "
								+"parentNO, "
								+"title, "
								+"id, "
								 +"writeDate"
							   +" from t_board " 
							   +" START WITH  parentNO=0 "
							   +" CONNECT BY PRIOR articleNO = parentNO "
							  +"  ORDER SIBLINGS BY articleNO DESC ) "
					+" ) "                        
					+" where recNum between(?-1)*100+(?-1)*10+1 and (?-1)*100+?*10 ";                
		   
		
			
			System.out.println(query);
			conn= DBManager.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, section);
			pstmt.setInt(2, pageNum);
			pstmt.setInt(3, section);
			pstmt.setInt(4, pageNum);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				 int level = rs.getInt("lvl");
			      int articleNO = rs.getInt("articleNO");
			      int parentNO = rs.getInt("parentNO");
			      String title = rs.getString("title");
			      String id = rs.getString("id");
			      Date writeDate= rs.getDate("writeDate");
				ArticleVO article = new ArticleVO();
				article.setLevel(level);
				article.setArticleNO(articleNO);
				article.setParentNO(parentNO);
				article.setTitle(title);
				article.setId(id);
				article.setWriteDate(writeDate);
				articlesList.add(article);
			} // end while
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} // end try
		return articlesList;
	}// end selectAllArticles2

	// 기본 글가져오기 view
	public List selectAllArticles() {
		List articlesList = new ArrayList();
		try {
			
			String query = "SELECT LEVEL,articleNO,parentNO,title,content,id,writeDate " 
					+ " from t_board"
					+ " START WITH  parentNO=0" 
					+ " CONNECT BY PRIOR articleNO=parentNO "
					+ " ORDER SIBLINGS BY articleNO DESC ";
		
			System.out.println(query);
			// DHCP
			conn= DBManager.getConnection();			
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
			} // end while
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} // end try
		return articlesList;
	}// end

	// 새글번호 가져오기 
	public int getNewArticleNO() {
		try {
			
			// sql 출력
			String query = "SELECT  max(articleNO) from t_board ";
			
			System.out.println(query);
			// DHCP
			conn= DBManager.getConnection();			
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery(query);
			if (rs.next()) {// 새글번호는 기존 최고값 +1
				return (rs.getInt(1) + 1);
			} // end if
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} // end try
		return 0;
	}// end getNewArticleNO

	// 게시판 새글 처리 plsql 저장프로시저
	public int insertNewArticle(ArticleVO article) {
		// 시퀀스 대신 사용 새글 번호
		int articleNO = getNewArticleNO();

		try {
			
			//필요한 파라미터 가져오기
			int parentNO = article.getParentNO();
			String title = article.getTitle();
			String content = article.getContent();
			String id = article.getId();
			String imageFileName = article.getImageFileName();
			// 저장프로시저 호출 파라미터 순서주의
			String query = "INSERT INTO t_board (articleNO, parentNO, title, content, imageFileName, id)"
					+ " VALUES (?, ? ,?, ?, ?, ?)";
			
		
			System.out.println(query);
			// DHCP
			conn= DBManager.getConnection();			
			cstmt = conn.prepareCall(query);
			cstmt.setInt(1, articleNO);
			cstmt.setInt(2, parentNO);
			cstmt.setString(3, title);
			cstmt.setString(4, content);
			cstmt.setString(5, imageFileName);
			cstmt.setString(6, id);
			cstmt.executeUpdate();
			cstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} // end try
		return articleNO;
	}// end insertNewArticle

	// 글선택 
	public ArticleVO selectArticle(int articleNO) {
		ArticleVO article = new ArticleVO();
		try {
			
			// SQL 
			String query = "select articleNO,parentNO,title,content,"
					+ " NVL(imageFileName, 'null') as imageFileName, id, writeDate" 
			+ " from t_board "
			+ " where articleNO=?";
	
			System.out.println(query);
			// DHCP
			conn= DBManager.getConnection();			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, articleNO);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			int _articleNO = rs.getInt("articleNO");
			int parentNO = rs.getInt("parentNO");
			String title = rs.getString("title");
			String content = rs.getString("content");
			// 파일이름에 특수문자가 있을 경우// 인코딩합니다.
			String imageFileName = URLEncoder.encode(rs.getString("imageFileName"), "UTF-8"); //�����̸��� Ư�����ڰ� ���� ��� ���ڵ��մϴ�.
			if(imageFileName.equals("null")) {
				imageFileName = null;
			}
			
			
			String id = rs.getString("id");
			Date writeDate = rs.getDate("writeDate");

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
		} // end try
		return article;
	}// end selectArticle

	// 게시판 글업데이트
	public void updateArticle(ArticleVO article) {
		int articleNO = article.getArticleNO();
		String title = article.getTitle();
		String content = article.getContent();
		String imageFileName = article.getImageFileName();
		try {
			
			String query = "";
			// 이미지 파일 변경시 업로드
			if (imageFileName != null && imageFileName.length() != 0) {
				//저장프로시저 호출 파라미터 순서주의
				query = "update t_board  set title=?,content=?";
				if (imageFileName != null && imageFileName.length() != 0) {
					query += ",imageFileName=?";
				}
				query += " where articleNO=?";

				System.out.println(query);

				System.out.println(query);
				//DHCP
				conn= DBManager.getConnection();				
				cstmt = conn.prepareStatement(query);
				cstmt.setInt(1, articleNO);
				cstmt.setString(2, title);
				cstmt.setString(3, content);
				cstmt.setString(4, imageFileName);				
				cstmt.executeUpdate();
				cstmt.close();
				conn.close();
			} // end if
			
		} catch (Exception e) {
			e.printStackTrace();
		} // end try
	}// end updateArticle(

	// 게시물 삭제 
	public void deleteArticle(int articleNO) {
		try {
			String query = "DELETE FROM t_board ";
			query += " WHERE articleNO in (";
			query += "  SELECT articleNO FROM  t_board ";
			query += " START WITH articleNO = ?";
			query += " CONNECT BY PRIOR  articleNO = parentNO )";
			System.out.println(query);
		
			//DHCP
			conn= DBManager.getConnection();			
			cstmt = conn.prepareStatement(query);
			cstmt.setInt(1, articleNO);
			cstmt.executeUpdate();
			cstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} // end try
	}// end deleteArticle

	//삭제할 게시글 번호 가져오기 plsql 함수
	public List<Integer> selectRemovedArticles(int articleNO) {
		List<Integer> articleNOList = new ArrayList<Integer>();
		try {
			
			String query = "SELECT articleNO FROM  t_board2  ";
			query += " START WITH articleNO = ?";
			query += " CONNECT BY PRIOR  articleNO = parentNO";
			System.out.println(query);
			//dhcp
			conn= DBManager.getConnection();			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, articleNO);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				articleNO = rs.getInt("articleNO");
				articleNOList.add(articleNO);
			} // end while
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} // end try
		return articleNOList;
	}

	// 전체 글수 가져오기 plsql 함수
	public int selectTotArticles() {
		try {
			// 디비연결
			String query = "select count(articleNO) from t_board ";
			System.out.println(query);
		
			System.out.println(query);
			//dhcp
			conn= DBManager.getConnection();			
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {// 데이터 있으면
				// 1번째 데이터 반환
				return (rs.getInt(1));
			} // END IF
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} // end try
		return 0; // 데이터 없으면 기본값
	}// end selc...

}// end class
