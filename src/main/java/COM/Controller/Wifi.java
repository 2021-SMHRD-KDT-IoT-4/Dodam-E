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
      int js = 1;

      System.out.println(js);

      RouteDAO dao = new RouteDAO();
      ArrayList<ReceiveDTO> list = dao.loca();
      int num = 0;
      String loca = "";
//      HttpSession session = request.getSession();
//      UserDTO info = (UserDTO) session.getAttribute("login_info");
//      String mcr = (String) session.getAttribute("mcr");
//      System.out.println(info.getId());
//      String cc = (String) session.getAttribute("c_name");
//      System.out.println(cc);

//         String id = info.getId();
      childDAO user = new childDAO();
      ArrayList<childDTO> dto = user.Child_one_info("ss");
      if (js > 0) {

         System.out.println(list.size());
         for (int i = 0; i < list.size(); i++) {
            num = list.get(i).getReceive_num();

            if (num == js) {
               if (dto.get(i).getC_send_machine().equals("11")) {

                  loca = list.get(i).getReceive_loca();
                  dao.upload("ss",dto.get(i).getC_name(), loca);
                  System.out.println(dto.get(i).getC_name());
                  break;
               }
            }
         }

      }

   }
}