
<%@page import="COM.Model.childDAO"%>
<%@page import="COM.Model.childDTO"%>
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
	Massively by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Elements Reference - Massively by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>

<style >
@font-face {
    font-family: 'Cafe24Ssurround';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24Ssurround.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'Cafe24SsurroundAir';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.mypageFont{
font-family: 'Cafe24Ssurround';

}
.kidsFont{
font-family: 'Cafe24Ssurround';
}
.mypageSFont{
 font-family: 'Cafe24SsurroundAir';
}
.kidsSFont{
  font-family: 'Cafe24SsurroundAir';
	
}

</style>
</head>
<body class="is-preload">

	<%
	UserDTO info = (UserDTO) session.getAttribute("login_info");
	
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
				<%
				if (info == null) {
				%>
				<li><a href="main.jsp">Dodam E</a></li>
				<li><a href="join.jsp">Join</a></li>
				<li><a href="login.jsp">Login</a></li>
				<%
				} else {
				%>
				<%
				if (info.getId().equals("admin")) {
				%>
				<li><a href="admin_userinfo.jsp">user info</a></li>
				<%
				} else {
				%>
				<li class="active"><a href="mypage.jsp">My Page</a></li>
				<li><a href="child.jsp">Child Sign Up</a></li>
				<li><a href="route.jsp">Route</a></li>
				<%
				}
				%>
				<li><a href="faq.jsp">FAQ</a></li>
				<li><a href="board.jsp">Board</a></li>
				<%
				}
				%>
			</ul>
			<ul class="icons">
				<li><a href="#" class="icon brands fa-twitter"><span
						class="label">Twitter</span></a></li>
				<li><a href="#" class="icon brands fa-facebook-f"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon brands fa-instagram"><span
						class="label">Instagram</span></a></li>
				<li><a href="#" class="icon brands fa-github"><span
						class="label">GitHub</span></a></li>
			</ul>
		</nav>



		<!-- Main -->
		<div id="main">

			<!-- Post -->
			<section class="post">
				<header class="major">
					<h1>
						<a href="#">My Page<br /></a>
					</h1>
				</header>
					
				

								<!-- mypage -->
                     <article id="mypage" class="panel">
                        <header>
                           <h2>My page</h2>
                        </header>
                        
                        <section>
                        
                        <%if(info!=null){ 
                        
                        	/* int num = Integer.parseInt(request.getParameter("child_machine"));
                        	System.out.println(num); */
                           childDAO c_dao = new childDAO();
                           UserDAO u_dao = new UserDAO();
                           /* UserDTO dto = u_dao.childdelete(id, num); */
                           
                          
                           ArrayList<childDTO> c_one_list = c_dao.Child_one_info(info);
                           
                        
                        %>
                        
                        
                        <div>
                              <table border="1">
                                 <tr align="center" class="mypageFont">
                                    <td>�̸�</td>
                                    <td>���̵�</td>
                                    <td>��й�ȣ</td>
                                    <td>�޴�����ȣ</td>
                                  
                                 </tr>
                                 <%if(info!=null){ %>
                                 <tr align="center" class="mypageSFont">
                                    <td><%=info.getName()%></td>
                                    <td><%=info.getId()%></td>
                                    <td><%=info.getPw()%></td>
                                    <td><%=info.getTel()%></td>
                                  
                                    
                                 </tr>
                                 <%} %>   
                              
                              </table>
                        </div>
                        
                        <header>
                           <h2>Kids page</h2>
                        </header>
                        <div>
                              <table border="1">
                                 <tr align="center" class="kidsFont">
                                    
                                    <td>ID</td>
                                    <td>�����̸�</td>
                                    <td>����</td>
                                    <td>����</td>
                                    <td>�б�</td>
                                    <td>����ȣ</td>
                                    <td>����</td>
                                 </tr>
                                <%for(int i = 0; i < c_one_list.size(); i++) { %>
										<tr align="center" class="kidsSFont">
													
											<td><%= c_one_list.get(i).getC_id()%></td>
											<td><%= c_one_list.get(i).getC_name()%></td>
											<td><%= c_one_list.get(i).getC_age()%></td>
											<td><%= c_one_list.get(i).getC_gender()%></td>
											<td><%= c_one_list.get(i).getC_school()%></td>
											<td><%= c_one_list.get(i).getC_send_machine()%></td>
											<td class="delete"><a href = "ChilddeleteService?num=<%= c_one_list.get(i).getC_send_machine() %>">����</a></td>
										</tr>
									<%} %>
									<%} %> 
                              
                              </table>
                              <br>
                             	 <div class="row" style="display: block; text-align: center;" >
                             	 <div class="col-6-medium" style="margin: 0 auto; float: none;display: block;" >
                             	 
									<input type="button" value="  �α׾ƿ�  " onClick="window.location='LogoutService'" style="
    										font-family: 'Cafe24Ssurround';"/>
									<!-- <input type="button" value="  ���� ���� ����   " onClick="window.location='ChilddeleteService'"style="
									   		font-family: 'Cafe24Ssurround';" /> -->
									<input type="button" value="  ȸ�� Ż��   " onClick="window.location='UserdeleteService'" style="
    										font-family: 'Cafe24Ssurround';"/>
									</div>
									</div>
								</div>
									
                        </div>
                        
                        </section>
                     </article>

				

				<!-- Copyright -->
				<div id="copyright">
					<ul>
						<li>&copy; Untitled</li>
						<li>Design: <a href="https://html5up.net">HTML5 UP</a></li>
					</ul>
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