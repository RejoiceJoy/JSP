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

@WebServlet("/insertMemberBizForm.do")
public class JoinServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	// 회원 가입을 위한 정보를 입력 받을 폼(.jsp)으로 포워딩
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/insertMemberBizForm.jsp");
		dispatcher.forward(request, response);
	}
	
	// 데이터베이스 처리 위한 코드
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 회원가입 폼에서 입력받은 한글이 깨지지 않도록 인코딩 설정
		
		// 폼에서 입력한 회원 정보 얻어옴
		String member_id = request.getParameter("member_id");
		String member_pw = request.getParameter("member_pw");
		String member_name = request.getParameter("member_name");
		String member_email = request.getParameter("member_email_id")+"@"+request.getParameter("member_email_domain");
		String member_phone = request.getParameter("phone1")+request.getParameter("phone2")+request.getParameter("phone3");
		String member_birthdate = request.getParameter("member_birthdate");
		String member_address = "("+request.getParameter("zipCode")+") "+request.getParameter("address")+" "+request.getParameter("addressDetail");
		
		// 회원정보 저장할 객체 생성
		MemberVO mVo = new MemberVO();
		// MemberVO 객체인 mVo에 회원가입 폼에서 입력받은 데이터 저장
		mVo.setMember_id(member_id);
		mVo.setMember_pw(member_pw);
		mVo.setMember_name(member_name);
		mVo.setMember_email(member_email);
		mVo.setMember_phone(member_phone);
		mVo.setMember_birthdate(member_birthdate);
		mVo.setMember_address(member_address);
		
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.insertMember(mVo); // mVo 객체를 전달인자로 하여 mDao 객체로 insertMember 메소드 호출
		
		HttpSession session = request.getSession();
		
		if (result == 1) {
			session.setAttribute("member_id", mVo.getMember_id()); // session에 "member_id"를 키로 하여 아이디 값을 저장해둔 것을 login.jsp로 제어를 이동해 로그인 할때 자동으로 아이디 값 채움
			request.setAttribute("message", "회원가입에 성공했습니다.");
		} else {
			request.setAttribute("message", "회원가입에 실패했습니다.");
		}
		
		// 회원가입 성공 시 로그인 페이지로 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/insertMemberForm4.jsp");
		dispatcher.forward(request, response);
	}
	
}
