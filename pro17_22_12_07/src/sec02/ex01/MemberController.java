package sec02.ex01;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//http://localhost:8080/pro17/member2/listMembers.do

//URL 주소 매핑 Deployment Descriptors 에서 확인 가능
//중복 되면 서버 꺼짐
//URL 요청 처리는 2단계로 이루어짐
// 사용자 브라우저가 URL /http://localhost:8080/pro17/member2/으로 시작
@WebServlet("/member2/*")
public class MemberController extends HttpServlet {
	
	//과거 코드 여러개의 웹서버에서 중복처리
	private static final long serialVersionUID = 1L;
	private MemberDAO memberDAO;

	//서블릿 시작시 DAO 생성
	public void init() throws ServletException {
		memberDAO = new MemberDAO();
	}//emd init

	//http get 요청시 HTML form 태그에서 요청
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//실제 처리할 부분 함수로 처리		
		doHandle(request, response);
	}//end doGet

	//http post 요청시 HTML form 태그에서 요청
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//실제 처리할 부분 함수로 처리
		doHandle(request, response);
	}//end doPost

	// 실핼할 로직 get, post 2개라서 함수로 처리
	private void doHandle(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String nextPage = null;
		//한국어 처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		
		//사용자 브라우져에서 URL에서 요청명[가장 끝부분]가져옴
		String action = request.getPathInfo();
		System.out.println("action:" + action);
		
		//URL에서 요청명[가장 끝부분] listMembers.do 이면 처리할 부분
		//null 은 최초 요청일 경우
		if (action == null || action.equals("/listMembers.do")) {
			List<MemberVO> membersList = memberDAO.listMembers();
			request.setAttribute("membersList", membersList);
			//이동할 JSP 경로 저장
			nextPage = "/test02/listMembers2.jsp";
		}
		//URL에서 요청명[가장 끝부분] addMember.do
		else if (action.equals("/addMember.do")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			MemberVO memberVO = new MemberVO(id, pwd, name, email);
			memberDAO.addMember(memberVO);
			//이동할 JSP 경로 저장
			nextPage = "/member2/listMembers.do";
		} 
		//URL에서 요청명[가장 끝부분] memberForm.do
		else if (action.equals("/memberForm.do")) {
			//이동할 JSP 경로 저장
			nextPage = "/test02/memberForm2.jsp";
		} 
		//모두 아니면 
		else {
			List<MemberVO> membersList = memberDAO.listMembers();
			request.setAttribute("membersList", membersList);
			//이동항 JSP 경로 저장
			nextPage = "/test02/listMembers2.jsp";
		}//end if
		
		//nextPage 에 저장된 JSP 경로로 이동
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		//브라우져 사용의 요청과 서버의 응답을 가지고 이동
		dispatch.forward(request, response);
	}//end doHandle

}//end class