package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/searchIdPwdProc.do")
public class SearchIdPwdProcServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String member_id = request.getParameter("member_id"); // 회원가입 시 입력한 아이디 가져옴
		
		request.setAttribute("member_id", member_id);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/searchIdPwdProc.jsp");
		dispatcher.forward(request, response);
	}

}
