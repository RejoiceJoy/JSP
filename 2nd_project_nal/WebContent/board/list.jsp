<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, controller.*"
    isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%@ page import="model.BoardDTO"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	List boardList = (List) request.getAttribute("boardlist");
	int total_record = ((Integer) request.getAttribute("total_record")).intValue();
	int pagenum = ((Integer) request.getAttribute("pagenum")).intValue();
	int total_pagenum = ((Integer) request.getAttribute("total_pagenum")).intValue();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유게시판</title>
    <script type="text/javascript">
		function createFreeboard() {	

			if (${sessionId==null}) {
				alert("로그인 해주세요.");
				return false;
			}
	
			location.href = "./BoardWriteForm.do?id=<%=sessionId%>"
		}
		
		function search() {	
			
			var itmes = document.querySelector("#items");
			itmes.setAttribute("itmes", itmes);
			var text = document.querySelector("#text");
			text.setAttribute("text", text);
			
			var uri = "./BoardListAction.do?";
			
			uri += "itmes";
			uri += "=";
			uri += encodeURIComponent(items.value);
			uri += "&";
			uri += "text";
			uri += "=";
			uri += encodeURIComponent(text.value);
			
// 			location.href = './BoardListAction.do?searchKeyCode=searchKeyCode&searchKeyWord=searchKeyWord'
// 			location.href = "./BoardListAction.do?items=" + ${param.items} + "&text=" + ${param.text};
			location.href = uri
		}
	</script>
</head>
<body>
    <div class="top"></div>
    <div class="bottom"></div>
    <div class="subTitle"></div>
    <div class="inner">
        <div class="contents" id="bodyWrap">
            <h3 class="title"><a href="<c:url value="./BoardListAction.do" /> ">자유게시판</a></h3>
            <div class="subContents">
                <div class="body" id="bodyCon">
                    <div class="bodyBox01">
                        <div class="textWrap">
                            <div class="conTxt">
                                <p class="txt01 txt">이 게시판은 이용자들이 자유롭게 의견을 표현하는 공간으로 글 등록 시 작성자의 실명이 공개됩니다.</p>
                                <p class="txt01 txt">인신공격, 욕설, 상업적인 글, 저속한 표현, 동일한 글의 반복 및 선거법 위반 등에 대한 글은 게시자에게
                                    통보하지 않고 삭제될 수 있습니다.</p>
                                <p class="txt01 txt">관계법령을 위반하거나 업무를 방해하는 등 「국회도서관 이용 약관」에서 정한 이용자의 의무를 위반하는 경우
                                    국회도서관 서비스를 제한하거나 정지시킬 수 있습니다.</p>
                                <p class="txt01 txt">국회도서관 이용과 관련된 문의사항은 묻고답하기 게시판을 이용하시기 바랍니다.</p>										
                            </div>
						</div>
                        <div class="conBottomBox conBottomBox2">
                            <div class="outputTxt">
                                <div class="leftTxt">총 <%=total_record%>건</div>
                                <div class="rightAlign all">
                           <span class="left01 left01_32">
	                            <select id="items" name="items" title="검색항목">
	                                <option value="title">제목</option>
	                                <option value="content">내용</option>
	                                <option value="member_name">작성자</option>
	                            </select>
	                        </span>
	                        <span class="left02 left02_49 left01_w215">
                        	
	                            <input id="text" name="text" title="검색어 입력" type="text">
                            
	                        </span>
                            <span class="left03 left03_01">
                               <span class="btn"><a href="javascript:search();">검색</a></span>
                           </span>
                                </div>
                            </div>
                            <div class="tableCon hAuto conShow57">
                                <table class="boardTable" summary="">
                                    <caption>자유게시판 목록에 대한 테이블로 번호, 제목, 작성자, 등록일, 조회로 구성</caption>
                                    <colgroup>
                                        <col style="width:7%;">
                                        <col style="width:58%;">
                                        <col style="width:16%;">
                                        <col style="width:12%;">
                                        <col style="width:7%;">
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th scope="col" class="cT01">번호</th>
                                        <th scope="col" class="cT02">제목</th>
                                        <th scope="col" class="cT03">작성자</th>
                                        <th scope="col" class="cT04">등록일</th>
                                        <th scope="col" class="cT05">조회</th>
                                    </tr>
                                    </thead>
                                    
									<tbody>
									
									<c:choose>
										<c:when test="${boardlist==null}">
											<tr>
												<td>등록된 글이 없습니다.</td>
											</tr>
										</c:when>
										<c:when test="${boardlist!=null}">
											<c:forEach var="list" items="${boardlist}">
												<tr>
													<td>${list.articleno}</td>
													<td><a href="./BoardViewAction.do?articleno=${list.articleno}&pagenum=<%=pagenum%>">${list.title}</a></td>
													<td>${list.member_name}</td>
													<td>${list.writedate}</td>
													<td>${list.hit}</td>
												</tr>										
											</c:forEach>
										</c:when>
									</c:choose>
									
									</tbody>
									
                                </table>
                            </div>
                            <div class="paging">
                                <c:set var="pagenum" value="<%=pagenum%>" />
									<a href="<c:url value="./BoardListAction.do?pagenum=1" /> ">맨 처음으로</a>
									<a href="<c:url value="./BoardListAction.do?pagenum=${pagenum - 1}" /> ">이전</a>
									<c:forEach var="i" begin="<%=pagenum > 6 ? pagenum - 5 : 1 %>" end="<%=(pagenum > 6 ? pagenum + 5 : 11) > total_pagenum ? total_pagenum : (pagenum > 6 ? pagenum + 5 : 11)%>">
										<a href="<c:url value="./BoardListAction.do?pagenum=${i}" /> ">
											<c:choose>
												<c:when test="${pagenum==i}">
													<font color='4C5317'><b> [${i}]</b></font>
												</c:when>
												<c:otherwise>
													<font color='4C5317'> [${i}]</font>
					
												</c:otherwise>
											</c:choose>
										</a>
									</c:forEach>
									<a href="<c:url value="./BoardListAction.do?pagenum=${pagenum + 1}" /> ">다음</a>
									<a href="<c:url value="./BoardListAction.do?pagenum=${total_pagenum}" /> ">맨 마지막으로</a>
                                <input id="pageIndex" name="pageIndex" type="hidden" value="1">

                                <div class="btn"><a href="javascript:createFreeboard();">글쓰기</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>