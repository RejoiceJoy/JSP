<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<title>마이페이지>로그인</title>

						
							
	
	<div class="wrap">
        <div class="inner">
        <!-- 중앙 좌측 회원목록, 기타 메뉴 섹션 -->
            <!-- 왼쪽메뉴 -->
            <div class="leftMenu" id="subMenu">
                <ul class="side-menu">
                    <li data-url="/loginForm.do, /snsLoginProc.do">
                        <a href="login.do">로그인</a>
                    </li>
                    <li data-url="/member/insertMemberForm1.do, /member/insertMemberForm2.do, /member/insertMemberForm3.do, /member/insertMemberForm4.do,
                                    /member/insertMemberForm5.do, /member/insertMemberForm6.do, /member/selectMember.do, /member/insertMemberFormKid1.do, /member/insertMemberFormKid2.do">
                       <a href="selectMember.do">회원가입</a>  <!-- 14세미만 선택화면 20211026 -->
    <!--                     <a href="/member/insertMemberForm1.do">회원가입</a> -->
                    </li>
                    <li data-url="/member/searchIdPwdForm.do, /member/searchPwdForm.do, /member/searchIdPwdProc.do, /member/searchIdPwdProc.do">
                        <a href="searchIdPwdForm.do">아이디/비밀번호 찾기</a>
                    </li>
                    <li data-url="/member/mobilePassForm.do, /member/studentPassForm.do, /member/insertPassForm.do, /member/mobileBizForm.do">
                        <a href="#">열람증</a>
                        <ul>
                            <li data-url="/member/mobilePassForm.do, /member/insertPassForm.do"><a href="/member/mobilePassForm.do">모바일 간편열람증</a></li>
    <!--                         <li data-url="/member/studentPassForm.do"> -->
    <!--                             <a href="/member/studentPassForm.do">학생증 시범사업</a> -->
    <!--                         </li> -->
                        </ul>
                    </li>
                </ul>
            </div><!-- //왼쪽메뉴 -->
        </div>
        
        <!-- <로그인>버튼 클릭하면 입력된 정보를 받아 DB에 해당 정보가 저장되어 있는지 확인하는 작업을 서블릿에서 해야 함
			     so, 요청이 일어날 때마다 서블릿 클래스를 별도로 만들어서 처리하기보단 로그인 입력 폼을 띄우기 위해 사용했던 동일한 요청에 요청방식만 post로 주어서
			     	로그인을 위한 DB 처리작업을 함  >> LoginServlet클래스의 doPost()-->						
		<form id="memberVO" action="login.do" method="post" name="loginfrm">

                <div class="contentsContainer">
                    <div class="subTitle">
                        <div class="inner">
                            <h2>마이페이지</h2>
                            <div class="location">
                                <ol>
                                    <li class="home"><img src="images/img/icon_home.png" alt="홈"/></li>
                                    <li>마이페이지</li>
                                    <li>로그인</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <div class="inner">
                        <div class="contents" id="bodyWrap">
                            <h3 class="title">로그인</h3>
                            <div class="subContents">
                                <div class="body">
                                    <!-- 여기서부터 콘텐츠 s -->
                                    <div class="bodyBox01">
                                        <div class="loginNemoBox">
                                            <div class="login" style="display: flex; justify-content: center;">
                                                <div class="txtLoginInfo">
                                                    <p class="blueTxt09">MEMBER LOGIN</p>
                                                    <p class="blackTxt09">
                                                        국회도서관은 이용자의 편의성을 제공하기 위하여
                                                        홈페이지 및 주요정보서비스(국회전자도서관, 국회의원 정책자료,국회법률도서관)를
                                                        <span class="txtred">한번의 로그인∙로그아웃으로 접근할 수 있도록 개선</span>하였습니다.
                                                    </p>
                                                </div>
                                                <div class="loginInput">
                                                    <div class="idBg">
                                                        <input id="member_id" name="member_id" title="아이디 입력란" style="height:100% !important;" placeholder="아이디" type="text" value="">
                                                    </div>
                                                    <div class="pwBg">
                                                        <input id="member_pw" name="member_pw" title="비밀번호 입력란" placeholder="비밀번호" type="password" value="">
                                                    </div>
                                                    <div style="margin-bottom: 10px;">
                                                    <input type="checkbox" id="idSaveCheck" name="idSaveCheck" value="" style="margin-right: 5px;" />
                                                    <label for="idSaveCheck">아이디저장</label>
                                                    </div>
                                                    <!-- submit 형식으로 작성되어 클릭하면 form태그의 action 속성에 기술한 "login.do"가 요청됨 
														- 요청에 대한 처리를 서블릿에서 함
														- 서블릿은 클래스 이름으로 요청하기보단 login.do와 같이 일정한 패턴 방식을 사용 -->
													<!-- member.js의 logincheck() 함수 호출 -->
                                                    <div class="loginBtn">
                                                        <input type="submit" value="로그인" onclick="return loginCheck()"/>
                                                        
 <script>
 function loginCheck() {
		/* 아이디 입력상자 : 이름이 loginfrm인 폼 태그 내부에 존재 */
		if (loginfrm.member_id.value.length == 0) {
			alert("아이디를 입력하세요!")
 			loginfrm.member_id.focus();
 			return false;
 		}
		
 		if (loginfrm.member_pw.value == "") {
 			alert("비밀번호를 입력하세요!")
 			loginfrm.member_pw.focus();
 			return false;
 		}
 		var pattern = /\s/g; // 공백체크 (탭, 스페이스)
 		if (loginfrm.member_pw.value.match(pattern)) {
 			alert("비밀번호는 공백 없이 입력해주세요.");
 			frm.member_pw.focus();
 			return false;
 		}
 		return true;
	}
 </script>

