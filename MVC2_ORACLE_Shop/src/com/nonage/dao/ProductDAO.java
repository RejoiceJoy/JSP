package com.nonage.dao;
import java.sql.*;
import java.util.ArrayList;
import utill.DBManager;
import com.nonage.dto.ProductVO;

public class ProductDAO {
  private ProductDAO() {  } //教臂畔 菩畔 贸府
  private static ProductDAO instance = new ProductDAO();
  public static ProductDAO getInstance() {
    return instance;
  }  
  // 脚惑前贸府
  public ArrayList<ProductVO> listNewProduct() {	  
    ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
    String sql = "select *  from new_pro_view";  //view肺 贸府  
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;    
    try {
      conn = DBManager.getConnection();
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        ProductVO product = new ProductVO();
        product.setPseq(rs.getInt("pseq"));
        product.setName(rs.getString("name"));
        product.setPrice2(rs.getInt("price2"));
        product.setImage(rs.getString("image"));
        productList.add(product);
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      DBManager.close(conn, pstmt, rs);
    }
    return productList;
  }    
  // 海胶飘 惑前
  public ArrayList<ProductVO> listBestProduct() {
    ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
    String sql = "select *  from best_pro_view";    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;    
    try {
      conn = DBManager.getConnection();
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        ProductVO product = new ProductVO();
        product.setPseq(rs.getInt("pseq"));
        product.setName(rs.getString("name"));
        product.setPrice2(rs.getInt("price2"));
        product.setImage(rs.getString("image"));
        productList.add(product);
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      DBManager.close(conn, pstmt, rs);
    }
    return productList;
  }   
  //惑前 惑技 贸府 
  public ProductVO getProduct(String pseq) {
	    ProductVO product = null;
	    String sql = "select * from product where pseq=?";	    
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;    	    
	    try {
	      con = DBManager.getConnection();
	      pstmt = con.prepareStatement(sql);
	      pstmt.setString(1, pseq);
	      rs = pstmt.executeQuery();
	      if (rs.next()) { 
	        product = new ProductVO();
	        product.setPseq(rs.getInt("pseq"));
	        product.setName(rs.getString("name"));
	        product.setKind(rs.getString("kind"));
	        product.setPrice1(rs.getInt("price1"));
	        product.setPrice2(rs.getInt("price2"));
	        product.setPrice3(rs.getInt("price3"));
	        product.setContent(rs.getString("content"));
	        product.setImage(rs.getString("image"));
	        product.setUseyn(rs.getString("useyn"));
	        product.setBestyn(rs.getString("bestyn"));
	        product.setIndate(rs.getTimestamp("indate"));
	      }
	    } catch (Exception e) {
	      e.printStackTrace();
	    } finally {
	      DBManager.close(con, pstmt, rs);
	    }
	    return product;
	  }
 
  //概春喊 其捞瘤 父甸扁
  public ArrayList<ProductVO> listKindProduct(String kind) {
	  
	    ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
	    String sql= "select * from product where kind=?";	    
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;	    
	    try {
	      conn = DBManager.getConnection();
	      pstmt = conn.prepareStatement(sql);
	      pstmt.setString(1, kind);
	      rs = pstmt.executeQuery();	      
	      while (rs.next()) {
	        ProductVO product = new ProductVO();
	        product.setPseq(rs.getInt("pseq"));
	        product.setName(rs.getString("name"));
	        product.setPrice2(rs.getInt("price2"));
	        product.setImage(rs.getString("image"));
	        productList.add(product);
	      }
	    } catch (Exception e) {
	      e.printStackTrace();
	    } finally {
	      DBManager.close(conn, pstmt, rs);
	    }
	    return productList;
	  }
  
