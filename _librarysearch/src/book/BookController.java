package book;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		if (command.equals("/search")) {
			showBookInfo(request);
			RequestDispatcher rd = request.getRequestDispatcher("./search.jsp");
			rd.forward(request, response);
		}
		
		
		/*
		 * if (command.equals("/BoardListAction.do")) {//등록된 글 목록 페이지 출력하기
		 * requestBoardList(request); RequestDispatcher rd =
		 * request.getRequestDispatcher("./board/list.jsp"); rd.forward(request,
		 * response); } else if (command.equals("/BoardWriteForm.do")) { // 글 등록 페이지
		 * 출력하기 requestLoginName(request); RequestDispatcher rd =
		 * request.getRequestDispatcher("./board/writeForm.jsp"); rd.forward(request,
		 * response); } else if (command.equals("/BoardWriteAction.do")) {// 새로운 글 등록하기
		 * requestBoardWrite(request); RequestDispatcher rd =
		 * request.getRequestDispatcher("/BoardListAction.do"); rd.forward(request,
		 * response); } else if (command.equals("/BoardViewAction.do")) {//선택된 글 상세 페이지
		 * 가져오기 requestBoardView(request); RequestDispatcher rd =
		 * request.getRequestDispatcher("/BoardView.do"); rd.forward(request, response);
		 * } else if (command.equals("/BoardView.do")) { //글 상세 페이지 출력하기
		 * RequestDispatcher rd = request.getRequestDispatcher("./board/view.jsp");
		 * rd.forward(request, response); }
		 */
		
	}//end doPost
	
	
	//책정보 리스트 가져오기
	public void showBookInfo(HttpServletRequest request) {
		
		int bookcount;		//찾은 책 개수
		String keyword;		//검색 키워드
		
		keyword = request.getParameter("keyword");
		
		BookDAO dao = BookDAO.getInstance();		//bookDAO 객체
		List<BookVO> bookinfo = new ArrayList<BookVO>();	//book info 담을 List
		
//		bookinfo = dao.searchBook(keyword);
		
		bookcount = bookinfo.size();
		
		request.setAttribute("bookcount", bookcount);
		request.setAttribute("keyword", keyword);
		request.setAttribute("bookinfo", bookinfo);
		
	
	}
	
}//end class




