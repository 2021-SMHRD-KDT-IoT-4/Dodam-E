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
import COM.Model.ReplyDAO;
import COM.Model.ReplyDTO;

@WebServlet("/ReplyService")
public class ReplyService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		
		HttpSession session = request.getSession();
		
		String u_id = (String)session.getAttribute("u_id");
		int n_seq = (int)session.getAttribute("r_seq");
		String r_content = request.getParameter("r_content");
		
		System.out.println(u_id);
		System.out.println(n_seq);
		System.out.println(r_content);
		
		ReplyDTO dto = new ReplyDTO(u_id, n_seq, r_content);
		
		ReplyDAO dao = new ReplyDAO();
		int cnt = dao.reply_upload(dto, u_id, n_seq);
		
		
		
		if (cnt > 0) {
			System.out.println("댓글쓰기 성공");
			session.setAttribute("notice_seq", n_seq);
		} else {
			System.out.println("댓글쓰기 실패");
		}
		response.sendRedirect("board.jsp");
		
	
	}

}
