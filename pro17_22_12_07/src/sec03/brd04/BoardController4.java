package sec03.brd04;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;

//http://localhost:8080/pro17/board/listArticles.do

//URL 주소 매핑 Deployment Descriptors 에서 확인 가능
//중복 되면 서버 꺼짐
//URL 요청 처리는 2단계로 이루어짐
//사용자 브라우저가 URL /http://localhost:8080/pro17/board/으로 시작


//@WebServlet("/board/*")
public class BoardController4 extends HttpServlet {
	
	 ////과거 코드 여러개의 웹서버에서 중복처리
	private static final long serialVersionUID = 1L;
	//이미지 경로
	private static String ARTICLE_IMAGE_REPO = "C:\\board\\article_image";
	
	//서비스 로직
	private BoardService boardService;
	private ArticleVO articleVO;

	//서블릿 시작시 boardService 생성
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
		System.out.println("BoardController4 ");
		
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
			//URL에서 요청명[가장 끝부분] listMembers.do 이면 처리할 부분
			//null 은 최초 요청일 경우
			if (action == null) {
				articlesList = boardService.listArticles();
				//request 에 DB에서 가져온 데이터 저장
				request.setAttribute("articlesList", articlesList);
				//이동할 JSP 페이지 위치 설정
				nextPage = "/board04/listArticles.jsp";
			}//URL에서 요청명[가장 끝부분] listArticles.do 이면 처리할 부분
			else if (action.equals("/listArticles.do")) {
				articlesList = boardService.listArticles();
				//request 에 DB에서 가져온 데이터 저장
				request.setAttribute("articlesList", articlesList);
				//이동할 JSP 페이지 위치 설정
				nextPage = "/board04/listArticles.jsp";
			} //URL에서 요청명[가장 끝부분] articleForm.do 이면 처리할 부분
			else if (action.equals("/articleForm.do")) {
				//이동할 JSP 페이지 위치 설정
				nextPage = "/board04/articleForm.jsp";
			} //URL에서 요청명[가장 끝부분] addArticle.do 이면 처리할 부분
			else if (action.equals("/addArticle.do")) {
				int articleNO=0;				
				//uplad 함수 호출 request 를 가져가야 업로드 가능 
				Map<String, String> articleMap = upload(request, response);
				//upload한 파일 정보 가져오기 t_board inset 위해서
				String title = articleMap.get("title");
				String content = articleMap.get("content");
				String imageFileName = articleMap.get("imageFileName");				
				//계층형 게시판 가장 위에 글
				articleVO.setParentNO(0);
				//테스트를 위해 글쓰는 사람 고정
				articleVO.setId("hong");
				articleVO.setTitle(title);
				articleVO.setContent(content);
				articleVO.setImageFileName(imageFileName);				
				// t_board INSERT
				articleNO= boardService.addArticle(articleVO);				
				//temp 폴더 추가 부분
				if(imageFileName!=null && imageFileName.length()!=0) {
				    File srcFile = 
				    		new 	File(ARTICLE_IMAGE_REPO +"\\"+"temp"+"\\"+imageFileName);
					File destDir = 
							new File(ARTICLE_IMAGE_REPO +"\\"+articleNO);
					//폴더 생성
					destDir.mkdirs();
					//업로드 파일 저장 
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
					srcFile.delete();
				}//end if				
				//브라우져에 서블릿으로 직접 출력
				PrintWriter pw = response.getWriter();
				pw.print("<script>" 
				         +"  alert('새글을 추가했습니다.');" 
						 +" location.href='"+request.getContextPath()+"/board/listArticles.do';"
				         +"</script>");
				//doHandle 나가기
				return; //doHandle 나가기
			}//URL에서 요청명[가장 끝부분] viewArticle.do 이면 처리할 부분		
			else if(action.equals("/viewArticle.do")){
				//http /board/viewArticle.do?articleNO= 에서 값 가져옴
				String articleNO = request.getParameter("articleNO");
				//DB에서 해당 정보 가져옴
				articleVO=boardService.viewArticle(Integer.parseInt(articleNO));
				//request 에 DB에서 가져온 데이터 저장
				request.setAttribute("article",articleVO);
				//이동할 JSP 페이지 위치 설정
				nextPage = "/board04/viewArticle.jsp";
			
			}else {
				//이동할 JSP 페이지 위치 설정
				nextPage = "/board04/listArticles.jsp";
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
		private Map<String, String> upload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//upload 처리후 t_board 테이블에 저장할 정보저장
			Map<String, String> articleMap = new HashMap<String, String>();
			//한글 처리
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
							//익스플로러에서 업로드 파일의 경로 제거 후 map에 파일명 저장
							articleMap.put(fileItem.getFieldName(), fileName);  						
							File uploadFile = new File(currentDirPath + "\\temp\\" + fileName);
							fileItem.write(uploadFile);
						} // end if
					} // end if
				} // end for
			} catch (Exception e) {
				e.printStackTrace();
			}//end try
			return articleMap;
		}//end upload

}//end BoardController4
