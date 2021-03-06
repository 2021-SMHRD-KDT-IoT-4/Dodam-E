
<%@page import="COM.Model.ReceiveDTO"%>
<%@page import="COM.Model.RouteDAO"%>
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


<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy?? MM?? dd?? k:mm");
%>

<!DOCTYPE HTML>
<!--
	Massively by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>

<title>Massively by HTML5 UP</title>
<meta charset="EUC-KR" />
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
.date{
font-family: 'Cafe24Ssurround';

}


</style>



</head>
<body class="is-preload">

	<%
	UserDTO info = (UserDTO) session.getAttribute("login_info");
			
	%>

	<!-- Wrapper -->
	<div id="wrapper" class="fade-in">

		<!-- Intro -->
		<div id="intro">
			<h1>
				Dodam Dodam<br /> Alien
			</h1>
			<p>
				Dodam Dodam is a location safety school service for children. <br>Let's
				watch the child's safety with us.
			</p>
			<ul class="actions">
				<li><a href="#header"
					class="button icon solid solo fa-arrow-down scrolly">Continue</a></li>
			</ul>

		</div>





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
				<li class="active"><a href="main.jsp">Dodam E</a></li>
				<li><a href="join.jsp">Join</a></li>
				<li><a href="login.jsp">Login</a></li>
				<%
				} else {
				%>
				<%
				if (info.getId().equals("admin")) {
				%>
				<li><a href="admin_userinfo.jsp">user info</a></li>
				
				<li><a href="sendview.jsp">send</a></li>
				<%
				} else {
				%>
				<li><a href="mypage.jsp">My Page</a></li>
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

			<%-- ?????? (???? ?????ϸ? ??????) --%>
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

			<!-- Featured Post -->
			<article class="post featured">
				<header class="major">
					<span class="date"><%= sf.format(nowTime) %></span>
					
					<h2>
						<a href="#">Dodam Dodam<br /> WELCOME
						</a>
					</h2>

				</header>

				<a href="#" class="image main"><img src="images/cc.png"
					alt="" /></a>

			</article>

		</div>

		<!-- Footer -->
		<footer id="footer">
		<%if(info ==null){ %>
			<section style='display:none'>
			<%}else{ %>
				<form method="post" action="#">
					<div class="fields">
						<div class="field">
							<label for="name">Name</label> <input type="text" name="name"
								id="name" />
						</div>
						<div class="field">
							<label for="email">Email</label> <input type="text" name="email"
								id="email" />
						</div>
						<div class="field">
							<label for="message">Message</label>
							<textarea name="message" id="message" rows="3"></textarea>
						</div>
					</div>
					<ul class="actions">
						<li><input type="submit" value="Send Message" /></li>
					</ul>
				</form>
				<%} %>
			</section>

			<section class="split contact">
				<section class="alt">
					<h3>Address</h3>
					<p>
						1234 Somewhere Road #87257<br /> Nashville, TN 00000-0000
					</p>
				</section>
				<section>
					<h3>Phone</h3>
					<p>
						<a href="#">(000) 000-0000</a>
					</p>
				</section>
				<section>
					<h3>Email</h3>
					<p>
						<a href="#">info@untitled.tld</a>
					</p>
				</section>
				

				<section>
					<h3>Social</h3>
					<ul class="icons alt">
						<li><a href="#" class="icon brands alt fa-twitter"><span
								class="label">Twitter</span></a></li>
						<li><a href="#" class="icon brands alt fa-facebook-f"><span
								class="label">Facebook</span></a></li>
						<li><a href="#" class="icon brands alt fa-instagram"><span
								class="label">Instagram</span></a></li>
						<li><a href="#" class="icon brands alt fa-github"><span
								class="label">GitHub</span></a></li>
					</ul>
				</section>
			</section>
		</footer>

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