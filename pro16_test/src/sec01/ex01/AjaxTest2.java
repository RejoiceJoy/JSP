package sec01.ex01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ajaxTest2")
public class AjaxTest2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
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
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		System.out.println("dodoHandle 메서드 호출");
		
		String result="";
		PrintWriter writer = response.getWriter();
		
		result="<main><book>"
				+ "<title><![CDATA[초보자를 위한 자바 프로그래밍]]></title>"
				+ "<writer><![CDATA[인포북스 저 | 이병승]]></writer>"
				+ "<image><![CDATA[http://localhost:8080/pro16_test/image/dongwon.png]]</image>"
				+ "</book>"
				+ "<book> "
				+ "<title><![CDATA[초보자를 위한 자바 프로그래밍]]></title>"
				+ "<writer><![CDATA[인포북스 저 | 이병승]]></writer>"
				+ "<image><![CDATA[http://localhost:8080/pro16_test/image/dongwon2.png]]</image>"
				+ "</book></main>";
		System.out.println(result);
		writer.print(result);
		

	}//end dodoHandle
}//end class
