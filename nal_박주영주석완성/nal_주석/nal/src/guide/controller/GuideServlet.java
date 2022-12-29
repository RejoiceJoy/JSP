package guide.controller;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guide.model.GuideDAO;
import guide.model.GuideVO;

/*코드 작성자 : 박주영*/

@WebServlet("/GuideServlet")
public class GuideServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void doGet(HttpServletRequest request,
    HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);
  }

  protected void doPost(HttpServletRequest request,
    HttpServletResponse response) throws ServletException, IOException {
	  
	response.setContentType("text/html; charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
	  
	String url="./guide/GuideDetail.jsp";
	
	GuideDAO guideDAO = GuideDAO.getInstance();
	ArrayList<GuideVO> volist = guideDAO.total_list(); 
	System.out.println("서블릿:"+volist);
	    
	request.setAttribute("volist", volist);    
	RequestDispatcher dispatcher = request.getRequestDispatcher(url);
	dispatcher.forward(request, response);
  }
}//end class