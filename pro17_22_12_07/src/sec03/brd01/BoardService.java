package sec03.brd01;

import java.util.List;

//서비스 로직 하나이상의 DB작업을 위해
public class BoardService {
	
	//DAO 설정
	private BoardDAO boardDAO;
	
	public BoardService() {
		boardDAO = new BoardDAO();
	}//end BoardService

	
	public List<ArticleVO> listArticles() {
		List<ArticleVO> articlesList = boardDAO.selectAllArticles();
		return articlesList;
	}//end listArticles
	
	
}//end BoardService
