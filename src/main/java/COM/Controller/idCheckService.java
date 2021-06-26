package COM.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import COM.Model.UserDAO;



@WebServlet("/idCheckService")
public class idCheckService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("EUC-KR");
		
	    PrintWriter	out= response.getWriter();
	    
		String id =	request.getParameter("id");
		System.out.println(id);
		
		UserDAO dao= new UserDAO();
		
		boolean check= 	dao.idcheck(id);
		out.print(check);
		
	}

}
