package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.MemberDAO;
import member.model.MemberVO;

//서블릿 요청하기 위한 URL : URL Mapping을 /login.do로 변경
@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/login.jsp");
		dispatcher.forward(request, response);
	}
	
	// 회원인증
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
		String url = "member/login.jsp";	// 회원인증 실패 시 이동할 페이지(jsp)를 url 변수에 저장
		
		String member_id = request.getParameter("member_id"); // login.jsp 로그인 폼에서 입력한 회원의 ID, PW 얻어와 변수에 저장
		String member_pw = request.getParameter("member_pw");
		
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.login(member_id, member_pw); // login() 메소드를 호출해 DB에 등록된 회원인지 확인
		
		if (result == 1) { // 회원 인증에 성공한 경우
			MemberVO mVo = mDao.getMember(member_id);
			// 로그인 인증 처리된 회원정보는 다른 사이트에 갔다 돌아와도 다시 로그인하지 안하도 되도록 세션에 등록
			HttpSession session = request.getSession(); // 세션 객체 생성
			session.setAttribute("loginUser", mVo); // 세션에 회원정보 저장
			session.setAttribute("sessionId", mVo.getMember_id());	// 세션에 회원 ID 저장
			// 수정하기
			request.setAttribute("message", "회원가입에 성공했습니다."); // jsp 페이지에 보낼 메시지를 요청 객체에 저장
			url = "/freeBoardList.do"; // 회원 인증 성공 시 이동 가능한 main페이지 url 변수에 저장
		} else if (result == 0) { // 비밀번호가 불일치할 경우
			// 수정하기
			request.setAttribute("message", "비밀번호가 맞지 않습니다.");
		} else if (result == -1) { // 아이디가 불일치할 경우
			// 수정하기
			request.setAttribute("message", "존재하지 않는 회원입니다.");
		}
		
		// confrimID() 메소드의 결과값을 사용자 아이디와 함께 idchk.jsp 페이지에 어트리뷰트에 실어보냄
		request.setAttribute("member_id", member_id);
		request.setAttribute("member_pw", member_pw);
		request.setAttribute("result", result);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
