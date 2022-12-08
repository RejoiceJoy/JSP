package sec03.brd03;

import java.util.List;

//서비스 로직 --> 인터페이스 권장
//서비스 로직 하나이상의 DB작업을 위해
public class BoardService {
	//DAO 설정
	BoardDAO boardDAO;
	
	public BoardService() {
		boardDAO = new BoardDAO();
	}//end BoardService

	//전체글 보기
	public List<ArticleVO> listArticles() {
		List<ArticleVO> articlesList = boardDAO.selectAllArticles();
		return articlesList;
	}//end listArticles
	
	//글쓰기
	public int addArticle(ArticleVO article){
		
		//새로쓴 글번호 반환
		return boardDAO.insertNewArticle(article);		
	}//end addArticle

}//end BoardService
