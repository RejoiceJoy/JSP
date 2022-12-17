package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;
import model.BoardDTO;

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
	
		if (command.equals("/BoardListAction.do")) {//등록된 글 목록 페이지 출력하기
			requestBoardList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./board/list.jsp");
			rd.forward(request, response);
		} else if (command.equals("/BoardWriteForm.do")) { // 글 등록 페이지 출력하기
				requestLoginName(request);
				RequestDispatcher rd = request.getRequestDispatcher("./board/writeForm.jsp");
				rd.forward(request, response);				
		} else if (command.equals("/BoardWriteAction.do")) {// 새로운 글 등록하기
				requestBoardWrite(request);
				RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
				rd.forward(request, response);						
		} else if (command.equals("/BoardViewAction.do")) {//선택된 글 상세 페이지 가져오기
				requestBoardView(request);
				RequestDispatcher rd = request.getRequestDispatcher("/BoardView.do");
				rd.forward(request, response);						
		} else if (command.equals("/BoardView.do")) { //글 상세 페이지 출력하기
				RequestDispatcher rd = request.getRequestDispatcher("./board/view.jsp");
				rd.forward(request, response);	
		} else if (command.equals("/BoardUpdateAction.do")) { //선택된 글의 조회수 증가하기
				requestBoardUpdate(request);
				RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
				rd.forward(request, response);
		}else if (command.equals("/BoardDeleteAction.do")) { //선택된 글 삭제하기
				requestBoardDelete(request);
				RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
				rd.forward(request, response);				
		} 
	}
	//등록된 글 목록 가져오기	
	public void requestBoardList(HttpServletRequest request){
		
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
		
	  	int pagenum=1;
		int limit=LISTCOUNT;
		
		if(request.getParameter("pagenum")!=null)
			pagenum=Integer.parseInt(request.getParameter("pagenum"));
			
		String items = request.getParameter("itmes");
		String text = request.getParameter("text");
		
		int total_record=dao.getListCount(items, text);
		boardlist = dao.getBoardList(pagenum, limit, items, text); 
		
		int total_pagenum;
		
		if (total_record % limit == 0){     
	     	total_pagenum =total_record/limit;
	     	Math.floor(total_pagenum);  
		}
		else{
		   total_pagenum =total_record/limit;
		   Math.floor(total_pagenum); 
		   total_pagenum =  total_pagenum + 1; 
		}		
   
   		request.setAttribute("pagenum", pagenum);		  
   		request.setAttribute("total_pagenum", total_pagenum);   
		request.setAttribute("total_record",total_record); 
		request.setAttribute("boardlist", boardlist);								
	}
	//인증된 사용자명 가져오기
	public void requestLoginName(HttpServletRequest request){
					
		String member_id = request.getParameter("member_id");
		
		BoardDAO  dao = BoardDAO.getInstance();
		
		String member_name = dao.getLoginNameById(member_id);		
		
		request.setAttribute("member_name", member_name);									
	}
	// 새로운 글 등록하기
	public void requestBoardWrite(HttpServletRequest request){
					
		BoardDAO dao = BoardDAO.getInstance();		
		
		BoardDTO board = new BoardDTO();
		board.setMember_id(request.getParameter("member_id"));
		board.setMember_name(request.getParameter("member_name"));
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));	
		
		System.out.println(request.getParameter("name"));
		System.out.println(request.getParameter("title"));
		System.out.println(request.getParameter("content"));
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		String writedate = formatter.format(new java.util.Date()); 
		
//		board.setHit(0);
		board.setWritedate(writedate);
		
		dao.insertBoard(board);								
	}
	//선택된 글 상세 페이지 가져오기
	public void requestBoardView(HttpServletRequest request){
					
		BoardDAO dao = BoardDAO.getInstance();
		int articleno = Integer.parseInt(request.getParameter("articleno"));
		int pagenum = Integer.parseInt(request.getParameter("pagenum"));	
		
		BoardDTO board = new BoardDTO();
		board = dao.getBoardByNum(articleno, pagenum);		
		
		request.setAttribute("articleno", articleno);		 
   		request.setAttribute("pagenum", pagenum); 
   		request.setAttribute("board", board);   									
	}
	//선택된 글 내용 수정하기
	public void requestBoardUpdate(HttpServletRequest request){
					
		int articleno = Integer.parseInt(request.getParameter("articleno"));
		int pagenum = Integer.parseInt(request.getParameter("pagenum"));	
		
		BoardDAO dao = BoardDAO.getInstance();		
		
		BoardDTO board = new BoardDTO();		
		board.setArticleno(articleno);
		board.setMember_name(request.getParameter("name"));
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));		
		
		 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		 String writedate = formatter.format(new java.util.Date()); 
		 
//		 board.setHit(0);
		 board.setWritedate(writedate);		
		
		 dao.updateBoard(board);								
	}
	//선택된 글 삭제하기
	public void requestBoardDelete(HttpServletRequest request){
					
		int articleno = Integer.parseInt(request.getParameter("articleno"));
		int pagenum = Integer.parseInt(request.getParameter("pagenum"));	
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.deleteBoard(articleno);							
	}	
}
