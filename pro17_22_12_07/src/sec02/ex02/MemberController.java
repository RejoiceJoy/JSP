package sec02.ex02;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//http://localhost:8080/pro17/member3/listMembers.do

//URL 주소 매핑 Deployment Descriptors 에서 확인 가능
//중복 되면 서버 꺼짐
//URL 요청 처리는 2단계로 이루어짐
//사용자 브라우저가 URL /http://localhost:8080/pro17/member3/으로 시작
@WebServlet("/member3/*")
public class MemberController extends HttpServlet {
	//과거 코드 여러개의 웹서버에서 중복처리
	private static final long serialVersionUID = 1L;
	private MemberDAO memberDAO;

	//서블릿 시작시 DAO 생성
	public void init() throws ServletException {
		memberDAO = new MemberDAO();
	}//end init

	//http get 요청 처리
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//실제 처리할 부분 함수로 처리
		doHandle(request, response);
	}//end doGet

	//http post 요청 처리
	protected void doPost(HttpServletRequest request, HttpServletResponse response)	
			throws ServletException, IOException {
		//실제 처리할 부분 함수로 처리
		doHandle(request, response);
	}//end doPost

	// 실핼할 로직 get, post 2개라서 함수로 처리
	private void doHandle(HttpServletRequest request, HttpServletResponse response)	
			throws ServletException, IOException {
		//이동할 JSP 페이지 위치 설정
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
			//db에서 데이터 가져와서 자바에 저장
			List<MemberVO> membersList = memberDAO.listMembers();
			//request 에 DB에서 가져온 데이터 저장
			request.setAttribute("membersList", membersList);
			//이동할 JSP 경로 저장
			nextPage = "/test03/listMembers3.jsp";
		}//URL에서 요청명[가장 끝부분] addMember.do 이면 처리할 부분
		else if (action.equals("/addMember.do")) {
			//HTML애서 insert에 필요한 데이터 가져오기
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			//여러값을 한번에 처리하기 위해 VO 클래스 생성
			MemberVO memberVO = new MemberVO(id, pwd, name, email);
			//db에 insert 작업 수행
			memberDAO.addMember(memberVO);
			//request 문자값 "addMember" 를 msg 라는 식별자로 저장
			request.setAttribute("msg", "addMember");
			//이동할 JSP 경로 저장
			nextPage = "/member3/listMembers3.jsp";
		}//URL에서 요청명[가장 끝부분] memberForm.do 이면 처리할 부분 //
		else if (action.equals("/memberForm.do")) {
			//그냥 JSP 페이지로만 이동
			//이동할 JSP 경로 저장
			nextPage = "/test03/memberForm3.jsp";
		}//URL에서 요청명[가장 끝부분] memberForm.do 이면 처리할 부분 ///modMemberForm.do
		else if(action.equals("/modMemberForm.do")){
			 //브라우저에서 id 값 갖옴
		     String id=request.getParameter("id");
		     //db에서 데이터 가져와서 자바에 저장
		     MemberVO memInfo = memberDAO.findMember(id);
		     //request 에 DB에서 가져온 데이터 저장
		     request.setAttribute("memInfo", memInfo);
		     //이동할 JSP 경로 저장
		     nextPage="/test03/modMemberForm3.jsp";
		}//URL에서 요청명[가장 끝부분] memberForm.do 이면 처리할 부분 ///modMember.do
		else if(action.equals("/modMember.do")){
			//HTML애서 update에 필요한 데이터 가져오기
		     String id=request.getParameter("id");
		     String pwd=request.getParameter("pwd");
		     String name= request.getParameter("name");
	         String email= request.getParameter("email");
	         //db에서 데이터 가져와서 자바에 저장
		     MemberVO memberVO = new MemberVO(id, pwd, name, email);
		     memberDAO.modMember(memberVO);
		     //request 에 DB에서 가져온 데이터 저장
		     request.setAttribute("msg", "modified");
		     //이동할 JSP 경로 저장
		     nextPage="/member3/listMembers.do";
		}//URL에서 요청명[가장 끝부분] memberForm.do 이면 처리할 부분 ///delMember.do
		else if(action.equals("/delMember.do")){
			//HTML애서 update에 필요한 데이터 가져오기
		     String id=request.getParameter("id");
		     //db 에서 delete 작업 수행
		     memberDAO.delMember(id);
		   //request 문자값 "deleted" 를 msg 라는 식별자로 저장
		     request.setAttribute("msg", "deleted");
		   //이동할 JSP 경로 저장
		     nextPage="/member3/listMembers.do";
		}else 
		{
			List<MemberVO> membersList = memberDAO.listMembers();
			request.setAttribute("membersList", membersList);
			//이동할 JSP 경로 저장
			nextPage = "/test03/listMembers3.jsp";
		}//end if
		
		//실제 Controller 부분
		//이동할 JSP 경로를 RequestDispatcher 에 저장
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		//request 에 저장된 DB 반환 데이터 또는 문자값을 가지고 이동
		dispatch.forward(request, response);
		
	}//end do handle

}//end class
