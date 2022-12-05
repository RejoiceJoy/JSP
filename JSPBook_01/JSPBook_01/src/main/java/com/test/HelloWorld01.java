package com.test;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//URI 설절
@WebServlet("/HelloWorld01")
public class HelloWorld01 extends HttpServlet {
	
	//버전 정보 다중 웹서버에 저장시 구분위해
	private static final long serialVersionUID = 1L; 
 
	//기본 구성자 문법때문에
    public HelloWorld01() {
        super();       
    }//end HelloWorld01

	//브라우져에서 http get 방식 요청 처리
    protected void doGet(
    		HttpServletRequest request, HttpServletResponse response) 
    				throws ServletException, IOException {
		Date date = new Date();
		// 컨텐츠 타입 선언 및 한글 설정
		response.setContentType("text/html;charset=UTF-8");
		// 웹브라우저 출력을 위한 PrintWriter 객체 확보
		PrintWriter out = response.getWriter();
		// HTML 형식으로 브라우저 출력 컨텐츠 작성
		out.println("<HTML>");
		out.println("<HEAD><TITLE>Hello World Servlet</TITLE></HEAD>");
		out.println("<BODY><H2>Hello World Servlet : " + date.toString());
		out.println("</H2></BODY>");
		out.println("</HTML>");
	}//end doGet

    //브라우져에서 http post 요청시
	protected void doPost(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
		// get으로 넘김
		doGet(request, response);
	}//end doPost

}//end class
