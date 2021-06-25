<%@page import="COM.Model.UserDAO"%>
<%@page import="COM.Model.FaqDTO"%>
<%@page import="COM.Model.FaqWriteDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="COM.Model.NoticeWriteDAO"%>
<%@page import="COM.Model.NoticeDTO"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@page import="COM.Model.UserDTO"%>
<%@page import="java.util.*"%>


<!DOCTYPE HTML>
<!--
   Astral by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Astral by HTML5 UP</title>
<meta charset="EUC-KR" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
   <link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<meta charset="utf-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		
		<link rel="stylesheet" href="assetsBoard/css/main.css" />
		<link rel="stylesheet" href="assetsBoard/css/board.css" />


</head>
<body class="is-preload">

   <%
      UserDTO info = (UserDTO)session.getAttribute("login_info");
   %>



   <!-- Wrapper-->
   <div id="wrapper">

            <!-- Nav -->
            <!-- Admin!!!!!!!!!!!!!! -->
               <nav id="nav">
           <%
         if (info == null) {
         %>
         <a href="#main" class="icon solid fa-home"><span>메인</span></a> <a
            href="#join" class="icon solid fa-user-plus"><span>회원가입</span></a>
         <%
         } else {
         %>
         <%
         if (info.getId().equals("admin")) {
         %>

         <a href="#admin_Userinfo" class="icon solid fa-users-cog"><span>회원정보</span></a>
         <%
         } else {
         %>
          <a href="#faq" class="icon Regular fa-question-circle"><span>FAQ</span></a>
         <%
         }
         %>
         <%
         }
         %>
               
               
               </nav>
               

               

      <div id="main">

         <!--faq 한개만 보기   -->
         <article id="faqa" class="panel">
            <header>
               <h2>FAQ 1개만 보기</h2>
            </header>

          
				<%
               	int num = Integer.parseInt(request.getParameter("faq_seq"));
              	FaqWriteDAO fdao = new FaqWriteDAO();
               	FaqDTO fdto = fdao.showOne(num);
               	%>
               <div>
				<table border="1">
			
					<tr>
						<td>번호 : </td>
						<td><%=fdto.getFaq_seq()%></td>
					</tr>
					<tr>
						<td>제목 : </td>
						<td><%=fdto.getFaq_title()%></td>
					</tr>
					<tr>
						<td style="width: 130px">작성자:</td>
						<td><%=fdto.getFaq_writer()%></td>
					</tr>
					<tr>
						<td colspan="2">내용</td>
					</tr>
					<tr>
						<td colspan="2">
							<%=fdto.getFaq_content() %>	
						</td>
					</tr>
                    <tr>
                         <td colspan="2"><a href="faq.jsp"><button>뒤로가기</button></a></td>
                    </tr>

                        
                  </table>
               	</div>
			   </article>	
            </body>


      

         <!-- Footer -->

         <div id="footer">
            <ul class="copyright">
               <li>&copy; Untitled.</li>
               <li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
            </ul>
         </div>


   <!-- Scripts -->
   <script src="assets/js/jquery.min.js"></script>
   <script src="assets/js/browser.min.js"></script>
   <script src="assets/js/breakpoints.min.js"></script>
   <script src="assets/js/util.js"></script>
   <script src="assets/js/main.js"></script>

</body>
</html>