<c:if test="${result == 0 }">
	<script>
		alert("아이디 또는 비밀번호가 일치하지 않습니다.");
	</script>
</c:if>
<c:if test="${result == -1 }">
	<script>
		alert("존재하지 않는 회원입니다.");
	</script>
</c:if>                                         
                                                        
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="loginBottomNemo pBg">
                                                <div class="loginBottomNemoSub">
                                                    <div class="loginIcon bg01">
                                                        회원가입을 하지 않으셨나요?
                                                    </div>
                                                    <div class="blueBtnNemo">
                                                        <a href="selectMember.do">회원가입</a>
                                                    	
                                                    </div>
                                                </div>
                                                <div class="loginBottomNemoSub">
                                                    <div class="loginIcon bg02">
                                                        아이디를 찾으시나요?
                                                    </div>
                                                    <div class="blueBtnNemo">
                                                        <a href="searchIdPwdForm.do">아이디 찾기</a>
                                                    </div>
                                                </div>
                                                <div class="loginBottomNemoSub">
                                                    <div class="loginIcon bg003">
                                                        비밀번호를 잊어버리셨나요?
                                                    </div>
                                                    <div class="blueBtnNemo">
                                                        <a href="searchPwdForm.do">비밀번호 변경</a>
                                                    </div>
                                                </div>
                                            </div>					
										
										<!-- 모바일버전?? -->
										 <div class="loginBottomNemo mBg" style="padding: 10px 20px">
                                                <div class="loginBottomNemoSub">
                                                    <div class="loginIcon ">
                                                        <a href="selectMember.do">
                                                            <img src="images/bg/bg09.png" alt="회원가입" style="max-width:100%;margin: 0 auto;"/>
                                                        </a>
                                                    </div> 
                                                </div>
                                                <div class="loginBottomNemoSub">
                                                    <div class="loginIcon ">
                                                        <a href="searchIdPwdForm.do">
                                                            <img src="images/bg/bg10.png" alt="아이디 찾기" style="max-width:100%;margin: 0 auto;"/>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="loginBottomNemoSub">
                                                    <div class="loginIcon ">
                                                        <a href="searchPwdForm.do">
                                                            <img src="images/bg/bg11.png" alt="비밀번호 변경" style="max-width:100%;margin: 0 auto;"/>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                           
                                        </div>
                                    </div>
                                </div>
								<!-- 모바일버전 끝..? -->
										
										
                                <!-- 여기까지 콘텐츠 e -->
                            </div>
                        </div>
                    </div>
                </div>
        </form>
		
		<form name="footerForm" method="post">
            <input type="hidden" name="deviceType" value="mob"/>
        </form>
        
<%@ include file="../footer.jsp" %>   