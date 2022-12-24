<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- 본문 하단 메뉴 영역 -->
        <!-- footer contents -->
        <div class="footerContents">
            <div class="inner">
                <div class="chatBot">
                <!-- DR 제거 -->
                    <a href="#" id="floating_box" title="새창열림"><img src="images/img/img_chatbot.png" alt="챗봇" /></a>
                </div>
                <div class="footerTopBox">
                    <ul class="pvLink">
                        <li><a href="#">개인정보처리방침</a></li>
                        <li><a href="#">이메일수집거부</a></li>
                        <li class="mo"><a href="#top">TOP</a></li>
                    </ul>
                    <div class="frmLink snsW480">
                        <div class="snsMl75">
                            <a href="https://www.youtube.com/c/NALKR" target="_blank" title="YouTube 새창열기" class="snsBt10" style="background-color:#ffffff;width: 25px;margin-right:10px;">
                                <img src="images/sns/sns_1.png" alt="YouTube" style="width:25px;margin-top: 8px;"/>
                            </a>
                            <a href="https://www.instagram.com/nal_kr/"  target="_blank" title="Instagram 새창열기"  class="snsBt10" style="background-color:#ffffff;width: 25px;margin-right:10px;">
                                <img src="images/sns/sns_2.png" alt="Instagram" style="width:25px;margin-top: 8px;"/>
                            </a>
                            <a href="https://www.facebook.com/NationalAssemblyLibraryROK" target="_blank" title="Facebook 새창열기"  class="snsBt10" style="background-color:#ffffff;width: 25px;margin-right:10px;">
                                <img src="images/sns/sns_3.png" alt="Facebook" style="width:25px;margin-top: 8px;"/>
                            </a>
                            <a href="https://blog.naver.com/nalkr2017" target="_blank" title="블로그 새창열기"  class="snsBt10" style="background-color:#ffffff;width: 25px;margin-right:10px;">
                                <img src="images/sns/sns_4.png" alt="블로그 " style="width:25px;margin-top: 8px;"/>
                            </a>     		
                        </div>

                        <form name="footerLinkForm" id="footerLinkForm"></form>
                        <fieldset>
                            <legend>관련사이트</legend>
                            <div class="siteLink">
                                <select name="siteLink" id="siteLink" title="관련사이트 바로가기">
                                    <option value="23" title="국회부산도서관">국회부산도서관</option>
                                    <option value="1" title="대한민국 국회">대한민국 국회</option>
                                    <option value="2" title="국회사무처">국회사무처</option>
                                    <option value="3" title="국회예산정책처">국회예산정책처</option>
                                    <option value="4" title="국회입법조사처">국회입법조사처</option>
                                    <option value="20" title="국회미래연구원">국회미래연구원</option>
                                    <option value="7" title="국회기록보존소">국회기록보존소</option>
                                    <option value="21" title="헌법재판소도서관">헌법재판소도서관</option>
                                    <option value="5" title="선거정보도서관">선거정보도서관</option>
                                    <option value="6" title="한국학술지인용색인">한국학술지인용색인</option>
                                    <option value="8" title="국가전자도서관">국가전자도서관</option>
                                    <option value="9" title="국가정책연구포털">국가정책연구포털</option>
                                    <option value="16" title="국가학술정보 클라우드">국가학술정보 클라우드</option>
                                    <!-- <option value="18" title="독도홈페이지">독도홈페이지</option> -->
                                    <option value="17" title="디지털콘텐츠식별체계">디지털콘텐츠식별체계</option>
                                    <option value="19" title="학술연구자정보 공유">학술연구자정보 공유</option>
                                    <option value="22" title="지능형 분석(아르고스)">지능형 분석(아르고스)</option>
                                </select>
                            </div>
                            <a href="javascript:footerLink($('#siteLink').val());" title="새창열림">이동</a>
                        </fieldset>
                    </div>
                </div>
                <div class="footerBottomBox">
                    <p class="copyright">
                        국회도서관 - 서울특별시 영등포구 의사당대로 1 (여의도동) (우07233)<br>
                        홈페이지 관련 문의 : webw3@nanet.go.kr  /  전화문의 : 02-6788-4211, 080-788-4211(수신자 부담)<br>
                        Copyright ⓒ 대한민국 국회도서관 All rights reserved.
                    </p>
                    <div class="otherban">
                        
                            <a href="https://ccl.cckorea.org" target="_blank" title="새창열림">
<!-- png 파일 변경하기!!!!! -->
                                <img src="images/img/logoSite01.png" alt="creativecommons">
                            </a>
<!-- png 파일 변경하기!!!!! -->                        
                            <a href="http://www.webwatch.or.kr/Situation/WA_Situation.html?MenuCD=110" target="_blank" title="새창열림">
<!-- png 파일 변경하기!!!!! -->                        
                                <img src="images/img/logoSite02.png" alt="과학기술정보통신부 WA WEB접근성(웹 접근성 품질인증 마크) (사)한국시각장애인연합회 2021.12.28~2022.12.27" title="과학기술정보통신부 WA WEB접근성 (사)한국시각장애인연합회 2021.12.28~2022.12.27" />
                            </a>

                        <a href="#" onclick="footerLink('12');" title="새창열림">
 <!-- png 파일 변경하기!!!!! -->
                            <img src="images/img/logoSite04.png" alt="107 손말이음센터 연중무휴 국번없이 107 청각,언어장애인 의사소통 지원">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>			
</body>
</html>