package book;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GuGuTest
 */
@WebServlet("/gugutest3")
public class GuGuTest3 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet 메서드 호출");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter printwriter = response.getWriter();
		
		int dan = Integer.parseInt(request.getParameter("dan"));
		printwriter.print("<table border = 1 width = 1000 align = center>" );
		printwriter.print("<tr align = center bgcolor = '#FFFF66'>");
		printwriter.print("<td colspan = 4>" + dan + "단 출력 </td>");
		printwriter.print("</tr>");
		
		for (int i = 1; i < 10; i++) {
			if (i % 2 == 0) {
				printwriter.print("<tr align = center bgcolor='#ACFA58'>" );
			} else {
				printwriter.print("<tr align = center bgcolor='#81BEF7'>" );
			}	
			printwriter.print("<td width = 100>" );
			printwriter.print("<input type = 'radio'>" + i);
			printwriter.print("</td>" );
			printwriter.print("<td width = 100>");
			printwriter.print("<input type = 'checkbox'>" + i);
			printwriter.print("</td>" );
					
			printwriter.print("<td width = 400>" );
			printwriter.print(dan + " * " + i );
			printwriter.print("</td>" );
			printwriter.print("<td width = 400>");
			printwriter.print(i * dan);
			printwriter.print("</td>" );
			printwriter.print("</tr>");
			
		}
		printwriter.print("</table>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
