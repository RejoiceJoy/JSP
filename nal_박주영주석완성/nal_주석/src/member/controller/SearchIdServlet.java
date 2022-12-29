package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.MemberDAO;

@WebServlet("/searchIdPwdForm.do")
public class SearchIdServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/searchIdPwdForm.jsp");
		dispatcher.forward(request, response);
	}
	
	// 아이디 찾기
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String url = "member/searchIdPwdForm.jsp";	// 실패 시 이동할 페이지(jsp)를 url 변수에 저장
		
		// searchIdPwdForm.jsp 폼에서 입력한 회원 정보 얻어옴
		String member_name = request.getParameter("member_name");
		String member_email = request.getParameter("member_email");
		String member_birthdate = request.getParameter("member_birthyear")+request.getParameter("member_birthmonth")+request.getParameter("member_birthday");
		
		MemberDAO mDao = MemberDAO.getInstance();
		String member_id = mDao.SearchId(member_name, member_email, member_birthdate);
		int result;
		
		if (member_id!=null) {
			result = 1;
			url = "member/searchIdPwdProc.jsp"; //성공 시 이동할 페이지 url 변수에 저장
		} else {
			result = -1;
		}
		
		request.setAttribute("member_id", member_id);
		request.setAttribute("result", result);
		
		System.out.println(member_id+"아이디찾기아이디");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
