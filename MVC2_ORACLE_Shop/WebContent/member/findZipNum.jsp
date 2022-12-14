<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<!DOCTYPE html>
<html> <head>
<meta charset="UTF-8">
<title>우편 번호 검색</title>

<style type="text/css">
body{   
   background-color:#B96DB5;
   font-family: Verdana;
}
</style>

<script type="text/javascript">
function result(zipNum,sido,gugun,dong) {
   opener.document.formm.zipNum.value=zipNum;
   opener.document.formm.addr1.value=sido+" "+gugun+" "+dong;
   self.close();
};
</script>

</head>
<body>
<div id="popup">
  <h1>우편번호검색</h1>
  <form method=post name=formm action="NonageServlet?command=find_zip_num" >
    동 이름 : 
  <input name="dong" type="text">
  <input type="submit" value="찾기"  class="submit">
  </form>
  
  <table id="zipcode">
    <tr>
      <th>우편번호</th>
      <th>주소</th>
    </tr>
    <c:forEach items="${addressList}" var="addressVO">
    <tr>
      <td>${addressVO.zipNum}</td>
        <td>
          <a href="#" 
          onclick="return result('${addressVO.zipNum}'
			,'${addressVO.sido}', '${addressVO.gugun}'
			,'${addressVO.dong}')">
          
            ${addressVO.sido}  ${addressVO.gugun}  ${addressVO.dong} 
          
          </a>
        </td>
    </tr>
    </c:forEach>
  </table>
</div>
</body>
</html>