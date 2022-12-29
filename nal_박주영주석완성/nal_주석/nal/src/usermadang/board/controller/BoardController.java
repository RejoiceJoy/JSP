package usermadang.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import usermadang.board.model.*;

@WebServlet("*.do")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 10; 

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
	
		if (command.equals("/freeBoardList.do")) {//등록된 글 목록 페이지 출력하기
				requestBoardList(request);
				RequestDispatcher rd = request.getRequestDispatcher("./freeboard/freeboard_list.jsp");
				rd.forward(request, response);
		} else if (command.equals("/freeBoardForm.do")) { // 글 등록 페이지 출력하기
				requestLoginName(request);
				RequestDispatcher rd = request.getRequestDispatcher("./freeboard/freeboard_writeform.jsp");
				rd.forward(request, response);				
		} else if (command.equals("/freeBoardUpdate.do")) { // 글 수정 페이지 출력하기
				requestLoginName(request);
				requestBoardView(request);
				RequestDispatcher rd = request.getRequestDispatcher("./freeboard/freeboard_rewriteform.jsp");
				rd.forward(request, response);				
		} else if (command.equals("/freeboardProc.do")) {// 새로운 글 등록하기
				requestBoardWrite(request);
//				RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
//				rd.forward(request, response);						
				HttpSession session = request.getSession(); // 세션에 담기
//				request.setAttribute("nickName", "Gurum");
				response.sendRedirect("./freeBoardList.do");
		} else if (command.equals("/freeBoardDetail.do")) {//선택된 글 상세 페이지 가져오기
				requestBoardView(request);
				RequestDispatcher rd = request.getRequestDispatcher("/BoardView.do");
				rd.forward(request, response);						
		} else if (command.equals("/BoardView.do")) { //글 상세 페이지 출력하기
				RequestDispatcher rd = request.getRequestDispatcher("./freeboard/freeboard_detail.jsp");
				rd.forward(request, response);	
		} else if (command.equals("/updateFreeboardProc.do")) { // 글 수정하기
//				requestBoardUpdate(request);
				requestBoardDelete(request);
				requestBoardWrite(request);
				HttpSession session = request.getSession(); // 세션에 담기
//				RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
//				rd.forward(request, response);
				response.sendRedirect("./freeBoardList.do");
		}else if (command.equals("/delFreeboardProc.do")) { //선택된 글 삭제하기
				requestBoardDelete(request);
				RequestDispatcher rd = request.getRequestDispatcher("/freeBoardList.do");
				rd.forward(request, response);				
		} 
	}
	//등록된 글 목록 가져오기	
	public void requestBoardList(HttpServletRequest request){
			
		FreeboardDAO dao = FreeboardDAO.getInstance();
		List<FreeboardVO> boardlist = new ArrayList<FreeboardVO>();
		
	  	int pageIndex=1;
		int limit=LISTCOUNT;
		
		if(request.getParameter("pageIndex")!=null)
			pageIndex=Integer.parseInt(request.getParameter("pageIndex"));
				
		String searchKeyCode = request.getParameter("searchKeyCode");
		String searchKeyWord = request.getParameter("searchKeyWord");
		
		int total_record=dao.getTotalArticleListCount(searchKeyCode, searchKeyWord);
		boardlist = dao.getTotalArticleList(pageIndex, limit, searchKeyCode, searchKeyWord); 
		
		int total_page;
		
		if (total_record % limit == 0){     
	     	total_page =total_record/limit;
	     	Math.floor(total_page);  
		}
		else{
		   total_page =total_record/limit;
		   Math.floor(total_page); 
		   total_page =  total_page + 1; 
		}		
   
   		request.setAttribute("pageIndex", pageIndex);		  
   		request.setAttribute("total_page", total_page);   
		request.setAttribute("total_record",total_record); 
		request.setAttribute("searchFreeBoardVO", boardlist);
		request.setAttribute("searchKeyCode", searchKeyCode);
		request.setAttribute("searchKeyWord", searchKeyWord);
	}
	//인증된 사용자명 가져오기
	public void requestLoginName(HttpServletRequest request){
					
		String member_id = request.getParameter("member_id");
		
		FreeboardDAO  dao = FreeboardDAO.getInstance();
		
		String member_name = dao.getLoginNameById(member_id);		
		
		request.setAttribute("member_name", member_name);									
	}
	// 새로운 글 등록하기
	public void requestBoardWrite(HttpServletRequest request){
					
		FreeboardDAO dao = FreeboardDAO.getInstance();		
		
		FreeboardVO board = new FreeboardVO();
		board.setMember_id(request.getParameter("member_id"));
//		board.setMember_name(request.getParameter("member_name"));
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("contents"));	
		
		System.out.println(request.getParameter("member_id"));
		System.out.println(request.getParameter("title"));
		System.out.println(request.getParameter("contents"));
