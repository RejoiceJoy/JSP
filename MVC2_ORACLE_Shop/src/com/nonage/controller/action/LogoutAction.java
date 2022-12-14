package com.nonage.controller.action;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutAction implements Action {
  @Override
  public void execute(HttpServletRequest request, 
		  HttpServletResponse response)
      throws ServletException, IOException {
    String url="NonageServlet?command=index";
    //로그 아웃시 시작 페이지로 이동
    HttpSession session=request.getSession(false);
    if(session!=null){
      session.invalidate();
    }    
        request.getRequestDispatcher(url).forward(request, response);  
  }
}//end class