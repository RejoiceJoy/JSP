//작성자: 이기쁨
package book.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import book.model.BookDAO;
import book.model.BookVO;
import book.model.MyListDAO;
import book.model.MyListVO;
import book.model.MylibraryDAO;
import book.model.MylibraryVO;
import util.DBConnection;

/**
 * Servlet implementation class SearchController
 */
@WebServlet("*.nal")	// ~.nal을 호출하면 오게되는 서블릿
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public void init(ServletConfig config) throws ServletException {
		System.out.println("init 메서드 호출");
	}

	public void destroy() {
		System.out.println("destroy 메서드 호출");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet 메서드 호출");
		doHandle(request, response);	//get방식으로 받아서 doHandle 메서드 호출
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost 메서드 호출");
		doHandle(request, response);	//post방식으로 받아서 doHandle 메서드 호출
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doHandle 메서드 호출");
		
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
				
		request.setCharacterEncoding("utf-8");	//utf-8인코딩 한글안깨지게!!
		response.setContentType("text/html; charset=utf-8");	//utf-8인코딩 한글안깨지게!!
		PrintWriter writer = response.getWriter();
		
		System.out.println();
		
		if(command.equals("/main.nal")) {		//	
			mainSearch(request);
			System.out.println("ifmainkey = ");			
			RequestDispatcher rd = request.getRequestDispatcher("./search.jsp");
			rd.forward(request, response);
		} else if (command.equals("/search.nal")) {
			String keyword = (String)request.getParameter("keyword");
			request.setAttribute("count", 1);	//검색창에서 책을 검색할 때에는 메인에서 저장한 결과가 나타나지 않게 count값 입력해줌
			System.out.println("ifkeyword = " + keyword);
			String jsoninfo = showBookinfo(keyword).toJSONString();	//JSONObject에 담긴 정보를 jsoninfo에 저장
			System.out.println(jsoninfo);
			writer.print(jsoninfo);		//jsoninfo를 writer를 통해 브라우저로 보내줌	
		} else if(command.equals("/mylibrary.nal")) {
			//HttpSession session = request.getSession();
			pushInsert(request);
			System.out.println("성공2");			
			showList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./mylibrary.jsp");
			rd.forward(request, response);			
		} else if(command.equals("/mylist.nal")) {
			showList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./mylibrary.jsp");
			rd.forward(request, response);	
		}

		//출력하여 확인해보기
		String keyword = (String)request.getParameter("keyword");
		System.out.println("keyword = " + keyword);
		
		String mainkey = (String)request.getParameter("mainkey");
		System.out.println("mainkey = " + mainkey);
	
	}//end doHandle
	

	//키워드로 검색해서 나오는 책 정보들을 JSONObject에 넣어주는 메서드
	public JSONObject showBookinfo(String keyword) {
		BookDAO dao = BookDAO.getInstance();		//BookDAO 객체 호출해서 dao에 저장
		JSONObject jsonobj = new JSONObject();		//책정보 저장할 JSONObject 선언	

			JSONArray bookinfoArray = new JSONArray();				//JSONObject들 저장할 JSOArray 선언
			ArrayList<BookVO> infoArr = dao.searchBook(keyword);	//searchBook 메서드 호출: 책 정보 저장된 ArrayList 받아옴
			
			for (int i = 0; i < infoArr.size(); i++) {		//ArrayList에 담긴 정보만큼 for문 실행
				JSONObject bookinfo = new JSONObject();		//책 정보를 JsonObject에 담기
				bookinfo.put("book_title", infoArr.get(i).getBook_title());
				bookinfo.put("author", infoArr.get(i).getAuthor());
				bookinfo.put("publishing", infoArr.get(i).getPublishing());
				bookinfo.put("room_name", infoArr.get(i).getRoom_name());
				bookinfo.put("book_sorting", infoArr.get(i).getBook_sorting());
				bookinfo.put("isbn", infoArr.get(i).getIsbn());
				
				bookinfoArray.add(bookinfo);		//각 JSONObject 들을 JSONArray에 넣어줌					
			}
			jsonobj.put("books", bookinfoArray);	//JSONArray를 book이란 이름표로 JSONObject에 넣어줌												
		return jsonobj;	//JSONObject 반환
	}//end showBookinfo	
		
	//메인화면에서 검색 할 시 시행되는 메서드
	public void mainSearch(HttpServletRequest request) {	
		BookDAO dao = BookDAO.getInstance();		
		String mainkey = (String)request.getParameter("mainkey");	//메인 검색창에서 입력한 검색 키워드
		ArrayList<BookVO> infoArr = dao.searchBook(mainkey);		//키워드로 검색하여 ArrayList infoArr에 저장
		int count = 0;  		//count값이 0일 때 만 메인창에서 검색한 결과 출력되도록 함
		
		for (int i = 0; i < infoArr.size(); i++) {
			request.setAttribute("infoArr", infoArr);	//infoArr를 브라우저로 보내주기 위해 request에 저장			
		}//end for
		
		request.setAttribute("count", count);	//count값도 저장
	}//end mainSearch
	
	//회원별 자신의 내서재 저장 책목록을 보여주는 메서드
	public void showList(HttpServletRequest request) {
		MyListDAO dao = MyListDAO.getInstance();		//MyListDAO 객체 호출
		HttpSession session = request.getSession();		//세션값 저장 위해 객체 생성
		String sessionId = (String) session.getAttribute("sessionId");	//회원 아이디 세션에 저장	
		ArrayList<MyListVO> mylist = dao.selectList(sessionId);		//세션에 저장된 아이디 값으로 검색하여 해댕 회원의 내서재 저장 목록 가져옴
		for (int i = 0; i < mylist.size(); i++) {
			request.setAttribute("mylist", mylist);	//mylist 브라우저로 보내주기 위해 request에 저장
		}//end for
	}
	
	//내서재에 담기 버튼 누를 때 mylibrary 테이블에 정보 INSERT 하는 메서드
	public void pushInsert(HttpServletRequest request){
		MylibraryDAO dao = MylibraryDAO.getInstance();	//MylibraryDAO 객체 호출 
		
		MylibraryVO vo = new MylibraryVO();	//MylibraryVO 객체 호출
	
		HttpSession session = request.getSession();
		String sessionId = (String) session.getAttribute("sessionId");	//세션값 받아옴	

		String isbn = request.getParameter("isbn");	//isbn 값 받아옴

		vo.setIsbn(Long.parseLong(isbn));	//isbn 값 vo에 저장
		
		vo.setMember_id(sessionId);			//회원아이디 세션값 vo에 저장
		System.out.println(vo.getIsbn());
		System.out.println(vo.getMember_id());
		
		dao.insertMyLibrary(vo);	//insert 메서드 실행	
	}//end pushInsert
	
}//end class