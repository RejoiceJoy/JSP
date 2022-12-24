package main;

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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.DBManager;

/**
 * Servlet implementation class BookControllerJson
 */
@WebServlet("*.do")
public class testServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public void init(ServletConfig config) throws ServletException {
		System.out.println("init 메서드 호출");
	}

	public void destroy() {
		System.out.println("destroy 메서드 호출");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet 메서드 호출");
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost 메서드 호출");
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doHandle 메서드 호출");
		
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
				
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		System.out.println();
		
		if(command.equals("/main.do")) {
			
			mainSearch(request);
			System.out.println("ifmainkey = ");
			
			RequestDispatcher rd = request.getRequestDispatcher("./_search9.jsp");
			rd.forward(request, response);
		} else if (command.equals("/search.do")) {
			String keyword = (String)request.getParameter("keyword");
			request.setAttribute("count", 1);
			System.out.println("ifkeyword = " + keyword);
			String jsoninfo = showBookinfo(keyword).toJSONString();
			System.out.println(jsoninfo);
			writer.print(jsoninfo);
			
		}
				
		String keyword = (String)request.getParameter("keyword");
		System.out.println("keyword = " + keyword);
		
		String mainkey = (String)request.getParameter("mainkey");
		System.out.println("mainkey = " + mainkey);
	
	}//end doHandle
	

	
	public JSONObject showBookinfo(String keyword) {
		BookDAO dao = BookDAO.getInstance();
		JSONObject jsonobj = new JSONObject();		

			JSONArray bookinfoArray = new JSONArray();
			ArrayList<BookVO> infoArr = dao.searchBook(keyword);	//searchBook 메서드 호출:ArrayList 받아옴
			
			for (int i = 0; i < infoArr.size(); i++) {
				JSONObject bookinfo = new JSONObject();
				bookinfo.put("book_title", infoArr.get(i).getBook_title());
				bookinfo.put("author", infoArr.get(i).getBook_title());
				bookinfo.put("publishing", infoArr.get(i).getBook_title());
				bookinfo.put("room_name", infoArr.get(i).getBook_title());
				bookinfo.put("book_sorting", infoArr.get(i).getBook_title());
				bookinfo.put("shape", infoArr.get(i).getBook_title());
				bookinfo.put("isbn", infoArr.get(i).getBook_title());
				
				bookinfoArray.add(bookinfo);						
			}
			jsonobj.put("books", bookinfoArray);	
												
		return jsonobj;
	}//end showBookinfo	
	
	
	public void mainSearch(HttpServletRequest request) {
		BookDAO dao = BookDAO.getInstance();		
		String mainkey = (String)request.getParameter("mainkey");
		ArrayList<BookVO> infoArr = dao.searchBook(mainkey);		
		int count = 0;  
		
		for (int i = 0; i < infoArr.size(); i++) {
			request.setAttribute("infoArr", infoArr);				
		}//end for
		
		request.setAttribute("count", count);
	}//end mainSearch
	

	

	
	
	
	
}//end class