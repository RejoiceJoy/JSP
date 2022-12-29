package usermadang.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import usermadang.board.model.*;

/**
 * Servlet implementation class BoardPlease
 */
@WebServlet("/BoardPlease.please")
public class BoardPlease extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		requestBoardUpdate(request);
//		requestBoardDelete(request);
//		requestBoardWrite(request);
//		HttpSession session = request.getSession(); // 세션에 담기
////		RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
////		rd.forward(request, response);
		response.sendRedirect("./freeBoardList.do");
	}
	
	public void requestBoardUpdate(HttpServletRequest request){
		
		int articleno = Integer.parseInt(request.getParameter("articleno"));
		int pageIndex = Integer.parseInt(request.getParameter("pageIndex"));	
		
		FreeboardDAO dao = FreeboardDAO.getInstance();		
		
		FreeboardVO board = new FreeboardVO();		
		board.setArticleno(articleno);
//		board.setMember_name(request.getParameter("name"));
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));		
		
//		 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
//		 String writedate = formatter.format(new java.util.Date()); 
		 
//		 board.setHit(0);
//		 board.setWritedate(writedate);		
		
		 dao.updateArticle(board);								
	}

}
