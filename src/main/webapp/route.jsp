

<%@page import="COM.Model.ReceiveDTO"%>
<%@page import="COM.Model.RouteDAO"%>
<%@page import="COM.Model.RouteDTO"%>
<%@page import="COM.Model.UserDTO"%>

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


</head>
<body class="is-preload">

	<%
	UserDTO info = (UserDTO) session.getAttribute("login_info");
    String name =info.getId();
	ArrayList<RouteDTO> list=null;


		if(info!=null){
			 list=(ArrayList<RouteDTO>)session.getAttribute("mcr");
			
		}
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
				<li class="active"><a href="login.jsp">Login</a></li>
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
				<li class="active"><a href="route.jsp">Route</a></li>
				<%}%>
				<li><a href="faq.jsp">FAQ</a></li>
				<li><a href="board.jsp">Board</a></li>
				<%}%>

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
		<div id="main" width="826px" ;heigh="400px">
			<section class="post">

				<header class="major">
					<h1>
						<a href="#">Route<br /></a>
					</h1>
				</header>

				<div id="map" style="width: 100%; height: 350px;"></div>

				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eead32d6ed0b289eaf8fb67836c885d3"></script>
				<script>
					var mapContainer = document.getElementById('map'), // ������ ǥ���� div  
					mapOption = {
						center : new kakao.maps.LatLng(35.110974, 126.877459), // ������ �߽���ǥ
						level : 4
					// ������ Ȯ�� ����
					};

					var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�

					// ��Ŀ�� ǥ���� ��ġ�� title ��ü �迭�Դϴ� 
					var positions = [ {
						title : '�б�',
						latlng : new kakao.maps.LatLng(35.112171, 126.873735),
						text : '�б�'

					}, {
						title : '�п�',
						latlng : new kakao.maps.LatLng(35.112445, 126.875642)
					}, {
						title : '��ȣ��',
						latlng : new kakao.maps.LatLng(35.111548, 126.876066)
					}, {
						title : '��',
						latlng : new kakao.maps.LatLng(35.110974, 126.877459)
					} ];

					// ��Ŀ �̹����� �̹��� �ּ��Դϴ�
					var imageSrc = [ "./images/school.png",
							"./images/piano.png", "./images/traffic.png",
							"./images/house.png" ];
					//var imageSrc = "./img/piano.png"; 
					//var imageSrc = "./img/traffic.png"; 
					//var imageSrc = "./img/school.png"; 

					for (var i = 0; i < positions.length; i++) {

						// ��Ŀ �̹����� �̹��� ũ�� �Դϴ�
						var imageSize = new kakao.maps.Size(35, 35);

						// ��Ŀ �̹����� �����մϴ�    
						var markerImage = new kakao.maps.MarkerImage(
								imageSrc[i], imageSize);

						// ��Ŀ�� �����մϴ�
						var marker = new kakao.maps.Marker({
							map : map, // ��Ŀ�� ǥ���� ����
							position : positions[i].latlng, // ��Ŀ�� ǥ���� ��ġ
							title : positions[i].title, // ��Ŀ�� Ÿ��Ʋ, ��Ŀ�� ���콺�� �ø��� Ÿ��Ʋ�� ǥ�õ˴ϴ�
							image : markerImage
						// ��Ŀ �̹��� 

						});
					}
					var polyline = new kakao.maps.Polyline({
						map : map, // ���� ǥ���� ���� ��ü 
						path : [ // ���� �����ϴ� ��ǥ �迭
						new kakao.maps.LatLng(35.112171, 126.873735),
								new kakao.maps.LatLng(35.112445, 126.875642),
								new kakao.maps.LatLng(35.111548, 126.876066),
								new kakao.maps.LatLng(35.110974, 126.877459)

						],
						strokeWeight : 3, // ���� �β�
						strokeColor : '#CC33FF', // �� ��
						strokeOpacity : 0.9, // �� ����
						strokeStyle : 'dash' // �� ��Ÿ��
					});
				</script>
				<br>
				<table border="1" id="hhh">
					<tr align="center">
						<td>����</td>
						<td>����̸�</td>
						<td>��ġȮ�νð�</td>
					</tr>
					
					<%for(int i=0;i<list.size();i++){%>
					<tr align="center">
						<td><%=i+1 %></td>
						<td><%=list.get(i).getRoute()%></td>
						<td><%=list.get(i).getCheckTime() %></td>
					</tr>
<%} %>
				</table>


				</script>
				</article>
				<!-- Copyright -->
				<div id="copyright">
					<ul>
						<li>&copy; Untitled</li>
						<li>Design: <a href="https://html5up.net">HTML5 UP</a></li>
					</ul>
			</section>
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