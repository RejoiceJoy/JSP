<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<title>마이페이지>아이디/비밀번호 찾기>아이디 찾기</title>

<script type="text/javascript">

    $(function(){
        fnCurrentMenuCheck();
    });

    function ipck(){
        window.open("/main/ipChkPopup.do","acDbipPopup","width=336, height=250, scrollbars=0, resizable=0");
        //푸터쪽 관련사이트 컨트롤러
    }

</script>

<div class="wrap">
    <div class="inner">
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


<script type="text/javascript">
//<![CDATA[
    $(function () {
		var gbn = $("#changeGubun").val();
    	if(gbn=='id'){
    		$("#t1").addClass("on");
    	}else if(gbn=="pwd"){
    		$("#t2").addClass("on");
    	}
    	

   		// 아이디 찾기 후 선택된 아이디의 회색 박스에 파란 보더 삽입
   		var check = $('input:radio[name=id]:input[value='+id+']').attr("checked", true);
   		var box = $(".width165");
   		if( $("check") ){
   			$(box).addClass("borderChange");
   			
   		} else {
   			$(box).removeClass("borderChange");					           			
   		}
   		
    });
    
    /*
     *로그인 페이지로 이동
     */
      var selId = function(){
   	   
   	   var id = $(':radio[name=id]:checked').val();
   	    $("#searchId").val(id);
       	$("#searchMemberVO").attr("action", "/loginForm.do").submit();
   		
   	};
   	
   	/*
   	*비밀번호 변경 폼으로 이동
   	*/
   	var changePwdForm = function(){
   		var id  = "";
   		var seq = "";

   		$(":radio[name=id]").each(function(index){
   			if($(this).is(":checked")){
   			 id =	$(this).val();
   			 seq =  $(":hidden[name=hiddenSeq]:eq("+(index)+")").val();
   			}
   		});
   		
   		$("#searchId").val(id);
   		$("#searchNoSeq").val(seq);
   		
   		$("#searchMemberVO").attr("action", "/member/changePwdForm.do").submit();
   	};
//]]>
</script>


<form id="MemberVO" action="searchIdPwdProc.do" method="get" name="frm">

<input id="searchId" name="searchId" type="hidden" value=""/>
<input id="searchNoSeq" name="searchNoSeq" type="hidden" value=""/>
<input id="searchBirthday" name="searchBirthday" type="hidden" value="CaimZFiuoyvAh/Jnzac6EQ=="/>
<input id="changeGubun" name="changeGubun" type="hidden" value="id"/>

    <div class="contentsContainer">
        <div class="subTitle">
            <div class="inner">
                <h2>마이페이지</h2>
                <div class="location">
                    <ol>
                        <li class="home"><img src="images/img/icon_home.png" alt="홈"/></li>
                        <li>마이페이지</li>
                        <li>아이디/비밀번호 찾기</li>
                    </ol>
                </div>
            </div>
        </div>
        <div class="inner">
            <div class="contents" id="bodyWrap">
                <h3 class="title">아이디/비밀번호 찾기</h3>

                <div class="subContents">

                    <div class="body">
                        <!-- 여기서부터 콘텐츠 s -->
                        <ul class="tabbox two">
                            <li class="tab on nemBox" id="t1">
                                <h3><a href="searchIdPwdForm.do">아이디 찾기</a></h3>
                            </li>
                            <li class="tab" id="t2">
                                <h3><a href="searchPwdForm.do">비밀번호 변경</a></h3>
                            </li>
                        </ul>

                        <div class="nemoWapbox">
                            <div class="pt20">
                                <p class="nemoTxtTitle01 fontTxt01">입력하신 정보와 일치하는 아이디는 아래와 같습니다.</p>
                            </div>

                            <div class="logonCon">


                                <div class="width165 divDefine divDefine2">
                                    
               <span class="chk21 m_idSerch chkRadio">          
                   <input type="radio" id="member_id" name="member_id" value="${member_id}"  checked = 'checked'/>
                   <label for="id" class="bdfc38">${member_id}</label>  
                   <input type="hidden" id="member_id" name="member_id" value="${member_id}"/>
                </span>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="btnSetList">
                            <ul>
                                <li class="mr10"><a href="login.do">로그인</a></li>
                                <li><a href="SearchPwdServlet?member_id=${member_id}">비밀번호 변경</a></li>
                            </ul>
                            
<!--                         <div class="joinbtn" style="display: flex; justify-content: center;"> -->
<!--                         		<input type="button" value="로그인" onclick="location.href='login.do' "/> -->
<!--                                <input type="submit" value="비밀번호 변경" onclick="return changepw()"/>     -->
                        </div>
<%
	String member_id = request.getParameter("member_id");
%>                        
<script>
 function changepw() {
 		/* changePwdForm.jsp 페이지는 changePwdForm.do로 요청하면서 입력받은 정보 받음 */
 		var url = "changePwdForm.do?member_id="+frm.member_id.value();
 		//location.replace(url);
		location.href = url;	
 }
 </script>
                        <!-- 여기까지 콘텐츠 e -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
	





<!-- [start] 접속 로그 -->
<script type="text/javascript">

    //컨텐츠 경로 구분 값(전체페이지 공통)
    var _TRK_CP = "";
    var TEXT = "";
    $('.location li').each(function(index, item){
        if(index > 0){
            if(window.location.href.indexOf('monthLibView.do') > -1){
                TEXT = '월간 국회도서관';
            }else{
                TEXT = $(item).find('a').text();
            }
            _TRK_CP += "^"+TEXT;
        }
    });






    



    // 연령 추출
    function getAges(birthday){
        var ages = new Date().getFullYear() - Number(birthday.substr(0,4)) + 1;

        if(ages <= 9){
            return "A";
        }else if(ages <= 19){
            return "B";
        }else if(ages <= 29){
            return "C";
        }else if(ages <= 39){
            return "D";
        }else if(ages <= 49){
            return "E";
        }else if(ages <= 59){
            return "F";
        }else if(ages <= 69){
            return "G";
        }else if(ages >= 70){
            return "H";
        }else{
            return "";
        }
    }
</script>


    <script type='text/javascript' src="/js/bs_trk.js"></script>

<script type="text/javascript" defer='defer'>/* CLICKZONE SCRIPT V.V.4 *//*X*//* COPYRIGHT 2002-2017 BIZSPRING INC. *//*X*//* DO NOT MODIFY THIS SCRIPT. *//*X*/


    var _CZN = "29"; //운영서버 : 10

</script>
<script type='text/javascript' defer="defer" src="https://webstat.nanet.go.kr/InsightTrk/js/InsightClickZone.js"></script>
<!-- [end] 접속 로그 -->



<form name="footerForm" method="post">
    <input type="hidden" name="deviceType" value="mob"/>
</form>


<%@ include file="../footer.jsp" %>  