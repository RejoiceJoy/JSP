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
@WebServlet("/search1")
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
				
		System.out.println();

		String keyword = (String)request.getParameter("keyword");
		System.out.println(keyword);
		
		String jsoninfo = showBookinfo(keyword).toJSONString();
		System.out.println(jsoninfo);
		writer.print(jsoninfo);
		
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