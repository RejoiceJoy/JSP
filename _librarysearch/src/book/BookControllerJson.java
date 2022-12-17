package book;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * Servlet implementation class BookControllerJson
 */
@WebServlet("/search")
public class BookControllerJson extends HttpServlet {
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
		
		String jsoninfo = totalObject.toJSONString();//JSONObject를 문자열로 변환
		System.out.print(jsoninfo);
		writer.print(jsoninfo);						//JSON 데이터를 브라우저로 전송

	}//end doHandle
}//end class