//		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
//		String writedate = formatter.format(new java.util.Date()); 
		
//		board.setHit(0);
//		board.setWritedate(writedate);
		
		dao.insertArticle(board);								
	}
	//선택된 글 상세 페이지 가져오기
	public void requestBoardView(HttpServletRequest request){
					
		FreeboardDAO dao = FreeboardDAO.getInstance();
		int articleno = Integer.parseInt(request.getParameter("articleno"));
		int pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
		
		String searchKeyCode = request.getParameter("searchKeyCode");
		String searchKeyWord = request.getParameter("searchKeyWord");
		
		FreeboardVO board = new FreeboardVO();
		FreeboardVO beforeboard = new FreeboardVO();
		FreeboardVO afterboard = new FreeboardVO();
		board = dao.getArticleByArticleno(articleno, pageIndex);
		int beforeArticleno = dao.getBeforeArticleno(articleno, searchKeyCode, searchKeyWord);
		if(beforeArticleno != 0) {
			beforeboard = dao.getArticleByArticleno(beforeArticleno, pageIndex);
		}
		int afterArticleno = dao.getAfterArticleno(articleno, searchKeyCode, searchKeyWord);
		if(afterArticleno != 0) {
			afterboard = dao.getArticleByArticleno(afterArticleno, pageIndex);
		}
		
//		dao.updateHit(articleno);
		
		request.setAttribute("articleno", articleno);		 
   		request.setAttribute("pageIndex", pageIndex); 
   		request.setAttribute("FreeBoardVO", board);   
   		request.setAttribute("beforeno", beforeArticleno);
   		request.setAttribute("afterno", afterArticleno);
   		if(beforeArticleno != 0) {
   			request.setAttribute("beforeboard", beforeboard); 
		}
		if(afterArticleno != 0) {
			request.setAttribute("afterboard", afterboard); 
		}
//   	request.setAttribute("searchKeyCode", searchKeyCode);
//		request.setAttribute("searchKeyWord", searchKeyWord);
	}
	//선택된 글 내용 수정하기
	public void requestBoardUpdate(HttpServletRequest request){
					
		int articleno = Integer.parseInt(request.getParameter("articleno"));
		int pageIndex = Integer.parseInt(request.getParameter("pageIndex"));	
		
		FreeboardDAO dao = FreeboardDAO.getInstance();		
		
		FreeboardVO board = new FreeboardVO();		
		board.setArticleno(articleno);
//		board.setMember_name(request.getParameter("name"));
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("contents"));		
		
//		 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
//		 String writedate = formatter.format(new java.util.Date()); 
		 
//		 board.setHit(0);
//		 board.setWritedate(writedate);		
		
		 dao.updateArticle(board);								
	}
	//선택된 글 삭제하기
	public void requestBoardDelete(HttpServletRequest request){
					
		int articleno = Integer.parseInt(request.getParameter("articleno"));
		int pageIndex = Integer.parseInt(request.getParameter("pageIndex"));	
		
		FreeboardDAO dao = FreeboardDAO.getInstance();
		dao.deleteArticle(articleno);							
	}	
}
