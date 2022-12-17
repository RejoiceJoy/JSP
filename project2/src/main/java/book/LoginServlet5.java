package book;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet5
 */
@WebServlet("/login5")
public class LoginServlet5 extends HttpServlet {
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init 메서드 호출");
	}

	public void destroy() {
		System.out.println("destroy 메서드 호출");
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost 메서드 호출");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter printwriter = response.getWriter();

		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String address = request.getParameter("user_address");
		
		System.out.println("아이디: " + user_id);
		System.out.println("비밀번호: " + user_pw);
		
		String data = "<html>";
		data += "<body>";
		data += "아이디 : " + user_pw;
		data += "<br>";
		data += "패스워드 : " + user_pw;
		data += "<br>";
		data += "주소 : " + address;
		data += "</body>";
		data += "</html>";
		printwriter.print(data);
		
	}
	
	
}
