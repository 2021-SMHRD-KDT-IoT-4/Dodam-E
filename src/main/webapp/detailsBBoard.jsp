
<%@page import="COM.Model.ReplyDTO"%>
<%@page import="COM.Model.ReplyDAO"%>
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
	  NoticeDTO result1 = (NoticeDTO)session.getAttribute("seq");
	
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
							<li><a href = "sendview.jsp">send</a></li>
							<%}else{ %>
							<li><a href="mypage.jsp">My Page</a></li>
							<li><a href="child.jsp">Child Sign Up</a></li>
							<li><a href="route.jsp">Route</a></li>
							<%}%>
							<li><a href="faq.jsp">FAQ</a></li>
							<li  class="active"><a href="board.jsp">Board</a></li>
							<%}%>
						</ul>
						<ul class="icons">
							<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
							<li><a href="#" class="icon brands fa-github"><span class="label">GitHub</span></a></li>
						</ul>
					</nav>
					
					

				<!-- Main -->
					<div id="main">

						<!-- Post -->
							<section class="post">
								<header class="major">
									<h1><a href="#">Board<br /></a></h1>
								</header>

				



		<div id="main">

			<!-- 글 1개 보기 -->
			<article id="FAQ" class="panel">
				<header>
				</header>

				<body>


					<%
					int num = Integer.parseInt(request.getParameter("notice_seq"));
					
					
					System.out.println("출력출력" + num);
					
					NoticeWriteDAO Noticedao = new NoticeWriteDAO();
					NoticeDTO dto = Noticedao.showOne(num);
					
					session.setAttribute("r_seq", num); 
					session.getAttribute("notice_seq");
					
					ReplyDAO R_dao = new ReplyDAO();
					ArrayList<ReplyDTO> Rlist = R_dao.showReply(num);
					
					%>
					
					<h1 class="con"></h1>
						<table class="cell" border="1">
							<colgroup>
								<col width="100px">
							</colgroup>
								<tr>
						<td>제목 : </td>
						<td><%=dto.getNotice_title()%></td>
					</tr>
					<tr>
						<td style="width: 130px">작성자:</td>
						<td><%=dto.getNotice_id() %></td>
					</tr>
					<tr>
						<td colspan="2">내용</td>
					</tr>
					<tr>
						<td colspan="2">
							<%=dto.getNotice_content() %>	
						</td>
					</tr>
					<tr>
						<td>날짜</td>
						<td><%=dto.getNotice_day()%></td>
					</tr>
					
					
				</table>
					
			<!-- 댓글 보기 -->		
				
				<h1 class="con"></h1>
						<table class="cell" border="1">
						
						<hr>
						
							<colgroup>
								<col width="100px">
							</colgroup>
				<%-- 	
					<%
                     for (int i = 0; i < Rlist.size(); i++) {
                     %>		
					<tr>
						<td style="width: 130px">작성자:</td>
						<td><%=Rlist.get(i).getUsers_id() %></td>
					</tr>
					<tr>
						<td style="width: 130px">내용:</td>
						<td><%=Rlist.get(i).getReply_content() %></td>
						<td><a href = "ReplydeleteService?num=<%= Rlist.get(i).getReply_seq() %>">삭제</a></td>
						
					</tr>
					
					<tr>
						<td>날짜</td>
						<td><%=Rlist.get(i).getReply_day()%></td>
					</tr>
					<%}%>
				</table>	
				 --%>
				 		<%
                     for (int i = 0; i < Rlist.size(); i++) {
                     %>		
					<tr>
						<td><%=Rlist.get(i).getUsers_id() %></td>
						<td style="width: 100px"><%=Rlist.get(i).getReply_content() %></td>
						<td style="width: 65px"><%=Rlist.get(i).getReply_day()%></td>
						<td style="width: 20px"><a href = "ReplydeleteService?num=<%= Rlist.get(i).getReply_seq() %>">삭제</a></td>
					</tr>
					<%}%>
				</table>	
					
					
					
					
			<!-- 댓글 쓰기 -->
					<h1 class="con"></h1>
						<form action="ReplyService">
							<table class="cell" border="1">
								<colgroup>
									<col width="100px">
								</colgroup>
								<tr class="col-6 col-6-medium" style="margin: 0 auto; float: none;">
                    				<th>내용 :</th>
                        			<td colspan="3"><textarea name="r_content"></textarea></td>
                    			</tr>
							</table>
							
							<div class="row" style="display: block;  text-align: center;">
                  			<div class="col-6-medium" style="margin: 0 auto; float: none;">
                        
                        	<input type = "submit" value = "댓글쓰기">
                        	<input type = "reset" value = "댓글 초기화">
                        	<input type="button" value="게시물 삭제" onClick="window.location='DeleteBoardService'" />
                        	</div> 
                        <% session.setAttribute("u_id", info.getId()); %>
                        <%--<% session.setAttribute("n_seq", num);%> --%>
               	       </div>
						</form>
						
				 	<div class="row" style="display: block;">
				 	<!-- col-3 col-6-medium -->
                   		<div class="col-9-medium" style="margin: 0 auto; float: none;">
                        	<%-- <a href="board.jsp"><button>뒤로가기</button></a> --%>
                        	<input type="button" value="뒤로가기" onClick="window.location='board.jsp'" />
                        
               	   		</div>   
               	   	</div>
               	   		
                        <!-- <form action="DeleteBoardService">
                        <input type="submit" value="게시물 삭제">
                        </form> -->
                        
                        
               	   </div>   
               	   </div>
				

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