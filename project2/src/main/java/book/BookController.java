package book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/first")
public class BookController extends HttpServlet{
	
	@Override
	public void init() throws ServletException{
		System.out.println("init 메서드 호출");
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		System.out.println("doGet 메서드 호출");
	}
	
	@Override
	public void destroy() {
		System.out.println("destroy 메서드 호출");
	}

}//end BookController
