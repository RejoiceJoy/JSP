package sec01.ex01;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//URL 주소 매핑 Deployment Descriptors 에서 확인 가능
//중복 되면 서버 꺼짐
// http://localhost:8080/pro17/mem.do

@WebServlet("/mem.do")
public class MemberController extends HttpServlet {
	//과거 코드 여러개의 웹서버에서 중복처리
	private static final long serialVersionUID = 1L;
	
	private MemberDAO memberDAO;

	//서블릿 시작시 DAO 생성
	public void init() throws ServletException {
		memberDAO = new MemberDAO();
	}// end init

	//http get 요청시 HTML form 태그에서 요청
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//실제 처리할 부분 함수로 처리
		doHandle(request, response);
	}//end doGet

	//http post 요청시 HTML form 태그에서 요청
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}//end doPost

	// 실핼할 로직 get, post 2개라서 함수로 처리
	private void doHandle(
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글 초리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//DB 처리
		List<MemberVO> membersList = memberDAO.listMembers();
		//listMembers.jsp 에 DB 처리 결과 전달
		request.setAttribute("membersList", membersList);
		
		//응답할 JSP 세팅 
		RequestDispatcher dispatch = request.getRequestDispatcher("/test01/listMembers.jsp");
		//브라우져 사용의 요청과 서버의 응답을 가지고 이동
		dispatch.forward(request, response);
	}//end class

}//end class
