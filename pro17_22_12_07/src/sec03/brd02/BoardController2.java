package sec03.brd02;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
//http://localhost:8080/pro17/board/listArticles.do

//URL 주소 매핑 Deployment Descriptors 에서 확인 가능
//중복 되면 서버 꺼짐
//URL 요청 처리는 2단계로 이루어짐
//사용자 브라우저가 URL /http://localhost:8080/pro17/board/으로 시작

//@WebServlet("/board/*")
public class BoardController2 extends HttpServlet {
	
	////과거 코드 여러개의 웹서버에서 중복처리
	private static final long serialVersionUID = 1L;

	//이미지 저장 경로
	private  String ARTICLE_IMAGE_REPO = "C:\\board\\article_image";
	
	//서비스 로직
	private BoardService boardService;
	private ArticleVO articleVO;

	//	//서블릿 시작시 boardService 생성
	public void init(ServletConfig config) throws ServletException {
		boardService = new BoardService();
		articleVO = new ArticleVO();
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
		System.out.println("BoardController2 ");
		//이동할 JSP 페이지 위치 설정
		String nextPage = "";
		
		//한국어 처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		//사용자 브라우져에서 URL에서 요청명[가장 끝부분]가져옴
		String action = request.getPathInfo();
		System.out.println("action:" + action);
		
		try {
			//DB에서 가여온 데이터 담을 공간 만듬
			List<ArticleVO> articlesList = new ArrayList<ArticleVO>();
			
			////URL에서 요청명[가장 끝부분] listMembers.do 이면 처리할 부분
			//null 은 최초 요청일 경우
			if (action == null || action.equals("/") ) {
				articlesList = boardService.listArticles();
				//request 에 DB에서 가져온 데이터 저장
				request.setAttribute("articlesList", articlesList);
				nextPage = "/board02/listArticles.jsp";
			} //URL에서 요청명[가장 끝부분] listArticles.do 이면 처리할 부분
			else if (action.equals("/listArticles.do")) {
				articlesList = boardService.listArticles();
				//request 에 DB에서 가져온 데이터 저장
				request.setAttribute("articlesList", articlesList);
				nextPage = "/board02/listArticles.jsp";
			} //URL에서 요청명[가장 끝부분] articleForm.do 이면 처리할 부분
			else if (action.equals("/articleForm.do")) {
				nextPage = "/board02/articleForm.jsp";
			} //URL에서 요청명[가장 끝부분] addArticle.do 이면 처리할 부분
			else if (action.equals("/addArticle.do")) {
				Map<String, String> articleMap = upload(request, response);
				String title = articleMap.get("title");
				String content = articleMap.get("content");
				String imageFileName = articleMap.get("imageFileName");
				//기본 댓글이 없음	
				articleVO.setParentNO(0);
				//글스는 사람 고정
				articleVO.setId("hong");
				articleVO.setTitle(title);
				articleVO.setContent(content);
				articleVO.setImageFileName(imageFileName);
				boardService.addArticle(articleVO);
				nextPage = "/board/listArticles.do";
			}else {
				nextPage = "/board02/listArticles.jsp";
			}//end if

			//실제 Controller 부분
			//이동할 JSP 경로를 RequestDispatcher 에 저장
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			//request 에 저장된 DB 반환 데이터 또는 문자값을 가지고 이동
			dispatch.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}//end try
	}//end doHandle

	//upload 처리
	private Map<String, String> upload(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//upload 처리후 t_board 테이블에 저장할 정보저장
		Map<String, String> articleMap = new HashMap<String, String>();
		
		//한글설정 저장
		String encoding = "utf-8";
		
		//이미지 저장 경로
		File currentDirPath = new File(ARTICLE_IMAGE_REPO);
		
		//org.apache.commons.fileupload.disk.DiskFileItemFactory
		//https://commons.apache.org/proper/commons-fileupload/using.html
		//외부 jar 파일 클래스
		DiskFileItemFactory factory = new DiskFileItemFactory();
		//저장할 경로 설정
		factory.setRepository(currentDirPath);
		//업로드 파일 사이즈 설정
		factory.setSizeThreshold(1024 * 1024);
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		try {
			List items = upload.parseRequest(request);
			for (int i = 0; i < items.size(); i++) {
				//org.apache.commons.fileupload.FileItem
				//https://commons.apache.org/proper/commons-fileupload/using.html
				//외부 JAR 파일 인터페이스
				//전송된 매개변수를 List 객체로 얻습니다.
				FileItem fileItem = (FileItem) items.get(i);				

				if (fileItem.isFormField()) {
					System.out.println(fileItem.getFieldName() + "=" + fileItem.getString(encoding));
					//viewArticle.jsp 에서  <form> 내 요소 가져와서 articleMap 넣기
					articleMap.put(fileItem.getFieldName(), fileItem.getString(encoding));
				} else {
					System.out.println("파라미터명:" + fileItem.getFieldName());
					//System.out.println("파일명:" + fileItem.getName());
					System.out.println("파일크기:" + fileItem.getSize() + "bytes");
					//articleMap.put(fileItem.getFieldName(), fileItem.getName());
					
					if (fileItem.getSize() > 0) {
						int idx = fileItem.getName().lastIndexOf("\\");
						if (idx == -1) {
							idx = fileItem.getName().lastIndexOf("/");
						}//end if

						String fileName = fileItem.getName().substring(idx + 1);
						System.out.println("파일명:" + fileName);
						articleMap.put(fileItem.getFieldName(), fileName);  //익스플로러에서 업로드 파일의 경로 제거 후 map에 파일명 저장
						File uploadFile = new File(currentDirPath + "\\" + fileName);
						//실제 파일 업로드 
						fileItem.write(uploadFile);
					} // end if
				} // end if
			} // end for
		} catch (Exception e) {
			e.printStackTrace();
		}//end try
		System.out.println(articleMap.toString());
		
		return articleMap;
	}//end upload

}//end class
