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

@WebServlet("/GuideServlet")
public class GuideServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  protected void doGet(HttpServletRequest request,
    HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);
  }

  protected void doPost(HttpServletRequest request,
    HttpServletResponse response) throws ServletException, IOException {

//    doGet(request, response); //doGet함수를 통해 command 정보를 읽어옴
//    //읽은 command 정보를 ActionFactory.java의 getAction()메서드를 호출하고 여기에 넘겨줌
	  
	response.setContentType("text/html; charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
	  
	String url="./guide/GuideDetail.jsp";
	  
//	int guide_room_code = 7;
//	if (request.getParameter("guide_room_code")!=null) {
//		guide_room_code = Integer.parseInt(request.getParameter("guide_room_code").trim()); 
//	}
	
	GuideDAO guideDAO = GuideDAO.getInstance();
	ArrayList<GuideVO> volist = guideDAO.total_list(); 
	System.out.println("서블릿:"+volist);
	    
	request.setAttribute("volist", volist);    
	RequestDispatcher dispatcher = request.getRequestDispatcher(url);
	dispatcher.forward(request, response);
  }
}//end class