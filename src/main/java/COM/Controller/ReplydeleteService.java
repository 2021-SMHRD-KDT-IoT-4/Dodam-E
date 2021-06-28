package COM.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import COM.Model.ReplyDAO;
import COM.Model.UserDTO;

@WebServlet("/ReplydeleteService")
public class ReplydeleteService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		UserDTO info = (UserDTO)session.getAttribute("login_info");
		
		
		String num = request.getParameter("num");
		
		String id = null;
		
		if(info != null) {
			id = info.getId();
		}
		id = info.getId();
		
		ReplyDAO dao = new ReplyDAO();
		
		int cnt = dao.DeleteOneReply(num);
		
		if(cnt > 0) {
			System.out.println("댓글 삭제성공");
		}else {
			System.out.println("댓글 삭제실패");
			
		}
		response.sendRedirect("board.jsp");
		
	}

}
