package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/SearchPwdServlet")
public class SearchPwdServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String member_id=null;		
		member_id = request.getParameter("member_id");
		
		HttpSession session = request.getSession();
		session.setAttribute("member_id", member_id);
		
		System.out.println("SearchPwdServlet member_id: "+member_id);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/changePwdForm.jsp");
		dispatcher.forward(request, response);
	}

}
