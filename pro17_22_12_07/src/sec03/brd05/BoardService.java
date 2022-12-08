package sec03.brd05;

import java.util.List;

//서비스 로직 --> 인터페이스 권장
//서비스 로직 하나이상의 DB작업을 위해

public class BoardService {
	//DAO 설정
	BoardDAO boardDAO;

	public BoardService() {
		boardDAO = new BoardDAO();
	}

	//전체글 보기
	public List<ArticleVO> listArticles() {
		List<ArticleVO> articlesList = boardDAO.selectAllArticles();
		return articlesList;
	}//end listArticles

	//글쓰기
	public int addArticle(ArticleVO article) {
		return boardDAO.insertNewArticle(article);
	}//end addArticle

	//게시글 보기
	public ArticleVO viewArticle(int articleNO) {
		ArticleVO article = null;
		article = boardDAO.selectArticle(articleNO);
		return article;
	}//end viewArticle
	
	//글 수정하기
	public void modArticle(ArticleVO article) {
		boardDAO.updateArticle(article);
	}//end modArticle

}//end BoardService
