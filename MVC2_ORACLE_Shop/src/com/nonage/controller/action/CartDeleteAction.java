package com.nonage.controller.action;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.nonage.dao.CartDAO;

public class CartDeleteAction implements Action {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
	  
    String url = "NonageServlet?command=cart_list";
    String[] cseqArr = request.getParameterValues("cseq");  
    // 한개 이상 체크 시 처리    
    for(String cseq:cseqArr){ //한개 이상의 물건의 장바구니에서 지우기 때문
      System.out.println(cseq);
      CartDAO cartDAO = CartDAO.getInstance();
      cartDAO.deleteCart(Integer.parseInt(cseq));
    }
    request.getRequestDispatcher(url).forward(request, response);
  }
}//end class