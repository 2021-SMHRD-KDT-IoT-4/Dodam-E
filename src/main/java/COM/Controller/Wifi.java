package COM.Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import COM.Model.ReceiveDTO;
import COM.Model.RouteDAO;


@WebServlet("/Wifi")
public class Wifi extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int js = Integer.parseInt( request.getParameter("sb"));

		System.out.println(js);
 
		RouteDAO dao = new RouteDAO();
		ArrayList<ReceiveDTO> list = dao.loca();
		int num = 0;
		String loca = "";
		if (js >0) {
			for (int i = 0; i < list.size(); i++) {

				num = list.get(i).getReceive_seq();
				if (num == js ) {

				
					loca = list.get(i).getReceive_loca();
					System.out.println("등록성공");

					dao.upload(loca);
					break;
				}else if(num==js) {
					
					loca = list.get(i).getReceive_loca();
					System.out.println("등록성공");

					dao.upload(loca);
					break;
				}else if(num==js) {
				
					loca = list.get(i).getReceive_loca();
					System.out.println("등록성공");

					dao.upload(loca);
					break;
				}

				

			}
		}
	}

}
