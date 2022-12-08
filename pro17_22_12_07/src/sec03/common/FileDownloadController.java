package sec03.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/download.do")
public class FileDownloadController extends HttpServlet {
	
	//과거 코드 여러개의 웹서버에서 중복처리
	private static final long serialVersionUID = 1L;
	//파일 이미지 경로
	private static String ARTICLE_IMAGE_REPO = "C:\\board\\article_image";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)	
			throws ServletException, IOException {
		//실제 처리할 부분 함수로 처리
		doHandle(request, response);
	}//end doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response)	
			throws ServletException, IOException {
		//실제 처리할 부분 함수로 처리
		doHandle(request, response);
	}//end doPost

	// 실핼할 로직 get, post 2개라서 함수로 처리
	private void doHandle(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		//한국어 처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		//이미지 파일이름과 글 번호를 가여옴
		String imageFileName = (String) request.getParameter("imageFileName");
		String articleNO = request.getParameter("articleNO");
		System.out.println("imageFileName=" + imageFileName);
		
		//브라우져에 이미지 파일 전송할 준비
		OutputStream out = response.getOutputStream();
		String path = ARTICLE_IMAGE_REPO + "\\" + articleNO + "\\" + imageFileName;
		
		//서버에 저장된 이미지 저장할 자바 파일 객체 선언
		File imageFile = new File(path);

		response.setHeader("Cache-Control", "no-cache");
		//이미지 파일을 내려 받는데 필요한 헤더 정보
		response.addHeader("Content-disposition", "attachment;fileName=" + imageFileName);
		//버퍼를 이용해서 한번에 8kb식 전송
		FileInputStream in = new FileInputStream(imageFile);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer);
			if (count == -1)
				break;
			out.write(buffer, 0, count);
		}//end while
		in.close();
		out.close();
	}//end do handle

}//end class
