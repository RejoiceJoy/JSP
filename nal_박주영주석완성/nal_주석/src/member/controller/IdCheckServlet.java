package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.MemberDAO;

@WebServlet("/idchk.do")
public class IdCheckServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String member_id = request.getParameter("member_id"); // 회원가입 시 입력한 아이디 가져옴
		
		MemberDAO mDao = MemberDAO.getInstance(); // DAO 객체 얻어옴
		
		int result = mDao.confirmID(member_id); // confrimID() 메소드에 id를 전달해 중복체크 결과값 얻어옴
		// confrimID() 메소드의 결과값을 사용자 아이디와 함께 idchk.jsp 페이지에 어트리뷰트에 실어보냄
		request.setAttribute("member_id", member_id);
		request.setAttribute("result", result);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/idchk.jsp");
		dispatcher.forward(request, response);
	}
}
