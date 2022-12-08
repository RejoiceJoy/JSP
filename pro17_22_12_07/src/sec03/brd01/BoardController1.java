package sec03.brd01;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//http://localhost:8080/pro17/board/listArticles.do

//URL 주소 매핑 Deployment Descriptors 에서 확인 가능
//중복 되면 서버 꺼짐
//URL 요청 처리는 2단계로 이루어짐
//사용자 브라우저가 URL /http://localhost:8080/pro17/board/으로 시작

//@WebServlet("/board/*")
public class BoardController1 extends HttpServlet {
	//과거 코드 여러개의 웹서버에서 중복처리
	private static final long serialVersionUID = 1L;
	
	//서비스 로직
	private BoardService boardService;

	//서블릿 시작시 boardService 생성
	public void init(ServletConfig config) throws ServletException {
		boardService = new BoardService();
	}//end init

	//http get 요청 처리
	protected void doGet(HttpServletRequest request, HttpServletResponse response)	
			throws ServletException, IOException {
		//실제 처리할 부분 함수로 처리
		doHandle(request, response);
	}//end doGet

	//http post 요청 처리
	protected void doPost(HttpServletRequest request, HttpServletResponse response)	
			throws ServletException, IOException {
		//실제 처리할 부분 함수로 처리
		doHandle(request, response);
	}//end doPost

	// 실핼할 로직 get, post 2개라서 함수로 처리
	private void doHandle(HttpServletRequest request, HttpServletResponse response)	
			throws ServletException, IOException {
		System.out.println("BoardController1 ");
		//이동할 JSP 페이지 위치 설정
		String nextPage = "";
		
		//한국어 처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		//사용자 브라우져에서 URL에서 요청명[가장 끝부분]가져옴
		String action = request.getPathInfo();
		System.out.println("action:" + action);
		try {
			List<ArticleVO> articlesList = new ArrayList<ArticleVO>();
			//if (action == null || action.equals("/"))
			if (action == null || action.equals("/")) {
				articlesList = boardService.listArticles();
				request.setAttribute("articlesList", articlesList);
				nextPage = "/board01/listArticles.jsp";
			} else if (action.equals("/listArticles.do")) {
				articlesList = boardService.listArticles();
				request.setAttribute("articlesList", articlesList);
				nextPage = "/board01/listArticles.jsp";
			}else {
				nextPage = "/board01/listArticles.jsp";
			}//end if
			
			//실제 Controller 부분
			//이동할 JSP 경로를 RequestDispatcher 에 저장
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			//request 에 저장된 DB 반환 데이터 또는 문자값을 가지고 이동
			dispatch.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}//end try
	}//end doHandle

}//end class
