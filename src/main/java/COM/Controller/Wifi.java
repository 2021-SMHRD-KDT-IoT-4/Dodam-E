package COM.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import COM.Model.ReceiveDAO;
import COM.Model.ReceiveDTO;
import COM.Model.RouteDAO;
import COM.Model.RouteDTO;
import COM.Model.SendDTO;
import COM.Model.UserDTO;
import COM.Model.childDAO;
import COM.Model.childDTO;

@WebServlet("/Wifi")
public class Wifi extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
//      Integer.parseInt(request.getParameter("sb"));
		int js = 4;

		System.out.println(js);
		RouteDAO dao = new RouteDAO();
		ArrayList<ReceiveDTO> list = dao.loca();
		int num = 0;
		String loca = "";
		
		ReceiveDAO rdao = new ReceiveDAO();
		ArrayList<ReceiveDTO> rlist =
				rdao.receive_all();
		
		childDAO user = new childDAO();
		ArrayList<childDTO> dto = user.Child_one_info("ss");
		if (js > 0) {

			System.out.println(js);

			for (int i = 0; i < list.size(); i++) {
				num=list.get(i).getReceive_num();
				System.out.println("num:"+num+"\tjs:"+js);
				if (js == num) {
					System.out.println(i);
					for(int j = 0 ; j<dto.size(); j++) {
					if (dto.get(j).getC_send_machine().equals("11")) {
						System.out.println(list.get(i).getReceive_la()+":"+list.get(i).getReceive_ha());
						
						System.out.println("asdasdgjlashnfljas");
						loca = list.get(js-1).getReceive_loca();
						dao.upload("ss", dto.get(j).getC_name(), loca, list.get(js-1).getReceive_la(),list.get(js-1).getReceive_ha());
						
						System.out.println(dto.get(j).getC_name());
						break;
					}
					}
				}
		}

	}
}}