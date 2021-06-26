

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
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
					mapOption = {
						center : new kakao.maps.LatLng(35.110974, 126.877459), // 지도의 중심좌표
						level : 4
					// 지도의 확대 레벨
					};

					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

					// 마커를 표시할 위치와 title 객체 배열입니다 
					var positions = [ {
						title : '학교',
						latlng : new kakao.maps.LatLng(35.112171, 126.873735),
						text : '학교'

					}, {
						title : '학원',
						latlng : new kakao.maps.LatLng(35.112445, 126.875642)
					}, {
						title : '신호등',
						latlng : new kakao.maps.LatLng(35.111548, 126.876066)
					}, {
						title : '집',
						latlng : new kakao.maps.LatLng(35.110974, 126.877459)
					} ];

					// 마커 이미지의 이미지 주소입니다
					var imageSrc = [ "./images/school.png",
							"./images/piano.png", "./images/traffic.png",
							"./images/house.png" ];
					//var imageSrc = "./img/piano.png"; 
					//var imageSrc = "./img/traffic.png"; 
					//var imageSrc = "./img/school.png"; 

					for (var i = 0; i < positions.length; i++) {

						// 마커 이미지의 이미지 크기 입니다
						var imageSize = new kakao.maps.Size(35, 35);

						// 마커 이미지를 생성합니다    
						var markerImage = new kakao.maps.MarkerImage(
								imageSrc[i], imageSize);

						// 마커를 생성합니다
						var marker = new kakao.maps.Marker({
							map : map, // 마커를 표시할 지도
							position : positions[i].latlng, // 마커를 표시할 위치
							title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
							image : markerImage
						// 마커 이미지 

						});
					}
					var polyline = new kakao.maps.Polyline({
						map : map, // 선을 표시할 지도 객체 
						path : [ // 선을 구성하는 좌표 배열
						new kakao.maps.LatLng(35.112171, 126.873735),
								new kakao.maps.LatLng(35.112445, 126.875642),
								new kakao.maps.LatLng(35.111548, 126.876066),
								new kakao.maps.LatLng(35.110974, 126.877459)

						],
						strokeWeight : 3, // 선의 두께
						strokeColor : '#CC33FF', // 선 색
						strokeOpacity : 0.9, // 선 투명도
						strokeStyle : 'dash' // 선 스타일
					});
				</script>
				<br>
				<table border="1" id="hhh">
					<tr align="center">
						<td>순서</td>
						<td>장소이름</td>
						<td>위치확인시간</td>
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