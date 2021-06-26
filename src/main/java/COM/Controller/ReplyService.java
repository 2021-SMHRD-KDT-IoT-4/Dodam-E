package COM.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import COM.Model.NoticeDTO;
import COM.Model.NoticeWriteDAO;

@WebServlet("/ReplyService")
public class ReplyService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("u_id");
		
		String r_content = request.getParameter("r_content");
		
		
		
		/*
		// 3개를 DB에 넣는 코드
		NoticeDTO dto = new NoticeDTO(title, id, content);
		NoticeWriteDAO dao = new NoticeWriteDAO();
		int cnt = dao.upload(dto, id);
		
		System.out.println(id);
		System.out.println(title);
		System.out.println(content);
		
		if (cnt > 0) {
			response.sendRedirect("board.jsp");
		} else {
			response.sendRedirect("insertbboard.jsp");
		}
		*/
		
		
		
	
	}

}