  // 包府磊 葛靛俊辑 荤侩登绰 皋家靛   * 
  public int totalRecord(String product_name) {	  
    int total_pages = 0;    
    String sql = "select count(*) from product where name like '%'||?||'%'";
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet pageset = null;    
    try {
      con = DBManager.getConnection();
      pstmt = con.prepareStatement(sql);
      if (product_name.equals("")){
        pstmt.setString(1, "%");
      } else{
        pstmt.setString(1, product_name);
      }
      pageset = pstmt.executeQuery();
      if (pageset.next()) {
        total_pages = pageset.getInt(1); // 饭内靛狼 俺荐
        pageset.close();
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      DBManager.close(con, pstmt);
    }  
    return total_pages;
  }
  
  static int view_rows = 5; // 其捞瘤狼 俺荐
  static int counts = 5; // 茄 其捞瘤俊 唱鸥尘 惑前狼 俺荐

  // 其捞瘤 捞悼阑 困茄 皋家靛
  public String pageNumber(int tpage, String name) {
    String str = "";   
    int total_pages = totalRecord(name);  //傈眉 其捞瘤     
    int page_count = ( total_pages / counts ) + 1;
    
    if (total_pages % counts == 0) {
      page_count-- ; //20 /5 =4 唱赣瘤啊 绝栏聪 1 哗扁
    }
    if (tpage < 1) {
      tpage = 1; //坷幅 规瘤
    }
    int start_page = tpage - (tpage % view_rows) + 1;  
    System.out.println(start_page);
    int end_page = start_page + ( counts - 1 ); 
    if ( end_page > page_count ) { 
      end_page = page_count; 
    }
    
    for (int i = start_page; i <= end_page; i++) {
      if (i == tpage) {
        str += "<font color=red>[" + i + "] </font>";
      } else {
        str += "<a href='NonageServlet?command=admin_product_list&tpage=" 
           + i + "&key=" + name + "'> [" + i + "] </a>";
      }
    }
     return str;
  }
  
  //其捞隆 单捞磐 贸府
  public ArrayList<ProductVO> listProduct(int tpage, String product_name) {
	  
	    ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
	    String str = "select pseq, indate, name, price1, price2, useyn, bestyn " +
	        " from product "
	        + " where name like '%'||?||'%' order by pseq desc";	    
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    int absolutepage = 1;
	    try {
	      con = DBManager.getConnection();
	      absolutepage = ( (tpage - 1) * counts ) + 1; 
	      pstmt = con.prepareStatement(str
	    		  , ResultSet.TYPE_SCROLL_SENSITIVE
	    		  , ResultSet.CONCUR_UPDATABLE); //搬苞悸狼 捞悼矫虐扁困秦辑	     
	      
	      if (product_name.equals("")){
	        pstmt.setString(1, "%");
	      } 
	      else{
	        pstmt.setString(1, product_name);
	      }	      
	      rs = pstmt.executeQuery();
	      
	      if (rs.next()) {
	        rs.absolute(absolutepage); //搬苞悸狼 困摹 瘤沥
	        int count = 0;
	        while (count < counts) { //counts绰 扁夯 5俺
	          ProductVO product = new ProductVO();
	          product.setPseq(rs.getInt(1));
	          product.setIndate(rs.getTimestamp(2));
	          product.setName(rs.getString(3));
	          product.setPrice1(rs.getInt(4));
	          product.setPrice2(rs.getInt(5));
	          product.setUseyn(rs.getString(6));
	          product.setBestyn(rs.getString(7));
	          productList.add(product);
	          if (rs.isLast()){
	            break;
	          }         
	          rs.next();
	          count++; 
	        }
	      }
	    } catch (Exception e) {
	      e.printStackTrace();
	    } finally {
	      DBManager.close(con, pstmt, rs);
	    }
	    return productList;
	  }

  public int insertProduct(ProductVO product) {
	    int result = 0;
	    String sql = "insert into product "
	    		+ " (pseq, kind, name, price1, price2, price3, content, image) " 
	    		+  " values(product_seq.nextval, ?, ?, ?, ?, ?, ?, ?)";
	    Connection con = null;
	    PreparedStatement pstmt = null;	    
	    try {
	      con = DBManager.getConnection();
	      pstmt = con.prepareStatement(sql);
	      pstmt.setString(1, product.getKind());      
	      pstmt.setString(2, product.getName());
	      pstmt.setInt(3, product.getPrice1());
	      pstmt.setInt(4, product.getPrice2());
	      pstmt.setInt(5, product.getPrice3());
	      pstmt.setString(6, product.getContent());
	      pstmt.setString(7, product.getImage());
	      result = pstmt.executeUpdate();
	    } catch (Exception e) {
	      System.out.println("眠啊 角菩");
	      e.printStackTrace();
	    } finally {
	      DBManager.close(con, pstmt);
	    }
	    return result;
  }
  
  public int updateProduct(ProductVO product) {
	    int result = -1;
	    String sql = "update product "
	    		+ " set kind=?, useyn=?, name=?, price1=?"
	    		+ ", price2=?, price3=?, content=?, image=?, bestyn=? " +
	        " where pseq=?";	    
	    Connection con = null;
	    PreparedStatement pstmt = null;	    
	    try {
	      con = DBManager.getConnection();
	      pstmt = con.prepareStatement(sql);
	      pstmt.setString(1, product.getKind());
	      pstmt.setString(2, product.getUseyn());
	      pstmt.setString(3, product.getName());
	      pstmt.setInt(4, product.getPrice1());
	      pstmt.setInt(5, product.getPrice2());
	      pstmt.setInt(6, product.getPrice3());
	      pstmt.setString(7, product.getContent());
	      pstmt.setString(8, product.getImage());
	      pstmt.setString(9, product.getBestyn());
	      pstmt.setInt(10, product.getPseq());
	      result = pstmt.executeUpdate();
	    } catch (Exception e) {
	      e.printStackTrace();
	    } finally {
	      DBManager.close(con, pstmt);
	    }
	    return result;
	  }
}//end class