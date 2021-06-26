package COM.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import COM.Model.ReceiveDTO;
import COM.Model.RouteDAO;
import COM.Model.UserDTO;
import COM.Model.childDTO;

@WebServlet("/Wifi")
public class Wifi extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");

		int js = Integer.parseInt(request.getParameter("sb"));

		System.out.println(js);

		RouteDAO dao = new RouteDAO();
		ArrayList<ReceiveDTO> list = dao.loca();
		int num = 0;
		String loca = "";
		int cnt = 0;
		HttpSession session = request.getSession();
		UserDTO info = (UserDTO) session.getAttribute("login_info");
		if (info != null) {
			String send = (String) session.getAttribute("send_machine");
			childDTO cname = (childDTO) session.getAttribute("c_name");

			if (js > 0) {
				if (send == "11") {
					for (int i = 0; i < list.size(); i++) {

						num = list.get(i).getReceive_num();
						if (num == js) {

							loca = list.get(i).getReceive_loca();
							System.out.println("등록성공");

							cnt = dao.upload(info, cname, loca);

							break;
						} else if (num == js) {

							loca = list.get(i).getReceive_loca();
							System.out.println("등록성공");

							cnt = dao.upload(info, cname, loca);
							break;
						} else if (num == js) {

							loca = list.get(i).getReceive_loca();
							System.out.println("등록성공");

							cnt = dao.upload(info, cname, loca);
							break;
						}
					}
				} else if (send == "111") {
					for (int i = 0; i < list.size(); i++) {

						num = list.get(i).getReceive_num();
						if (num == js) {

							loca = list.get(i).getReceive_loca();
							System.out.println("등록성공");

							cnt = dao.upload(info, cname, loca);

							break;
						} else if (num == js) {

							loca = list.get(i).getReceive_loca();
							System.out.println("등록성공");

							cnt = dao.upload(info, cname, loca);

							break;
						} else if (num == js) {

							loca = list.get(i).getReceive_loca();
							System.out.println("등록성공");

							cnt = dao.upload(info, cname, loca);
							break;
						}

						if (cnt > 0) {

							session.setAttribute("loca", loca);
							response.sendRedirect("route.jsp");

						} else {
							response.sendRedirect("child.jsp");

						}

					}

				}

			}
		}

	}
}
