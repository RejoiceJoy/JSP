package com.nonage.controller.action;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.nonage.dao.OrderDAO;
import com.nonage.dto.MemberVO;
import com.nonage.dto.OrderVO;

public class OrderDetailAction implements Action {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
	  
    String url = "mypage/orderDetail.jsp";    
    HttpSession session = request.getSession();
    MemberVO loginUser =  //로그인 한 사용자 처리
    		(MemberVO) session.getAttribute("loginUser");
    
    if (loginUser == null) { //비회원 처리
      url = "NonageServlet?command=login_form";
    } 
    else {    	
      int oseq=Integer.parseInt(request.getParameter("oseq"));
      OrderDAO orderDAO = OrderDAO.getInstance();
      ArrayList<OrderVO> orderList = 
    		  orderDAO.listOrderById(loginUser.getId(), "1", oseq);
      
      int totalPrice=0;
      for(OrderVO ovo :orderList){
        totalPrice += ovo.getPrice2() * ovo.getQuantity();
      }//for end
      //전체 주문 중 가장 처음거 하나만 가져옴
      request.setAttribute("orderDetail", orderList.get(0));  
      request.setAttribute("orderList", orderList);
      request.setAttribute("totalPrice", totalPrice);
    }//if end    
    request.getRequestDispatcher(url).forward(request, response);
  }    
}// end class