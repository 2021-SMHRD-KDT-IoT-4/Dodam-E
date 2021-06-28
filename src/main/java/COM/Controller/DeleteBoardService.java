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
import COM.Model.UserDAO;
import COM.Model.UserDTO;

@WebServlet("/DeleteBoardService")
public class DeleteBoardService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("EUC-KR");
//		String id = request.getParameter("id");
		
		HttpSession session = request.getSession(); 
		
		UserDTO result = (UserDTO) session.getAttribute("login_info");
		String id = result.getId();
		
		int num = (int) session.getAttribute("r_seq");
		
		System.out.println("출력" + num);
		
		
		NoticeDTO dto = new NoticeDTO(num, id);
		NoticeWriteDAO dao = new NoticeWriteDAO();
		int cnt = dao.deleteOne(dto);
		
		
		
		if(cnt > 0) {
			System.out.println("게시물 삭제 성공");
		}else {
			System.out.println("게시물 삭제 실패");
		}
		response.sendRedirect("board.jsp");
	
	
	
	}

}
