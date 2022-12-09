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
	//파일 이미지 경로
	private static String ARTICLE_IMAGE_REPO = "C:\\board2\\article_image";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		doHandle(request, response);
	}//end do...

	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		doHandle(request, response);
	}//end dop..

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		//이미지 파일이름과 글 번호를 가여옴
		String imageFileName = (String) request.getParameter("imageFileName");
		String articleNO = request.getParameter("articleNO");
		System.out.println("imageFileName=" + imageFileName);
		//스트림 객체 선언
		OutputStream out = response.getOutputStream();
		//이미지 파일 경로 설정
		String path = ARTICLE_IMAGE_REPO + "\\" + articleNO + "\\" + imageFileName;
		//파일 객체 선언 
		File imageFile = new File(path);
		//브라우저 헤더 세팅
		response.setHeader("Cache-Control", "no-cache");
		//이미지 파일을 내려 받는데 필요한 헤더 정보
		response.addHeader("Content-disposition", "attachment;fileName=" + imageFileName);
		//버퍼를 이용해서 한번에 8kb식 브라우저에게 전송
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
