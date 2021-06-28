package COM.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import COM.Model.UserDAO;
import COM.Model.UserDTO;
import COM.Model.childDAO;
import COM.Model.childDTO;

@WebServlet("/ChilddeleteService")
public class ChilddeleteService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		
		HttpSession session = request.getSession(); 
		
		UserDTO result = (UserDTO) session.getAttribute("login_info");
		String id = result.getId();
		String num = request.getParameter("num");
		
		/*
		 * childDTO dto = new childDTO(id, num); UserDAO udao = new UserDAO(); UserDTO
		 * udto = new UserDTO(id);
		 */
		
		childDAO dao = new childDAO();
		int cnt = dao.childdelete(id, num);
		
		
		
	
		if(cnt > 0) {
			
			System.out.println("아이정보 삭제 성공");
		}else {
			System.out.println("아이정보 삭제 실패");
		}
		response.sendRedirect("mypage.jsp");
	
	
	}

}
