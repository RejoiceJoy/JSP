package sec03.brd02;

import java.util.List;


//서비스 로직 --> 인터페이스 권장
//서비스 로직 하나이상의 DB작업을 위해
public class BoardService {
	
	//DAO 설정
	private BoardDAO boardDAO;
	
	
	public BoardService() {
		boardDAO = new BoardDAO();
	}//end BoardService

	//전체글 보기
	public List<ArticleVO> listArticles() {
		List<ArticleVO> articlesList = boardDAO.selectAllArticles();
		return articlesList;
	}//end listArticles
	
	//글쓰기
	public void addArticle(ArticleVO article){
		boardDAO.insertNewArticle(article);		
	}//end addArticle

}//end class
