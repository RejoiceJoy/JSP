<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>2nd</title>
</head>
<body>
    <div class="top"></div>
    <div class="bottom"></div>
    <div class="subTitle"></div>
    <div class="inner">
        <div class="contents" id="bodyWrap">
            <h3 class="title">자유게시판</h3>
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
                                <div class="leftTxt">총 1,364건</div>
                                <div class="rightAlign all">
                           <span class="left01 left01_32">
                            <select id="searchKeyCode" name="searchKeyCode" title="검색항목">
                                <option value="00">전체</option>
                                <option value="01">제목</option>
                                <option value="02">제목+내용</option>
                                <option value="03">작성자</option>
                            </select>
                        </span>
                                    <span class="left02 left02_49 left01_w215">
                            <input id="searchKeyWord" name="searchKeyWord" title="검색어 입력" onkeydown="javascript:if(event.keyCode == 13) search();" type="text" value="">
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
                                        <tbody> <tr>
                                                    <td class="cT01">1364</td>
                                                    <td class="tableTitle cT02"> 
                                                                <a href="javascript:freeBoardDetail('4325','1')">수고</a>
                                                    </td>
                                                    <td class="cT03">이기쁨</td>
                                                    <td class="cT04">
                                                            2022-12-12
                                                    </td>
                                                    <td class="cT05">33</td>
                                                </tr>
                                                <!-- //예전 댓글 표시 시작-->
                                                <!-- //예전 댓글 표시 끝-->
                                                <tr>
                                                    <td class="cT01">1363</td>
                                                    <td class="tableTitle cT02">  
                                                                <a href="javascript:freeBoardDetail('4303','4')">웹사이트의 메뉴 에러와 불편한 점 등</a>
                                                    </td>
                                                    <td class="cT03">고승연</td>
                                                    <td class="cT04">
                                                            2022-12-08
                                                    </td>
                                                    <td class="cT05">43</td>
                                                </tr>
                                                <!-- //예전 댓글 표시 시작-->
                                                <!-- //예전 댓글 표시 끝-->
                                                <tr>
                                                    <td class="cT01">1362</td>
                                                    <td class="tableTitle cT02">
                                                                <a href="javascript:freeBoardDetail('4283','5')">국민 제안을 드립니다.</a>
                                                    </td>
                                                    <td class="cT03">민승재</td>
                                                    <td class="cT04">
                                                            2022-11-29
                                                    </td>
                                                    <td class="cT05">74</td>
                                                </tr>
                                                <!-- //예전 댓글 표시 시작-->
                                                <!-- //예전 댓글 표시 끝-->
                                                <tr>
                                                    <td class="cT01">1361</td>
                                                    <td class="tableTitle cT02">
                                                                <a href="javascript:freeBoardDetail('4282','6')">비치도서 신청등록합니다</a>
                                                    </td>
                                                    <td class="cT03">박춘우</td>
                                                    <td class="cT04">
                                                            2022-11-24
                                                    </td>
                                                    <td class="cT05">58</td>
                                                </tr>
                                                <!-- //예전 댓글 표시 시작-->
                                                <!-- //예전 댓글 표시 끝-->
                                                <tr>
                                                    <td class="cT01">1360</td>
                                                    <td class="tableTitle cT02">
                                                                <a href="javascript:freeBoardDetail('4262','7')">식당 샐러드 겨자드레싱</a>
                                                    </td>
                                                    <td class="cT03">고혜원</td>
                                                    <td class="cT04">
                                                            2022-11-17
                                                    </td>
                                                    <td class="cT05">152</td>
                                                </tr>
                                                <!-- //예전 댓글 표시 시작-->
                                                <!-- //예전 댓글 표시 끝-->
                                                <tr>
                                                    <td class="cT01">1359</td>
                                                    <td class="tableTitle cT02">
                                                                <a href="javascript:freeBoardDetail('4222','9')">사진등록</a>
                                                    </td>
                                                    <td class="cT03">박희준</td>
                                                    <td class="cT04">
                                                            2022-11-12
                                                    </td>
                                                    <td class="cT05">92</td>
                                                </tr>
                                                <!-- //예전 댓글 표시 시작-->
                                                <!-- //예전 댓글 표시 끝-->
                                                <tr>
                                                    <td class="cT01">1358</td>
                                                    <td class="tableTitle cT02">
                                                                <a href="javascript:freeBoardDetail('4142','12')">부산 협정기관 리스트 보기 오류입니다</a>
                                                    </td>
                                                    <td class="cT03">정민호</td>
                                                    <td class="cT04">
                                                            2022-10-20
                                                    </td>
                                                    <td class="cT05">87</td>
                                                </tr>
                                                <!-- //예전 댓글 표시 시작-->
                                                <!-- //예전 댓글 표시 끝-->
                                                <tr>
                                                    <td class="cT01">1357</td>
                                                    <td class="tableTitle cT02">
                                                                <a href="javascript:freeBoardDetail('4123','13')">우편번호 서비스가 오류가 납니다.</a>
                                                    </td>
                                                    <td class="cT03">안선덕</td>
                                                    <td class="cT04">
                                                            2022-10-16
                                                    </td>
                                                    <td class="cT05">51</td>
                                                </tr>
                                                <!-- //예전 댓글 표시 시작-->
                                                <!-- //예전 댓글 표시 끝-->
                                                <tr>
                                                    <td class="cT01">1356</td>
                                                    <td class="tableTitle cT02">
                                                                <a href="javascript:freeBoardDetail('4062','16')">멀티미디어 자료 검색</a>
                                                    </td>
                                                    <td class="cT03">강승묵</td>
                                                    <td class="cT04">
                                                            2022-09-17
                                                    </td>
                                                    <td class="cT05">101</td>
                                                </tr>
                                                <!-- //예전 댓글 표시 시작-->
                                                <!-- //예전 댓글 표시 끝-->
                                                <tr>
                                                    <td class="cT01">1355</td>
                                                    <td class="tableTitle cT02">
                                                                <a href="javascript:freeBoardDetail('4043','17')">전자책의 읽기여부의 기록에 관한 이의--&gt; 안내받음</a>
                                                    </td>
                                                    <td class="cT03">윤경호</td>
                                                    <td class="cT04">
                                                            2022-08-25
                                                    </td>
                                                    <td class="cT05">180</td>
                                                </tr>
                                                <!-- //예전 댓글 표시 시작-->
                                                <!-- //예전 댓글 표시 끝-->
                                </tbody></table>
                            </div>
                            <div class="paging">
                                <ul>
                                    <li class="first"><a href="#" onclick="fn_egov_link_page(1); return false;"><img src="/images/img/btnFirst.png" style="border:0;" alt="처음으로"></a></li><li class="pre"><a href="#" onclick="fn_egov_link_page(1); return false;"><img src="/images/img/btnPre.png" style="border:0;" alt="이전으로"></a></li><li class="active"><a href="#">1</a></li><li><a href="#" onclick="fn_egov_link_page(2); return false;">2</a></li><li><a href="#" onclick="fn_egov_link_page(3); return false;">3</a></li><li><a href="#" onclick="fn_egov_link_page(4); return false;">4</a></li><li><a href="#" onclick="fn_egov_link_page(5); return false;">5</a></li><li><a href="#" onclick="fn_egov_link_page(6); return false;">6</a></li><li><a href="#" onclick="fn_egov_link_page(7); return false;">7</a></li><li><a href="#" onclick="fn_egov_link_page(8); return false;">8</a></li><li><a href="#" onclick="fn_egov_link_page(9); return false;">9</a></li><li><a href="#" onclick="fn_egov_link_page(10); return false;">10</a></li><li class="next"><a href="#" onclick="fn_egov_link_page(11); return false;"><img src="/images/img/btnNext.png" style="border:0;" alt="다음으로"></a></li><li class="end"><a href="#" onclick="fn_egov_link_page(137); return false;"><img src="/images/img/btnLast.png" style="border:0;" alt="마지막으로"></a></li>
                                </ul>
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