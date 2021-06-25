<%@page import="COM.Model.childDAO"%>
<%@page import="COM.Model.childDTO"%>
<%@page import="COM.Model.UserDAO"%>

<%@page import="COM.Model.FaqDTO"%>
<%@page import="COM.Model.FaqWriteDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="COM.Model.NoticeWriteDAO"%>
<%@page import="COM.Model.NoticeDTO"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import = "COM.Model.UserDTO"%>  
<%@page import = "java.util.*" %>  

<!DOCTYPE HTML>
<!--
	Massively by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Elements Reference - Massively by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">
	
	<%
      UserDTO info = (UserDTO)session.getAttribute("login_info");
      %>
	

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<a href="main.jsp" class="logo">Dodam E</a>
					</header>

				<!-- Nav -->
					<nav id="nav">
						<ul class="links">
							<%if(info == null) { %>
							<li><a href="main.jsp">Dodam E</a></li>
							<li><a href="join.jsp">Join</a></li>
							<li><a href="login.jsp">Login</a></li>
							<%}else{ %>
							<%if(info.getId().equals("admin")) { %>
							<li><a href = "admin_userinfo.jsp">user info</a></li>
							<li class="active"><a href = "sendview.jsp">send</a></li>
							
							<%}else{ %>
							<li><a href="mypage.jsp">My Page</a></li>
							<li><a href="child.jsp">Child Sign Up</a></li>
							<li><a href="route.jsp">Route</a></li>
							<%}%>
							<li><a href="faq.jsp">FAQ</a></li>
							<li><a href="board.jsp">Board</a></li>
							<%}%>
						</ul>
						<ul class="icons">
							<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
							<li><a href="#" class="icon brands fa-github"><span class="label">GitHub</span></a></li>
						</ul>
					</nav>
	



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
         <article id="FAQ" class="panel">
            <header>
               <h2>FAQ 1개만 보기</h2>
            </header>

            <body>


               <%
               int num = Integer.parseInt(request.getParameter("faq_seq"));
               FaqWriteDAO fdao = new FaqWriteDAO();
               FaqDTO fdto = fdao.showOne(num);
               %>
               <h1 class="con"></h1>
				<table class="cell" border="1">
				<colgroup>
								<col width="100px">
							</colgroup>
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
						<td style= "align-content: center"><%=fdto.getFaq_writer()%></td>
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

                        
                     </tbody>
                  </table>
               

            </body>


         </article>
					

				

				<!-- Copyright -->
					<div id="copyright">
						<ul><li>&copy; Untitled</li><li>Design: <a href="https://html5up.net">HTML5 UP</a></li></ul>
					</div>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>