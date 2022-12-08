package sec01.ex01;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//web.xml 에 등록 대신
@WebServlet("/login") 
public class LoginServlet  extends HttpServlet{
   
	public void init() throws ServletException {
      System.out.println("init 메서드 호출");
   }//end init..

   protected void doGet(HttpServletRequest request , HttpServletResponse response) 
                                            throws ServletException, IOException {
      // 한국어 처리
	  request.setCharacterEncoding("utf-8"); 
	  ////HTML input 태그 name
      String user_id=request.getParameter("user_id");
      String user_pw=request.getParameter("user_pw"); 
      System.out.println("아이디:"+user_id);
      System.out.println("비밀번호:"+user_pw);
   }//end doget...

   public void destroy() {
      System.out.println("destroy 메서드 호출");
   }//end des..
}//end class
