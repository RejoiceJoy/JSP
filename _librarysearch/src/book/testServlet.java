package book;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
@WebServlet("/search")
public class testServlet extends HttpServlet {
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
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		BookDAO dao = BookDAO.getInstance();
		
		JSONObject totalObject = new JSONObject();	//배열을 저장할 totalObject 선언
		JSONArray bookinfoArray = new JSONArray();	//bookinfo JSON 객체 저장할 bookinfoArray JSONArray배열 선언
		JSONObject bookinfo = new JSONObject();		//책 한 권의 정보가 들어갈 bookinfo JSON 객체 선언
		bookinfo.put("book_title", "아낌없이주는트리");	//책 정보를 name/value 쌍으로 저장
		bookinfo.put("author", "배재연");	
		bookinfo.put("publishing", "재연출판사");
		bookinfo.put("room_name", "코사강의실");
		bookinfo.put("book_sorting", "B1H4");
		bookinfo.put("shape", "네모 24cm");
		bookinfo.put("isbn", "216516546512");
		bookinfoArray.add(bookinfo);				//책 정보를 다시 bookinfoArray 배열에 저장

		bookinfo = new JSONObject();				//다른 책 정보를 name/value 쌍으로 저장
		bookinfo.put("book_title", "아낌없이주는트리");
		bookinfo.put("author", "배재연");
		bookinfo.put("publishing", "재연출판사");
		bookinfo.put("room_name", "코사강의실");
		bookinfo.put("book_sorting", "B1H4");
		bookinfo.put("shape", "네모 24cm");
		bookinfo.put("isbn", "216516546512");
		bookinfoArray.add(bookinfo);				//책 정보를 다시 bookinfoArray 배열에 저장
		
		totalObject.put("books", bookinfoArray);	//책 정보 저장한 배열을 books로 totalObject에 저장
		
		//String jsoninfo = totalObject.toJSONString();//JSONObject를 문자열로 변환
		//System.out.print(jsoninfo);
		//writer.print(jsoninfo);						//JSON 데이터를 브라우저로 전송
		
		System.out.println();

		String keyword = (String)request.getParameter("keyword");
		System.out.println(keyword);
		
		String jsoninfo = showBookinfo(keyword).toJSONString();
		System.out.println(jsoninfo);
		writer.print(jsoninfo);
		
		
		
		
	}//end doHandle
	
/*	
	public JSONObject showBookinfo(String keyword) {
		BookDAO dao = BookDAO.getInstance();
		JSONObject jsonobj = new JSONObject();
		JSONArray bookinfoArray = new JSONArray();
		JSONObject bookinfo = new JSONObject();
		
		BookVO vo = dao.searchBook(keyword);	//searchBook 메서드 호출:BookVO 객체받아
		
		bookinfo.put("book_title", vo.getBook_title());
		bookinfo.put("author", vo.getAuthor());
		bookinfo.put("publishing", vo.getPublishing());
		bookinfo.put("room_name", vo.getRoom_name());
		bookinfo.put("book_sorting", vo.getBook_sorting());
		bookinfo.put("shape", vo.getShape());
		bookinfo.put("isbn", vo.getIsbn());
		
		bookinfoArray.add(bookinfo);
		jsonobj.put("books", bookinfoArray);		
		return jsonobj;
	}
*/	
	
/*	
	public JSONObject showBookinfo(String keyword) {
		BookDAO dao = BookDAO.getInstance();
		JSONObject jsonobj = new JSONObject();
		JSONArray bookinfoArray = new JSONArray();
		JSONObject bookinfo = new JSONObject();
		
		BookVO vo = dao.searchBook(keyword);	//searchBook 메서드 호출:BookVO 객체받아
			
		bookinfo.put("book_title", vo.getBook_title());
		bookinfo.put("author", vo.getAuthor());
		bookinfo.put("publishing", vo.getPublishing());
		bookinfo.put("room_name", vo.getRoom_name());
		bookinfo.put("book_sorting", vo.getBook_sorting());
		bookinfo.put("shape", vo.getShape());
		bookinfo.put("isbn", vo.getIsbn());
		
		bookinfoArray.add(bookinfo);
		jsonobj.put("books", bookinfoArray);		
		return jsonobj;
	}//end showBookinfo
*/	
	public JSONObject showBookinfo(String keyword) {
		//BookDAO dao = BookDAO.getInstance();
		JSONObject jsonobj = new JSONObject();
		
		try {
			JSONArray bookinfoArray = new JSONArray();
			ArrayList<BookVO> infoArr = dao.searchBook(keyword);	//searchBook 메서드 호출:ArrayList 받아옴
			
			for (int i = 0; i < infoArr.size(); i++) {
				JSONObject bookinfo = new JSONObject();
				bookinfo.put("book_title", infoArr.get(i).getBook_title());
				bookinfo.put("book_title", infoArr.get(i).getBook_title());
				bookinfo.put("book_title", infoArr.get(i).getBook_title());
				bookinfo.put("book_title", infoArr.get(i).getBook_title());
				bookinfo.put("book_title", infoArr.get(i).getBook_title());
				bookinfo.put("book_title", infoArr.get(i).getBook_title());
				bookinfo.put("book_title", infoArr.get(i).getBook_title());
				
				bookinfoArray.add(bookinfo);						
			}
			jsonobj.put("books", bookinfoArray);	
			
		} catch (JSONException e) {
			e.printStackTrace();
		}												
		return jsonobj;
	}//end showBookinfo	
	
	//BookDAO ArrayList반환 메서드
	public ArrayList<BookVO> searchBook(String keyword) {
		Connection conn = null;
		String sql = "SELECT * FROM nal.book where book_title like '%" + keyword +"%'";
		ArrayList<BookVO> bookinfo = new ArrayList<BookVO>();
		
		try {
		conn= DBManager.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
			while (rs.next()) {
				BookVO vo = new BookVO();
				vo.setBook_title(rs.getString("book_title"));
				vo.setAuthor(rs.getString("author"));
				vo.setPublishing(rs.getString("publishing"));
				vo.setRoom_name(rs.getString("room_name"));
				vo.setBook_sorting(rs.getString("book_sorting"));
				vo.setShape(rs.getString("shape"));
				vo.setIsbn(rs.getLong("isbn"));
				
				bookinfo.add(vo);
			}
			
		}catch (SQLException e) {
			System.out.println("\n에러 발생! >> searchBook");		
			System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
		}//end try	
		return bookinfo;
	}//end searchBook
	
	

	
	
	
	
}//end class