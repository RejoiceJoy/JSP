package sec03.ex01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;


@WebServlet("/json3")
public class JasonServlet3 extends HttpServlet {

	public void init(ServletConfig config) throws ServletException {
		System.out.println("init 메서드 호출");
	}

	public void destroy() {
		System.out.println("destroy 메서드 호출");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet 메서드 호출");
		dodoHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost 메서드 호출");
		dodoHandle(request, response);
	}
	
	private void dodoHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("dodoHandle 메서드 호출");
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		JSONObject totalObject = new JSONObject();
//		JSONArray membersArray = new 
		
		
//		String param = (String)request.getParameter("param");
//		System.out.println("param = " + param);
		
		
		writer.print("안녕하세요! 서버입니다.");

	}//end dodoHandle
}//end class
