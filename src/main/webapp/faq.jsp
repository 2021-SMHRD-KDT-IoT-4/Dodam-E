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

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<a href="join.jsp" class="logo">Dodam E</a>
					</header>

				<!-- Nav -->
					<nav id="nav">
						<ul class="links">
							<li><a href="main.jsp">Dodam E</a></li>
							<li><a href="join.jsp">Join</a></li>
							<li><a href="login.jsp">Login</a></li>
							<li><a href="mypage.jsp">My Page</a></li>
							<li><a href="child.jsp">Child Sign Up</a></li>
							<li class="active"><a href="faq.jsp">FAQ</a></li>
							<li><a href="board.jsp">Board</a></li>
							<li><a href="route.jsp">Route</a></li>
						</ul>
						<ul class="icons">
							<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
							<li><a href="#" class="icon brands fa-github"><span class="label">GitHub</span></a></li>
						</ul>
					</nav>
					
					<%
      					UserDTO info = (UserDTO)session.getAttribute("login_info");
      
   					%>

				<!-- Main -->
					<div id="main">

						<!-- Post -->
							<section class="post">
								<header class="major">
									<h1><a href="#">FAQ<br /></a></h1>
								</header>

								<!-- FAQ -->
                     <article id="faq" class="panel">
                        <form action="#" method="post">
                           <%
                           FaqWriteDAO dao = new FaqWriteDAO();
                           ArrayList<FaqDTO> list = dao.showFaq();
                           %>
                           <div>
                              <table border="1">
                                 <tr align="center">
                                 
                                    <td>번호</td>
                                    <td>제목</td>
                                    <td>글쓴이</td>
                                    <td>내용</td>
                                    <td>날짜</td>
                                 </tr>
                                 <%
                                 for (int i = 0; i <list.size(); i++){
                                 %>
                                 <tr align="center">
                                    <td><%=list.get(i).getFaq_seq()%></td>
                                    
                                    <td><a href="viewFaq.jsp?faq_seq=<%=list.get(i).getFaq_seq()%>">
                                    <%=list.get(i).getFaq_title()%></a>
                                    </td>
                                    <td><%=list.get(i).getFaq_writer()%></td>
                                    <td><%=list.get(i).getFaq_content()%></td>
                                    <td><%=list.get(i).getFaq_answer()%></td>
                                 </tr>
                                 <%
                                 }
                                 %>                              
                              
                              </table>
                           </div>
                        </form>
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