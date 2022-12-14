package com.nonage.admin.controller;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.nonage.controller.action.Action;
import com.nonage.dao.ProductDAO;
import com.nonage.dto.ProductVO;

public class AdminProductListAction implements Action {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    String url = "admin/product/productList.jsp";    
    String key = request.getParameter("key");
    String tpage = request.getParameter("tpage");    
    if(key == null){
     key=""; //전체 상품 조회
    }    
    if(tpage == null){
      tpage = "1"; //현재 페이지 (default 1)                        
    }else if( tpage.equals("") ){
       tpage="1";  //에러 방지
    }
    request.setAttribute("key", key);
    request.setAttribute("tpage",tpage);
    
    ProductDAO productDAO = ProductDAO.getInstance();
    ArrayList<ProductVO> productList=
                productDAO.listProduct( Integer.parseInt(tpage), key);    
    String paging = productDAO.pageNumber( Integer.parseInt(tpage), key);
     //jsp로 데이터 전달
    request.setAttribute("productList",productList);
    int n = productList.size();   
    request.setAttribute("productListSize",n); 
    request.setAttribute("paging", paging);    
    request.getRequestDispatcher(url).forward(request, response);
  }
}//end class