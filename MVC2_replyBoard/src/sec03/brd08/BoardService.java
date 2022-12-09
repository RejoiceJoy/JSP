package sec03.brd08;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BoardService {
	
	//dao 싱글턴
	private BoardDAO boardDAO  = BoardDAO.getInstance();
	
	
	//페이징 처리
	public Map listArticles(Map<String, Integer> pagingMap) {
		//하나이상 object 의 저장 위해 map
		Map articlesMap = new HashMap();
		//페이징 할 글 리스트
		List<ArticleVO> articlesList = boardDAO.selectAllArticles2(pagingMap);
		//articleNO 총 갯수
		int totArticles = boardDAO.selectTotArticles();
		//map에 2개의 object 넣기
		articlesMap.put("articlesList", articlesList);
		articlesMap.put("totArticles", totArticles);
		
		return articlesMap;
	}//end listArtic

	//전체 글 목록
	public List<ArticleVO> listArticles() {
		List<ArticleVO> articlesList = boardDAO.selectAllArticles();
		return articlesList;
	}//list..

	//새글 추가
	public int addArticle(ArticleVO article) {
		return boardDAO.insertNewArticle(article);
	}//end add..

	//글 보기
	public ArticleVO viewArticle(int articleNO) {
		ArticleVO article = null;
		article = boardDAO.selectArticle(articleNO);
		return article;
	}

	//글 업데이트
	public void modArticle(ArticleVO article) {
		boardDAO.updateArticle(article);
	}//

	//글삭제
	public List<Integer> removeArticle(int articleNO) {
		//삭제할 글 있는지 확인
		List<Integer> articleNOList = boardDAO.selectRemovedArticles(articleNO);
		//글 삭제
		boardDAO.deleteArticle(articleNO);
		//삭제된 글 갯수
		return articleNOList;
	}//end re...

	//새답글 추가
	public int addReply(ArticleVO article) {
		return boardDAO.insertNewArticle(article);
	}//end add..

}//end class
