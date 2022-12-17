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
 * Servlet implementation class LoginTest
 */
@WebServlet("/loginTest")
public class LoginTest extends HttpServlet {

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost 메서드 호출");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter printwriter = response.getWriter();
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");

		System.out.println("아이디: " + user_id);
		System.out.println("비밀번호: " + user_pw);
		
		if(user_id != null && (user_id.length() != 0)) {
			printwriter.print("<html>");
			printwriter.print("<body>");
			printwriter.print(user_id + "님 로그인 하셨습니다.");
			printwriter.print("<br>");
			printwriter.print("<a href = 'http://localhost:8080/project2/test01/login.html'>"
																		+ "로그인 창으로 이동 </a>");
			printwriter.print("</body>");
			printwriter.print("</html>");			
		} else {
			printwriter.print("<html>");
			printwriter.print("<body>");
			printwriter.print("아이디 입력해라~~~~");
			printwriter.print("<br>");
			printwriter.print("<a href = 'http://localhost:8080/project2/test01/login.html'>"
																		+ "로그인 창으로 이동 </a>");
			printwriter.print("</body>");
			printwriter.print("</html>");		
		}//end if
		
		
	}//end doPst

}//end class
