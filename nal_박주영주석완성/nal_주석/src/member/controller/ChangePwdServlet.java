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


@WebServlet("/changePwdForm.do")
public class ChangePwdServlet extends HttpServlet {
	
private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/changePwdForm.jsp"); // 비밀번호를 변경할 폼으로 이동
		dispatcher.forward(request, response);
	}
	
	// 비번변경
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		String member_pw = request.getParameter("member_pw");
		String member_id = (String) session.getAttribute("member_id"); // 입력한 아이디 가져옴
		
		System.out.println("pw변경서블릿 : "+member_pw);
		System.out.println("pw변경서블릿 id:"+member_id);
		
		MemberVO mVo = new MemberVO();
		mVo.setMember_pw(member_pw);
		
		MemberDAO mDao = MemberDAO.getInstance(); // DAO 객체 얻어옴
		mDao.updatePw(member_pw, member_id);
		
		request.setAttribute("member_id", member_id);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/login.jsp"); // 비밀번호를 변경할 폼으로 이동
		dispatcher.forward(request, response);
	}

}
